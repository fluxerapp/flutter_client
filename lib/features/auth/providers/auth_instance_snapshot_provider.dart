import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_instance_snapshot_provider.g.dart';

@Riverpod(keepAlive: true)
InstanceConfigSnapshot authInstanceSnapshot(Ref ref) {
  final InstanceSelectorState? selector = ref
      .watch(instanceSelectorProvider)
      .asData
      ?.value;
  final InstanceConfigSnapshot? pendingSnapshot = selector?.pendingSnapshot;
  if (pendingSnapshot != null) {
    return pendingSnapshot;
  }
  return ref.watch(activeInstanceProvider);
}

@riverpod
bool isAuthInstanceSsoEnforced(Ref ref) {
  return ref.watch(authInstanceSnapshotProvider).isSsoEnforced;
}

@riverpod
bool isAuthInstanceSsoEnabled(Ref ref) {
  return ref.watch(authInstanceSnapshotProvider).isSsoEnabled;
}
