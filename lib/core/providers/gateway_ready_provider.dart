import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_ready_provider.g.dart';

@Riverpod(keepAlive: true)
class GatewayReady extends _$GatewayReady {
  @override
  bool build() => false;

  void setReady() {
    state = true;
  }

  void reset() {
    state = false;
  }
}
