import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/dm/data/dm_conversation_mapper.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/utils/invites/invite_code.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

class DmRepository {
  final FluxerClient _client;
  final db.FluxerDatabase _db;
  final GuildUserSettingsRepository _guildUserSettingsRepository;
  final ReadStateRepository? _readStateRepository;
  final String _productName;

  const DmRepository(
    this._client,
    this._db,
    this._guildUserSettingsRepository, {
    this._readStateRepository,
    this._productName = InstanceConstants.defaultProductName,
  });

  ReadStateRepository get _readStateRepo =>
      _readStateRepository ?? ReadStateRepository(_client, _db);

  Stream<List<DmConversation>> watchDmChannels() {
    final controller = StreamController<List<DmConversation>>();
    var disposed = false;
    var latestRows = <db.DmChannel>[];
    var rowsById = <String, db.DmChannel>{};
    final conversations = <String, DmConversation>{};
    final builtReadStates = <String, db.ReadState?>{};
    final dirtyIds = <String>{};
    var lightIds = <String>{};
    var didLightEmit = false;
    var draining = false;
    var pendingEmit = false;
    List<DmConversation>? emitted;
    StreamSubscription<List<db.ReadState>>? readStateSub;
    var readStateIds = <String>{};
    var watchedReadStates = <String, db.ReadState>{};
    var watchedReadStateIds = <String>{};

    void markReadStateDrift(Iterable<String> ids) {
      for (final String id in ids) {
        if (watchedReadStateIds.contains(id) &&
            builtReadStates.containsKey(id) &&
            dmReadStateUnreadFieldsChanged(
              builtReadStates[id],
              watchedReadStates[id],
            )) {
          dirtyIds.add(id);
        }
      }
    }

    void emit() {
      final next = <DmConversation>[
        for (final db.DmChannel row in latestRows) conversations[row.id]!,
      ];
      final previous = emitted;
      var same = previous != null && next.length == previous.length;
      for (var i = 0; same && i < next.length; i++) {
        same = identical(next[i], previous![i]);
      }
      if (same) {
        return;
      }
      emitted = next;
      controller.add(next);
    }

    void store(
      ({
        Map<String, DmConversation> conversations,
        Map<String, db.ReadState> readStates,
      })
      built,
    ) {
      final ids = <String>[
        for (final String id in built.conversations.keys)
          if (rowsById.containsKey(id)) id,
      ];
      for (final String id in ids) {
        conversations[id] = built.conversations[id]!;
        builtReadStates[id] = built.readStates[id];
      }
      markReadStateDrift(ids);
    }

    Future<void> rebuild(
      List<db.DmChannel> rows, {
      bool includeLastMessages = true,
    }) async {
      try {
        store(
          await _buildConversations(
            rows,
            includeLastMessages: includeLastMessages,
          ),
        );
      } catch (_) {
        dirtyIds.addAll(rows.map((db.DmChannel row) => row.id));
        rethrow;
      }
    }

    Future<void> drain() async {
      if (draining) {
        return;
      }
      draining = true;
      try {
        if (!didLightEmit) {
          didLightEmit = true;
          final rows = latestRows;
          dirtyIds.clear();
          await rebuild(rows, includeLastMessages: false);
          if (disposed) {
            return;
          }
          if (dirtyIds.isEmpty) {
            emit();
          }
          final bool needsEnrichment = rows.any(
            (db.DmChannel row) =>
                row.lastMessageId != null && row.lastMessageId!.isNotEmpty,
          );
          final ids = {for (final db.DmChannel row in rows) row.id};
          if (needsEnrichment) {
            dirtyIds.addAll(ids);
          } else {
            lightIds = ids;
          }
        }
        while (!disposed && (dirtyIds.isNotEmpty || pendingEmit)) {
          pendingEmit = false;
          final rows = <db.DmChannel>[
            for (final db.DmChannel row in latestRows)
              if (dirtyIds.contains(row.id)) row,
          ];
          dirtyIds.clear();
          if (rows.isNotEmpty) {
            await rebuild(rows);
            if (disposed) {
              return;
            }
          }
          if (dirtyIds.isEmpty) {
            emit();
          }
        }
      } finally {
        draining = false;
      }
    }

    void schedule() {
      dirtyIds.addAll(lightIds);
      lightIds = <String>{};
      unawaited(drain().catchError(controller.addError));
    }

    void watchReadStatesFor(Set<String> ids) {
      if (ids.length == readStateIds.length && readStateIds.containsAll(ids)) {
        return;
      }
      readStateIds = ids;
      unawaited(readStateSub?.cancel());
      readStateSub = null;
      watchedReadStateIds = <String>{};
      if (ids.isEmpty) {
        return;
      }
      readStateSub = _db.readStateDao
          .watchReadStatesForChannels(ids.toList())
          .listen((states) {
            watchedReadStates = <String, db.ReadState>{
              for (final db.ReadState state in states) state.channelId: state,
            };
            watchedReadStateIds = ids;
            final int before = dirtyIds.length;
            markReadStateDrift(ids);
            if (dirtyIds.length != before) {
              schedule();
            }
          }, onError: controller.addError);
    }

    final dmSub = _db.dmChannelDao.watchDmChannels().listen((rows) {
      if (disposed) {
        return;
      }
      final next = <String, db.DmChannel>{
        for (final db.DmChannel row in rows) row.id: row,
      };
      for (final db.DmChannel row in rows) {
        if (rowsById[row.id] != row) {
          dirtyIds.add(row.id);
        }
      }
      for (final String id in rowsById.keys) {
        if (!next.containsKey(id)) {
          conversations.remove(id);
          builtReadStates.remove(id);
          lightIds.remove(id);
        }
      }
      latestRows = rows;
      rowsById = next;
      pendingEmit = true;
      watchReadStatesFor(next.keys.toSet());
      schedule();
    }, onError: controller.addError);

    controller.onCancel = () async {
      disposed = true;
      await dmSub.cancel();
      await readStateSub?.cancel();
      await controller.close();
    };

    return controller.stream;
  }

