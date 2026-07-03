import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

class DmRepository {
  final FluxerClient _client;
  final db.FluxerDatabase _db;
  final GuildUserSettingsRepository _guildUserSettingsRepository;
  final ReadStateRepository? _readStateRepository;

  const DmRepository(
    this._client,
    this._db,
    this._guildUserSettingsRepository, {
    ReadStateRepository? readStateRepository,
  }) : _readStateRepository = readStateRepository;

  ReadStateRepository get _readStateRepo =>
      _readStateRepository ?? ReadStateRepository(_client, _db);

  Stream<List<DmConversation>> watchDmChannels() {
    final controller = StreamController<List<DmConversation>>();
    var latestRows = <db.DmChannel>[];
    var disposed = false;
    var dmReadStateSnapshot = <String, db.ReadState>{};

    Future<void> recompute([List<db.DmChannel>? rows]) async {
      if (disposed) {
        return;
      }
      latestRows = rows ?? await _db.dmChannelDao.getDmChannels();
      final conversations = await _buildConversations(latestRows);
      if (!disposed) {
        controller.add(conversations);
      }
    }

    final dmSub = _db.dmChannelDao.watchDmChannels().listen(
      (rows) => unawaited(recompute(rows)),
      onError: controller.addError,
    );
    final readStateSub = _db.readStateDao.watchReadStates().listen((rows) {
      final dmIds = latestRows.map((r) => r.id).toSet();
      final next = <String, db.ReadState>{
        for (final r in rows)
          if (dmIds.contains(r.channelId)) r.channelId: r,
      };
      if (!dmReadStatesChanged(dmReadStateSnapshot, next)) {
        return;
      }
      dmReadStateSnapshot = next;
      unawaited(recompute());
    }, onError: controller.addError);

    controller.onCancel = () async {
      disposed = true;
      await dmSub.cancel();
      await readStateSub.cancel();
      await controller.close();
    };

    return controller.stream;
  }

  Future<List<DmConversation>> _buildConversations(
    List<db.DmChannel> rows,
  ) async {
    final channelIds = rows.map((r) => r.id).toList();
    final lastMessages = await _db.messageDao.getLastMessageForChannels(
      channelIds,
    );
    final readStates = channelIds.isEmpty
        ? <db.ReadState>[]
        : await _db.readStateDao.watchReadStatesForChannels(channelIds).first;
    final readStateMap = {for (final rs in readStates) rs.channelId: rs};

    final allRecipientIds = <String>{};
    for (final row in rows) {
      allRecipientIds.add(row.recipientId);
      final ids = _parseRecipientIds(row.recipientIds);
      allRecipientIds.addAll(ids);
    }
    allRecipientIds.addAll(lastMessages.values.map((m) => m.authorId));
    for (final db.Message message in lastMessages.values) {
      final String? mentionedUserId = DmConversation.mentionedUserIdFromMessage(
        message,
      );
      if (mentionedUserId != null && mentionedUserId.isNotEmpty) {
        allRecipientIds.add(mentionedUserId);
      }
    }

    final users = await _db.userDao.getUsersByIds(allRecipientIds.toList());
    final userMap = {for (final u in users) u.id: u};

    return rows.map((row) {
      final lastMsg = lastMessages[row.id];
      final readState = readStateMap[row.id];
      final latestMessageId = resolveLatestMessageIdForUnread(
        strictLatestMessageId: lastMsg?.id,
        channelLastMessageId: row.lastMessageId,
        ackLastMessageId: readState?.lastMessageId,
        mentionCount: readState?.mentionCount ?? 0,
      );
      final recipientIds = _parseRecipientIds(row.recipientIds);
      final isGroup = isDmGroupType(row.type);
      final remoteRecipientIds = _buildRemoteRecipientIds(
        recipientIds,
        row.recipientId,
      );
      return DmConversation.fromRow(
        row,
        userMap[row.recipientId],
        cachedLastMessage: lastMsg,
        lastMessageAuthor: lastMsg != null ? userMap[lastMsg.authorId] : null,
        lastMessageMentionedUser: lastMsg == null
            ? null
            : userMap[DmConversation.mentionedUserIdFromMessage(lastMsg)],
        groupStatus: isGroup
            ? _computeGroupStatus(recipientIds, userMap)
            : null,
        groupMembers: isGroup
            ? _buildGroupMembers(recipientIds, userMap)
            : const [],
        remoteRecipientIds: remoteRecipientIds,
        unreadCount: dmUnreadCountFromReadState(
          latestMessageId: latestMessageId,
          ackLastMessageId: readState?.lastMessageId,
          fallbackAckMs: snowflakeTimestampMs(row.id),
          mentionCount: readState?.mentionCount ?? 0,
          cachedUnreadCount: row.unreadCount,
        ),
      );
    }).toList();
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
    final List<String> out = combined.toList()..sort();
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
    return recipientIds.map((id) {
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
    final companion = dmChannelCompanionFromChannelResponse(channel);
    if (companion == null) {
      return null;
    }
    for (final recipient in dmRecipientUsersFromChannelResponse(channel)) {
      await _db.userDao.upsertUser(userFromPartialSdk(recipient));
    }
    return companion;
  }

  Future<void> ensurePersonalNotesChannel(String userId) async {
    final existing = await _db.dmChannelDao.getDmChannelById(userId);
    if (existing != null && isDmPersonalNotesType(existing.type)) {
      return;
    }
    await _db.dmChannelDao.upsertDmChannels([
      buildPersonalNotesDmCompanion(userId: userId),
    ]);
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
      return _buildConversations(rows);
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to fetch DM channels',
      );
    }
  }

