import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType, isThreadOnlyChannelType;
import 'package:fluxer_app/features/forum/domain/forum_channel.dart'
    show forumNewPostsUnreadEnabled;
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_provider.g.dart';

@immutable
class UnreadState {
  final bool hasUnread;
  final bool hasUnreadMessages;
  final int mentionCount;
  final bool hasUnreadPins;
  final UserNotificationSettings? unreadBadgesLevel;

  const UnreadState({
    this.hasUnread = false,
    this.hasUnreadMessages = false,
    this.mentionCount = 0,
    this.hasUnreadPins = false,
    this.unreadBadgesLevel,
  });

  @override
  bool operator ==(Object other) =>
      other is UnreadState &&
      other.hasUnread == hasUnread &&
      other.hasUnreadMessages == hasUnreadMessages &&
      other.mentionCount == mentionCount &&
      other.hasUnreadPins == hasUnreadPins &&
      other.unreadBadgesLevel == unreadBadgesLevel;

  @override
  int get hashCode => Object.hash(
    hasUnread,
    hasUnreadMessages,
    mentionCount,
    hasUnreadPins,
    unreadBadgesLevel,
  );
}

@riverpod
Stream<UnreadState> channelUnread(Ref ref, String channelId) {
  final db = ref.watch(fluxerDatabaseProvider);
  final currentUserId = ref.watch(currentUserIdProvider);
  ref
    ..watch(gatewayReadyProvider)
    ..watch(effectiveGuildChannelPermissionBitsProvider(channelId));
  final controller = StreamController<UnreadState>();
  var disposed = false;
  var recomputeScheduled = false;
  StreamSubscription<Object?>? memberSub;
  String? watchedMemberGuildId;
  StreamSubscription<Object?>? settingsSub;
  String? watchedSettingsGuildId;
  StreamSubscription<Object?>? threadMemberSub;
  UnreadState? lastEmitted;

  void emit(UnreadState next) {
    if (disposed || next == lastEmitted) {
      return;
    }
    lastEmitted = next;
    controller.add(next);
  }

  late void Function() scheduleRecompute;

  Future<void> recompute() async {
    if (disposed) {
      return;
    }

    final channel = await db.channelDao.getChannelById(channelId);
    final readState = await db.readStateDao.getReadState(channelId);
    final mentionCount = readState?.mentionCount ?? 0;
    final latestMessageId = await resolveLatestMessageIdForUnreadDisplay(
      db,
      channelId,
      channelLastMessageId: channel?.lastMessageId,
      ackLastMessageId: readState?.lastMessageId,
      mentionCount: mentionCount,
    );
    if (channel != null) {
      final permissionOutcome = await evaluateChannelUnreadPermission(
        database: db,
        channel: channel,
        currentUserId: currentUserId,
      );
      if (permissionOutcome.isDefinitive && !permissionOutcome.canRead) {
        emit(const UnreadState());
        return;
      }
      if (currentUserId != null &&
          currentUserId.isNotEmpty &&
          watchedMemberGuildId != channel.guildId) {
        unawaited(memberSub?.cancel());
        watchedMemberGuildId = channel.guildId;
        memberSub = db.memberDao
            .watchMemberByUserId(currentUserId, channel.guildId)
            .distinct()
            .listen((_) => scheduleRecompute());
      }
      if (channel.guildId.isNotEmpty &&
          watchedSettingsGuildId != channel.guildId) {
        unawaited(settingsSub?.cancel());
        watchedSettingsGuildId = channel.guildId;
        settingsSub = db.userGuildSettingsDao
            .watchByGuildId(channel.guildId)
            .distinct()
            .listen((_) => scheduleRecompute());
      }
    }

    final guildSettings = channel == null
        ? null
        : await db.userGuildSettingsDao.getByGuildId(channel.guildId);
    final decodedGuildSettings = guildSettings == null
        ? null
        : decodeUserGuildSettings(guildSettings.data);
    final unreadBadgesLevel = channel == null
        ? null
        : resolveUnreadBadgesLevel(
            channel: channel,
            guildSettings: decodedGuildSettings,
          );
    // A guild channel without an ack returns false before the fallback is
    // read, so skipping it here keeps this hot recompute off the DB.
    final fallbackAckMs = channel == null ? snowflakeTimestampMs(channelId) : 0;
    final bool isThread = channel != null && isThreadChannelType(channel.type);
    if (isThread && threadMemberSub == null) {
      threadMemberSub = db.threadDao
          .watchMember(channelId)
          .skip(1)
          .listen((_) => scheduleRecompute());
    }
    final bool unreadTracked =
        (!isThread || await db.threadDao.getMember(channelId) != null) &&
        !(channel != null &&
            isThreadOnlyChannelType(channel.type) &&
            !forumNewPostsUnreadEnabled(
              decodedGuildSettings?.channelOverrides?[channelId]?.flags,
            ));
    final hasUnreadMessage =
        unreadTracked &&
        hasUnreadByReadState(
          channelLastMessageId: latestMessageId,
          ackLastMessageId: readState?.lastMessageId,
          fallbackAckMs: fallbackAckMs,
          mentionCount: 0,
          isGuildChannel: channel != null,
        );
    final hasUnread = mentionCount > 0 || hasUnreadMessage;

    final hasPinUnread = hasUnreadPins(
      channelLastPinTimestamp: channel?.lastPinTimestamp,
      ackLastPinTimestamp: readState?.lastPinTimestamp,
    );

    emit(
      UnreadState(
        hasUnread: hasUnread,
        hasUnreadMessages: hasUnreadMessage,
        mentionCount: mentionCount,
        hasUnreadPins: hasPinUnread,
        unreadBadgesLevel: unreadBadgesLevel,
      ),
    );
  }

  scheduleRecompute = () {
    if (disposed || recomputeScheduled) {
      return;
    }
    recomputeScheduled = true;
    scheduleMicrotask(() {
      recomputeScheduled = false;
      if (!disposed) {
        unawaited(recompute());
      }
    });
  };

  final channelSub = db.channelDao
      .watchChannelById(channelId)
      .distinct()
      .listen((_) => scheduleRecompute());
  final readStateSub = db.readStateDao
      .watchReadState(channelId)
      .distinct()
      .listen((_) => scheduleRecompute());
  final messageSub = db.messageDao
      .watchLastMessage(channelId)
      .map((message) => message?.id)
      .distinct()
      .listen((_) => scheduleRecompute());
  final indexSub = ref
      .watch(channelLastMessageIndexProvider)
      .flushStream
      .where((Map<String, String> updates) => updates.containsKey(channelId))
      .listen((_) => scheduleRecompute());

  scheduleRecompute();

  ref.onDispose(() {
    disposed = true;
    unawaited(channelSub.cancel());
    unawaited(readStateSub.cancel());
    unawaited(messageSub.cancel());
    unawaited(indexSub.cancel());
    unawaited(settingsSub?.cancel());
    unawaited(memberSub?.cancel());
    unawaited(threadMemberSub?.cancel());
    unawaited(controller.close());
  });

  return controller.stream;
}
