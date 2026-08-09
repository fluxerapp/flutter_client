import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'premium_state_sync_provider.g.dart';

Future<void>? _premiumStateRefreshInFlight;
String? _premiumStateRefreshUserId;

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
  final String? userId = ref.read(currentUserIdProvider);
  final Future<void>? inFlight = _premiumStateRefreshInFlight;
  if (inFlight != null && _premiumStateRefreshUserId == userId) {
    await inFlight;
    return;
  }
  final Future<void> request = _fetchPremiumState(ref, userId);
  _premiumStateRefreshInFlight = request;
  _premiumStateRefreshUserId = userId;
  try {
    await request;
  } finally {
    if (identical(_premiumStateRefreshInFlight, request)) {
      _premiumStateRefreshInFlight = null;
      _premiumStateRefreshUserId = null;
    }
  }
}

Future<void> _fetchPremiumState(Ref ref, String? requestedUserId) async {
  try {
    final state = await ref
        .read(fluxerClientProvider)
        .premium
        .getPremiumState();
    if (ref.read(currentUserIdProvider) != requestedUserId) {
      return;
    }
    ref.read(currentUserEntitlementsProvider.notifier).applyPremiumState(state);
  } on Object catch (error, stackTrace) {
    talker.error('Premium state fetch failed', error, stackTrace);
  }
}
