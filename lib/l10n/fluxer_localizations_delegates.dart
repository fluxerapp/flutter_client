import 'package:cupertino_ui/cupertino_ui.dart'
    show CupertinoLocalizations, GlobalCupertinoLocalizations;
import 'package:flutter/material.dart' as flutter show MaterialLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart' as l10n;
import 'package:flutter_localizations/src/l10n/generated_date_localizations.dart'
    as date_localizations;
import 'package:flutter_localizations/src/utils/date_localizations.dart'
    show loadDateIntlDataIfNotLoaded;
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/number_symbols_data.dart';

const Set<String> englishBackedLanguageCodes = <String>{'art'};

const Locale _english = Locale('en');

bool _englishBackedIntlLocalesRegistered = false;

void registerEnglishBackedIntlLocales() {
  if (_englishBackedIntlLocalesRegistered) {
    return;
  }
  _englishBackedIntlLocalesRegistered = true;
  loadDateIntlDataIfNotLoaded();
  final DateSymbols englishDateSymbols =
      date_localizations.dateSymbols[_english.languageCode]!;
  for (final String code in englishBackedLanguageCodes) {
    initializeDateFormattingCustom(
      locale: code,
      symbols: DateSymbols.deserializeFromMap(<String, Object?>{
        ...englishDateSymbols.serializeToMap(),
        'NAME': code,
      }),
      patterns: date_localizations.datePatterns[_english.languageCode],
    );
    numberFormatSymbols[code] = numberFormatSymbols[_english.languageCode]!;
    compactNumberSymbols[code] = compactNumberSymbols[_english.languageCode]!;
  }
}

class _EnglishBackedLocalizationsDelegate<T> extends LocalizationsDelegate<T> {
  const _EnglishBackedLocalizationsDelegate(this._englishDelegate);

  final LocalizationsDelegate<T> _englishDelegate;

  @override
  bool isSupported(Locale locale) =>
      englishBackedLanguageCodes.contains(locale.languageCode);

  @override
  Future<T> load(Locale locale) {
    registerEnglishBackedIntlLocales();
    return _englishDelegate.load(_english);
  }

  @override
  bool shouldReload(_EnglishBackedLocalizationsDelegate<T> old) => false;
}

const List<LocalizationsDelegate<dynamic>> fluxerLocalizationsDelegates =
    <LocalizationsDelegate<dynamic>>[
      FluxerLocalizations.delegate,
      ...GlobalMaterialLocalizations.delegates,
      l10n.GlobalMaterialLocalizations.delegate,
      _EnglishBackedLocalizationsDelegate<MaterialLocalizations>(
        GlobalMaterialLocalizations.delegate,
      ),
      _EnglishBackedLocalizationsDelegate<flutter.MaterialLocalizations>(
        l10n.GlobalMaterialLocalizations.delegate,
      ),
      _EnglishBackedLocalizationsDelegate<CupertinoLocalizations>(
        GlobalCupertinoLocalizations.delegate,
      ),
      _EnglishBackedLocalizationsDelegate<WidgetsLocalizations>(
        l10n.GlobalWidgetsLocalizations.delegate,
      ),
    ];
