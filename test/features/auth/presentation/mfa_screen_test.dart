import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/presentation/mfa_screen.dart';
import 'package:fluxer_app/features/auth/providers/mfa_view_model.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/test_l10n.dart';

const _challenge = MfaChallenge(
  ticket: 'mfa-ticket',
  totp: true,
  sms: false,
  webauthn: false,
);

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets(
    'entering a TOTP code syncs to the view model and enables Log in',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: _app(
            MfaScreen(
              challenge: _challenge,
              onBack: () {},
              onAuthorized: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final container = ProviderScope.containerOf(
        tester.element(find.byType(MfaScreen)),
      );
      final provider = mfaViewModelProvider(_challenge);

      expect(container.read(provider).canSubmitCode, isFalse);

      await tester.enterText(find.byType(TextFormField), '123456');
      await tester.pump();

      expect(container.read(provider).code, '123456');
      expect(container.read(provider).canSubmitCode, isTrue);
    },
  );

  testWidgets('TOTP field uses a numeric keyboard', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: _app(
          MfaScreen(challenge: _challenge, onBack: () {}, onAuthorized: () {}),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final TextField field = tester.widget(find.byType(TextField));
    expect(field.keyboardType, TextInputType.number);
  });

  testWidgets('TOTP field accepts an alphanumeric backup code', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: _app(
          MfaScreen(challenge: _challenge, onBack: () {}, onAuthorized: () {}),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(MfaScreen)),
    );
    await tester.enterText(find.byType(TextFormField), 'ab12-cd34');
    await tester.pump();

    expect(container.read(mfaViewModelProvider(_challenge)).code, 'ab12-cd34');
  });

  testWidgets('context menu paste fills the TOTP field', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: _app(
          MfaScreen(challenge: _challenge, onBack: () {}, onAuthorized: () {}),
        ),
      ),
    );
    await tester.pumpAndSettle();

    _mockClipboardText('123456');
    await _pasteViaToolbar(tester, find.byType(EditableText));

    final container = ProviderScope.containerOf(
      tester.element(find.byType(MfaScreen)),
    );
    expect(container.read(mfaViewModelProvider(_challenge)).code, '123456');
  });

  testWidgets('clearing the view model code resets the input field', (
    tester,
  ) async {
    const multiMethodChallenge = MfaChallenge(
      ticket: 'mfa-ticket',
      totp: true,
      sms: false,
      webauthn: true,
    );

    await tester.pumpWidget(
      ProviderScope(
        child: _app(
          MfaScreen(
            challenge: multiMethodChallenge,
            onBack: () {},
            onAuthorized: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final l10n = FluxerLocalizations.of(tester.element(find.byType(MfaScreen)));

    await tester.tap(find.text(l10n.mfaMethodTotp));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), '123456');
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(MfaScreen)),
    );
    container
        .read(mfaViewModelProvider(multiMethodChallenge).notifier)
        .clearMethod();
    await tester.pumpAndSettle();

    await tester.tap(find.text(l10n.mfaMethodTotp));
    await tester.pumpAndSettle();

    final TextFormField field = tester.widget(find.byType(TextFormField));
    expect(field.controller?.text, isEmpty);
    expect(
      container.read(mfaViewModelProvider(multiMethodChallenge)).code,
      isEmpty,
    );
  });

  testWidgets('restores TOTP focus when app resumes from background', (
    tester,
  ) async {
    const multiMethodChallenge = MfaChallenge(
      ticket: 'mfa-ticket',
      totp: true,
      sms: false,
      webauthn: true,
    );

    await tester.pumpWidget(
      ProviderScope(
        child: _app(
          MfaScreen(
            challenge: multiMethodChallenge,
            onBack: () {},
            onAuthorized: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final l10n = FluxerLocalizations.of(tester.element(find.byType(MfaScreen)));

    await tester.tap(find.text(l10n.mfaMethodTotp));
    await tester.pumpAndSettle();

    final EditableText editable = tester.widget<EditableText>(
      find.byType(EditableText),
    );
    final FocusNode focusNode = editable.focusNode..requestFocus();
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isTrue);

    tester.binding
      ..handleAppLifecycleStateChanged(AppLifecycleState.inactive)
      ..handleAppLifecycleStateChanged(AppLifecycleState.hidden)
      ..handleAppLifecycleStateChanged(AppLifecycleState.paused);
    focusNode.unfocus();
    await tester.pump();

    tester.binding
      ..handleAppLifecycleStateChanged(AppLifecycleState.hidden)
      ..handleAppLifecycleStateChanged(AppLifecycleState.inactive)
      ..handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);

    expect(focusNode.hasFocus, isTrue);
  });
}

void _mockClipboardText(String text) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(SystemChannels.platform, (
        MethodCall methodCall,
      ) async {
        if (methodCall.method == 'Clipboard.getData') {
          return <String, String>{'text': text};
        }
        if (methodCall.method == 'Clipboard.hasStrings') {
          return <String, bool>{'value': true};
        }
        return null;
      });
}

Future<void> _pasteViaToolbar(
  WidgetTester tester,
  Finder editableFinder,
) async {
  await tester.longPress(editableFinder);
  await tester.pumpAndSettle();
  await tester.tap(find.text('Paste'));
  await tester.pumpAndSettle();
}
