import 'package:go_router/go_router.dart';

const int shellHomeBranchIndex = 0;
const int shellNotificationsBranchIndex = 1;
const int shellYouBranchIndex = 2;

String? resolveActiveBranchLocation(RouteMatchList config) {
  for (final RouteMatchBase match in config.matches) {
    if (match is ShellRouteMatch) {
      return _deepestMatchedLocation(match.matches);
    }
  }
  return null;
}

String? resolveShellLocation(RouteMatchList config) {
  return resolveActiveBranchLocation(config);
}

String resolveTopLocation(RouteMatchList config) {
  return config.isNotEmpty ? config.last.matchedLocation : '/';
}

int inferShellBranchIndex(String location) {
  if (location == '/notifications') {
    return shellNotificationsBranchIndex;
  }
  if (location == '/you') {
    return shellYouBranchIndex;
  }
  return shellHomeBranchIndex;
}

String _deepestMatchedLocation(List<RouteMatchBase> matches) {
  if (matches.isEmpty) {
    return '/';
  }
  final RouteMatchBase last = matches.last;
  if (last is ShellRouteMatch) {
    return _deepestMatchedLocation(last.matches);
  }
  if (last is ImperativeRouteMatch) {
    if (last.matches.matches.isNotEmpty) {
      return _deepestMatchedLocation(last.matches.matches);
    }
    return last.matchedLocation;
  }
  if (last is RouteMatch) {
    return last.matchedLocation;
  }
  return '/';
}

bool isRootOverlayLocation(String topLocation, {String? shellLocation}) {
  if (shellLocation == null) {
    return false;
  }
  return topLocation != shellLocation;
}
