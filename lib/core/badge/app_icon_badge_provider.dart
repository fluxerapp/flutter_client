import 'dart:async';

import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_icon_badge_provider.g.dart';

@Riverpod(keepAlive: true)
class AppIconBadge extends _$AppIconBadge {
  StreamSubscription<List<DmChannel>>? _dmSub;
  StreamSubscription<List<ReadState>>? _readStateSub;
  List<DmChannel> _dmRows = const [];
  Map<String, ReadState> _readStateByChannel = const {};
  int _dmMentionCount = 0;
  bool _hasState = false;

  @override
  AppIconBadgeValue build() {
    final bool gatewayReady = ref.watch(gatewayReadyProvider);
    if (!gatewayReady) {
      return const AppIconBadgeValue(count: 0);
    }
    final Map<String, GuildReadStateEntry> guildStates = ref.watch(
      guildReadStateProvider,
    );
    final int pendingFriends =
        ref.watch(pendingFriendRequestCountProvider).value ?? 0;
    final db = ref.watch(fluxerDatabaseProvider);
    unawaited(_dmSub?.cancel());
    unawaited(_readStateSub?.cancel());
    _dmSub = db.dmChannelDao.watchDmChannels().listen((rows) {
      _dmRows = rows;
      unawaited(_recomputeDmMentions());
    });
    _readStateSub = db.readStateDao.watchReadStates().listen((rows) {
      _readStateByChannel = {for (final r in rows) r.channelId: r};
      unawaited(_recomputeDmMentions());
    });
    ref.onDispose(() {
      unawaited(_dmSub?.cancel());
      unawaited(_readStateSub?.cancel());
    });
    unawaited(_recomputeDmMentions());
    return _computeFromParts(
      guildStates: guildStates,
      pendingFriendRequestCount: pendingFriends,
    );
  }

  Future<void> _recomputeDmMentions() async {
    if (_dmRows.isEmpty) {
      _dmMentionCount = 0;
      _syncState();
      return;
    }
    var mentionTotal = 0;
    for (final dm in _dmRows) {
      final readState = _readStateByChannel[dm.id];
      final rawMentions = readState?.mentionCount ?? 0;
      mentionTotal += rawMentions;
    }
    _dmMentionCount = mentionTotal;
    _syncState();
  }

  void _syncState() {
    final Map<String, GuildReadStateEntry> guildStates = ref.read(
      guildReadStateProvider,
    );
    final int pendingFriends =
        ref.read(pendingFriendRequestCountProvider).value ?? 0;
    final AppIconBadgeValue next = _computeFromParts(
      guildStates: guildStates,
      pendingFriendRequestCount: pendingFriends,
    );
    if (!_hasState || next.count != state.count) {
      _hasState = true;
      state = next;
    }
  }

  AppIconBadgeValue _computeFromParts({
    required Map<String, GuildReadStateEntry> guildStates,
    required int pendingFriendRequestCount,
  }) {
    var guildMentionCount = 0;
    for (final entry in guildStates.values) {
      guildMentionCount += entry.mentionCount;
    }
    return computeAppIconBadge(
      guildMentionCount: guildMentionCount,
      dmMentionCount: _dmMentionCount,
      pendingFriendRequestCount: pendingFriendRequestCount,
    );
  }
}
