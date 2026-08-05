import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';

void returnToFavoritesList(WidgetRef ref) {
  DrawerNavigationCoordinator.revealDrawer(ref.container);
}

bool isFavoritesChannelRoute(String location) {
  return location.startsWith('/channels/@favorites/');
}
