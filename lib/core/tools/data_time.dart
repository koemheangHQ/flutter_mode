class BaseSingleton {
  static final BaseSingleton _baseSingleton = BaseSingleton._internal();
  static BaseSingleton get resultBaseSingleton => _baseSingleton;
  BaseSingleton._internal();

  void convertDataTime() {}
}
