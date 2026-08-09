import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/voice/tts/tts_incoming_message_handler.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

Future<FluxerDatabase> _guildDb({
  UserNotificationSettings guildLevel = UserNotificationSettings.noMessages,
  bool muted = false,
}) async {
  final FluxerDatabase db = openTestDatabase();
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: 'channel-1',
      guildId: 'guild-1',
      name: 'general',
    ),
  );
  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion.insert(
      guildId: 'guild-1',
      data: jsonEncode(
        UserGuildSettingsResponse(
          guildId: 'guild-1',
          messageNotifications: guildLevel,
          muted: muted,
          muteConfig: null,
          mobilePush: true,
          suppressEveryone: false,
          suppressRoles: false,
          hideMutedChannels: false,
          channelOverrides: const {},
          version: 1,
        ).toJson(),
      ),
    ),
  );
  return db;
}

Future<FluxerDatabase> _dmDb({
  UserNotificationSettings dmLevel = UserNotificationSettings.noMessages,
  bool muted = false,
}) async {
  final FluxerDatabase db = openTestDatabase();
  await db.dmChannelDao.upsertDmChannels([
    DmChannelsCompanion.insert(id: 'dm-1', recipientId: 'other'),
  ]);
  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion.insert(
      guildId: '@me',
      data: jsonEncode(
        UserGuildSettingsResponse(
          guildId: null,
          messageNotifications: dmLevel,
          muted: false,
          muteConfig: null,
          mobilePush: true,
          suppressEveryone: false,
          suppressRoles: false,
          hideMutedChannels: false,
          channelOverrides: muted
              ? {
                  'dm-1': const ChannelOverrides(
                    collapsed: false,
                    muted: true,
                    messageNotifications: UserNotificationSettings.inherit,
                    muteConfig: null,
                  ),
                }
              : null,
          version: 1,
        ).toJson(),
      ),
    ),
  );
  return db;
}

void main() {
  group('isIncomingTtsMuted', () {
    test('guild no_messages without mute still speaks', () async {
      final FluxerDatabase db = await _guildDb();
      expect(
        await isIncomingTtsMuted(database: db, channelId: 'channel-1'),
        isFalse,
      );
    });

    test('guild mute blocks tts', () async {
      final FluxerDatabase db = await _guildDb(
        guildLevel: UserNotificationSettings.allMessages,
        muted: true,
      );
      expect(
        await isIncomingTtsMuted(database: db, channelId: 'channel-1'),
        isTrue,
      );
    });

    test('dm no_messages without mute still speaks', () async {
      final FluxerDatabase db = await _dmDb();
      expect(
        await isIncomingTtsMuted(database: db, channelId: 'dm-1'),
        isFalse,
      );
    });

    test('muted dm blocks tts', () async {
      final FluxerDatabase db = await _dmDb(
        dmLevel: UserNotificationSettings.allMessages,
        muted: true,
      );
      expect(await isIncomingTtsMuted(database: db, channelId: 'dm-1'), isTrue);
    });

    test('unknown channel is treated as muted', () async {
      final FluxerDatabase db = openTestDatabase();
      expect(
        await isIncomingTtsMuted(database: db, channelId: 'missing'),
        isTrue,
      );
    });
  });
}
