import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';

void returnToFavoritesList(WidgetRef ref) {
  returnToFavoritesListFromContainer(ref.container);
}

void returnToFavoritesListFromContainer(ProviderContainer container) {
  final String location = container.read(shellLocationProvider);
  if (location.startsWith('/channels/@favorites/')) {
    container.read(fluxerRouterProvider).go(RoutePaths.favoritesBase);
  }
  DrawerNavigationCoordinator.revealDrawer(container);
}

bool isFavoritesChannelRoute(String location) {
  return location.startsWith('/channels/@favorites/');
}
