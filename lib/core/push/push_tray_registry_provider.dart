import 'package:fluxer_app/core/push/push_tray_registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_tray_registry_provider.g.dart';

@Riverpod(keepAlive: true)
PushTrayRegistry pushTrayRegistry(Ref ref) {
  return PushTrayRegistry();
}
