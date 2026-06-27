import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_dart/export.dart';

class _FakeUsersApi implements UsersApi {
  UserSettingsUpdateRequest? lastPushBody;
  Object? pushError;

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    required UserSettingsUpdateRequest body,
  }) async {
    lastPushBody = body;
    if (pushError != null) {
      // The fake accepts arbitrary configured failures to exercise error paths.
      // ignore: only_throw_errors
      throw pushError!;
    }
    return _testUserSettings(status: body.status?.json ?? 'online');
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

UserSettingsResponse _testUserSettings({required String status}) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': status,
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': '',
    'render_embeds': true,
    'profile_privacy': 0,
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'render_reactions': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': null,
    'afk_timeout': 600,
    'default_share_voice_activity': false,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'time_format': 0,
  });
}

void main() {
  group('UserStatusService', () {
    late db.FluxerDatabase database;
    late _FakeUsersApi usersApi;
    late ProviderContainer container;

    setUp(() async {
      database = db.FluxerDatabase.forTesting(NativeDatabase.memory());
      usersApi = _FakeUsersApi();
      await database.userSettingsDao.upsertSettings(
        db.UserSettingsTableCompanion.insert(
          userId: 'user-1',
          data: jsonEncode(_testUserSettings(status: 'online').toJson()),
        ),
      );
      await database.userDao.upsertUser(
        db.UsersCompanion.insert(id: 'user-1', username: 'user'),
      );
      container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
          currentUserIdProvider.overrideWith(_FakeCurrentUserId.new),
          userSettingsStatusProvider.overrideWithValue(
            _testUserSettings(status: 'online'),
          ),
        ],
      );
      container.read(currentUserIdProvider.notifier).set('user-1');
    });

    tearDown(() async {
      container.dispose();
      await database.close();
    });

    test(
      'setPresenceStatus sends permanent status without reset fields',
      () async {
        await container
            .read(userStatusServiceProvider)
            .setPresenceStatus(status: PresenceStatus.dnd);
        expect(usersApi.lastPushBody?.status, PresenceStatus.dnd);
        expect(usersApi.lastPushBody?.statusResetsAt, isNull);
        expect(usersApi.lastPushBody?.statusResetsTo, isNull);
      },
    );

    test('setPresenceStatus sends timed status with reset fields', () async {
      await container
          .read(userStatusServiceProvider)
          .setPresenceStatus(
            status: PresenceStatus.idle,
            duration: const Duration(hours: 1),
          );
      expect(usersApi.lastPushBody?.status, PresenceStatus.idle);
      expect(usersApi.lastPushBody?.statusResetsAt, isNotNull);
      expect(usersApi.lastPushBody?.statusResetsTo, PresenceResetStatus.online);
    });

    test('applyScheduledStatusReset clears reset fields', () async {
      await container
          .read(userStatusServiceProvider)
          .applyScheduledStatusReset(fallbackStatus: PresenceStatus.online);
      expect(usersApi.lastPushBody?.status, PresenceStatus.online);
      expect(usersApi.lastPushBody?.statusResetsAt, isNull);
      expect(usersApi.lastPushBody?.statusResetsTo, isNull);
    });
  });
}

class _FakeCurrentUserId extends CurrentUserId {
  @override
  String? build() => null;
}
