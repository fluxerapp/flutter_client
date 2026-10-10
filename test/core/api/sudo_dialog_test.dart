import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/sudo_dialog.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class _NoRequestAdapter implements HttpClientAdapter {
  const _NoRequestAdapter();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    fail('unexpected ${options.method} ${options.uri.path}');
  }

  @override
  void close({bool force = false}) {}
}

Dio _dio() =>
    Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = const _NoRequestAdapter();

Widget _app(GlobalKey<NavigatorState> navigatorKey) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: const Scaffold(body: SizedBox.shrink()),
    ),
  );
}

void main() {
  testWidgets(
    'passkey-only MFA shows the passkey button and no credential input',
    (tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();

      await tester.pumpWidget(_app(navigatorKey));
      await tester.pumpAndSettle();

      unawaited(
        showSudoVerificationSheet(
          navigatorKey: navigatorKey,
          dio: _dio(),
          challenge: const SudoChallenge(
            hasMfa: true,
            totp: false,
            webauthn: true,
            backupCodes: false,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final l10n = FluxerLocalizations.of(navigatorKey.currentContext!);
      expect(find.text(l10n.mfaMethodWebauthn), findsOneWidget);
      expect(find.byType(FluxerInput), findsNothing);
    },
  );

  testWidgets('TOTP-only MFA shows a code input and no passkey button', (
    tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(_app(navigatorKey));
    await tester.pumpAndSettle();

    unawaited(
      showSudoVerificationSheet(
        navigatorKey: navigatorKey,
        dio: _dio(),
        challenge: const SudoChallenge(
          hasMfa: true,
          totp: true,
          webauthn: false,
          backupCodes: false,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final l10n = FluxerLocalizations.of(navigatorKey.currentContext!);
    expect(find.byType(FluxerInput), findsOneWidget);
    expect(find.text(l10n.mfaMethodWebauthn), findsNothing);
  });

  testWidgets('restores TOTP input focus when app resumes from background', (
    tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(_app(navigatorKey));
    await tester.pumpAndSettle();

    unawaited(
      showSudoVerificationSheet(
        navigatorKey: navigatorKey,
        dio: _dio(),
        challenge: const SudoChallenge(
          hasMfa: true,
          totp: true,
          webauthn: false,
          backupCodes: false,
        ),
      ),
    );
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
    await tester.pump();

    expect(focusNode.hasFocus, isTrue);
  });

  testWidgets('backup codes show a code input that accepts letters', (
    tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(_app(navigatorKey));
    await tester.pumpAndSettle();

    final Future<Map<String, dynamic>?> result = showSudoVerificationSheet(
      navigatorKey: navigatorKey,
      dio: _dio(),
      challenge: const SudoChallenge(
        hasMfa: true,
        totp: false,
        webauthn: true,
        backupCodes: true,
      ),
    );
    await tester.pumpAndSettle();

    final l10n = FluxerLocalizations.of(navigatorKey.currentContext!);
    expect(find.byType(FluxerInput), findsOneWidget);
    await tester.enterText(find.byType(EditableText), 'abcd-1234');
    await tester.tap(find.text(l10n.continueAction));
    await tester.pumpAndSettle();

    expect(await result, <String, dynamic>{
      'mfa_method': 'totp',
      'mfa_code': 'abcd-1234',
    });
  });

  testWidgets('an account without MFA is asked for its password', (
    tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(_app(navigatorKey));
    await tester.pumpAndSettle();

    final Future<Map<String, dynamic>?> result = showSudoVerificationSheet(
      navigatorKey: navigatorKey,
      dio: _dio(),
      challenge: const SudoChallenge(
        hasMfa: false,
        totp: false,
        webauthn: false,
        backupCodes: false,
      ),
    );
    await tester.pumpAndSettle();

    final l10n = FluxerLocalizations.of(navigatorKey.currentContext!);
    await tester.enterText(find.byType(EditableText), 'hunter2');
    await tester.tap(find.text(l10n.continueAction));
    await tester.pumpAndSettle();

    expect(await result, <String, dynamic>{'password': 'hunter2'});
  });

  testWidgets('shows the error of a failed verification', (tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(_app(navigatorKey));
    await tester.pumpAndSettle();

    unawaited(
      showSudoVerificationSheet(
        navigatorKey: navigatorKey,
        dio: _dio(),
        challenge: const SudoChallenge(
          hasMfa: true,
          totp: true,
          webauthn: false,
          backupCodes: true,
          error: 'Invalid MFA code.',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Invalid MFA code.'), findsOneWidget);
  });
}
