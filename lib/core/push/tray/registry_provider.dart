import 'package:fluxer_app/core/push/tray/registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registry_provider.g.dart';

@Riverpod(keepAlive: true)
PushTrayRegistry pushTrayRegistry(Ref ref) {
  return PushTrayRegistry();
}
