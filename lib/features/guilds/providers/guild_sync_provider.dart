import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sync_provider.g.dart';

LazyRequestSubscription guildSyncSubscription({required bool threads}) =>
    threads
    ? const LazyRequestSubscription(active: true, sync: true, threads: true)
    : const LazyRequestSubscription(active: true, sync: true);

LazyRequestSubscription threadGateFlipSubscription({required bool active}) =>
    active
    ? const LazyRequestSubscription(threads: true)
    : const LazyRequestSubscription(
        threads: false,
        threadMemberLists: <String>[],
      );

@Riverpod(keepAlive: true)
class GuildSync extends _$GuildSync {
  @override
  Set<String> build() => {};

  void syncIfNeeded(String guildId, {bool force = false}) {
    if (!force && state.contains(guildId)) {
      return;
    }

    final connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      return;
    }

    try {
      connection.sendLazyRequest(
        subscriptions: {
          guildId: guildSyncSubscription(
            threads: ref.read(threadsGateProvider).isActive(guildId),
          ),
        },
      );
      state = {...state, guildId};
      prefetchGuildRoles(ref.read(memberRepositoryProvider), guildId);
    } on Object catch (e) {
      talker.warning('[GuildSync] Failed to sync guild $guildId: $e');
    }
  }

  void handleThreadGateChanged(String guildId, {required bool active}) {
    if (!state.contains(guildId)) {
      return;
    }
    final connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      return;
    }
    connection.sendLazyRequest(
      subscriptions: {guildId: threadGateFlipSubscription(active: active)},
    );
  }

  Future<void> backfillMembersIfSparse(String guildId) async {
    await ref
        .read(guildMemberChunkWaiterProvider)
        .waitForChunk(guildId, timeout: const Duration(seconds: 3));
    try {
      await ref.read(memberRepositoryProvider).backfillMembersIfSparse(guildId);
    } on Object catch (e) {
      talker.warning(
        '[GuildSync] REST member backfill failed for $guildId: $e',
      );
    }
  }

  void clearAll() {
    if (state.isEmpty) {
      return;
    }
    state = {};
  }
}
