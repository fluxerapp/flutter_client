import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_relationships_sync_provider.g.dart';

/// Refreshes relationships from the REST API after each gateway READY.
///
/// READY clears the local relationship table and may omit pending requests from
/// its payload, so a follow up fetch keeps incoming requests consistent.
@Riverpod(keepAlive: true)
class FriendRelationshipsSync extends _$FriendRelationshipsSync {
  @override
  void build() {
    ref
      ..listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
        if (!(previous ?? false) && next) {
          unawaited(_sync());
        }
      })
      ..listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
        if (next > 0 && previous != next) {
          unawaited(_sync());
        }
      });
    if (ref.read(gatewayReadyProvider)) {
      unawaited(_sync());
    }
  }

  Future<void> _sync() async {
    try {
      await ref.read(friendRepositoryProvider).getRelationships();
    } on Exception catch (e, st) {
      talker.warning('[FriendRelationshipsSync] Failed to sync: $e', st);
    }
  }
}
