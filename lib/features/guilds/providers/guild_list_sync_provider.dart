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
  bool _syncScheduled = false;

  @override
  void build() {
    ref.listen<int>(gatewayFullRecoveryProvider, (int? previous, int next) {
      if (next > 0 && previous != next) {
        _scheduleSync();
      }
    });
    if (ref.read(gatewayFullRecoveryProvider) > 0) {
      _scheduleSync();
    }
  }

  /// Waits out the first-channel-open window after READY; bumps arriving
  /// while a sweep is pending collapse into it, since the fetch reflects
  /// server truth at run time.
  void _scheduleSync() {
    if (_syncScheduled) {
      return;
    }
    _syncScheduled = true;
    unawaited(() async {
      await Future<void>.delayed(kFullRecoverySweepDelay);
      _syncScheduled = false;
      if (!ref.mounted) {
        return;
      }
      await _sync();
    }());
  }

  Future<void> _sync() async {
    try {
      await ref.read(guildRepositoryProvider).syncServers();
    } on Exception catch (e, st) {
      talker.warning('[GuildListSync] Failed to sync: $e', st);
    }
  }
}
