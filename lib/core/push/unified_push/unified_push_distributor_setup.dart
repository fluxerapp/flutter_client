import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unified_push_distributor_setup.g.dart';

@Riverpod(keepAlive: true)
class UnifiedPushDistributorSetup extends _$UnifiedPushDistributorSetup {
  @override
  bool build() => false;

  void requestPicker() {
    state = true;
  }

  void clearRequest() {
    state = false;
  }
}
