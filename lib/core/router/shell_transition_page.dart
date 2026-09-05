import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/shell/navigation/shell_transition_policy.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:go_router/go_router.dart';

ValueKey<String> guildChatPageKey(String guildId) =>
    ValueKey<String>('guild-chat:$guildId');

const ValueKey<String> kDmChatPageKey = ValueKey<String>('dm-chat');

const ValueKey<String> kFavoritesChatPageKey = ValueKey<String>(
  'favorites-chat',
);

/// Nested `@me` routes share one navigator stack. Only the `:channelId` route
/// may use [kDmChatPageKey]; parent and message pages must keep [routePageKey].
LocalKey dmShellPageKeyForRoute({
  required String? routeName,
  required LocalKey routePageKey,
}) {
  if (routeName == RouteNames.dmChannel) {
    return kDmChatPageKey;
  }
  return routePageKey;
}

CustomTransitionPage<void> shellInstantTransitionPage({
  required LocalKey key,
  required Widget child,
  String? name,
}) {
  return CustomTransitionPage<void>(
    key: key,
    name: name,
    child: child,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return child;
        },
  );
}

CustomTransitionPage<void> shellFadeTransitionPage({
  required BuildContext context,
  required LocalKey key,
  required Widget child,
  String? name,
  Duration? duration,
  bool opaque = true,
}) {
  final Duration resolved =
      duration ?? ShellTransitionPolicy.rootOverlayFadeDuration(context);
  return CustomTransitionPage<void>(
    key: key,
    name: name,
    opaque: opaque,
    child: child,
    transitionDuration: resolved,
    reverseTransitionDuration: resolved,
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
  required BuildContext context,
  required LocalKey key,
  required Widget child,
  String? name,
  bool parallaxOutgoing = false,
}) {
  final Duration duration = ShellTransitionPolicy.channelSlideDuration(context);
  return CustomTransitionPage<void>(
    key: key,
    name: name,
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
                end: const Offset(
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
  required BuildContext context,
  required LocalKey key,
  required Widget child,
}) {
  final Duration duration = ShellTransitionPolicy.channelSlideDuration(context);
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
          return CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: false,
            child: child,
          );
        },
  );
}

CustomTransitionPage<void> shellPhoneVoiceCallTransitionPage({
  required BuildContext context,
  required LocalKey key,
  required Widget child,
}) {
  if (peekVoicePipSkipPhoneEnter()) {
    return shellInstantTransitionPage(key: key, child: child);
  }
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: kVoiceCallPhoneTransitionDuration,
    reverseTransitionDuration: kVoiceCallPhoneTransitionDuration,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          final Animation<double> curved = CurvedAnimation(
            parent: animation,
            curve: kVoiceCallPhoneTransitionCurve,
          );
          return FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: kVoiceCallPhoneSlideBegin,
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
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
    return shellCupertinoSlideTransitionPage(
      context: context,
      key: key,
      child: child,
    );
  }
  return shellSlideTransitionPage(context: context, key: key, child: child);
}

Page<void> shellMobileRootPushPage({
  required BuildContext context,
  required LocalKey key,
  required Widget child,
}) {
  if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
    return CupertinoPage<void>(key: key, child: child);
  }
  return shellSlideTransitionPage(context: context, key: key, child: child);
}
