import 'dart:ui' show Locale;

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

export 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
export 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Fixed locale for widget tests that render localized UI.
const Locale kTestLocale = Locale('en');

/// English strings for test expectations. Use for UI copy from [FluxerLocalizations],
/// not for fixture data such as channel names or usernames.
final FluxerLocalizations testL10n = FluxerLocalizationsEn();
