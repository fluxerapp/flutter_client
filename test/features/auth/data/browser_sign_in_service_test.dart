import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/data/browser_sign_in_service.dart';
import 'package:fluxer_app/features/auth/data/sso_auth_service.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/well_known_fixture.dart';

void main() {
  late FluxerDatabase db;
  late MapAuthTokenStorage tokenStorage;
  late _HandoffServer server;

  setUp(() {
    db = openTestDatabase();
    tokenStorage = MapAuthTokenStorage();
    server = _HandoffServer();
  });

  tearDown(() => db.close());

  BrowserSignInService service(_Browser browser) {
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://chat.example/api'))
      ..httpClientAdapter = server;
    return BrowserSignInService(
      repository: AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: selfHostedInstanceSnapshot,
      ),
      browser: browser,
    );
  }

  test(
    'opens the instance sign-in and redeems the returned grant with the poll secret',
    () async {
      final _Browser browser = _Browser(
        (Uri opened) => Uri.parse(
          'fluxer://handoff?code=${opened.queryParameters['code']}&grant=g-1',
        ),
      );

      final session = await service(browser).signIn(
        instance: selfHostedInstanceSnapshot(),
        identifier: 'ana@chat.example',
        usernameSignIn: false,
      );

      expect(server.initiateBody, <String, Object?>{
        'return_uri': 'fluxer://handoff',
      });
      final Uri opened = browser.opened.single;
      expect(opened.origin, 'https://chat.example');
      expect(opened.path, '/login');
      expect(opened.queryParameters, <String, String>{
        'handoff': '1',
        'code': 'ABCD-EFGH',
        'api': 'https://chat.example',
        'email': 'ana@chat.example',
      });
      expect(server.statusBodies.single, <String, Object?>{
        'poll_secret': 'poll-secret',
        'grant': 'g-1',
      });
      expect(session.token, 'handoff-token');
      expect(await tokenStorage.readToken('42'), 'handoff-token');
      expect(server.cancelled, isFalse);
    },
  );

  test(
    'rejects a return link for another request and cancels the handoff',
    () async {
      final _Browser browser = _Browser(
        (_) => Uri.parse('fluxer://handoff?code=ZZZZ-ZZZZ&grant=g-1'),
      );

      await expectLater(
        service(browser).signIn(
          instance: selfHostedInstanceSnapshot(),
          identifier: '',
          usernameSignIn: false,
        ),
        throwsA(isA<BrowserSignInFailedException>()),
      );

      await pumpEventQueue();
      expect(server.statusBodies, isEmpty);
      expect(server.cancelled, isTrue);
      expect(await tokenStorage.readToken('42'), isNull);
    },
  );

  test('a dismissed browser sheet cancels the handoff', () async {
    final _Browser browser = _Browser(
      (_) => throw const SsoAuthCancelledException(),
    );

    await expectLater(
      service(browser).signIn(
        instance: selfHostedInstanceSnapshot(),
        identifier: '',
        usernameSignIn: false,
      ),
      throwsA(isA<BrowserSignInCancelledException>()),
    );

    await pumpEventQueue();
    expect(server.statusBodies.single, <String, Object?>{
      'poll_secret': 'poll-secret',
    });
    expect(server.cancelled, isTrue);
  });
}

class _Browser extends SsoAuthService {
  _Browser(this._respond);

  final Uri Function(Uri opened) _respond;
  final List<Uri> opened = <Uri>[];

  @override
  Future<Uri> authenticate({required String authorizationUrl}) async {
    final Uri uri = Uri.parse(authorizationUrl);
    opened.add(uri);
    return _respond(uri);
  }
}

class _HandoffServer implements HttpClientAdapter {
  Map<String, Object?>? initiateBody;
  final List<Map<String, Object?>> statusBodies = <Map<String, Object?>>[];
  bool cancelled = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final Map<String, Object?> body = options.data == null
        ? <String, Object?>{}
        : Map<String, Object?>.from(
            jsonDecode(jsonEncode(options.data)) as Map,
          );
    final String route = '${options.method} ${options.uri.path}';
    switch (route) {
      case 'POST /api/auth/handoff/initiate':
        initiateBody = body;
        return _json(<String, Object?>{
          'code': 'ABCD-EFGH',
          'expires_at': '2030-01-01T00:00:00.000Z',
          'poll_secret': 'poll-secret',
          'return_method': 'deep_link',
        });
      case 'POST /api/auth/handoff/ABCD-EFGH/status':
        statusBodies.add(body);
        final bool released =
            body['poll_secret'] == 'poll-secret' && body['grant'] == 'g-1';
        return _json(
          released
              ? <String, Object?>{
                  'status': 'completed',
                  'token': 'handoff-token',
                  'user_id': '42',
                }
              : <String, Object?>{'status': 'pending'},
        );
      case 'DELETE /api/auth/handoff/ABCD-EFGH':
        cancelled = true;
        return ResponseBody.fromString('', 204);
    }
    throw StateError('Unexpected request $route');
  }

  ResponseBody _json(Map<String, Object?> json) => ResponseBody.fromString(
    jsonEncode(json),
    200,
    headers: <String, List<String>>{
      Headers.contentTypeHeader: <String>[Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}
