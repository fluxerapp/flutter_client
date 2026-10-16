import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/observability/measure_screen_name.dart';
import 'package:measure_flutter/measure_flutter.dart';

class FluxerMeasureNavigatorObserver extends NavigatorObserver {
  static const _transitionTimeoutMargin = Duration(milliseconds: 100);

  final MeasureApi _measure;

  FluxerMeasureNavigatorObserver() : _measure = Measure.instance;

  @visibleForTesting
  FluxerMeasureNavigatorObserver.withMeasure(this._measure);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _trackScreenView(_routeScreenName(route), route, AnimationStatus.completed);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _trackScreenView(
      previousRoute == null ? null : _routeScreenName(previousRoute),
      route,
      AnimationStatus.dismissed,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _trackScreenView(
      newRoute == null ? null : _routeScreenName(newRoute),
      newRoute,
      AnimationStatus.completed,
    );
  }

  String? _routeScreenName(Route<dynamic> route) {
    final String? name = route.settings.name;
    if (name != null && name.isNotEmpty) {
      return name;
    }
    final Object? arguments = route.settings.arguments;
    if (arguments is String && arguments.isNotEmpty) {
      return arguments;
    }
    return null;
  }

  void _trackScreenView(
    String? name,
    Route<dynamic>? transitioningRoute,
    AnimationStatus settledStatus,
  ) {
    final String? normalized = normalizeMeasureScreenName(name);
    if (normalized == null || normalized.isEmpty) {
      return;
    }
    final int timestamp = _measure.getCurrentTime();
    final TransitionRoute<dynamic>? route =
        transitioningRoute is TransitionRoute<dynamic>
        ? transitioningRoute
        : null;
    if (route == null || route.animation == null) {
      _track(normalized, timestamp);
      return;
    }
    unawaited(
      _whenTransitionEnds(
        route,
        settledStatus,
      ).then((_) => _track(normalized, timestamp)),
    );
  }

  Future<void> _whenTransitionEnds(
    TransitionRoute<dynamic> route,
    AnimationStatus settledStatus,
  ) async {
    await WidgetsBinding.instance.endOfFrame;
    final Animation<double>? animation = route.animation;
    if (animation == null ||
        route.navigator == null ||
        animation.status == settledStatus) {
      return;
    }
    final Completer<void> completer = Completer<void>();
    void onStatusChanged(AnimationStatus status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        animation.removeStatusListener(onStatusChanged);
        completer.complete();
      }
    }

    animation.addStatusListener(onStatusChanged);
    final Duration duration = settledStatus == AnimationStatus.dismissed
        ? route.reverseTransitionDuration
        : route.transitionDuration;
    await completer.future.timeout(
      duration + _transitionTimeoutMargin,
      onTimeout: () => animation.removeStatusListener(onStatusChanged),
    );
  }

  void _track(String name, int timestamp) {
    if (!FluxerObservability.instance.isEnabled) {
      return;
    }
    _measure.trackScreenViewEvent(
      name: name,
      userTriggered: false,
      timestamp: timestamp,
    );
  }
}
