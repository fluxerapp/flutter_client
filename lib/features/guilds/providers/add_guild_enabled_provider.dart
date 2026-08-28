import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_guild_enabled_provider.g.dart';

@Riverpod(keepAlive: true)
bool addGuildEnabled(Ref ref) {
  return !ref.watch(
    instanceRuntimeConfigProvider.select((config) => config.singleCommunity),
  );
}
