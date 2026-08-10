import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/presentation/mfa_screen.dart';
import 'package:fluxer_app/features/auth/providers/mfa_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';
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
    final FocusNode focusNode = editable.focusNode!;

    focusNode.requestFocus();
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isTrue);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    focusNode.unfocus();
    await tester.pump();

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);

    expect(focusNode.hasFocus, isTrue);
  });
}
