import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:material_ui/material_ui.dart';

class ChannelPersistenceObserver extends NavigatorObserver {
  final FluxerDatabase db;

  ChannelPersistenceObserver(this.db);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _saveLocation(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _saveLocation(newRoute);
    }
  }

  void _saveLocation(Route<dynamic> route) {
    final String? uri = route.settings.name;
    if (uri == null) {
      return;
    }
    persistAppLocation(db, uri);
    if (!uri.startsWith('/channels/')) {
      return;
    }
    persistGuildChannelFromLocation(db, uri);
  }
}
