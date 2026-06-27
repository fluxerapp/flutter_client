import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'premium_state_sync_provider.g.dart';

@Riverpod(keepAlive: true)
void premiumStateSyncBinding(Ref ref) {
  ref.listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
    if (!next) {
      return;
    }
    unawaited(_refreshPremiumState(ref));
  });
}

Future<void> refreshPremiumState(Ref ref) async {
  await _refreshPremiumState(ref);
}

Future<void> _refreshPremiumState(Ref ref) async {
  try {
    final state = await ref
        .read(fluxerClientProvider)
        .premium
        .getPremiumState();
    ref.read(currentUserEntitlementsProvider.notifier).applyPremiumState(state);
  } on Object catch (error, stackTrace) {
    talker.error('Premium state fetch failed', error, stackTrace);
  }
}
