import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sync_provider.g.dart';

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
          guildId: const LazyRequestSubscription(active: true, sync: true),
        },
      );
      state = {...state, guildId};
      prefetchGuildRoles(ref.read(memberRepositoryProvider), guildId);
      unawaited(_backfillMembersIfSparse(guildId));
    } on Object catch (e) {
      talker.warning('[GuildSync] Failed to sync guild $guildId: $e');
    }
  }

  Future<void> _backfillMembersIfSparse(String guildId) async {
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
