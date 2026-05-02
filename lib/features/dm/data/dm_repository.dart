import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

class DmRepository {
  final FluxerClient _client;
  final db.FluxerDatabase _db;

  const DmRepository(this._client, this._db);

  Stream<List<DmConversation>> watchDmChannels() {
    return _db.dmChannelDao.watchDmChannels().asyncMap((rows) async {
      final channelIds = rows.map((r) => r.id).toList();
      final lastMessages = await _db.messageDao.getLastMessageForChannels(
        channelIds,
      );

      final allRecipientIds = <String>{};
      for (final row in rows) {
        allRecipientIds.add(row.recipientId);
        final ids = _parseRecipientIds(row.recipientIds);
        allRecipientIds.addAll(ids);
      }
      allRecipientIds.addAll(lastMessages.values.map((m) => m.authorId));

      final users = await _db.userDao.getUsersByIds(allRecipientIds.toList());
      final userMap = {for (final u in users) u.id: u};

      return rows.map((row) {
        final lastMsg = lastMessages[row.id];
        final recipientIds = _parseRecipientIds(row.recipientIds);
        final isGroup = row.type == 3;
        final remoteRecipientIds = _buildRemoteRecipientIds(
          recipientIds,
          row.recipientId,
        );
        return DmConversation.fromRow(
          row,
          userMap[row.recipientId],
          cachedLastMessage: lastMsg,
          lastMessageAuthor: lastMsg != null ? userMap[lastMsg.authorId] : null,
          groupStatus: isGroup
              ? _computeGroupStatus(recipientIds, userMap)
              : null,
          groupMembers: isGroup
              ? _buildGroupMembers(recipientIds, userMap)
              : const [],
          remoteRecipientIds: remoteRecipientIds,
        );
      }).toList();
    });
  }

  static List<String> _parseRecipientIds(String json) {
    try {
      final List<dynamic> raw = jsonDecode(json) as List<dynamic>;
      return raw.map((e) => e.toString()).where((s) => s.isNotEmpty).toList();
    } on Object {
      return [];
    }
  }

  static List<String> _buildRemoteRecipientIds(
    List<String> parsedRecipientIds,
    String primaryRecipientId,
  ) {
    final Set<String> combined = {...parsedRecipientIds, primaryRecipientId};
    final List<String> out = combined.toList();
    out.sort();
    return out;
  }

  static String? _computeGroupStatus(
    List<String> recipientIds,
    Map<String, db.User> userMap,
  ) {
    for (final id in recipientIds) {
      if (userMap[id]?.status == 'online') {
        return 'online';
      }
    }
    return null;
  }

  static List<GroupMemberInfo> _buildGroupMembers(
    List<String> recipientIds,
    Map<String, db.User> userMap,
  ) {
    return recipientIds.take(3).map((id) {
      final user = userMap[id];
      return GroupMemberInfo(
        id: id,
        avatar: user?.avatar,
        name: user?.globalName ?? user?.username ?? '',
      );
    }).toList();
  }

  Future<db.DmChannelsCompanion?> _buildDmChannelCompanion(
    ChannelResponse channel,
  ) async {
    if (channel.type != 1 && channel.type != 3) {
      return null;
    }

    final recipients = channel.recipients;
    if (recipients == null || recipients.isEmpty) {
      return null;
    }

    for (final recipient in recipients) {
      await _db.userDao.upsertUser(userFromPartialSdk(recipient));
    }

    return db.DmChannelsCompanion.insert(
      id: channel.id,
      recipientId: recipients.first.id,
      type: Value(channel.type),
      name: Value(channel.name),
      icon: Value(channel.icon),
      recipientCount: Value(recipients.length + 1),
      recipientIds: Value(jsonEncode(recipients.map((r) => r.id).toList())),
      lastMessageTime: Value(
        channel.lastMessageId != null
            ? dateTimeFromSnowflakeAsLocalOrNow(channel.lastMessageId!)
            : dateTimeFromSnowflakeAsLocalOrNow(channel.id),
      ),
    );
  }

