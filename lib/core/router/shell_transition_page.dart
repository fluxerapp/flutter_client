import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:fluxer_app/features/shell/navigation/shell_transition_policy.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> shellFadeTransitionPage({
  required LocalKey key,
  required Widget child,
  Duration duration = ShellTransitionPolicy.rootOverlayFadeDuration,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(opacity: animation, child: child);
        },
  );
}

CustomTransitionPage<void> shellSlideTransitionPage({
  required LocalKey key,
  required Widget child,
  bool parallaxOutgoing = false,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: ShellTransitionPolicy.channelSlideDuration,
    reverseTransitionDuration: ShellTransitionPolicy.channelSlideDuration,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          final Animation<Offset> incoming =
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: kHorizontalSwipeCurve,
                ),
              );
          if (!parallaxOutgoing) {
            return SlideTransition(position: incoming, child: child);
          }
          final Animation<Offset> outgoing =
              Tween<Offset>(
                begin: Offset.zero,
                end: Offset(
                  -ShellTransitionPolicy.channelOutgoingParallaxFactor,
                  0,
                ),
              ).animate(
                CurvedAnimation(
                  parent: secondaryAnimation,
                  curve: kHorizontalSwipeCurve,
                ),
              );
          return SlideTransition(
            position: incoming,
            child: SlideTransition(position: outgoing, child: child),
          );
        },
  );
}

CustomTransitionPage<void> shellCupertinoSlideTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: ShellTransitionPolicy.channelSlideDuration,
    reverseTransitionDuration: ShellTransitionPolicy.channelSlideDuration,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: false,
            child: child,
          );
        },
  );
}

CustomTransitionPage<void> shellMobileRootPushTransitionPage({
  required BuildContext context,
  required LocalKey key,
  required Widget child,
}) {
  if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
    return shellCupertinoSlideTransitionPage(key: key, child: child);
  }
  return shellSlideTransitionPage(key: key, child: child);
}

Page<void> shellMobileRootPushPage({
  required BuildContext context,
  required LocalKey key,
  required Widget child,
}) {
  if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
    return CupertinoPage<void>(key: key, child: child);
  }
  return shellSlideTransitionPage(key: key, child: child);
}
