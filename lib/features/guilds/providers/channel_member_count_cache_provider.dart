import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_member_count_cache_provider.g.dart';

@immutable
class ChannelMemberCounts {
  const ChannelMemberCounts({
    required this.memberCount,
    required this.onlineCount,
  });

  final int memberCount;
  final int onlineCount;

  @override
  bool operator ==(Object other) {
    return other is ChannelMemberCounts &&
        other.memberCount == memberCount &&
        other.onlineCount == onlineCount;
  }

  @override
  int get hashCode => Object.hash(memberCount, onlineCount);
}

@Riverpod(keepAlive: true)
class ChannelMemberCountCache extends _$ChannelMemberCountCache {
  @override
  Map<String, ChannelMemberCounts> build() => <String, ChannelMemberCounts>{};

  static String cacheKey(String guildId, String channelId) =>
      '$guildId|$channelId';

  ChannelMemberCounts? getCounts(String guildId, String channelId) {
    return state[cacheKey(guildId, channelId)];
  }

  void applyUpdates(List<ChannelMemberCountEntry> entries) {
    if (entries.isEmpty) {
      return;
    }
    Map<String, ChannelMemberCounts>? next;
    for (final ChannelMemberCountEntry entry in entries) {
      final String key = cacheKey(entry.guildId, entry.channelId);
      final ChannelMemberCounts counts = ChannelMemberCounts(
        memberCount: entry.memberCount,
        onlineCount: entry.onlineCount,
      );
      if ((next ?? state)[key] == counts) {
        continue;
      }
      next ??= Map<String, ChannelMemberCounts>.from(state);
      next[key] = counts;
    }
    if (next != null) {
      state = next;
    }
  }
}
