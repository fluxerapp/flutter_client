import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

const String _guildId = 'guild';
const String _channelId = 'channel';
const String _categoryId = 'category';

Future<Channel> _channel({String id = _channelId, String? parentId}) async {
  final FluxerDatabase db = openTestDatabase();
  await db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: id,
      guildId: _guildId,
      name: id,
      parentId: Value(parentId),
    ),
  );
  final Channel? row = await db.channelDao.getChannelById(id);
  expect(row, isNotNull);
  return row!;
}

UserGuildSettingsResponse _settings({
  bool muted = false,
  UserNotificationSettings messageNotifications =
      UserNotificationSettings.allMessages,
  UserNotificationSettings? unreadBadges,
  Map<String, ChannelOverrides>? channelOverrides,
}) {
  return UserGuildSettingsResponse(
    guildId: _guildId,
    messageNotifications: messageNotifications,
    muted: muted,
    muteConfig: null,
    mobilePush: true,
    suppressEveryone: false,
    suppressRoles: false,
    hideMutedChannels: false,
    channelOverrides: channelOverrides,
    unreadBadges: unreadBadges,
    version: 1,
  );
}

ChannelOverrides _override({
  UserNotificationSettings? unreadBadges,
  UserNotificationSettings messageNotifications =
      UserNotificationSettings.inherit,
  bool muted = false,
}) {
  return ChannelOverrides(
    collapsed: false,
    messageNotifications: messageNotifications,
    muted: muted,
    muteConfig: null,
    unreadBadges: unreadBadges,
  );
}

void main() {
  group('resolveGuildUnreadBadgesLevel', () {
    test('locks muted communities to no messages', () async {
      final Channel channel = await _channel();
      final UserNotificationSettings? level = resolveGuildUnreadBadgesLevel(
        channel: channel,
        guildSettings: _settings(muted: true),
        unreadBadgeCustomizationEnabled: true,
      );
      expect(level, UserNotificationSettings.noMessages);
    });

    test('locks all messages notification level', () async {
      final Channel channel = await _channel();
      final UserNotificationSettings? level = resolveGuildUnreadBadgesLevel(
        channel: channel,
        guildSettings: _settings(),
        unreadBadgeCustomizationEnabled: true,
      );
      expect(level, UserNotificationSettings.allMessages);
    });

    test('locks no messages notification level', () async {
      final Channel channel = await _channel();
      final UserNotificationSettings? level = resolveGuildUnreadBadgesLevel(
        channel: channel,
        guildSettings: _settings(
          messageNotifications: UserNotificationSettings.noMessages,
        ),
        unreadBadgeCustomizationEnabled: true,
      );
      expect(level, UserNotificationSettings.noMessages);
    });

    test('does not lock only mentions notification level', () async {
      final Channel channel = await _channel();
      final UserNotificationSettings? level = resolveGuildUnreadBadgesLevel(
        channel: channel,
        guildSettings: _settings(
          messageNotifications: UserNotificationSettings.onlyMentions,
          unreadBadges: UserNotificationSettings.allMessages,
        ),
        unreadBadgeCustomizationEnabled: true,
      );
      expect(level, UserNotificationSettings.allMessages);
    });
  });

  group('resolveUnreadBadgesLevel', () {
    test(
      'ignores explicit unread badges when customization is disabled',
      () async {
        final Channel channel = await _channel();
        final UserNotificationSettings? level = resolveUnreadBadgesLevel(
          channel: channel,
          guildSettings: _settings(
            messageNotifications: UserNotificationSettings.onlyMentions,
            unreadBadges: UserNotificationSettings.allMessages,
            channelOverrides: <String, ChannelOverrides>{
              _channelId: _override(
                unreadBadges: UserNotificationSettings.noMessages,
              ),
            },
          ),
        );
        expect(level, isNull);
      },
    );

    test('honors explicit channel unread badge overrides', () async {
      final Channel channel = await _channel();
      final UserNotificationSettings? level = resolveUnreadBadgesLevel(
        channel: channel,
        guildSettings: _settings(
          channelOverrides: <String, ChannelOverrides>{
            _channelId: _override(
              unreadBadges: UserNotificationSettings.noMessages,
            ),
          },
        ),
        unreadBadgeCustomizationEnabled: true,
      );
      expect(level, UserNotificationSettings.noMessages);
    });

    test('inherits category unread badge overrides', () async {
      final Channel channel = await _channel(parentId: _categoryId);
      final UserNotificationSettings? level = resolveUnreadBadgesLevel(
        channel: channel,
        guildSettings: _settings(
          messageNotifications: UserNotificationSettings.onlyMentions,
          channelOverrides: <String, ChannelOverrides>{
            _categoryId: _override(
              unreadBadges: UserNotificationSettings.allMessages,
            ),
          },
        ),
        unreadBadgeCustomizationEnabled: true,
      );
      expect(level, UserNotificationSettings.allMessages);
    });
  });

  group('shouldShowChannelInUnreadInbox', () {
    test('uses explicit badge level before notification fallback', () async {
      final Channel channel = await _channel();
      final UserGuildSettingsResponse settings = _settings(
        channelOverrides: <String, ChannelOverrides>{
          _channelId: _override(
            unreadBadges: UserNotificationSettings.onlyMentions,
          ),
        },
      );
      expect(
        shouldShowChannelInUnreadInbox(
          channel: channel,
          guildSettings: settings,
          hasUnread: true,
          hasMentions: false,
          now: DateTime.utc(2026, 6, 13),
          unreadBadgeCustomizationEnabled: true,
        ),
        isFalse,
      );
      expect(
        shouldShowChannelInUnreadInbox(
          channel: channel,
          guildSettings: settings,
          hasUnread: true,
          hasMentions: true,
          now: DateTime.utc(2026, 6, 13),
          unreadBadgeCustomizationEnabled: true,
        ),
        isTrue,
      );
    });

    test('hides inbox unreads when guild or category is muted', () async {
      final Channel channel = await _channel(parentId: _categoryId);
      final DateTime now = DateTime.utc(2026, 6, 13);
      expect(
        shouldShowChannelInUnreadInbox(
          channel: channel,
          guildSettings: _settings(muted: true),
          hasUnread: true,
          hasMentions: false,
          now: now,
        ),
        isFalse,
      );
      expect(
        shouldShowChannelInUnreadInbox(
          channel: channel,
          guildSettings: _settings(
            channelOverrides: <String, ChannelOverrides>{
              _categoryId: _override(muted: true),
            },
          ),
          hasUnread: true,
          hasMentions: false,
          now: now,
        ),
        isFalse,
      );
    });

    test(
      'falls back to resolved notification levels without explicit badges',
      () async {
        final Channel channel = await _channel();
        expect(
          shouldShowChannelInUnreadInbox(
            channel: channel,
            guildSettings: _settings(
              messageNotifications: UserNotificationSettings.onlyMentions,
            ),
            hasUnread: true,
            hasMentions: false,
            now: DateTime.utc(2026, 6, 13),
          ),
          isFalse,
        );
        expect(
          shouldShowChannelInUnreadInbox(
            channel: channel,
            guildSettings: _settings(
              messageNotifications: UserNotificationSettings.onlyMentions,
            ),
            hasUnread: true,
            hasMentions: true,
            now: DateTime.utc(2026, 6, 13),
          ),
          isTrue,
        );
      },
    );
  });
}
