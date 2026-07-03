import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';

/// Navigates to [path] using `go()` and pre-sets the mobile drawer for
/// chat-route targets so re-tapping the active channel still closes the
/// drawer (`context.go` is a no-op when the location is unchanged, so the
/// post-nav route listener never fires).
///
/// Use this from widgets. For non-context call sites (notifiers,
/// providers, deep-link handlers) use [navigateToContentVia].
void navigateToContent(BuildContext context, String path) {
  final ProviderContainer container = ProviderScope.containerOf(context);
  DrawerNavigationCoordinator.navigateToContent(container, path);
}

/// Same as [navigateToContent] but for call sites that hold a Riverpod
/// [Ref] instead of a [BuildContext] (e.g. notifiers, deep-link handlers,
/// non-widget providers).
void navigateToContentVia(WidgetRef ref, String path) {
  DrawerNavigationCoordinator.navigateToContent(ref.container, path);
}

void navigateToContentViaRef(Ref ref, String path) {
  DrawerNavigationCoordinator.navigateToContent(ref.container, path);
}

void navigateToContentViaContainer(ProviderContainer container, String path) {
  DrawerNavigationCoordinator.navigateToContent(container, path);
}
