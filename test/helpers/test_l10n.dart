import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

export 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
export 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const Locale kTestLocale = Locale('en');

FluxerLocalizations get testL10n => lookupFluxerLocalizations(kTestLocale);

Finder findTestText(String text) => find.text(text);

String testSettingsSwitchSemanticsLabel({
  required String label,
  required String description,
}) => '$label. $description';
