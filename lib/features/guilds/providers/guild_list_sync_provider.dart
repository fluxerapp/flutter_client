import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_list_sync_provider.g.dart';

/// Refreshes guild membership from the REST API after each gateway READY.
///
/// READY may omit guilds the user has left while offline, so a follow up fetch
/// prunes stale local entries.
@Riverpod(keepAlive: true)
class GuildListSync extends _$GuildListSync {
  @override
  void build() {
    ref.listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
      if (next > 0 && previous != next) {
        unawaited(_sync());
      }
    });
    if (ref.read(gatewaySessionRecoveryProvider) > 0) {
      unawaited(_sync());
    }
  }

  Future<void> _sync() async {
    try {
      await ref.read(guildRepositoryProvider).syncServers();
    } on Exception catch (e, st) {
      talker.warning('[GuildListSync] Failed to sync: $e', st);
    }
  }
}
