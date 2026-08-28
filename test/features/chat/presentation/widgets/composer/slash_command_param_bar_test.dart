import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slash_command_param_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/service/composer_slash_session.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('param bar shows the focused option name and description', (
    tester,
  ) async {
    final ComposerSlashSession session = ComposerSlashSession();
    addTearDown(session.dispose);
    session.start(
      const ComposerActionSlashCommand(
        name: '/kick',
        description: 'd',
        options: <ComposerCommandOption>[
          ComposerCommandOption(
            name: 'user',
            description: 'User to kick',
            type: ComposerCommandOptionType.user,
            required: true,
          ),
        ],
      ),
    );

    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: SlashCommandParamBar(session: session, onClear: () {}),
        ),
      ),
    );

    expect(find.text('user'), findsOneWidget);
    expect(find.text('User to kick'), findsOneWidget);
    expect(
      tester.getSize(find.byType(SlashCommandParamBar)).height,
      WideComposerLayout.actionRowMinHeight,
    );
  });
}