  Future<DmConversation> conversationFromChannelRow(db.DmChannel row) {
    return buildDmConversationFromChannelRow(
      _db,
      row,
      productName: _productName,
    );
  }

  Future<
    ({
      Map<String, DmConversation> conversations,
      Map<String, db.ReadState> readStates,
    })
  >
  _buildConversations(
    List<db.DmChannel> rows, {
    bool includeLastMessages = true,
  }) async {
    final channelIds = rows.map((r) => r.id).toList();
    final Map<String, db.Message> lastMessagesForUnread = await _db.messageDao
        .getLastMessageForChannels(channelIds);
    final Map<String, db.Message> lastMessages = includeLastMessages
        ? lastMessagesForUnread
        : const <String, db.Message>{};
    final readStates = channelIds.isEmpty
        ? <db.ReadState>[]
        : await _db.readStateDao.watchReadStatesForChannels(channelIds).first;
    final readStateMap = {for (final rs in readStates) rs.channelId: rs};

    final allRecipientIds = <String>{};
    for (final row in rows) {
      allRecipientIds.add(row.recipientId);
      final ids = parseDmChannelRecipientIds(row.recipientIds);
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

    final conversations = <String, DmConversation>{};
    for (final db.DmChannel row in rows) {
      final lastMsg = lastMessages[row.id];
      final lastMsgForUnread = lastMessagesForUnread[row.id];
      final readState = readStateMap[row.id];
      final latestMessageId = resolveLatestMessageIdForUnread(
        strictLatestMessageId: lastMsgForUnread?.id,
        channelLastMessageId: row.lastMessageId,
        ackLastMessageId: readState?.lastMessageId,
        mentionCount: readState?.mentionCount ?? 0,
        channelLastMessageExistsInCache:
            lastMsgForUnread?.id == row.lastMessageId,
      );
      final recipientIds = parseDmChannelRecipientIds(row.recipientIds);
      final isGroup = isDmGroupType(row.type);
      final remoteRecipientIds = buildDmRemoteRecipientIds(
        recipientIds,
        row.recipientId,
        isGroup: isGroup,
      );
      conversations[row.id] = DmConversation.fromRow(
        row,
        userMap[row.recipientId],
        cachedLastMessage: lastMsg,
        lastMessageAuthor: lastMsg != null ? userMap[lastMsg.authorId] : null,
        lastMessageMentionedUser: lastMsg == null
            ? null
            : userMap[DmConversation.mentionedUserIdFromMessage(lastMsg)],
        groupMembers: isGroup
            ? buildDmGroupMembers(recipientIds, userMap)
            : const [],
        channelNicks: isGroup
            ? parseDmChannelNicksJson(row.nicksJson)
            : const {},
        remoteRecipientIds: remoteRecipientIds,
        unreadCount: dmUnreadCountFromReadState(
          latestMessageId: latestMessageId,
          ackLastMessageId: readState?.lastMessageId,
          fallbackAckMs: snowflakeTimestampMs(row.id),
          mentionCount: readState?.mentionCount ?? 0,
          cachedUnreadCount: row.unreadCount,
        ),
        productName: _productName,
      );
    }
    return (conversations: conversations, readStates: readStateMap);
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
      return (await _buildConversations(rows)).conversations.values.toList();
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<String> ensureDmChannel(String userId) async {
    final rows = await _db.dmChannelDao.getDmChannels();
    for (final row in rows) {
      if (isDmChannelType(row.type) &&
          (row.recipientId == userId ||
              parseDmChannelRecipientIds(row.recipientIds).contains(userId))) {
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

  Future<String> createGroupDmChannel(List<String> recipientIds) async {
    final channel = await _client.users.createPrivateChannel(
      body: CreatePrivateChannelRequest(recipients: recipientIds),
    );
    final companion = await _buildDmChannelCompanion(channel);
    if (companion != null) {
      await _db.dmChannelDao.upsertDmChannels([companion]);
    }
    return channel.id;
  }

  Future<String> createDmFromSelection(List<String> userIds) {
    if (userIds.length == 1) {
      return ensureDmChannel(userIds.first);
    }
    return createGroupDmChannel(userIds);
  }

  Future<List<DmConversation>> findDuplicateGroupDms(
    List<String> recipientIds, {
    String? excludeChannelId,
  }) async {
    if (recipientIds.length < 2) {
      return const <DmConversation>[];
    }
    final String key = canonicalizeRecipientIds(recipientIds);
    final List<db.DmChannel> rows = await _db.dmChannelDao.getDmChannels();
    final List<db.DmChannel> matches =
        rows
            .where(
              (db.DmChannel row) => isDuplicateGroupDmRow(
                row: row,
                canonicalKey: key,
                excludeChannelId: excludeChannelId,
              ),
            )
            .toList()
          ..sort((db.DmChannel a, db.DmChannel b) {
            final String aSnowflake = a.lastMessageId ?? a.id;
            final String bSnowflake = b.lastMessageId ?? b.id;
            return dateTimeFromSnowflakeAsLocalOrNow(
              bSnowflake,
            ).compareTo(dateTimeFromSnowflakeAsLocalOrNow(aSnowflake));
          });
    return (await _buildConversations(matches)).conversations.values.toList();
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

  Future<ChannelResponse> updateGroupDm({
    required String channelId,
    required String? name,
    String? icon,
    bool removeIcon = false,
  }) async {
    try {
      final ChannelResponse response = await _client.channels.updateChannel(
        channelId: channelId,
        body: ChannelUpdateRequestBody(<String, dynamic>{
          'name': name,
          if (removeIcon) 'icon': null else 'icon': ?icon,
        }),
      );
      final db.DmChannelsCompanion? companion = await _buildDmChannelCompanion(
        response,
      );
      if (companion != null) {
        await _db.dmChannelDao.upsertDmChannels([companion]);
      }
      return response;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<void> addGroupDmMember({
    required String channelId,
    required String userId,
  }) async {
    await _client.channels.addGroupDmRecipient(
      channelId: channelId,
      userId: userId,
    );
  }

  Future<void> removeGroupDmMember({
    required String channelId,
    required String userId,
  }) {
    return _client.channels.removeGroupDmRecipient(
      channelId: channelId,
      userId: userId,
    );
  }

  Future<String> createGroupDmInvite({required String channelId}) async {
    try {
      final InviteMetadataResponseSchema invite = await _client.invites
          .createChannelInvite(
            channelId: channelId,
            body: const ChannelInviteCreateRequest(maxAge: 86400),
          );
      return inviteCodeOf(invite);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<List<InviteMetadataResponseSchema>> listGroupDmInvites(
    String channelId,
  ) async {
    try {
      return await _client.invites.listChannelInvites(channelId: channelId);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<void> revokeGroupDmInvite(String inviteCode) async {
    try {
      await _client.invites.deleteInvite(inviteCode: inviteCode);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

bool dmReadStateUnreadFieldsChanged(
  db.ReadState? previous,
  db.ReadState? next,
) {
  if (previous == null || next == null) {
    return previous != next;
  }
  return previous.lastMessageId != next.lastMessageId ||
      previous.mentionCount != next.mentionCount;
}
