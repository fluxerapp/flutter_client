import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';

void navigateToContent(BuildContext context, String path) {
  final ProviderContainer container = ProviderScope.containerOf(context);
  DrawerNavigationCoordinator.navigateToContent(container, path);
}

void navigateToContentVia(WidgetRef ref, String path) {
  DrawerNavigationCoordinator.navigateToContent(ref.container, path);
}

void navigateToContentViaRef(Ref ref, String path) {
  DrawerNavigationCoordinator.navigateToContent(ref.container, path);
}

void navigateToContentViaContainer(ProviderContainer container, String path) {
  DrawerNavigationCoordinator.navigateToContent(container, path);
}
