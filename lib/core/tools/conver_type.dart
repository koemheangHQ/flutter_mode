abstract class ConversionResult {}

class StringToIntResult<T> extends ConversionResult {
  final T value;

  StringToIntResult(this.value);
}

class StringToDoubleResult<T> extends ConversionResult {
  final T value;

  StringToDoubleResult(this.value);
}

class DoubleToStringResult<T> extends ConversionResult {
  final T value;

  DoubleToStringResult(this.value);
}

class IntToStringResult<T> extends ConversionResult {
  final T value;

  IntToStringResult(this.value);
}

 ConversionResult convert(T) {
  if (int.tryParse(T) != null) {
    return StringToIntResult(int.parse(T));
  } else if (double.tryParse(T) != null) {
    return StringToDoubleResult(double.parse(T));
  } else {
    throw Exception('Conversion not supported');
  }
}
