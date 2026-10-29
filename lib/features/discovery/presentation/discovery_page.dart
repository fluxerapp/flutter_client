import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_category_tabs.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_filters.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_guild_grid_slivers.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_language_select.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_background_bleed.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/navigation/root_overlay_navigation.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DiscoveryPage extends ConsumerStatefulWidget {
  const DiscoveryPage({this.showBackButton = false, super.key});

  final bool showBackButton;

  @override
  ConsumerState<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends ConsumerState<DiscoveryPage> {
  static const double _mobileExpandedHeight = 170;
  static const double _loadMoreThreshold = 320;

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _headerStretch = ValueNotifier<double>(0);
  bool _showCollapsedTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    _headerStretch.dispose();
    super.dispose();
  }

  double get _mobileCollapseThreshold => _mobileExpandedHeight - kToolbarHeight;

  void _handleScroll() {
    if (!mounted || !_scrollController.hasClients) {
      return;
    }
    final double currentScroll = _scrollController.position.pixels;
    if (isMobileLayout(context)) {
      final bool showCollapsedTitle =
          currentScroll >= _mobileCollapseThreshold - 1;
      if (showCollapsedTitle != _showCollapsedTitle) {
        setState(() => _showCollapsedTitle = showCollapsedTitle);
      }
    }
    _maybeLoadMore();
  }

  void _maybeLoadMore() {
    if (!mounted || !_scrollController.hasClients) {
      return;
    }
    final DiscoveryState state = ref.read(discoveryControllerProvider);
    if (state.isLoading || state.isLoadingMore || !state.hasMore) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final double maxScroll = position.maxScrollExtent;
    final bool isNearBottom =
        maxScroll <= 0 || position.pixels >= maxScroll - _loadMoreThreshold;
    if (isNearBottom) {
      unawaited(ref.read(discoveryControllerProvider.notifier).loadMore());
    }
  }

  void _scheduleLoadMoreCheck() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _maybeLoadMore();
      }
    });
  }

  void _leaveDiscovery(BuildContext context) {
    popRootOverlay(context, ref);
  }

  double _mobileDiscoveryFiltersBrandHeight(FluxerLayoutTheme layout) {
    return layout.s4 + kPickerSearchInputHeight;
  }

  double _duoBrandSideStripHeight(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    final double top = MediaQuery.paddingOf(context).top;
    final double expandedBottom =
        top +
        _mobileExpandedHeight +
        _mobileDiscoveryFiltersBrandHeight(layout);
    final double collapsedBottom = top + kToolbarHeight;
    if (!_scrollController.hasClients) {
      return expandedBottom;
    }
    final ScrollPosition position = _scrollController.position;
    final double minExtent = position.minScrollExtent;
    final double pixels = position.pixels;
    if (pixels < minExtent) {
      return math.max(collapsedBottom, expandedBottom - pixels);
    }
    return math.max(
      collapsedBottom,
      expandedBottom - pixels + _headerStretch.value,
    );
  }

  bool _handleHeaderScrollNotification(ScrollNotification notification) {
    final double next = _nextHeaderStretch(notification, _headerStretch.value);
    if (next != _headerStretch.value) {
      _headerStretch.value = next;
    }
    return false;
  }

  static double _nextHeaderStretch(
    ScrollNotification notification,
    double current,
  ) {
    if (!notification.metrics.hasPixels) {
      return current;
    }
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.pixels < metrics.minScrollExtent ||
        metrics.pixels > metrics.minScrollExtent + 1) {
      return 0;
    }
    if (notification is ScrollEndNotification) {
      return 0;
    }
    if (notification is OverscrollNotification && notification.overscroll < 0) {
      return math.max(current, -notification.overscroll);
    }
    return current;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final DiscoveryState state = ref.watch(discoveryControllerProvider);
    ref.listen<DiscoveryState>(discoveryControllerProvider, (
      DiscoveryState? previous,
      DiscoveryState next,
    ) {
      if (previous == null) {
        return;
      }
      if (previous.guilds.length != next.guilds.length ||
          previous.isLoading != next.isLoading ||
          previous.isLoadingMore != next.isLoadingMore) {
        _scheduleLoadMoreCheck();
      }
    });
    final bool showBackButton =
        (widget.showBackButton || isMobile) &&
        showsInAppShellBackButton(context);
    final List<Widget> gridSlivers = buildDiscoveryGuildGridSlivers(
      context: context,
      state: state,
      isMobile: isMobile,
    );
    Widget scrollView = NotificationListener<ScrollNotification>(
      onNotification: _handleHeaderScrollNotification,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: isMobile
            ? <Widget>[
                _buildMobileHeaderSliver(
                  context,
                  colors: colors,
                  textStyles: textStyles,
                  layout: layout,
                  l10n: l10n,
                  showBackButton: showBackButton,
                  showCollapsedTitle: _showCollapsedTitle,
                ),
                const SliverToBoxAdapter(
                  child: DiscoveryFilters(showLanguageFilter: false),
                ),
                buildDiscoveryCategoryTabsSliver(context),
                ...gridSlivers,
              ]
            : <Widget>[
                SliverToBoxAdapter(
                  child: _buildDesktopHero(
                    colors: colors,
                    textStyles: textStyles,
                    layout: layout,
                    l10n: l10n,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: DiscoveryFilters(
                    autofocusSearch: true,
                    maxContentWidth: discoveryFiltersMaxContentWidth,
                  ),
                ),
                buildDiscoveryCategoryTabsSliver(context),
                ...gridSlivers,
              ],
      ),
    );
    final bool duoSideStrip = isMobile && hasIphoneDuoSideStrip(context);
    if (duoSideStrip) {
      scrollView = Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ListenableBuilder(
            listenable: Listenable.merge(<Listenable>[
              _scrollController,
              _headerStretch,
            ]),
            builder: (BuildContext context, Widget? _) {
              return HostedUiSideStripFill(
                color: colors.brandPrimary,
                height: _duoBrandSideStripHeight(context),
              );
            },
          ),
          scrollView,
        ],
      );
    }
    final Widget content = HostedUiBackgroundBleed(
      color: colors.backgroundPrimary,
      child: ColoredBox(color: colors.backgroundPrimary, child: scrollView),
    );
    return content;
  }

  Widget _buildDesktopHero({
    required FluxerColorTheme colors,
    required FluxerTextTheme textStyles,
    required FluxerLayoutTheme layout,
    required FluxerLocalizations l10n,
  }) {
    return Container(
      width: double.infinity,
      color: colors.brandPrimary,
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s6, layout.s4, layout.s5),
      child: Column(
        children: <Widget>[
          Text(
            l10n.discoveryExplorePublicCommunities,
            textAlign: TextAlign.center,
            style: textStyles.heading.copyWith(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          SizedBox(height: layout.s2),
          Text(
            l10n.discoveryListingSubheading,
            textAlign: TextAlign.center,
            style: textStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHeaderSliver(
    BuildContext context, {
    required FluxerColorTheme colors,
    required FluxerTextTheme textStyles,
    required FluxerLayoutTheme layout,
    required FluxerLocalizations l10n,
    required bool showBackButton,
    required bool showCollapsedTitle,
  }) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: _mobileExpandedHeight,
      backgroundColor: colors.brandPrimary,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const PhosphorIcon(
                PhosphorIconsBold.caretLeft,
                color: Colors.white,
              ),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () => _leaveDiscovery(context),
            )
          : null,
      title: AnimatedOpacity(
        duration: context.motion.fast,
        opacity: showCollapsedTitle ? 1 : 0,
        child: Text(
          l10n.discoveryExplore,
          style: textStyles.channelName.copyWith(color: Colors.white),
        ),
      ),
      actions: const <Widget>[DiscoveryLanguageAppBarAction()],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: ColoredBox(
          color: colors.brandPrimary,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                layout.s4,
                kToolbarHeight,
                layout.s4,
                layout.s3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    l10n.discoveryExplorePublicCommunities,
                    textAlign: TextAlign.center,
                    style: textStyles.heading.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: layout.s2),
                  Text(
                    l10n.discoveryListingSubheading,
                    textAlign: TextAlign.center,
                    style: textStyles.bodySmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
