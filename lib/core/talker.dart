import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:material_ui/material_ui.dart';
import 'package:talker/talker.dart';
import 'package:talker_flutter/talker_flutter.dart' as talker_ui;

final talker = Talker(settings: TalkerSettings());

/// Pushes the Talker log viewer
Future<void> pushTalkerLogScreen(
  BuildContext context, {
  String title = 'App Logs',
}) {
  return Navigator.of(context, rootNavigator: true).push<void>(
    MaterialPageRoute<void>(
      builder: (BuildContext routeContext) => Builder(
        builder: (BuildContext themedContext) {
          final FluxerColorTheme colors = themedContext.colors;
          return talker_ui.TalkerScreen(
            talker: talker,
            appBarTitle: title,
            theme: talker_ui.TalkerScreenTheme(
              backgroundColor: colors.backgroundPrimary,
              cardColor: colors.backgroundTertiary,
              textColor: colors.textPrimary,
              logColors: _talkerLogColors(colors),
            ),
          );
        },
      ),
    ),
  );
}

Map<String, Color> _talkerLogColors(FluxerColorTheme colors) => <String, Color>{
  TalkerKey.error: colors.textDanger,
  TalkerKey.critical: colors.textDanger,
  TalkerKey.exception: colors.textDanger,
  TalkerKey.httpError: colors.textDanger,
  TalkerKey.warning: colors.textWarning,
  TalkerKey.info: colors.textLink,
  TalkerKey.httpRequest: colors.textLink,
  TalkerKey.httpResponse: colors.textPositive,
  TalkerKey.route: colors.accentPurple,
  TalkerKey.debug: colors.textSecondary,
  TalkerKey.verbose: colors.textTertiary,
};
