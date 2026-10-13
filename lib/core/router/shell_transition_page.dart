import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/navigation/shell_transition_policy.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:go_router/go_router.dart';

ValueKey<String> guildChatPageKey(String guildId) =>
    ValueKey<String>('guild-chat:$guildId');

const ValueKey<String> kDmChatPageKey = ValueKey<String>('dm-chat');

const ValueKey<String> kFavoritesChatPageKey = ValueKey<String>(
  'favorites-chat',
);

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
    child: FluxerSheetBackdrop(child: child),
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
    child: FluxerSheetBackdrop(child: child),
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
}) {
  final FluxerMotionTheme motion = context.motion;
  return CustomTransitionPage<void>(
    key: key,
    name: name,
    child: FluxerSheetBackdrop(child: child),
    transitionDuration: motion.push,
    reverseTransitionDuration: motion.pop,
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: SidebarDrawerSliderScope.isPresentingOf(context)
                ? _kSettledOffset
                : Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: motion.pushCurve,
                      reverseCurve: motion.pushCurve.flipped,
                    ),
                  ),
            child: child,
          );
        },
  );
}

const Animation<Offset> _kSettledOffset = AlwaysStoppedAnimation<Offset>(
  Offset.zero,
);

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
    child: FluxerSheetBackdrop(child: child),
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

Page<void> shellMobileRootPushPage({
  required BuildContext context,
  required LocalKey key,
  required Widget child,
}) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return ShellCupertinoPushPage(key: key, child: child);
  }
  return shellSlideTransitionPage(context: context, key: key, child: child);
}

class ShellCupertinoPushPage extends Page<void> {
  const ShellCupertinoPushPage({required this.child, super.key});

  final Widget child;

  @override
  Route<void> createRoute(BuildContext context) {
    final FluxerMotionTheme motion = context.motion;
    return _ShellCupertinoPushRoute(
      page: this,
      push: motion.push,
      pop: motion.pop,
    );
  }
}

class _ShellCupertinoPushRoute extends PageRoute<void>
    with CupertinoRouteTransitionMixin<void> {
  _ShellCupertinoPushRoute({
    required ShellCupertinoPushPage page,
    required this.push,
    required this.pop,
  }) : super(settings: page);

  final Duration push;
  final Duration pop;

  ShellCupertinoPushPage get _page => settings as ShellCupertinoPushPage;

  @override
  Duration get transitionDuration => push;

  @override
  Duration get reverseTransitionDuration => pop;

  @override
  DelegatedTransitionBuilder? get delegatedTransition =>
      CupertinoPageTransition.delegatedTransition;

  @override
  Widget buildContent(BuildContext context) =>
      FluxerSheetBackdrop(child: _page.child);

  @override
  String? get title => null;

  @override
  bool get maintainState => true;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';
}
