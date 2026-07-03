import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/root_overlay_return_location_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:go_router/go_router.dart';

void openDiscover(BuildContext context, WidgetRef ref) {
  if (isMobileLayout(context)) {
    unawaited(context.push(RoutePaths.discover));
    return;
  }
  ref
      .read(rootOverlayReturnLocationProvider.notifier)
      .remember(ref.read(shellLocationProvider));
  DrawerNavigationCoordinator.navigateToContent(
    ref.container,
    RoutePaths.discover,
  );
}

void popRootOverlay(BuildContext context, WidgetRef ref) {
  if (context.canPop()) {
    context.pop();
    return;
  }
  context.go(
    ref.read(rootOverlayReturnLocationProvider.notifier).takeOrDefault(),
  );
}
