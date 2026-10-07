import 'package:flutter_localizations/flutter_localizations.dart' as l10n;
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const List<LocalizationsDelegate<dynamic>> fluxerLocalizationsDelegates =
    <LocalizationsDelegate<dynamic>>[
      FluxerLocalizations.delegate,
      ...GlobalMaterialLocalizations.delegates,
      l10n.GlobalMaterialLocalizations.delegate,
    ];
