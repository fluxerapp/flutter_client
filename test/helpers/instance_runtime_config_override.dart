import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:riverpod/src/framework.dart' show Override;

Override instanceRuntimeConfigOverride([
  InstanceRuntimeConfig config = InstanceRuntimeConfig.defaults,
]) => instanceRuntimeConfigProvider.overrideWithValue(config);
