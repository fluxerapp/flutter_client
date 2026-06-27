import 'package:flutter/widgets.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:opentelemetry/api.dart' as otel;

class FluxerRouteTraceObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _recordNavigation('push', route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _recordNavigation('pop', previousRoute, route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute == null) {
      return;
    }
    _recordNavigation('replace', newRoute, oldRoute);
  }

  void _recordNavigation(
    String action,
    Route<dynamic>? route,
    Route<dynamic>? previousRoute,
  ) {
    if (route == null) {
      return;
    }
    final String? routeName = _stableRouteName(route);
    final String? previousRouteName = _stableRouteName(previousRoute);
    final otel.Span? span = FluxerObservability.instance.startSpan(
      'navigation.$action',
      attributes: <otel.Attribute>[
        otel.Attribute.fromString('navigation.action', action),
        otel.Attribute.fromString('route.type', route.runtimeType.toString()),
        if (routeName != null)
          otel.Attribute.fromString('route.name', routeName),
        if (previousRouteName != null)
          otel.Attribute.fromString('route.previous_name', previousRouteName),
      ],
    );
    span?.end();
  }

  String? _stableRouteName(Route<dynamic>? route) {
    final String? name = route?.settings.name;
    if (name == null ||
        name.isEmpty ||
        name.contains('/') ||
        name.contains('?')) {
      return null;
    }
    return name;
  }
}
