import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sync_provider.g.dart';

const Duration kMemberListSyncSettleDelay = Duration(seconds: 3);

const LazyRequestSubscription kGuildSyncSubscription = LazyRequestSubscription(
  active: true,
  sync: true,
  threads: true,
);

@Riverpod(keepAlive: true)
class GuildSync extends _$GuildSync {
  @override
  Set<String> build() => {};

  final Set<String> _ownMemberSyncRequested = <String>{};
  String? _pendingGuildId;

  void syncIfNeeded(String guildId, {bool force = false}) {
    if (!force && state.contains(guildId)) {
      return;
    }

    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      _pendingGuildId = guildId;
      return;
    }

    try {
      connection.sendLazyRequest(
        subscriptions: {guildId: kGuildSyncSubscription},
      );
      state = {...state, guildId};
      if (_pendingGuildId == guildId) {
        _pendingGuildId = null;
      }
      prefetchGuildRoles(ref.read(memberRepositoryProvider), guildId);
    } on Object catch (e) {
      talker.warning('[GuildSync] Failed to sync guild $guildId: $e');
    }
  }

  void flushPending() {
    final String? guildId = _pendingGuildId;
    if (guildId != null) {
      syncIfNeeded(guildId, force: true);
    }
  }

  void requestOwnMemberSync(String guildId) {
    if (!_ownMemberSyncRequested.add(guildId)) {
      return;
    }
    syncIfNeeded(guildId, force: true);
  }

  void ownMemberPresent(String guildId) {
    _ownMemberSyncRequested.remove(guildId);
  }

  Future<void> backfillMembersIfSparse(String guildId) async {
    await Future<void>.delayed(kMemberListSyncSettleDelay);
    try {
      await ref.read(memberRepositoryProvider).backfillMembersIfSparse(guildId);
    } on Object catch (e) {
      talker.warning(
        '[GuildSync] REST member backfill failed for $guildId: $e',
      );
    }
  }

  void clearAll() {
    _ownMemberSyncRequested.clear();
    if (state.isEmpty) {
      return;
    }
    state = {};
  }
}
