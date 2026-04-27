import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/expression_panel_provider.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_list_view_model.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/overlapping_panels.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Left sidebars width is computed from layout theme in _buildDesktopBody.

class AppLayout extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppLayout({required this.navigationShell, super.key});

  @override
  ConsumerState<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends ConsumerState<AppLayout>
    with SingleTickerProviderStateMixin {
  static const _youBranchIndex = 2;
  static const _kBackGestureMinWidthCupertino = 20.0;
  static const _kBackGestureMinWidthMaterial = 32.0;
  static const _kBackSwipeFlingWidthPerSecond = 1.0;
  static const _kBackSwipeProgressThresholdMaterial = 0.4;
  static const _kBackSwipeProgressThresholdCupertino = 0.5;
  static const _kBackSwipeSnapDuration = Duration(milliseconds: 350);
  static const Curve _kBackSwipeSnapCurve = Curves.fastEaseInToSlowEaseOut;
  static final _rootRoutePattern = RegExp(r'^/channels/[^/]+$');
  static final _chatRoutePattern = RegExp('^/channels/[^/]+/.+');
  late final GoRouter _router;
  late final AnimationController _swipeController;
  final _mobilePanelsKey = GlobalKey<OverlappingPanelsState>();

  @override
  void initState() {
    super.initState();
    _router = ref.read(fluxerRouterProvider);
    _router.routerDelegate.addListener(_onRouteChange);
    _swipeController = AnimationController(
      vsync: this,
      duration: _kBackSwipeSnapDuration,
    );
  }

  @override
  void dispose() {
    _swipeController.dispose();
    _router.routerDelegate.removeListener(_onRouteChange);
    super.dispose();
  }

  void _onRouteChange() {
    if (mounted) {
      _swipeController.value = 0;
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _syncMobilePanelWithRoute(_currentLocation);
        }
      });
    }
  }

  String get _currentLocation {
    final config = _router.routerDelegate.currentConfiguration;
    return config.isNotEmpty ? config.last.matchedLocation : '/';
  }

  @override
  Widget build(BuildContext context) {
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

  Widget _buildDesktopBody() {
    final location = _currentLocation;
    final isDm = location.startsWith('/channels/@me');

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
                    Expanded(
                      child: isDm ? const DMList() : const GuildSidebar(),
                    ),
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
    final location = _currentLocation;

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
    final showBottomNav = !_isChatRoute(location);
    final defaultSide = _isRootRoute(location)
        ? RevealSide.left
        : RevealSide.main;
    final mainContent = OverlappingPanels(
      key: _mobilePanelsKey,
      left: _buildMobileSidebar(location),
      main: widget.navigationShell,
      defaultSide: defaultSide,
      restWidth: 0,
    );

    if (!showBottomNav) {
      final isPanelOpen = ref.watch(expressionPanelProvider);
      final shouldResizeForKeyboard =
          mobileChannelScaffoldShouldResizeForKeyboard(
            isChatRoute: true,
            isExpressionPanelOpen: isPanelOpen,
          );
      final shouldRemoveKeyboardInset =
          mobileChannelScaffoldShouldRemoveKeyboardInset(
            isChatRoute: true,
            isExpressionPanelOpen: isPanelOpen,
          );
      final body = shouldRemoveKeyboardInset
          ? MediaQuery.removeViewInsets(
              context: context,
              removeBottom: true,
              child: mainContent,
            )
          : mainContent;
      return Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        resizeToAvoidBottomInset: shouldResizeForKeyboard,
        body: body,
      );
    }

    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Column(
        children: [
          Expanded(child: mainContent),
          _buildBottomNav(context),
        ],
      ),
    );
  }

  void _syncMobilePanelWithRoute(String location) {
    if (!_isChannelsRoute(location) || !isMobileLayout(context)) {
      return;
    }
    final panelState = _mobilePanelsKey.currentState;
    if (panelState == null) {
      return;
    }
    unawaited(
      panelState.moveToState(
        _isRootRoute(location) ? RevealSide.left : RevealSide.main,
      ),
    );
  }

  Widget _buildSwipeableContent(
    String location, {
    required bool showBottomNav,
  }) {
    final canSwipePop = _canSwipePop(location);
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
                  duration: _kBackSwipeSnapDuration,
                  curve: _kBackSwipeSnapCurve,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  double _backSwipeEdgeWidth(BuildContext context) {
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final double startEdgePadding = isRtl ? padding.right : padding.left;
    if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
      return math.max(_kBackGestureMinWidthCupertino, startEdgePadding);
    }
    return math.max(_kBackGestureMinWidthMaterial, startEdgePadding);
  }

  double _backSwipeProgressThreshold() {
    if (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb) {
      return _kBackSwipeProgressThresholdCupertino;
    }
    return _kBackSwipeProgressThresholdMaterial;
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
    if (logicalWidthPerSec.abs() >= _kBackSwipeFlingWidthPerSecond) {
      shouldComplete = logicalWidthPerSec > 0;
    } else {
      shouldComplete = _swipeController.value > _backSwipeProgressThreshold();
    }
    if (shouldComplete) {
      unawaited(
        _swipeController
            .animateTo(
              1,
              duration: _kBackSwipeSnapDuration,
              curve: _kBackSwipeSnapCurve,
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
          duration: _kBackSwipeSnapDuration,
          curve: _kBackSwipeSnapCurve,
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
          child: Column(
            children: [
              Expanded(child: _buildMobileSidebar(location)),
              _buildBottomNav(context),
            ],
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
          child: ExcludeSemantics(child: slidingContent),
        ),
      ],
    );
  }

  Widget _buildMobileSidebar(String location) {
    final isDm = location.startsWith('/channels/@me');
    return ColoredBox(
      color: context.colors.channelSidebarBackground,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            const GuildNavbar(),
            Expanded(child: isDm ? const DMList() : const GuildSidebar()),
          ],
        ),
      ),
    );
  }

  /// Matches /channels/@me, /channels/@favorites, /channels/:guildId (no sub-path).
  bool _isRootRoute(String location) => _rootRoutePattern.hasMatch(location);

  bool _isChannelsRoute(String location) => location.startsWith('/channels/');

  /// Matches any /channels/:x/:y path (DM channel, guild channel, message).
  bool _isChatRoute(String location) => _chatRoutePattern.hasMatch(location);

  bool _canSwipePop(String location) {
    if (location == '/notifications' || location == '/you') {
      return false;
    }
    return true;
  }

  Widget _buildProfileTabIcon({
    required UserSettingsViewState user,
    required int currentIndex,
  }) {
    final isSelected = currentIndex == _youBranchIndex;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isSelected ? 1 : 0.5,
      child: FluxerAvatar.user(
        fallbackText: user.displayName,
        userId: user.userId,
        imageUrl: user.avatarUrl,
        avatarColor: user.avatarColor,
        size: 24,
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final user = ref.watch(userSettingsViewModelProvider);
    final currentIndex = widget.navigationShell.currentIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// TODO: Replace with a more final design
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
