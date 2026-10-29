import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_instance_runtime_config_provider.g.dart';

@Riverpod(keepAlive: true)
InstanceRuntimeConfig authInstanceRuntimeConfig(Ref ref) {
  final wellKnown = ref.watch(authInstanceSnapshotProvider).wellKnown;
  if (wellKnown != null) {
    return InstanceRuntimeConfig.fromWellKnown(wellKnown);
  }
  return ref.watch(instanceRuntimeConfigProvider);
}
