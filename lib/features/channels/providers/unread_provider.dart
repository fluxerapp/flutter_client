import 'dart:async';

import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_permission_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_provider.g.dart';

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
  StreamSubscription<Object?>? memberSub;
  String? watchedMemberGuildId;
  StreamSubscription<Object?>? settingsSub;
  String? watchedSettingsGuildId;

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
        if (!disposed) {
          controller.add(const UnreadState());
        }
        return;
      }
      if (currentUserId != null &&
          currentUserId.isNotEmpty &&
          watchedMemberGuildId != channel.guildId) {
        unawaited(memberSub?.cancel());
        watchedMemberGuildId = channel.guildId;
        memberSub = db.memberDao
            .watchMemberByUserId(currentUserId, channel.guildId)
            .listen((_) => unawaited(recompute()));
      }
      if (channel.guildId.isNotEmpty &&
          watchedSettingsGuildId != channel.guildId) {
        unawaited(settingsSub?.cancel());
        watchedSettingsGuildId = channel.guildId;
        settingsSub = db.userGuildSettingsDao
            .watchByGuildId(channel.guildId)
            .listen((_) => unawaited(recompute()));
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
    final fallbackAckMs = channel == null
        ? snowflakeTimestampMs(channelId)
        : await guildChannelFallbackAckMs(
            database: db,
            channel: channel,
            currentUserId: currentUserId,
          );
    final hasUnreadMessage = hasUnreadByReadState(
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

    if (!disposed) {
      controller.add(
        UnreadState(
          hasUnread: hasUnread,
          hasUnreadMessages: hasUnreadMessage,
          mentionCount: mentionCount,
          hasUnreadPins: hasPinUnread,
          unreadBadgesLevel: unreadBadgesLevel,
        ),
      );
    }
  }

  final channelSub = db.channelDao
      .watchChannelById(channelId)
      .listen((_) => unawaited(recompute()));
  final readStateSub = db.readStateDao
      .watchReadState(channelId)
      .listen((_) => unawaited(recompute()));
  final messageSub = db.messageDao
      .watchLastMessage(channelId)
      .listen((_) => unawaited(recompute()));

  unawaited(recompute());

  ref.onDispose(() {
    disposed = true;
    unawaited(channelSub.cancel());
    unawaited(readStateSub.cancel());
    unawaited(messageSub.cancel());
    unawaited(settingsSub?.cancel());
    unawaited(memberSub?.cancel());
    unawaited(controller.close());
  });

  return controller.stream;
}
