import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_session_recovery_provider.g.dart';

@Riverpod(keepAlive: true)
class GatewaySessionRecovery extends _$GatewaySessionRecovery {
  @override
  int build() => 0;

  void bump() {
    state++;
  }
}

const Duration kFullRecoverySweepDelay = Duration(seconds: 10);

@Riverpod(keepAlive: true)
class GatewayFullRecovery extends _$GatewayFullRecovery {
  @override
  int build() => 0;

  void bump() {
    state++;
  }
}