  Future<List<DmConversation>> getDmChannels() async {
    try {
      final channels = await _client.users.listPrivateChannels();

      final companions = <db.DmChannelsCompanion>[];
      for (final ch in channels) {
        final companion = await _buildDmChannelCompanion(ch);
        if (companion != null) {
          companions.add(companion);
        }
      }

      await _db.dmChannelDao.upsertDmChannels(companions);

      final rows = await _db.dmChannelDao.getDmChannels();
      final channelIds = rows.map((r) => r.id).toList();
      final lastMessages = await _db.messageDao.getLastMessageForChannels(
        channelIds,
      );

      final allRecipientIds = <String>{
        ...rows.map((r) => r.recipientId),
        ...lastMessages.values.map((m) => m.authorId),
      };
      for (final row in rows) {
        allRecipientIds.addAll(_parseRecipientIds(row.recipientIds));
      }
      final users = await _db.userDao.getUsersByIds(allRecipientIds.toList());
      final userMap = {for (final u in users) u.id: u};

      return rows.map((row) {
        final lastMsg = lastMessages[row.id];
        final recipientIds = _parseRecipientIds(row.recipientIds);
        final isGroup = row.type == 3;
        final remoteRecipientIds = _buildRemoteRecipientIds(
          recipientIds,
          row.recipientId,
        );
        return DmConversation.fromRow(
          row,
          userMap[row.recipientId],
          cachedLastMessage: lastMsg,
          lastMessageAuthor: lastMsg != null ? userMap[lastMsg.authorId] : null,
          groupStatus: isGroup
              ? _computeGroupStatus(recipientIds, userMap)
              : null,
          groupMembers: isGroup
              ? _buildGroupMembers(recipientIds, userMap)
              : const [],
          remoteRecipientIds: remoteRecipientIds,
        );
      }).toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to fetch DM channels',
      );
    }
  }

  Future<String> ensureDmChannel(String userId) async {
    final rows = await _db.dmChannelDao.getDmChannels();
    for (final row in rows) {
      if (row.type == 1 &&
          (row.recipientId == userId ||
              _parseRecipientIds(row.recipientIds).contains(userId))) {
        return row.id;
      }
    }

    final channel = await _client.users.createPrivateChannel(
      body: CreatePrivateChannelRequest(recipientId: userId),
    );
    final companion = await _buildDmChannelCompanion(channel);
    if (companion != null) {
      await _db.dmChannelDao.upsertDmChannels([companion]);
    }

    return channel.id;
  }

  Future<void> markAsRead(String channelId) async {
    await _db.dmChannelDao.markAsRead(channelId);

    // Find the latest message to ack: prefer cached messages, fall back
    // to the read state's ack point.
    final messages = await _db.messageDao.getMessages(channelId, limit: 1);
    final messageId = messages.isNotEmpty
        ? messages.last.id
        : (await _db.readStateDao.getReadState(channelId))?.lastMessageId;
    if (messageId != null) {
      await _client.channels.acknowledgeMessage(
        channelId: channelId,
        messageId: messageId,
        body: const MessageAckRequest(),
      );
    }
  }

  Future<void> closeDmChannel(String channelId) async {
    await _client.channels.deleteChannel(channelId: channelId);
    await _db.dmChannelDao.deleteDmChannel(channelId);
  }

  Future<void> pinDm(String channelId) async {
    await _client.users.pinDirectMessageChannel(channelId: channelId);
  }

  Future<void> unpinDm(String channelId) async {
    await _client.users.unpinDirectMessageChannel(channelId: channelId);
  }

  Future<void> muteDm(String channelId, {int? durationSeconds}) async {
    String? endTime;
    final selectedTimeWindow = durationSeconds ?? -1;
    if (durationSeconds != null) {
      endTime = DateTime.now()
          .add(Duration(seconds: durationSeconds))
          .toUtc()
          .toIso8601String();
    }

    await _client.users.updateDmNotificationSettings(
      body: UserGuildSettingsUpdateRequest(
        channelOverrides: {
          channelId: ChannelOverrides(
            collapsed: false,
            messageNotifications: UserNotificationSettings.inherit,
            muted: true,
            muteConfig: ChannelOverridesMuteConfig(
              endTime: endTime,
              selectedTimeWindow: selectedTimeWindow,
            ),
          ),
        },
      ),
    );
  }

  Future<void> unmuteDm(String channelId) async {
    await _client.users.updateDmNotificationSettings(
      body: UserGuildSettingsUpdateRequest(
        channelOverrides: {
          channelId: const ChannelOverrides(
            collapsed: false,
            messageNotifications: UserNotificationSettings.inherit,
            muted: false,
            muteConfig: null,
          ),
        },
      ),
    );
  }
}
