import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

class _RecordingAccountManager extends AccountManager {
  final List<String> switched = <String>[];
  @visibleForTesting
  int loads = 0;

  @override
  Future<void> loadAccounts() async {
    await super.loadAccounts();
    loads++;
  }

  @override
  Future<void> switchToAccount(String userId) async {
    switched.add(userId);
  }
}

Future<void> _waitUntil(
  bool Function() ready, {
  Duration timeout = const Duration(seconds: 2),
}) async {
  final DateTime deadline = DateTime.now().add(timeout);
  while (!ready() && DateTime.now().isBefore(deadline)) {
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
}

void main() {
  test('cross-account tap switches when accounts are not loaded yet', () async {
    final FluxerDatabase db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    await db.authSessionDao.saveSessionMetadata(
      userId: 'user-b',
      username: 'bob',
    );
    await tokens.saveToken(userId: 'user-b', token: 'token-b');
    final _RecordingAccountManager accounts = _RecordingAccountManager();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        authTokenStorageProvider.overrideWithValue(tokens),
        authRepositoryProvider.overrideWithValue(
          AuthRepository(
            FluxerClient(
              Dio(BaseOptions(baseUrl: 'https://fluxer.com/api/v1')),
            ),
            db,
            tokens,
            readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
          ),
        ),
        accountManagerProvider.overrideWith(() => accounts),
      ],
    );
    addTearDown(container.dispose);
    container.read(currentUserIdProvider.notifier).set('user-a');
    expect(container.read(accountManagerProvider).accounts, isEmpty);

    container.read(pushNotificationTapHandlerProvider.notifier).handlePayload(
      <String, String>{
        'url': '/channels/@me/dm-1/msg-9',
        'target_user_id': 'user-b',
      },
    );

    await _waitUntil(() => accounts.switched.isNotEmpty);
    expect(accounts.switched, <String>['user-b']);
    expect(
      container.read(pendingPushNotificationPathProvider)?.accountUserId,
      'user-b',
    );
    expect(
      container.read(pendingPushNotificationPathProvider)?.path,
      '/channels/@me/dm-1/msg-9',
    );
  });

  test('cross-account tap ignores a user that is not stored', () async {
    final FluxerDatabase db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    final _RecordingAccountManager accounts = _RecordingAccountManager();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        authTokenStorageProvider.overrideWithValue(tokens),
        authRepositoryProvider.overrideWithValue(
          AuthRepository(
            FluxerClient(
              Dio(BaseOptions(baseUrl: 'https://fluxer.com/api/v1')),
            ),
            db,
            tokens,
            readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
          ),
        ),
        accountManagerProvider.overrideWith(() => accounts),
      ],
    );
    addTearDown(container.dispose);
    container.read(currentUserIdProvider.notifier).set('user-a');

    container.read(pushNotificationTapHandlerProvider.notifier).handlePayload(
      <String, String>{
        'url': '/channels/@me/dm-1/msg-9',
        'target_user_id': 'missing',
      },
    );

    await _waitUntil(() => accounts.loads > 0);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(accounts.switched, isEmpty);
    expect(container.read(pendingPushNotificationPathProvider), isNull);
  });
}
