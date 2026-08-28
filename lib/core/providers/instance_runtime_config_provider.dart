import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instance_runtime_config_provider.g.dart';

@Riverpod(keepAlive: true)
InstanceRuntimeConfig instanceRuntimeConfig(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.maybeWhen(
    data: InstanceRuntimeConfig.fromWellKnown,
    orElse: () => InstanceRuntimeConfig.fromWellKnown(
      ref.watch(activeInstanceProvider).wellKnown,
    ),
  );
}
