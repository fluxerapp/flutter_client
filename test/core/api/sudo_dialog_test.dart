import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/sudo_dialog.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class _MfaMethodsAdapter implements HttpClientAdapter {
  const _MfaMethodsAdapter({
    required this.totp,
    required this.webauthn,
    required this.hasMfa,
  });

  final bool totp;
  final bool webauthn;
  final bool hasMfa;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'GET');
    expect(options.uri.path, endsWith('/users/@me/sudo/mfa-methods'));
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{
        'totp': totp,
        'webauthn': webauthn,
        'has_mfa': hasMfa,
      }),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Widget _app(GlobalKey<NavigatorState> navigatorKey) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
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
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _MfaMethodsAdapter(
          totp: false,
          webauthn: true,
          hasMfa: true,
        );

      await tester.pumpWidget(_app(navigatorKey));
      await tester.pumpAndSettle();

      unawaited(
        showSudoVerificationSheet(navigatorKey: navigatorKey, dio: dio),
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
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = const _MfaMethodsAdapter(
        totp: true,
        webauthn: false,
        hasMfa: true,
      );

    await tester.pumpWidget(_app(navigatorKey));
    await tester.pumpAndSettle();

    unawaited(showSudoVerificationSheet(navigatorKey: navigatorKey, dio: dio));
    await tester.pumpAndSettle();

    final l10n = FluxerLocalizations.of(navigatorKey.currentContext!);
    expect(find.byType(FluxerInput), findsOneWidget);
    expect(find.text(l10n.mfaMethodWebauthn), findsNothing);
  });
}
