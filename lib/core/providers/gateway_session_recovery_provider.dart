import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_session_recovery_provider.g.dart';

/// Incremented after each gateway READY/RESUMED callback.
///
/// Consumers that only listen to gateway readiness false-to-true miss soft
/// reconnects on the same socket instance
@Riverpod(keepAlive: true)
class GatewaySessionRecovery extends _$GatewaySessionRecovery {
  @override
  int build() => 0;

  void bump() {
    state++;
  }
}

/// Delay between a full recovery and the REST consistency sweeps keyed to it.
///
/// The sweeps prune rows READY may have omitted and carry nothing the UI
/// waits on; running them at READY put their cost under the first channel open.
const Duration kFullRecoverySweepDelay = Duration(seconds: 10);

/// Incremented only after a fresh READY (full identify), never on RESUMED.
///
/// RESUMED replays buffered events on the same session; eager REST re-syncs
/// keyed to this generation (friends, guild list) trust that replay — matching
/// the web client — and run only when the server rebuilt the session.
@Riverpod(keepAlive: true)
class GatewayFullRecovery extends _$GatewayFullRecovery {
  @override
  int build() => 0;

  void bump() {
    state++;
  }
}
