import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slash_command_composer.dart';
import 'package:fluxer_app/features/chat/services/composer_slash_session.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('resume restores the focused slash slot', (tester) async {
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
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: SlashCommandComposer(
            session: session,
            enabled: true,
            style: const TextStyle(fontSize: 16),
            onSubmit: () {},
          ),
        ),
      ),
    );
    session.focusSlot(0);
    await tester.pump();

    final FocusNode slotFocus = tester
        .widget<TextField>(find.byType(TextField))
        .focusNode!;
    expect(slotFocus.hasFocus, isTrue);

    tester.testTextInput.log.clear();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump();
    await tester.pump();

    expect(slotFocus.hasFocus, isTrue);
    expect(
      tester.testTextInput.log.map((call) => call.method),
      contains('TextInput.show'),
    );
  });
}
