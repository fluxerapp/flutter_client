import 'dart:async';

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_coordinator.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/push_notifications_coordinator.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_setup.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_ui.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/favorites/presentation/favorites_sidebar.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_list_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_blocks_horizontal_gestures_provider.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Left sidebars width is computed from layout theme in _buildDesktopBody.

enum BottomNavBranch { home, notifications, you }

class AppLayout extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppLayout({required this.navigationShell, super.key});

  @override
  ConsumerState<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends ConsumerState<AppLayout>
    with SingleTickerProviderStateMixin {
  late final GoRouter _router;
  late final AnimationController _swipeController;
  String _cachedLocation = '/';

  @override
  void initState() {
    super.initState();
    _router = ref.read(fluxerRouterProvider);
    _router.routerDelegate.addListener(_onRouteChange);
    _swipeController = AnimationController(
      vsync: this,
      duration: kHorizontalSwipeRevealDuration,
    );
    _cachedLocation = _readLocation();
  }

  @override
  void dispose() {
    _swipeController.dispose();
    _router.routerDelegate.removeListener(_onRouteChange);
    super.dispose();
  }

  void _onRouteChange() {
    if (!mounted) {
      return;
    }
    _cachedLocation = _readLocation();
    _swipeController.value = 0;
    setState(() {});
    ref.read(currentRevealSideProvider.notifier).syncForRoute(_cachedLocation);
  }

  String _readLocation() {
    final config = _router.routerDelegate.currentConfiguration;
    return config.isNotEmpty ? config.last.matchedLocation : '/';
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(pushNotificationsCoordinatorProvider);
    ref.watch(appIconBadgeCoordinatorProvider);
    if (PushProviderGuard.isUnifiedPush) {
      ref.listen(unifiedPushDistributorSetupProvider, (
        bool? previous,
        bool next,
      ) {
        if (!next) {
          return;
        }
        final BuildContext? rootContext = rootNavigatorKey.currentContext;
        if (rootContext == null || !rootContext.mounted) {
          return;
        }
        ref.read(unifiedPushDistributorSetupProvider.notifier).clearRequest();
        unawaited(showUnifiedPushDistributorSetup(rootContext));
      });
    }
    ref.listen(activeGuildIdProvider, (previous, next) {
      if (next != null) {
        final guilds = ref.read(guildListViewModelProvider).guilds;
        final guild = guilds.where((g) => g.id == next).firstOrNull;
        ref
            .read(channelListViewModelProvider.notifier)
            .loadChannels(next, guild: guild);
        ref.read(memberListViewModelProvider.notifier).loadMembers(next);
        ref.read(guildSyncProvider.notifier).syncIfNeeded(next);
      }
    });

    final isMobile = isMobileLayout(context);

    if (!isMobile) {
      return Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: _buildDesktopBody(),
      );
    }

    return _buildMobileBody();
  }

  Widget _sidebarForLocation(String location) {
    if (location.startsWith('/channels/@me')) {
      return const DMList();
    }
    if (location.startsWith('/channels/@favorites')) {
      return const FavoritesSidebar();
    }
    return const GuildSidebar();
  }

  Widget _buildDesktopBody() {
    final location = _cachedLocation;

    final layout = context.layout;
    final leftSidebarsWidth = layout.guildListWidth + layout.sidebarWidth;

    return Row(
      children: [
        SizedBox(
          width: leftSidebarsWidth,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const GuildNavbar(),
                    Expanded(child: _sidebarForLocation(location)),
                  ],
                ),
              ),
              UserArea(onSettingsTap: () => UserSettingsModal.show(context)),
            ],
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: context.colors.backgroundModifierAccent,
        ),
        Expanded(child: widget.navigationShell),
      ],
    );
  }

  Widget _buildMobileBody() {
    final location = _cachedLocation;

    if (_isChannelsRoute(location)) {
      return _buildMobileChannelBody(location);
    }

    final showSidebar = _isRootRoute(location);

    if (showSidebar) {
      return Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: Column(
          children: [
            Expanded(child: _buildMobileSidebar(location)),
            _buildBottomNav(context),
          ],
        ),
      );
    }

    final isChatRoute = _isChatRoute(location);
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: _buildSwipeableContent(location, showBottomNav: !isChatRoute),
    );
  }

  Widget _buildMobileChannelBody(String location) {
    final isOnChatRoute = _isChatRoute(location);
    final isPanelOpen = ref.watch(expressionPanelProvider);
    final keyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;

    final shouldResizeForKeyboard =
        mobileChannelScaffoldShouldResizeForKeyboard(
          isChatRoute: isOnChatRoute,
          isExpressionPanelOpen: isPanelOpen,
        );

    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      resizeToAvoidBottomInset: shouldResizeForKeyboard,
      body: SidebarDrawer(
        base: Column(
          children: [
            Expanded(child: _buildMobileSidebar(location)),
            if (!keyboardOpen) _buildBottomNav(context),
          ],
        ),
        slider: widget.navigationShell,
      ),
    );
  }

  Widget _buildSwipeableContent(
    String location, {
    required bool showBottomNav,
  }) {
    ref.listen<bool>(shellBlocksHorizontalGesturesProvider, (prev, next) {
      if (next && _swipeController.value > 0) {
        _swipeController.value = 0;
      }
    });
    final bool blocksHorizontalGestures = ref.watch(
      shellBlocksHorizontalGesturesProvider,
    );
    final canSwipePop = _canSwipePop(location) && !blocksHorizontalGestures;
    final mainContent = AnimatedBuilder(
      animation: _swipeController,
      builder: (context, child) {
        return _backSwipeBuildTransition(
          context,
          child: child!,
          location: location,
          showBottomNav: showBottomNav,
        );
      },
      child: widget.navigationShell,
    );
    if (!canSwipePop) {
      return mainContent;
    }
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    if (screenWidth <= 0) {
      return mainContent;
    }
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        mainContent,
        PositionedDirectional(
          start: 0,
          top: 0,
          bottom: 0,
          width: _backSwipeEdgeWidth(context),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              final double primaryDelta = details.primaryDelta ?? 0;
              final double logical =
                  (isRtl ? -primaryDelta : primaryDelta) / screenWidth;
              _swipeController.value = (_swipeController.value + logical).clamp(
                0.0,
                1.0,
              );
            },
            onHorizontalDragEnd: (DragEndDetails details) {
              _onBackSwipeEnd(
                context,
                isRtl: isRtl,
                screenWidth: screenWidth,
                endDetails: details,
              );
            },
            onHorizontalDragCancel: () {
              unawaited(
                _swipeController.animateBack(
                  0,
                  duration: kHorizontalSwipeSnapBackDuration,
                  curve: kHorizontalSwipeCurve,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  double _backSwipeEdgeWidth(BuildContext context) {
    return leadingEdgeHorizontalSwipeReserveWidth(context);
  }

  double _backSwipeProgressThreshold() {
    if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
      return kHorizontalSwipeCompletionThresholdCupertino;
    }
    return kHorizontalSwipeCompletionThresholdMaterial;
  }

  void _onBackSwipeEnd(
    BuildContext context, {
    required bool isRtl,
    required double screenWidth,
    required DragEndDetails endDetails,
  }) {
    final double vx = endDetails.velocity.pixelsPerSecond.dx;
    final double logicalWidthPerSec = (isRtl ? -vx : vx) / screenWidth;
    final bool shouldComplete;
    if (logicalWidthPerSec.abs() >= kHorizontalSwipeFlingVelocity) {
      shouldComplete = logicalWidthPerSec > 0;
    } else {
      shouldComplete = _swipeController.value > _backSwipeProgressThreshold();
    }
    if (shouldComplete) {
      unawaited(
        _swipeController
            .animateTo(
              1,
              duration: kHorizontalSwipeRevealDuration,
              curve: kHorizontalSwipeCurve,
            )
            .then((void _) {
              if (mounted) {
                context.pop();
              }
            }),
      );
    } else {
      unawaited(
        _swipeController.animateBack(
          0,
          duration: kHorizontalSwipeSnapBackDuration,
          curve: kHorizontalSwipeCurve,
        ),
      );
    }
  }

  Widget _backSwipeBuildTransition(
    BuildContext context, {
    required Widget child,
    required String location,
    required bool showBottomNav,
  }) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    if (_swipeController.value == 0) {
      if (showBottomNav) {
        return Column(
          children: [
            Expanded(child: child),
            _buildBottomNav(context),
          ],
        );
      }
      return child;
    }
    final double t = _swipeController.value;
    final double slideOffset = t * screenWidth;
    final double sign = isRtl ? -1.0 : 1.0;
    final double foregroundOffset = sign * slideOffset;
    Widget slidingContent = child;
    if (showBottomNav) {
      slidingContent = Column(
        children: [
          Expanded(child: slidingContent),
          _buildBottomNav(context),
        ],
      );
    }
    return Stack(
      children: [
        IgnorePointer(
          child: RepaintBoundary(
            child: Column(
              children: [
                Expanded(child: _buildMobileSidebar(location)),
                _buildBottomNav(context),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black.withValues(alpha: 0.5 * (1 - t)),
          ),
        ),
        Transform.translate(
          offset: Offset(foregroundOffset, 0),
          // [Transform] + semantics can assert during pan; t > 0 only here.
          child: RepaintBoundary(
            child: ExcludeSemantics(child: slidingContent),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSidebar(String location) {
    return ColoredBox(
      color: context.colors.channelSidebarBackground,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            const GuildNavbar(),
            Expanded(child: _sidebarForLocation(location)),
          ],
        ),
      ),
    );
  }

  bool _isRootRoute(String location) =>
      classifyRoute(location) == RouteKind.channelsRoot;

  bool _isChannelsRoute(String location) => isChannelsRoute(location);

  /// Any `/channels/:x/:y(...)` path — chat, guild members, dm call.
  bool _isChatRoute(String location) {
    final kind = classifyRoute(location);
    return kind == RouteKind.chat ||
        kind == RouteKind.guildMembers ||
        kind == RouteKind.dmCall;
  }

  bool _canSwipePop(String location) {
    if (location == '/notifications' || location == '/you') {
      return false;
    }
    return true;
  }

  Widget _buildProfileTabIcon({
    required UserSettingsViewState user,
    required int currentIndex,
    String? presenceStatus,
  }) {
    final isSelected = currentIndex == BottomNavBranch.you.index;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isSelected ? 1 : 0.5,
      child: FluxerAvatar.user(
        fallbackText: user.displayName,
        userId: user.userId,
        imageUrl: user.avatarUrl,
        avatarColor: user.avatarColor,
        status: presenceStatus,
        size: 24,
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final user = ref.watch(userSettingsViewModelProvider);
    final currentIndex = widget.navigationShell.currentIndex;
    final String? selfUserId = user.userId.isEmpty ? null : user.userId;
    final String? presenceStatus = selfUserId == null
        ? null
        : ref.watch(userPresenceProvider(selfUserId)).value?.status;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TODO(montys): Replace with a more final design.
        const VoiceCallBar(),
        Divider(height: 1, color: context.colors.borderColor),
        Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => widget.navigationShell.goBranch(
              index,
              initialLocation: index == currentIndex,
            ),
            selectedItemColor: context.colors.textChat,
            unselectedItemColor: context.colors.textPrimaryMuted,
            items: [
              const BottomNavigationBarItem(
                icon: PhosphorIcon(PhosphorIconsFill.house),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: PhosphorIcon(PhosphorIconsFill.bell),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: _buildProfileTabIcon(
                  user: user,
                  currentIndex: currentIndex,
                  presenceStatus: presenceStatus,
                ),
                label: 'You',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
