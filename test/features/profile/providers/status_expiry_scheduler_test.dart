import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/profile/providers/status_expiry_scheduler.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

class _SettingsAdapter implements HttpClientAdapter {
  _SettingsAdapter({this.statusCode = 400});

  final int statusCode;
  final List<Map<String, Object?>> bodies = <Map<String, Object?>>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final BytesBuilder builder = BytesBuilder();
    if (requestStream != null) {
      await for (final Uint8List chunk in requestStream) {
        builder.add(chunk);
      }
    }
    final String raw = utf8.decode(builder.takeBytes());
    if (raw.isNotEmpty) {
      bodies.add(Map<String, Object?>.from(jsonDecode(raw) as Map));
    }
    return ResponseBody.fromString(
      '{}',
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

UserSettingsResponse _testUserSettings({
  required String status,
  DateTime? statusResetsAt,
  String? statusResetsTo,
}) {
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
    if (statusResetsAt != null)
      'status_resets_at': statusResetsAt.toIso8601String(),
    'status_resets_to': ?statusResetsTo,
  });
}

Future<void> _drainEventQueue() async {
  for (int i = 0; i < 20; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  group('StatusExpiryScheduler', () {
    late _SettingsAdapter adapter;

    Future<void> openScheduler({required int statusCode}) async {
      final db.FluxerDatabase database = openTestDatabase();
      adapter = _SettingsAdapter(statusCode: statusCode);
      final UserSettingsResponse expiredInvisible = _testUserSettings(
        status: 'invisible',
        statusResetsAt: DateTime.utc(2020),
        statusResetsTo: 'online',
      );
      await database.userSettingsDao.upsertSettings(
        db.UserSettingsTableCompanion.insert(
          userId: 'user-1',
          data: jsonEncode(expiredInvisible.toJson()),
        ),
      );
      await database.userDao.upsertUser(
        db.UsersCompanion.insert(id: 'user-1', username: 'user'),
      );
      final Dio dio = Dio()..httpClientAdapter = adapter;
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          fluxerDioProvider.overrideWithValue(dio),
          currentUserIdProvider.overrideWith(_FakeCurrentUserId.new),
          userSettingsStatusProvider.overrideWithValue(expiredInvisible),
        ],
      );
      addTearDown(container.dispose);
      container.read(currentUserIdProvider.notifier).set('user-1');
      container.read(statusExpirySchedulerProvider);
      await _drainEventQueue();
    }

    test('sends null reset fields when an expired reset fails', () async {
      await openScheduler(statusCode: 400);
      expect(adapter.bodies, hasLength(1));
      expect(adapter.bodies.single['status'], 'online');
      expect(adapter.bodies.single['status_resets_at'], isNull);
      expect(adapter.bodies.single['status_resets_to'], isNull);
    });

    test('clears an expired invisible status once', () async {
      await openScheduler(statusCode: 200);
      expect(adapter.bodies, hasLength(1));
      expect(adapter.bodies.single['status'], 'online');
      expect(adapter.bodies.single['status_resets_at'], isNull);
      expect(adapter.bodies.single['status_resets_to'], isNull);
    });
  });
}

class _FakeCurrentUserId extends CurrentUserId {
  @override
  String? build() => null;
}
