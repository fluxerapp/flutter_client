import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_typing_provider.g.dart';

bool _isRemoteUserTyping({
  required Map<String, DateTime>? entries,
  required String userId,
  required String? currentUserId,
  required DateTime now,
}) {
  if (userId == currentUserId) {
    return false;
  }
  final DateTime? expiresAt = entries?[userId];
  return expiresAt != null && expiresAt.isAfter(now);
}

/// Whether [userId] is remotely typing in [channelId].
@riverpod
bool isUserTypingInChannel(Ref ref, String channelId, String userId) {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final Map<String, DateTime>? entries = ref.watch(
    typingIndicatorsProvider.select((m) => m[channelId]),
  );
  return _isRemoteUserTyping(
    entries: entries,
    userId: userId,
    currentUserId: currentUserId,
    now: clock.now(),
  );
}

/// Whether [userId] is typing in [channelId] for member list avatars.
@riverpod
bool memberListUserIsTyping(Ref ref, String channelId, String userId) {
  return ref.watch(isUserTypingInChannelProvider(channelId, userId));
}

/// Whether a DM conversation avatar should show the typing badge.
@riverpod
bool dmAvatarIsTyping(Ref ref, DmConversation dm) {
  if (dm.isGroup) {
    for (final String userId in dm.remoteRecipientIds) {
      if (ref.watch(isUserTypingInChannelProvider(dm.id, userId))) {
        return true;
      }
    }
    return false;
  }
  return ref.watch(isUserTypingInChannelProvider(dm.id, dm.recipientId));
}

/// Whether a remote user is typing in [channelId].
@riverpod
bool channelHasTyping(Ref ref, String channelId) {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final Map<String, DateTime>? entries = ref.watch(
    typingIndicatorsProvider.select((m) => m[channelId]),
  );
  if (entries == null) {
    return false;
  }
  final DateTime now = clock.now();
  for (final MapEntry<String, DateTime> e in entries.entries) {
    if (e.key != currentUserId && e.value.isAfter(now)) {
      return true;
    }
  }
  return false;
}

/// Remote users typing in [channelId].
@riverpod
List<String> typingUsersInChannel(Ref ref, String channelId) {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final Map<String, DateTime>? entries = ref.watch(
    typingIndicatorsProvider.select((m) => m[channelId]),
  );
  if (entries == null) {
    return const <String>[];
  }
  final DateTime now = clock.now();
  return <String>[
    for (final MapEntry<String, DateTime> e in entries.entries)
      if (e.key != currentUserId && e.value.isAfter(now)) e.key,
  ];
}

/// Remote users typing in [channelId], excluding blocked users.
@riverpod
List<String> presentableTypingUsersInChannel(Ref ref, String channelId) {
  final List<String> userIds = ref.watch(
    typingUsersInChannelProvider(channelId),
  );
  if (userIds.isEmpty) {
    return const <String>[];
  }
  final Set<String> blockedIds = ref.watch(blockedUserIdsProvider);
  if (blockedIds.isEmpty) {
    return userIds;
  }
  return <String>[
    for (final String id in userIds)
      if (!blockedIds.contains(id)) id,
  ];
}

const Duration _kSidebarTypingRecentWindow = Duration(seconds: 5);

/// Whether a remote user is typing in [channelId] within the last 5 seconds.
@riverpod
bool channelHasRecentTyping(Ref ref, String channelId) {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final Map<String, DateTime>? entries = ref.watch(
    typingIndicatorsProvider.select((m) => m[channelId]),
  );
  if (entries == null || entries.isEmpty) {
    return false;
  }
  final DateTime now = clock.now();
  for (final MapEntry<String, DateTime> e in entries.entries) {
    if (e.key == currentUserId) {
      continue;
    }
    if (!e.value.isAfter(now)) {
      continue;
    }
    final DateTime startedAt = e.value.subtract(kTypingExpiry);
    if (now.difference(startedAt) < _kSidebarTypingRecentWindow) {
      return true;
    }
  }
  return false;
}
