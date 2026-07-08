import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_typing_provider.g.dart';

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
