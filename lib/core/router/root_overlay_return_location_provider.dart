import 'package:fluxer_app/core/router/pre_reconnecting_location_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root_overlay_return_location_provider.g.dart';

@Riverpod(keepAlive: true)
class RootOverlayReturnLocation extends _$RootOverlayReturnLocation {
  @override
  String? build() => null;

  void remember(String location) {
    if (!isRestorableShellReturnLocation(location)) {
      return;
    }
    state = location;
  }

  String takeOrDefault() {
    final String? saved = state;
    state = null;
    if (saved != null && isRestorableShellReturnLocation(saved)) {
      return saved;
    }
    return RoutePaths.me;
  }
}

bool isRestorableShellReturnLocation(String location) {
  if (location == RoutePaths.discover || !isRestorableAppLocation(location)) {
    return false;
  }
  return true;
}
