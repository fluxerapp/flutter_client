import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_instance_snapshot_provider.g.dart';

InstanceConfigSnapshot? _pendingAuthSnapshot(Ref ref) => ref.watch(
  instanceSelectorProvider.select(
    (selector) => selector.asData?.value.pendingSnapshot,
  ),
);

@Riverpod(keepAlive: true)
InstanceConfigSnapshot authInstanceSnapshot(Ref ref) {
  return _pendingAuthSnapshot(ref) ?? ref.watch(activeInstanceProvider);
}

@riverpod
InstanceConfigSnapshot authInstanceLegalSnapshot(Ref ref) {
  return _pendingAuthSnapshot(ref) ??
      ref.watch(refreshedActiveInstanceProvider);
}

@riverpod
bool isAuthInstanceSsoEnforced(Ref ref) {
  return ref.watch(authInstanceSnapshotProvider).isSsoEnforced;
}

@riverpod
bool isAuthInstanceSsoEnabled(Ref ref) {
  return ref.watch(authInstanceSnapshotProvider).isSsoEnabled;
}

@riverpod
bool authInstanceSupportsPasskeys(Ref ref) {
  return passkeysSupportedFor(
    ref.watch(authInstanceSnapshotProvider).apiBaseUrl,
  );
}
