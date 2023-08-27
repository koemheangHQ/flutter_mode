import 'dart:async';
import 'dart:ui';

class Debounce {
  VoidCallback? action;
  static Timer? _debounce;

  static run({required int milliseconds, required VoidCallback action}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: milliseconds), action);
  }
}
