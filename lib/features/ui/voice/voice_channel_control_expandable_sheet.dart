import 'dart:ui' show lerpDouble;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_system_ui_sync.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_panel_settings.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

const double _kExpandedSheetHeightFraction = 0.88;
const double _kNarrowVoiceControlBarWidth = 360;
const Key kVoiceControlSheetDragHandleKey = Key(
  'voice-control-sheet-drag-handle',
);
const Key kVoiceControlSheetDragHeaderKey = Key(
  'voice-control-sheet-drag-header',
);
const Key kVoiceControlMorphingBarKey = Key('voice-control-morphing-bar');

class VoiceCallMobilePageLayout extends ConsumerWidget {
  const VoiceCallMobilePageLayout({
    required this.channelId,
    required this.child,
    this.guildId,
    super.key,
  });

  final String? channelId;
  final String? guildId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      bool isInVoice,
      bool isConnected,
      String? connectionId,
      String? channelId,
      String? guildId,
    ) = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => (
          s.isInVoice,
          s.isConnected,
          s.activeConnectionId,
          s.channelId,
          s.guildId,
        ),
      ),
    );
    if (!isInVoice) {
      return VoiceCallSystemUiSync(child: child);
    }
    final bool showsOverlay = ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    );
    final double footprint = showsOverlay
        ? voiceChannelControlCollapsedFootprint(context)
        : 0;
    return VoiceCallSystemUiSync(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: footprint),
                child: child,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  offset: showsOverlay ? Offset.zero : const Offset(0, 1.2),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 180),
                    opacity: showsOverlay ? 1 : 0,
                    child: IgnorePointer(
                      ignoring: !showsOverlay,
                      child: VoiceChannelControlExpandableSheet(
                        channelId: this.channelId ?? channelId,
                        guildId: this.guildId ?? guildId,
                        isConnected: isConnected,
                        connectionId: connectionId,
                        parentHeight: constraints.maxHeight,
                        parentWidth: constraints.maxWidth,
                        positioned: false,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class VoiceChannelControlExpandableSheet extends ConsumerStatefulWidget {
  const VoiceChannelControlExpandableSheet({
    required this.parentHeight,
    required this.parentWidth,
    required this.isConnected,
    this.channelId,
    this.guildId,
    this.connectionId,
    this.positioned = true,
    super.key,
  });

  final String? channelId;
  final String? guildId;
  final String? connectionId;
  final bool isConnected;
  final double parentHeight;
  final double parentWidth;
  final bool positioned;

  @override
  ConsumerState<VoiceChannelControlExpandableSheet> createState() =>
      _VoiceChannelControlExpandableSheetState();
}

const ScrollPhysics _kVoicePanelScrollPhysics = AlwaysScrollableScrollPhysics(
  parent: ClampingScrollPhysics(),
);
const ScrollPhysics _kVoicePanelHiddenScrollPhysics =
    NeverScrollableScrollPhysics();

class _VoiceChannelControlExpandableSheetState
    extends ConsumerState<VoiceChannelControlExpandableSheet> {
  final ScrollController _scrollController = ScrollController();
  final VelocityTracker _headerVelocityTracker = VelocityTracker.withKind(
    PointerDeviceKind.touch,
  );
  late final ValueNotifier<double> _heightNotifier;
  late final ValueNotifier<bool> _isDraggingNotifier;
  double _collapsedHeightCache = 0;
  double _expandedHeightCache = 0;
  bool _canScreenShare = false;
  bool? _dragWasPastCollapsed;
  bool _initialized = false;
  bool _panelBodyVisible = false;
  int _lastDragDirection = 0;

  @override
  void initState() {
    super.initState();
    _heightNotifier = ValueNotifier<double>(0);
    _isDraggingNotifier = ValueNotifier<bool>(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshLayoutMetrics();
    _refreshScreenShareCapability();
    if (!_initialized) {
      updateExpandableSheetHeight(
        heightNotifier: _heightNotifier,
        nextHeight: _collapsedHeightCache,
      );
      _initialized = true;
    }
  }

  @override
  void didUpdateWidget(VoiceChannelControlExpandableSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.parentHeight != widget.parentHeight ||
        oldWidget.parentWidth != widget.parentWidth) {
      _refreshLayoutMetrics();
      final double clamped = _heightNotifier.value.clamp(
        _collapsedHeightCache,
        _expandedHeightCache,
      );
      if (clamped != _heightNotifier.value) {
        updateExpandableSheetHeight(
          heightNotifier: _heightNotifier,
          nextHeight: clamped,
        );
        _syncPanelBodyVisibility(clamped);
      }
    }
  }

  @override
  void dispose() {
    _isDraggingNotifier.dispose();
    _heightNotifier.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  double get _height => _heightNotifier.value;

  void _refreshLayoutMetrics() {
    _collapsedHeightCache = voiceChannelControlMorphingHeaderHeight();
    final double bottomInset = MediaQuery.viewPaddingOf(context).bottom;
    const double outerPadding = kVoiceControlBarVerticalPadding * 2;
    final double available = widget.parentHeight - bottomInset - outerPadding;
    _expandedHeightCache = (available * _kExpandedSheetHeightFraction).clamp(
      _collapsedHeightCache,
      available,
    );
  }

  void _refreshScreenShareCapability() {
    final bool value = ref
        .read(screenShareCapabilityProvider)
        .maybeWhen(data: (bool canShare) => canShare, orElse: () => false);
    if (value != _canScreenShare) {
      _canScreenShare = value;
    }
  }

  double _expansionFor(double height) {
    if (_expandedHeightCache <= _collapsedHeightCache) {
      return 0;
    }
    return ((height - _collapsedHeightCache) /
            (_expandedHeightCache - _collapsedHeightCache))
        .clamp(0.0, 1.0);
  }

  void _syncPanelBodyVisibility(double height) {
    final bool shouldShow = expandableSheetIsPastCollapsedHeight(
      currentHeight: height,
      collapsedHeight: _collapsedHeightCache,
    );
    ref
        .read(voiceCallOverlayProvider.notifier)
        .setSheetExpanded(value: shouldShow);
    if (shouldShow == _panelBodyVisible) {
      return;
    }
    setState(() => _panelBodyVisible = shouldShow);
  }

  void _adjustSheetHeight(double deltaDy) {
    if (deltaDy != 0) {
      _lastDragDirection = deltaDy > 0 ? 1 : -1;
    }
    final double collapsed = _collapsedHeightCache;
    final double expanded = _expandedHeightCache;
    final double previousHeight = _height;
    final double nextHeight = (previousHeight - deltaDy).clamp(
      collapsed,
      expanded,
    );
    if (nextHeight == previousHeight && _isDraggingNotifier.value) {
      return;
    }
    _isDraggingNotifier.value = true;
    updateExpandableSheetHeight(
      heightNotifier: _heightNotifier,
      nextHeight: nextHeight,
    );
    _syncPanelBodyVisibility(nextHeight);
    _dragWasPastCollapsed = updateExpandableSheetDragHaptic(
      wasPastCollapsed: _dragWasPastCollapsed,
      previousHeight: previousHeight,
      currentHeight: nextHeight,
      collapsedHeight: collapsed,
    );
  }

  void _resetDragHaptics() {
    _dragWasPastCollapsed = null;
  }

  void _onVerticalDragStart(DragStartDetails details) {
    ref.read(voiceCallOverlayProvider.notifier).reveal();
    _headerVelocityTracker.addPosition(
      details.sourceTimeStamp ?? Duration.zero,
      details.globalPosition,
    );
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _headerVelocityTracker.addPosition(
      details.sourceTimeStamp ?? Duration.zero,
      details.globalPosition,
    );
    _adjustSheetHeight(details.delta.dy);
  }

  double _resolveHeaderDragVelocity(DragEndDetails details) {
    final double? primary = details.primaryVelocity;
    if (primary != null && primary != 0 && _lastDragDirection != 0) {
      return primary.abs() * _lastDragDirection;
    }
    final double trackedVelocity = _headerVelocityTracker
        .getVelocity()
        .pixelsPerSecond
        .dy;
    if (trackedVelocity != 0) {
      return trackedVelocity;
    }
    final double velocityY = details.velocity.pixelsPerSecond.dy;
    if (velocityY != 0) {
      return velocityY;
    }
    return primary ?? 0;
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    final double collapsed = _collapsedHeightCache;
    final double expanded = _expandedHeightCache;
    final double velocity = _resolveHeaderDragVelocity(details);
    final double target = expandableSheetBinarySnapHeight(
      currentHeight: _height,
      velocity: velocity,
      collapsedHeight: collapsed,
      expandedHeight: expanded,
    );
    updateExpandableSheetHeight(
      heightNotifier: _heightNotifier,
      nextHeight: target,
    );
    _isDraggingNotifier.value = false;
    _lastDragDirection = 0;
    setState(() {
      _panelBodyVisible = expandableSheetIsPastCollapsedHeight(
        currentHeight: target,
        collapsedHeight: collapsed,
      );
    });
    _syncPanelBodyVisibility(target);
    _resetDragHaptics();
  }

  bool _isPanelListAtTop() {
    return !_scrollController.hasClients || _scrollController.offset <= 0;
  }

  void _onPanelPointerMove(PointerMoveEvent event) {
    if (!_panelBodyVisible || !_isPanelListAtTop()) {
      return;
    }
    if (event.delta.dy > 0) {
      _adjustSheetHeight(event.delta.dy);
    }
  }

  void _onPanelPointerEnd(PointerEvent event) {
    if (!_isDraggingNotifier.value) {
      return;
    }
    _onVerticalDragEnd(DragEndDetails());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.parentHeight <= 0 || widget.parentWidth <= 0) {
      return const SizedBox.shrink();
    }
    ref.listen(screenShareCapabilityProvider, (
      AsyncValue<bool>? previous,
      AsyncValue<bool> next,
    ) {
      final bool value = next.maybeWhen(
        data: (bool canShare) => canShare,
        orElse: () => false,
      );
      if (value != _canScreenShare && mounted) {
        setState(() => _canScreenShare = value);
      }
    });
    final double maxBarWidth = widget.parentWidth - 16;
    final int buttonCount = voiceChannelControlButtonCount(
      canScreenShare: _canScreenShare,
    );
    final double collapsedWidth = voiceChannelControlMorphingCollapsedWidth(
      buttonCount: buttonCount,
    ).clamp(0, maxBarWidth);
    final double collapsedBarInnerWidth =
        collapsedWidth - (kVoiceControlMorphingBarBorderWidth * 2);
    final double expandedBarInnerWidth =
        maxBarWidth - (kVoiceControlMorphingBarBorderWidth * 2);
    final double homeIndicatorInset = MediaQuery.viewPaddingOf(context).bottom;
    final bool useNarrowControls =
        widget.parentWidth < _kNarrowVoiceControlBarWidth;
    final Widget sheet = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SafeArea(
          top: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: kVoiceControlBarVerticalPadding,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  boxShadow: kVoiceControlFloatingBarShadow,
                ),
                child: ExpandableSheetHeightBuilder(
                  heightNotifier: _heightNotifier,
                  isDraggingNotifier: _isDraggingNotifier,
                  sizeBuilder:
                      (
                        BuildContext context,
                        double height, {
                        required bool isDragging,
                        required Widget child,
                      }) {
                        final double expansion = _expansionFor(height);
                        final double barWidth =
                            lerpDouble(
                              collapsedWidth,
                              maxBarWidth,
                              expansion,
                            ) ??
                            maxBarWidth;
                        final double barRadius =
                            voiceChannelControlMorphingBarRadius(expansion);
                        final BorderRadius borderRadius = BorderRadius.circular(
                          barRadius,
                        );
                        return KeyedSubtree(
                          key: kVoiceControlMorphingBarKey,
                          child: expandableSheetAnimatedSize(
                            context: context,
                            isDragging: isDragging,
                            width: barWidth,
                            height: height,
                            child: DecoratedBox(
                              decoration:
                                  voiceChannelControlMorphingSurfaceDecoration(
                                    context,
                                    borderRadius: borderRadius,
                                  ),
                              child: ClipRRect(
                                borderRadius: borderRadius,
                                child: LayoutBuilder(
                                  builder:
                                      (
                                        BuildContext context,
                                        BoxConstraints constraints,
                                      ) {
                                        final double measuredBarInnerWidth =
                                            constraints.maxWidth -
                                            (kVoiceControlMorphingBarBorderWidth *
                                                2);
                                        final double widthExpansion =
                                            voiceChannelControlMorphingWidthExpansion(
                                              barInnerWidth:
                                                  measuredBarInnerWidth,
                                              collapsedBarInnerWidth:
                                                  collapsedBarInnerWidth,
                                              expandedBarInnerWidth:
                                                  expandedBarInnerWidth,
                                            );
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            ExpandableSheetDragTarget(
                                              key:
                                                  kVoiceControlSheetDragHeaderKey,
                                              onVerticalDragStart:
                                                  _onVerticalDragStart,
                                              onVerticalDragUpdate:
                                                  _onVerticalDragUpdate,
                                              onVerticalDragEnd:
                                                  _onVerticalDragEnd,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  const VoiceChannelControlSheetDragHandle(
                                                    key:
                                                        kVoiceControlSheetDragHandleKey,
                                                  ),
                                                  ClipRect(
                                                    child: VoiceChannelControlBarContent(
                                                      channelId:
                                                          widget.channelId,
                                                      guildId: widget.guildId,
                                                      connectionId:
                                                          widget.connectionId,
                                                      isConnected:
                                                          widget.isConnected,
                                                      style:
                                                          VoiceChannelControlBarStyle
                                                              .embedded,
                                                      barInnerWidth:
                                                          measuredBarInnerWidth,
                                                      expansion: widthExpansion,
                                                      canScreenShare:
                                                          _canScreenShare,
                                                      useCompactControls:
                                                          useNarrowControls,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (_panelBodyVisible)
                                              Expanded(child: child),
                                          ],
                                        );
                                      },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                  child: TickerMode(
                    enabled: !_isDraggingNotifier.value,
                    child: RepaintBoundary(
                      child: _VoiceControlPanelSettingsBody(
                        scrollController: _scrollController,
                        channelId: widget.channelId,
                        panelBodyVisible: _panelBodyVisible,
                        onPointerMove: _onPanelPointerMove,
                        onPointerEnd: _onPanelPointerEnd,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (homeIndicatorInset > 0)
          ColoredBox(
            color: context.colors.chatBackground,
            child: SizedBox(height: homeIndicatorInset),
          ),
      ],
    );
    if (!widget.positioned) {
      return sheet;
    }
    return Positioned(left: 0, right: 0, bottom: 0, child: sheet);
  }
}

class _VoiceControlPanelSettingsBody extends StatelessWidget {
  const _VoiceControlPanelSettingsBody({
    required this.scrollController,
    required this.channelId,
    required this.panelBodyVisible,
    required this.onPointerMove,
    required this.onPointerEnd,
  });

  final ScrollController scrollController;
  final String? channelId;
  final bool panelBodyVisible;
  final void Function(PointerMoveEvent event) onPointerMove;
  final void Function(PointerEvent event) onPointerEnd;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerMove: onPointerMove,
      onPointerUp: onPointerEnd,
      onPointerCancel: onPointerEnd,
      child: ListView(
        controller: scrollController,
        physics: panelBodyVisible
            ? _kVoicePanelScrollPhysics
            : _kVoicePanelHiddenScrollPhysics,
        padding: EdgeInsets.zero,
        children: <Widget>[
          VoiceChannelControlPanelSettings(channelId: channelId),
        ],
      ),
    );
  }
}

class VoiceChannelControlSheetDragHandle extends StatelessWidget {
  const VoiceChannelControlSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Voice call controls',
      child: SizedBox(
        height: kVoiceControlSheetHandleHeight,
        width: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: context.colors.backgroundModifierAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
