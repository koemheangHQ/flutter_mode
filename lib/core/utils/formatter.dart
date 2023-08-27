import 'package:intl/intl.dart';

class Formatter {
  static final _formatterNumber = NumberFormat("#,###,###.##", "en_US");
  static final _formatterNumberLast2Zero =
      NumberFormat("#,###,##0.00", "en_US");

  static String numberFormatter(dynamic number) {
    return _formatterNumber.format(number);
  }

  static String numberLast2ZeroFormatter(dynamic number) {
    return _formatterNumberLast2Zero.format(number);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension StringCurrency on String {
  String toStringUSD() => '\$$this';
}
