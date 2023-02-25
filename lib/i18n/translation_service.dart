import 'package:get/get.dart';

import 'language/en_US.dart';
import 'language/zh_CN.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}

class LanguageMap {
  static Map<String, Map<String, String>> languageMap = {
    'English': {'en': 'US'},
    '简体中文': {'zh': 'CN'},
  };
}
