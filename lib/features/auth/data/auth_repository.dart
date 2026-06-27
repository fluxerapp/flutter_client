import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide AuthSession;
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/ban_view.dart';
import 'package:fluxer_app/features/auth/domain/ip_auth_poll_result.dart';
import 'package:fluxer_app/features/auth/domain/ip_authorization_challenge.dart';
import 'package:fluxer_app/features/auth/domain/login_result.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_dart/export.dart';

class AuthRepository {
  final FluxerClient _client;
  final FluxerDatabase _db;
  final AuthTokenStorage _tokenStorage;
  final InstanceConfigSnapshot Function() _readInstanceSnapshot;

  const AuthRepository(
    this._client,
    this._db,
    this._tokenStorage, {
    required InstanceConfigSnapshot Function() readInstanceSnapshot,
  }) : _readInstanceSnapshot = readInstanceSnapshot;

  Future<LoginResult> login({
    required String email,
    required String password,
    String? inviteCode,
  }) async {
    final request = LoginRequest(
      email: email.trim(),
      password: password,
      inviteCode: inviteCode,
    );

    try {
      final response = await _client.auth.loginUser(body: request);

      try {
        final tokenResponse = response.toAuthTokenWithUserIdResponse();
        final session = AuthSession(
          token: tokenResponse.token,
          userId: tokenResponse.userId,
        );

        await _saveSession(session);

        return LoginSuccess(session);
      } on Object {
        // Not a token response — try MFA
      }

      try {
        final mfaResponse = response.toVariant2();
        return LoginMfaRequired(
          MfaChallenge(
            ticket: mfaResponse.ticket,
            totp: mfaResponse.totp,
            sms: false,
            webauthn: mfaResponse.webauthn,
          ),
        );
      } on Object {
        // Not an MFA response either
      }

      // Check for account suspension (ban_view_token in raw JSON).
      final json = response.toJson();
      final banViewToken = json['ban_view_token'] as String?;
      final banType = json['ban_type'] as String?;
      if (banViewToken != null && banType != null) {
        return LoginSuspended(
          BanViewInfo(
            token: banViewToken,
            banType: BanType.fromString(banType),
          ),
        );
      }

      throw const AuthFailure('Unexpected login response from Fluxer API.');
    } on AuthFailure {
      rethrow;
    } on DioException catch (error) {
      final ipChallenge = _extractIpAuthChallenge(error);
      if (ipChallenge != null) {
        return LoginIpAuthRequired(ipChallenge);
      }
      throw _failureFromDio(error);
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _client.auth.forgotPassword(
        body: ForgotPasswordRequest(email: email.trim()),
      );
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  /// Resets the password using a token from a reset email.
  ///
  /// Returns [LoginSuccess] (auto-login) or [LoginMfaRequired] if the user
  /// has MFA enabled.
  Future<LoginResult> resetPassword({
    required String token,
    required String password,
  }) async {
    try {
      final response = await _client.auth.resetPassword(
        body: ResetPasswordRequest(token: token, password: password),
      );

      try {
        final tokenResponse = response.toAuthTokenWithUserIdResponse();
        final session = AuthSession(
          token: tokenResponse.token,
          userId: tokenResponse.userId,
        );
        await _saveSession(session);
        return LoginSuccess(session);
      } on Object {
        // Not a token response — try MFA
      }

      final mfaResponse = response.toVariant2();
      return LoginMfaRequired(
        MfaChallenge(
          ticket: mfaResponse.ticket,
          totp: mfaResponse.totp,
          sms: false,
          webauthn: mfaResponse.webauthn,
        ),
      );
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<List<String>> getUsernameSuggestions({
    required String globalName,
  }) async {
    try {
      final response = await _client.auth.getUsernameSuggestions(
        body: UsernameSuggestionsRequest(globalName: globalName),
      );
      return response.suggestions;
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<AuthSession> register({
    required String email,
    required String password,
    required String dateOfBirth,
    String? username,
    String? displayName,
    String? inviteCode,
  }) async {
    try {
      final response = await _client.auth.registerAccount(
        body: RegisterRequest(
          email: email.trim(),
          password: password,
          dateOfBirth: dateOfBirth,
          consent: true,
          username: (username?.trim().isNotEmpty ?? false)
              ? username!.trim()
              : null,
          globalName: (displayName?.trim().isNotEmpty ?? false)
              ? displayName!.trim()
              : null,
          inviteCode: inviteCode,
        ),
      );

      final tokenResponse = response.toAuthTokenWithUserIdResponse();
      final session = AuthSession(
        token: tokenResponse.token,
        userId: tokenResponse.userId,
      );
      await _saveSession(session);
      return session;
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<AuthSession?> restoreSession() {
    return getActiveSession();
  }

  Future<AuthSession?> getActiveSession() async {
    final row = await _db.authSessionDao.getActiveSession();
    if (row == null) {
      return null;
    }
    return _resolveSessionForUserId(row.userId);
  }

  Future<AuthSession?> getSession(String userId) async {
    final row = await _db.authSessionDao.getSession(userId);
    if (row == null) {
      return null;
    }
    return _resolveSessionForUserId(userId);
  }

  Future<void> migrateLegacyTokens() async {
    final List<({String userId, String token})> legacyTokens = await _db
        .authSessionDao
        .getLegacyTokens();
    if (legacyTokens.isEmpty) {
      await _db.authSessionDao.dropLegacyTokenColumnIfPresent();
      return;
    }
    for (final ({String userId, String token}) entry in legacyTokens) {
      await _tokenStorage.saveToken(userId: entry.userId, token: entry.token);
    }
    await _db.authSessionDao.clearLegacyTokens();
    await _db.authSessionDao.dropLegacyTokenColumnIfPresent();
  }

  Future<void> logout(String userId) async {
    try {
      await _client.auth.logoutUser();
    } on Object {
      // Best-effort API call — proceed with local cleanup regardless.
    }
    await _db.authSessionDao.removeSession(userId);
    await _tokenStorage.deleteToken(userId);
    await _db.clearUserData();
  }

  Future<IpAuthPollResult> pollIpAuthorization(String ticket) async {
    try {
      final response = await _client.auth.pollIpAuthorization(ticket: ticket);
      if (response.completed &&
          response.token != null &&
          response.userId != null) {
        final session = AuthSession(
          token: response.token!,
          userId: response.userId!,
        );
        await _saveSession(session);
        return IpAuthCompleted(session);
      }
      return const IpAuthPending();
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        return const IpAuthExpired();
      }
      rethrow;
    }
  }

  Future<void> resendIpAuthorization(String ticket) async {
    await _client.auth.resendIpAuthorization(
      body: MfaTicketRequest(ticket: ticket),
    );
  }

  Future<void> _saveSession(
    AuthSession session, {
    String? username,
    String? discriminator,
    String? avatar,
  }) async {
    await _tokenStorage.saveToken(userId: session.userId, token: session.token);
    await _db.authSessionDao.saveSessionMetadata(
      userId: session.userId,
      username: username,
      discriminator: discriminator,
      avatar: avatar,
      instanceSnapshotJson: _readInstanceSnapshot().toJson(),
    );
  }

  Future<InstanceConfigSnapshot> resolveInstanceSnapshotForUser(
    String userId,
  ) async {
    final String? json = await _db.authSessionDao.getInstanceSnapshotJson(
      userId,
    );
    if (json == null || json.isEmpty) {
      return InstanceConfigSnapshot.officialDefault();
    }
    return InstanceConfigSnapshot.fromJson(json);
  }

  Future<InstanceConfigSnapshot?> resolveActiveInstanceSnapshot() async {
    final row = await _db.authSessionDao.getActiveSession();
    if (row == null) {
      return null;
    }
    return resolveInstanceSnapshotForUser(row.userId);
  }

  String _resolveDisplayDomain(String? instanceSnapshotJson) {
    const InstanceEndpointNormalizer normalizer = InstanceEndpointNormalizer();
    final String? parsed = _parseDisplayDomain(instanceSnapshotJson);
    final String raw =
        parsed ?? InstanceConfigSnapshot.officialDefault().displayDomain;
    return normalizer.formatDisplayDomain(raw);
  }

  String? _parseDisplayDomain(String? instanceSnapshotJson) {
    if (instanceSnapshotJson == null || instanceSnapshotJson.isEmpty) {
      return null;
    }
    try {
      final Object? decoded = jsonDecode(instanceSnapshotJson);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }
      final Object? displayDomain = decoded['display_domain'];
      if (displayDomain is String && displayDomain.isNotEmpty) {
        return displayDomain;
      }
      return null;
    } on Object {
      return null;
    }
  }

  Future<AuthSession> verifyMfaTotp({
    required String ticket,
    required String code,
  }) async {
    try {
      final response = await _client.auth.loginWithTotp(
        body: MfaTotpRequest(code: code, ticket: ticket),
      );
      final session = AuthSession(
        token: response.token,
        userId: response.userId,
      );
      await _saveSession(session);
      return session;
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<dynamic> getMfaWebauthnOptions({required String ticket}) async {
    try {
      return await _client.auth.getWebauthnMfaOptions(
        body: MfaTicketRequest(ticket: ticket),
      );
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<AuthSession> verifyMfaWebauthn({
    required String ticket,
    required dynamic response,
    required String challenge,
  }) async {
    try {
      final result = await _client.auth.loginWithWebauthnMfa(
        body: WebAuthnMfaRequest(
          response: response,
          challenge: challenge,
          ticket: ticket,
        ),
      );
      final session = AuthSession(token: result.token, userId: result.userId);
      await _saveSession(session);
      return session;
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<dynamic> getPasskeyLoginOptions() async {
    try {
      return await _client.auth.getWebauthnAuthenticationOptions();
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<SsoStartResponse> startSso({
    String? redirectTo,
    String? redirectUri,
  }) async {
    try {
      return await _client.auth.startSso(
        body: SsoStartRequest(redirectTo: redirectTo, redirectUri: redirectUri),
      );
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<AuthSession> completeSso({
    required String code,
    required String state,
  }) async {
    try {
      final SsoCompleteResponse response = await _client.auth.completeSso(
        body: SsoCompleteRequest(code: code, state: state),
      );
      final AuthSession session = AuthSession(
        token: response.token,
        userId: response.userId,
      );
      await _saveSession(
        session,
        username: response.user.username,
        discriminator: response.user.discriminator,
        avatar: response.user.avatar,
      );
      return session;
    } on DioException catch (error) {
      throw _failureFromDio(error);
    }
  }

  Future<LoginResult> loginWithPasskey({
    required dynamic response,
    required String challenge,
  }) async {
    try {
      final result = await _client.auth.authenticateWithWebauthn(
        body: WebAuthnAuthenticateRequest(
          response: response,
          challenge: challenge,
        ),
      );
      final session = AuthSession(token: result.token, userId: result.userId);
      await _saveSession(session);
      return LoginSuccess(session);
    } on DioException catch (error) {
      final ipChallenge = _extractIpAuthChallenge(error);
      if (ipChallenge != null) {
        return LoginIpAuthRequired(ipChallenge);
      }
      throw _failureFromDio(error);
    }
  }

  Future<void> updateStoredUserData({
    required String userId,
    required String? username,
    required String? discriminator,
    required String? avatar,
  }) async {
    await _db.authSessionDao.updateUserData(
      userId: userId,
      username: username,
      discriminator: discriminator,
      avatar: avatar,
    );
  }

  Future<List<StoredAccount>> getStoredAccounts() async {
    final sessions = await _db.authSessionDao.getAllSessions();
    return sessions
        .map(
          (s) => StoredAccount(
            userId: s.userId,
            isValid: s.isValid,
            lastActive: s.lastActive,
            username: s.username,
            discriminator: s.discriminator,
            avatar: s.avatar,
            displayDomain: _resolveDisplayDomain(s.instanceSnapshotJson),
          ),
        )
        .toList();
  }

  Future<void> removeStoredAccount(String userId) async {
    await _db.authSessionDao.removeSession(userId);
    await _tokenStorage.deleteToken(userId);
  }

  Future<void> clearAllSessions() async {
    await _db.authSessionDao.clearSession();
    await _tokenStorage.deleteAllTokens();
  }

  Future<AuthSession?> _resolveSessionForUserId(String userId) async {
    final String? token = await _tokenStorage.readToken(userId);
    if (token == null || token.isEmpty) {
      return null;
    }
    return AuthSession(token: token, userId: userId);
  }

  IpAuthorizationChallenge? _extractIpAuthChallenge(DioException error) {
    if (error.response?.statusCode != 403) {
      return null;
    }

    final data = error.response?.data;
    if (data is! Map<String, dynamic>) {
      return null;
    }

    final code = data['code'] as String?;
    if (code != 'IP_AUTHORIZATION_REQUIRED') {
      return null;
    }

    final ticket = data['ticket'] as String?;
    final email = data['email'] as String?;
    final resendIn = (data['resend_available_in'] as num?)?.toInt();

    if (ticket == null || email == null) {
      return null;
    }

    return IpAuthorizationChallenge(
      ticket: ticket,
      email: email,
      resendAvailableIn: resendIn ?? 30,
    );
  }

  AuthFailure _failureFromDio(DioException error) {
    final responseData = error.response?.data;

    if (responseData is Map<String, dynamic>) {
      final rawErrors = responseData['errors'];
      if (rawErrors is List<dynamic>) {
        var sawInvalidCredentials = false;
        final fieldErrors = <String, String>{};
        for (final item in rawErrors) {
          if (item is! Map<String, dynamic>) {
            continue;
          }
          if (item['code'] == 'INVALID_EMAIL_OR_PASSWORD') {
            sawInvalidCredentials = true;
          }
          // The live API names the failing field `path`; the OpenAPI spec
          // (and the generated SDK model) calls it `field`. Accept either so
          // the helpful per-field message survives spec drift.
          final Object? field = item['path'] ?? item['field'];
          final Object? message = item['message'];
          if (field is String &&
              field.isNotEmpty &&
              message is String &&
              message.isNotEmpty) {
            fieldErrors.putIfAbsent(field, () => message);
          }
        }

        if (sawInvalidCredentials) {
          return const AuthFailure(
            'Invalid email or password.',
            kind: AuthFailureKind.invalidCredentials,
          );
        }
        if (fieldErrors.isNotEmpty) {
          final topMessage = responseData['message'];
          return AuthFailure(
            topMessage is String && topMessage.isNotEmpty
                ? topMessage
                : 'Invalid form body.',
            fieldErrors: fieldErrors,
          );
        }
      }

      final message = responseData['message'];
      if (message is String && message.isNotEmpty) {
        return AuthFailure(message);
      }
    }

    if (responseData is String && responseData.isNotEmpty) {
      return AuthFailure(responseData);
    }

    switch (error.response?.statusCode) {
      case 401:
        return const AuthFailure(
          'Invalid email or password.',
          kind: AuthFailureKind.invalidCredentials,
        );
      case 429:
        return const AuthFailure(
          'Too many attempts. Please wait and try again.',
        );
    }

    if (error.message != null && error.message!.isNotEmpty) {
      return AuthFailure(error.message!);
    }

    return const AuthFailure('Unable to sign in right now. Please try again.');
  }
}
