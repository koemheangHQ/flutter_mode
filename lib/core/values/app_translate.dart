import 'package:fluuter_model/core/languages/en.dart';
import 'package:fluuter_model/core/languages/kh.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_EN': En.translations,
        'km_KH': Kh.translations,
      };
}
