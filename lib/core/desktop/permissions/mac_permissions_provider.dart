import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mac_permissions_provider.g.dart';

@Riverpod(keepAlive: true)
class MacPermissionStatuses extends _$MacPermissionStatuses {
  @override
  MacPermissionsState build() {
    final MacPermissionsController controller = macPermissions;
    void sync() {
      if (ref.mounted) {
        state = controller.state;
      }
    }

    controller.addListener(sync);
    ref.onDispose(() => controller.removeListener(sync));
    return controller.state;
  }
}
