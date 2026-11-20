// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/password_change_sheet.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/test_l10n.dart';

class _FixedUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() {
    return const UserSettingsViewState(
      userId: '1',
      username: 'alice',
      displayName: 'Alice',
      discriminator: '0',
      avatar: null,
      avatarColor: null,
      memberSince: null,
      status: 'offline',
      messageDisplayCompact: false,
      developerMode: false,
      trustedDomains: <String>[],
      email: 'alice@example.com',
    );
  }

  @override
  Future<void> loadProfile() async {}
}

class _FakeUsersApi implements UsersApi {
  @override
  Future<PasswordChangeStartResponse> startPasswordChange({
    EmptyBodyRequest? body,
  }) async {
    return const PasswordChangeStartResponse(
      ticket: 'ticket',
      codeExpiresAt: '2099-01-01T00:00:00Z',
      resendAvailableAt: null,
    );
  }

  @override
  Future<PasswordChangeVerifyResponse> verifyPasswordChangeCode({
    required PasswordChangeVerifyRequest body,
  }) async {
    return const PasswordChangeVerifyResponse(verificationProof: 'proof');
  }

  @override
  Future<PasswordChangeCompleteResponse> completePasswordChange({
    required PasswordChangeCompleteRequest body,
  }) async {
    return const PasswordChangeCompleteResponse(
      token: 'replacement-token',
      authSessionIdHash: 'replacement-hash',
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._usersApi) : super(Dio());

  final UsersApi _usersApi;

  @override
  UsersApi get users => _usersApi;
}

class _RecordingGatewayConnection extends GatewayConnection {
  _RecordingGatewayConnection() : super(token: 'old-token', dio: Dio());

  String? lastToken;

  @override
  void setToken(String token) {
    lastToken = token;
    super.setToken(token);
  }
}

class _RecordingAuthRepository implements AuthRepository {
  String? persistedToken;

  @override
  Future<void> persistRotatedToken(String token) async {
    persistedToken = token;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  testWidgets(
    'keeps the replacement session after an email verified password change',
    (tester) async {
      final gateway = _RecordingGatewayConnection();
      final authRepository = _RecordingAuthRepository();
      final colorTheme = buildDarkColorTheme();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            instanceRuntimeConfigProvider.overrideWithValue(
              InstanceRuntimeConfig.defaults,
            ),
            userSettingsViewModelProvider.overrideWith(_FixedUserSettings.new),
            fluxerClientProvider.overrideWithValue(
              _FakeClient(_FakeUsersApi()),
            ),
            fluxerBaseUrlProvider.overrideWithValue('https://api.test'),
            gatewayConnectionProvider.overrideWithValue(gateway),
            authRepositoryProvider.overrideWithValue(authRepository),
          ],
          child: MaterialApp(
            locale: kTestLocale,
            localizationsDelegates: fluxerLocalizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
            home: const Scaffold(body: PasswordChangeSheet()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sheet = find.byType(PasswordChangeSheet);
      final l10n = FluxerLocalizations.of(tester.element(sheet));
      final container = ProviderScope.containerOf(tester.element(sheet));

      await tester.tap(find.text(l10n.passwordChangeStart));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'ABCD-EFGH');
      await tester.tap(find.text(l10n.passwordChangeVerify));
      await tester.pumpAndSettle();

      final fields = find.byType(TextField);
      await tester.enterText(fields.at(0), 'correct horse battery');
      await tester.enterText(fields.at(1), 'correct horse battery');
      await tester.tap(find.text(l10n.passwordChangeSubmit));
      await tester.pumpAndSettle();

      expect(container.read(fluxerAuthTokenProvider), 'replacement-token');
      expect(
        container.read(currentAuthSessionIdHashProvider),
        'replacement-hash',
      );
      expect(gateway.lastToken, 'replacement-token');
      expect(authRepository.persistedToken, 'replacement-token');
    },
  );
}
