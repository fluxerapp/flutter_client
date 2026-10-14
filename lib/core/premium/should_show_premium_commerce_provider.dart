import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'should_show_premium_commerce_provider.g.dart';

@Riverpod(keepAlive: true)
bool shouldShowPremiumCommerce(Ref ref) {
  return !ref.watch(instanceRuntimeConfigProvider).selfHosted;
}
