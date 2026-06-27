import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_account_instance_guard_provider.g.dart';

/// Preserves the signed in account's instance while adding another account
@Riverpod(keepAlive: true)
class AddAccountInstanceGuard extends _$AddAccountInstanceGuard {
  @override
  InstanceConfigSnapshot? build() => null;

  // ignore: use_setters_to_change_properties, command mirrors guard lifecycle.
  void arm(InstanceConfigSnapshot snapshot) {
    state = snapshot;
  }

  void disarm() {
    state = null;
  }

  void restoreActiveInstance() {
    final InstanceConfigSnapshot? snapshot = state;
    if (snapshot != null) {
      ref.read(activeInstanceProvider.notifier).applySnapshot(snapshot);
    }
  }
}
