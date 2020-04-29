import 'package:i18n_extension/i18n_extension.dart';
import 'package:my_finance_flutter/i18n/languages/en_us.dart';
import 'package:my_finance_flutter/i18n/languages/pt_br.dart';

extension MyFinanceLocalization on String {
  static var t = Translations.byLocale("en_us") + enUS + ptBR;

  String get i18n => localize(this, t);

  String i18nForced(String language) => localize(this, t, locale: language);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, t);

  String version(Object modifier) => localizeVersion(modifier, this, t);

  Map<String, String> allVersions() => localizeAllVersions(this, t);
}
