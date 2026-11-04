import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_instance_runtime_config_provider.g.dart';

@Riverpod(keepAlive: true)
InstanceRuntimeConfig authInstanceRuntimeConfig(Ref ref) {
  final InstanceConfigSnapshot snapshot = ref.watch(
    authInstanceSnapshotProvider,
  );
  final wellKnown = snapshot.wellKnown;
  if (wellKnown != null &&
      !identical(snapshot, ref.watch(activeInstanceProvider))) {
    return InstanceRuntimeConfig.fromWellKnown(wellKnown);
  }
  return ref.watch(instanceRuntimeConfigProvider);
}