  Future<String> ensureDmChannel(String userId) async {
    final rows = await _db.dmChannelDao.getDmChannels();
    for (final row in rows) {
      if (isDmChannelType(row.type) &&
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

  Future<void> markAsRead(String channelId) =>
      _readStateRepo.ackLatest(channelId);

  Future<void> closeDmChannel(String channelId) async {
    await _client.channels.deleteChannel(
      channelId: channelId,
      body: const SudoVerificationSchema(),
    );
    await _db.dmChannelDao.deleteDmChannel(channelId);
  }

  Future<void> pinDm(String channelId) async {
    await _client.users.pinDirectMessageChannel(channelId: channelId);
    await _pinDmLocally(channelId);
  }

  Future<void> unpinDm(String channelId) async {
    await _client.users.unpinDirectMessageChannel(channelId: channelId);
    await _unpinDmLocally(channelId);
  }

  Future<void> _pinDmLocally(String channelId) async {
    final List<String> pinnedIds = (await _db.pinnedDmsDao.getPinnedDms())
        .map((db.PinnedDmsTableData row) => row.channelId)
        .toList();
    if (pinnedIds.contains(channelId)) {
      return;
    }
    pinnedIds.add(channelId);
    await _replacePinnedDms(pinnedIds);
  }

  Future<void> _unpinDmLocally(String channelId) async {
    final List<String> pinnedIds = (await _db.pinnedDmsDao.getPinnedDms())
        .map((db.PinnedDmsTableData row) => row.channelId)
        .where((String id) => id != channelId)
        .toList();
    await _replacePinnedDms(pinnedIds);
  }

  Future<void> _replacePinnedDms(List<String> channelIds) async {
    final List<db.PinnedDmsTableCompanion> companions =
        <db.PinnedDmsTableCompanion>[];
    for (var i = 0; i < channelIds.length; i++) {
      companions.add(
        db.PinnedDmsTableCompanion(
          channelId: Value(channelIds[i]),
          position: Value(i),
        ),
      );
    }
    await _db.pinnedDmsDao.replaceAll(companions);
  }

  Future<void> muteDm(String channelId, {int? durationSeconds}) {
    return _guildUserSettingsRepository.updateChannelOverride(
      guildId: '@me',
      channelId: channelId,
      muted: true,
      durationSeconds: durationSeconds,
    );
  }

  Future<void> unmuteDm(String channelId) {
    return _guildUserSettingsRepository.updateChannelOverride(
      guildId: '@me',
      channelId: channelId,
      muted: false,
    );
  }
}
