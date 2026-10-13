import 'dart:ui' show Locale;

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

export 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
export 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const Locale kTestLocale = Locale('en');

final FluxerLocalizations testL10n = FluxerLocalizationsEn();
