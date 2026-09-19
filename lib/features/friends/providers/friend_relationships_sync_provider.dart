import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_relationships_sync_provider.g.dart';

/// Refreshes relationships from REST after each gateway READY.
///
/// READY can omit pending requests, so this fetch runs immediately.
@Riverpod(keepAlive: true)
class FriendRelationshipsSync extends _$FriendRelationshipsSync {
  bool _syncInFlight = false;
  bool _syncQueued = false;

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

  void _scheduleSync() {
    if (_syncInFlight) {
      _syncQueued = true;
      return;
    }
    _syncInFlight = true;
    unawaited(() async {
      try {
        do {
          _syncQueued = false;
          if (!ref.mounted) {
            return;
          }
          await _sync();
        } while (_syncQueued);
      } finally {
        _syncInFlight = false;
        if (_syncQueued && ref.mounted) {
          _scheduleSync();
        }
      }
    }());
  }

  Future<void> _sync() async {
    try {
      await ref.read(friendRepositoryProvider).getRelationships();
    } on Exception catch (e, st) {
      talker.warning('[FriendRelationshipsSync] Failed to sync: $e', st);
    }
  }
}
