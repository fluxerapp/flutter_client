import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_linked_devices.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class _FakeAuthApi implements AuthApi {
  _FakeAuthApi({this.sessions = const [], this.listError});
  List<AuthSessionResponse> sessions;
  Object? listError;

  @override
  Future<AuthSessionsResponse> listAuthSessions() async {
    if (listError != null) {
      // ignore: only_throw_errors -- test helper rethrows arbitrary objects to simulate network failures
      throw listError!;
    }
    return sessions;
  }

  @override
  Future<void> logoutAllSessions({
    required LogoutAuthSessionsRequest body,
  }) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._fakeAuth) : super(Dio());

  final AuthApi _fakeAuth;

  @override
  AuthApi get auth => _fakeAuth;
}

Widget _wrap(Widget child, {required AuthApi api, String? currentIdHash}) {
  final colorTheme = buildDarkColorTheme();
  final container = ProviderContainer(
    overrides: [fluxerClientProvider.overrideWithValue(_FakeClient(api))],
  );
  if (currentIdHash != null) {
    container
        .read(currentAuthSessionIdHashProvider.notifier)
        .update(currentIdHash);
  }
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

AuthSessionResponse _session({
  required String id,
  bool current = false,
  String os = 'macOS',
  String platform = 'Fluxer Desktop',
}) {
  return AuthSessionResponse(
    idHash: id,
    maskedIp: null,
    current: current,
    clientInfo: AuthSessionResponseClientInfo(os: os, platform: platform),
    approxLastUsedAt: DateTime.now().subtract(const Duration(hours: 2)),
  );
}

void main() {
  testWidgets('shows loading spinner initially', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const UserLinkedDevices(),
        api: _FakeAuthApi(sessions: [_session(id: 'a')]),
        currentIdHash: 'a',
      ),
    );
    expect(find.byType(FluxerLoadingSpinner), findsOneWidget);
  });

  testWidgets('shows load error with retry after failure', (tester) async {
    final api = _FakeAuthApi(
      listError: DioException(requestOptions: RequestOptions()),
    );
    await tester.pumpWidget(_wrap(const UserLinkedDevices(), api: api));
    await tester.pumpAndSettle();

    expect(find.text('Network Error'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });

  testWidgets('renders current-only device list without bulk button', (
    tester,
  ) async {
    final api = _FakeAuthApi(sessions: [_session(id: 'a')]);
    await tester.pumpWidget(
      _wrap(const UserLinkedDevices(), api: api, currentIdHash: 'a'),
    );
    await tester.pumpAndSettle();

    expect(find.text('CURRENT DEVICE'), findsOneWidget);
    expect(find.text('OTHER DEVICES'), findsNothing);
    expect(find.text('Sign out all other devices'), findsNothing);
  });

  testWidgets('renders both sections and bulk button with multiple sessions', (
    tester,
  ) async {
    final api = _FakeAuthApi(
      sessions: [
        _session(id: 'a'),
        _session(id: 'b'),
        _session(id: 'c', os: 'iOS'),
      ],
    );
    await tester.pumpWidget(
      _wrap(const UserLinkedDevices(), api: api, currentIdHash: 'a'),
    );
    await tester.pumpAndSettle();

    expect(find.text('CURRENT DEVICE'), findsOneWidget);
    expect(find.text('OTHER DEVICES'), findsOneWidget);
    expect(find.text('Sign out all other devices'), findsOneWidget);
  });

  testWidgets('hides bulk button when only one other device exists', (
    tester,
  ) async {
    final api = _FakeAuthApi(
      sessions: [
        _session(id: 'a'),
        _session(id: 'b'),
      ],
    );
    await tester.pumpWidget(
      _wrap(const UserLinkedDevices(), api: api, currentIdHash: 'a'),
    );
    await tester.pumpAndSettle();

    expect(find.text('OTHER DEVICES'), findsOneWidget);
    expect(find.text('Sign out all other devices'), findsNothing);
  });

  testWidgets('shows Network Error when current session cannot be identified', (
    tester,
  ) async {
    // Mirrors web behavior: without a gateway-supplied current session id
    // hash, the widget refuses to render the device list to avoid
    // accidentally revoking the wrong session.
    final api = _FakeAuthApi(
      sessions: [
        _session(id: 'a'),
        _session(id: 'b'),
        _session(id: 'c'),
      ],
    );
    await tester.pumpWidget(_wrap(const UserLinkedDevices(), api: api));
    await tester.pumpAndSettle();

    expect(find.text('Network Error'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('CURRENT DEVICE'), findsNothing);
    expect(find.text('OTHER DEVICES'), findsNothing);
    expect(find.text('Sign out all other devices'), findsNothing);
  });

  testWidgets('identifies current session via gateway-supplied id hash', (
    tester,
  ) async {
    final api = _FakeAuthApi(
      sessions: [
        _session(id: 'a'),
        _session(id: 'b'),
        _session(id: 'c'),
      ],
    );
    await tester.pumpWidget(
      _wrap(const UserLinkedDevices(), api: api, currentIdHash: 'b'),
    );
    await tester.pumpAndSettle();

    expect(find.text('CURRENT DEVICE'), findsOneWidget);
    expect(find.text('OTHER DEVICES'), findsOneWidget);
  });
}
