import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/data/disable_totp_mfa.dart';

class _DisableAdapter implements HttpClientAdapter {
  _DisableAdapter({required this.backupCodes, this.regeneratedCodes});

  final List<Map<String, Object?>> backupCodes;
  final List<Map<String, Object?>>? regeneratedCodes;
  final List<Map<String, Object?>> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final builder = BytesBuilder();
    if (requestStream != null) {
      await for (final chunk in requestStream) {
        builder.add(chunk);
      }
    }
    final body =
        jsonDecode(utf8.decode(builder.takeBytes())) as Map<String, Object?>;
    requests.add(<String, Object?>{'path': options.uri.path, 'body': body});

    if (options.uri.path.endsWith('/users/@me/mfa/backup-codes')) {
      final regenerate = body['regenerate'] == true;
      final codes = regenerate
          ? (regeneratedCodes ?? backupCodes)
          : backupCodes;
      return ResponseBody.fromString(
        jsonEncode(<String, Object?>{'backup_codes': codes}),
        200,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
          'x-fluxer-sudo-mode-jwt': <String>['sudo-token'],
        },
      );
    }

    if (options.uri.path.endsWith('/users/@me/mfa/totp/disable')) {
      return ResponseBody.fromString('', 204);
    }

    return ResponseBody.fromString('{"code":"NOT_FOUND"}', 404);
  }

  @override
  void close({bool force = false}) {}
}

Dio _dio(_DisableAdapter adapter) {
  return Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
}

void main() {
  test('picks the first unused backup code', () {
    expect(
      firstUnusedMfaBackupCode(<String, dynamic>{
        'backup_codes': <Map<String, Object?>>[
          <String, Object?>{'code': 'aaaa-aaaa', 'consumed': true},
          <String, Object?>{'code': 'bbbb-bbbb', 'consumed': false},
        ],
      }),
      'bbbb-bbbb',
    );
  });

  test(
    'verifies sudo with the entered code then disables with a backup code',
    () async {
      final adapter = _DisableAdapter(
        backupCodes: <Map<String, Object?>>[
          <String, Object?>{'code': 'used-code', 'consumed': true},
          <String, Object?>{'code': 'live-code', 'consumed': false},
        ],
      );

      await disableTotpMfa(dio: _dio(adapter), code: '123456');

      expect(adapter.requests, hasLength(2));
      expect(
        adapter.requests[0]['path'],
        endsWith('/users/@me/mfa/backup-codes'),
      );
      expect(adapter.requests[0]['body'], <String, Object?>{
        'regenerate': false,
        'mfa_method': 'totp',
        'mfa_code': '123456',
      });
      expect(
        adapter.requests[1]['path'],
        endsWith('/users/@me/mfa/totp/disable'),
      );
      expect(adapter.requests[1]['body'], <String, Object?>{
        'code': 'live-code',
      });
    },
  );

  test('regenerates backup codes when none are unused', () async {
    final adapter = _DisableAdapter(
      backupCodes: <Map<String, Object?>>[
        <String, Object?>{'code': 'used-code', 'consumed': true},
      ],
      regeneratedCodes: <Map<String, Object?>>[
        <String, Object?>{'code': 'fresh-code', 'consumed': false},
      ],
    );

    await disableTotpMfa(dio: _dio(adapter), code: '123456');

    expect(adapter.requests, hasLength(3));
    expect(adapter.requests[1]['body'], <String, Object?>{'regenerate': true});
    expect(adapter.requests[2]['body'], <String, Object?>{
      'code': 'fresh-code',
    });
  });
}
