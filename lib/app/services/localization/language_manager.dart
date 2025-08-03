import 'package:acacia/app/shared/common/constants.dart';
import 'package:flutter/material.dart';

const String ar = "ar";
const String en = "en";

const String arCountry = 'EG';
const String usCountry = 'US';

enum LanguageType {
  arabic(ar, arCountry, LocalizationManager.arabicLocal),
  english(en, usCountry, LocalizationManager.englishLocal);

  final String lang;
  final String country;
  final Locale locale;

  const LanguageType(this.lang, this.country, this.locale);

  static LanguageType fromString(String value) {
    return LanguageType.values.firstWhere(
      (langType) =>
          langType.lang == value || langType.getLangWithCountry() == value,
      orElse: () => AppConstants.defaultLang, // Default fallback
    );
  }

  static final String langSeparator = '-';
}

extension GetLanguage on LanguageType {
  String getValue() {
    return lang;
  }

  String getLangWithCountry() {
    if (country.isEmpty) {
      return lang;
    }
    return "$lang${LanguageType.langSeparator}$country";
  }

  static LanguageType get defaultLang => LanguageType.english;
}

class LocalizationManager {
  static const Locale arabicLocal = Locale(ar, arCountry);
  static const Locale englishLocal = Locale(en, usCountry);

  static const String assetsPath = "assets/translations";

  static Locale getLangLocal(String langCountry) {
    final languageType = LanguageType.fromString(langCountry);
    switch (languageType) {
      case LanguageType.arabic:
        return arabicLocal;
      case LanguageType.english:
        return englishLocal;
    }
  }
}
