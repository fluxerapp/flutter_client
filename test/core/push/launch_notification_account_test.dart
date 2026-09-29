import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/push/launch_notification_account.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

void main() {
  late FluxerDatabase db;
  late MapAuthTokenStorage tokens;
  late AuthRepository repository;

  setUp(() {
    db = openTestDatabase();
    tokens = MapAuthTokenStorage();
    repository = AuthRepository(
      FluxerClient(Dio(BaseOptions(baseUrl: 'https://fluxer.com/api/v1'))),
      db,
      tokens,
      readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
    );
  });

  test('reads target_user_id from a launch payload', () {
    expect(
      targetUserIdFromPushPayloadJson(
        '{"url":"/channels/@me/dm-1","target_user_id":"user-b"}',
      ),
      'user-b',
    );
    expect(targetUserIdFromPushPayloadJson('{"url":"/channels/@me"}'), isNull);
  });

  test('selects the launch account before the previous session', () async {
    await db.authSessionDao.saveSessionMetadata(
      userId: 'user-a',
      username: 'ada',
      instanceSnapshotJson: const InstanceConfigSnapshot(
        apiBaseUrl: 'https://fluxer.com/api/v1',
        gatewayUrl: 'wss://gateway.fluxer.com',
        displayDomain: 'fluxer.com',
      ).toJson(),
    );
    await tokens.saveToken(userId: 'user-a', token: 'token-a');
    await db.authSessionDao.saveSessionMetadata(
      userId: 'user-b',
      username: 'bob',
      instanceSnapshotJson: const InstanceConfigSnapshot(
        apiBaseUrl: 'https://chat.example.com/api',
        gatewayUrl: 'wss://chat.example.com/gateway',
        displayDomain: 'chat.example.com',
      ).toJson(),
    );
    await tokens.saveToken(userId: 'user-b', token: 'token-b');
    await (db.update(db.authSessions)..where((t) => t.userId.equals('user-a')))
        .write(AuthSessionsCompanion(lastActive: Value(DateTime.utc(2020))));
    final beforeA = await db.authSessionDao.getSession('user-a');

    final bool selected = await selectStoredAccountForLaunchPayload(
      payloadJson: '{"url":"/channels/@me/dm-1","target_user_id":"user-b"}',
      dao: db.authSessionDao,
      readSession: repository.getSession,
    );

    expect(selected, isTrue);
    final active = await db.authSessionDao.getActiveSession();
    expect(active?.userId, 'user-b');
    final afterA = await db.authSessionDao.getSession('user-a');
    expect(afterA!.instanceSnapshotJson, beforeA!.instanceSnapshotJson);
    expect(afterA.isValid, isTrue);
  });

  test('ignores a launch account that is expired or missing', () async {
    await db.authSessionDao.saveSessionMetadata(userId: 'user-a');
    await tokens.saveToken(userId: 'user-a', token: 'token-a');
    await db.authSessionDao.saveSessionMetadata(userId: 'user-b');
    await tokens.saveToken(userId: 'user-b', token: 'token-b');
    await db.authSessionDao.markInvalid('user-b');

    expect(
      await selectStoredAccountForLaunchPayload(
        payloadJson: '{"target_user_id":"user-b"}',
        dao: db.authSessionDao,
        readSession: repository.getSession,
      ),
      isFalse,
    );
    expect(
      await selectStoredAccountForLaunchPayload(
        payloadJson: '{"target_user_id":"missing"}',
        dao: db.authSessionDao,
        readSession: repository.getSession,
      ),
      isFalse,
    );
    expect((await db.authSessionDao.getActiveSession())?.userId, 'user-a');
  });
}
