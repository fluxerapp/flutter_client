import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_drag_bridge.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/horizontal_reveal_physics.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';

const Key kChannelDetailsDrawerPanelKey = Key('channel-details-drawer-panel');

class ChannelDetailsDrawerOverlay extends ConsumerStatefulWidget {
  const ChannelDetailsDrawerOverlay({required this.channelId, super.key});

  final String channelId;

  @override
  ConsumerState<ChannelDetailsDrawerOverlay> createState() =>
      _ChannelDetailsDrawerOverlayState();
}

class _ChannelDetailsDrawerOverlayState
    extends ConsumerState<ChannelDetailsDrawerOverlay>
    with SingleTickerProviderStateMixin
    implements ChannelDetailsDrawerPhysicsHost {
  late final AnimationController _translateController;
  late final ScrollController _scrollController;
  late final ChannelDetailsDrawerDragBridge _dragBridge;
  ChannelDetailsDrawerState? _content;
  double _lastWidth = 0;
  bool _interactiveDragActive = false;
  bool _closeAnimationRunning = false;

  @override
  void initState() {
    super.initState();
    _translateController = createHorizontalRevealController(
      vsync: this,
      onTranslateChanged: _publishRevealPixels,
    );
    _scrollController = ScrollController();
    _dragBridge = ref.read(channelDetailsDrawerDragBridgeProvider);
    _dragBridge.attach(this);
  }

  @override
  void dispose() {
    _dragBridge.detach(this);
    _translateController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ChannelDetailsDrawerOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId == widget.channelId) {
      return;
    }
    final ChannelDetailsDrawer drawer = ref.read(
      channelDetailsDrawerProvider.notifier,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => drawer.close());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncWidth(MediaQuery.sizeOf(context).width);
  }

  void _publishRevealPixels() {
    ref
        .read(channelDetailsDrawerRevealProvider.notifier)
        .setPixels(_translateController.value);
  }

  void _syncWidth(double width) {
    if (width <= 0 || _lastWidth == width) {
      return;
    }
    rescaleHorizontalRevealOnWidthChange(
      controller: _translateController,
      previousWidth: _lastWidth,
      width: width,
      setLastWidth: (double w) => _lastWidth = w,
    );
  }

  double _screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

  Duration _revealDuration(BuildContext context) =>
      horizontalSwipeRevealDuration(context);

  Duration _snapBackDuration(BuildContext context) =>
      horizontalSwipeSnapBackDuration(context);

  Future<void> _moveToOpen() async {
    await animateHorizontalReveal(
      _translateController,
      _screenWidth(context),
      _revealDuration(context),
      kHorizontalSwipeCurve,
    );
  }

  Future<void> _moveToClosed() async {
    if (_closeAnimationRunning) {
      return;
    }
    _closeAnimationRunning = true;
    try {
      await animateHorizontalReveal(
        _translateController,
        0,
        _snapBackDuration(context),
        kHorizontalSwipeCurve,
      );
      if (mounted && ref.read(channelDetailsDrawerProvider) == null) {
        setState(() => _content = null);
      }
      ref.read(channelDetailsDrawerRevealProvider.notifier).setPixels(0);
    } finally {
      _closeAnimationRunning = false;
    }
  }

  void _requestCloseAnimation() {
    if (_closeAnimationRunning) {
      return;
    }
    if (_translateController.value == 0 && !_translateController.isAnimating) {
      if (mounted && _content != null) {
        setState(() => _content = null);
      }
      return;
    }
    unawaited(_moveToClosed());
  }

  @override
  void bindInteractiveSession({
    required Channel? channel,
    required DmConversation? dm,
  }) {
    if (channel == null && dm == null) {
      return;
    }
    _interactiveDragActive = true;
    unawaited(
      ref
          .read(channelDetailsDrawerProvider.notifier)
          .open(channel: channel, dm: dm),
    );
    _content = ref.read(channelDetailsDrawerProvider);
    _translateController.value = 0;
  }

  @override
  void onDragStart() {
    _translateController.stop();
  }

  @override
  void onDragUpdate(double delta) {
    _applyDragDelta(delta);
  }

  @override
  Future<void> onDragEnd(DragEndDetails details) async {
    await _onApplyTranslation(details);
  }

  void _applyDragDelta(double delta) {
    if (!mounted) {
      return;
    }
    final double width = _screenWidth(context);
    if (width <= 0) {
      return;
    }
    _translateController.value = applyHorizontalRevealDrag(
      edge: HorizontalRevealEdge.right,
      translate: _translateController.value,
      deltaDx: delta,
      min: 0,
      max: width,
    );
  }

  Future<void> _onApplyTranslation(DragEndDetails details) async {
    if (!mounted) {
      return;
    }
    final double width = _screenWidth(context);
    if (width <= 0) {
      return;
    }
    final bool shouldStayOpen = horizontalRevealShouldOpen(
      edge: HorizontalRevealEdge.right,
      translate: _translateController.value,
      maxExtent: width,
      primaryVelocity: details.primaryVelocity ?? 0,
      completionThreshold: horizontalSwipeCompletionThreshold(),
    );
    setState(() => _interactiveDragActive = false);
    if (shouldStayOpen) {
      await _moveToOpen();
      return;
    }
    _dismissDrawer();
  }

  void _dismissDrawer([ChannelDetailsJumpRequest? result]) {
    ref.read(channelDetailsDrawerProvider.notifier).close(result);
  }

  bool _shouldDeferDrawerGesture(PointerDownEvent event) {
    return isPointerOverShellHorizontalGestureBlock(
      context,
      event.position,
      viewId: event.viewId,
    );
  }

  Map<Type, GestureRecognizerFactory> _drawerGestures() {
    return horizontalRevealDragGestures(
      translateController: _translateController,
      edge: HorizontalRevealEdge.right,
      shouldDefer: _shouldDeferDrawerGesture,
      onDragUpdate: _applyDragDelta,
      onDragEnd: (DragEndDetails details) {
        unawaited(_onApplyTranslation(details));
      },
    );
  }

  Widget _buildSlidingPanel({
    required BuildContext context,
    required Widget panelChild,
  }) {
    return AnimatedBuilder(
      animation: _translateController,
      child: RepaintBoundary(
        child: Material(
          key: kChannelDetailsDrawerPanelKey,
          color: context.colors.backgroundPrimary,
          child: panelChild,
        ),
      ),
      builder: (BuildContext context, Widget? slider) {
        final double width = _screenWidth(context);
        if (width <= 0) {
          return const SizedBox.shrink();
        }
        final double translate = _translateController.value.clamp(0.0, width);
        final double progress = (translate / width).clamp(0.0, 1.0);
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            if (progress > 0)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                excludeFromSemantics: true,
                onTap: _dismissDrawer,
                child: ColoredBox(
                  color: Color.fromRGBO(
                    0,
                    0,
                    0,
                    kDrawerPeekInactiveScrimOpacity * progress,
                  ),
                ),
              ),
            Transform.translate(
              offset: Offset(width - translate, 0),
              child: SizedBox(width: width, child: slider),
            ),
          ],
        );
      },
    );
  }

  Channel? _liveChannel(Channel? opened) {
    if (opened == null) {
      return null;
    }
    return ref.watch(channelByIdProvider(opened.id)).value ?? opened;
  }

  DmConversation? _liveDm(DmConversation? opened) {
    if (opened == null) {
      return null;
    }
    return findDmById(
          ref.watch(dmViewModelProvider.select((s) => s.conversations)),
          opened.id,
        ) ??
        opened;
  }

  @override
  Widget build(BuildContext context) {
    final ChannelDetailsDrawerState? open = ref.watch(
      channelDetailsDrawerProvider,
    );
    ref.listen<ChannelDetailsDrawerState?>(channelDetailsDrawerProvider, (
      ChannelDetailsDrawerState? previous,
      ChannelDetailsDrawerState? next,
    ) {
      if (next != null && previous == null) {
        FocusManager.instance.primaryFocus?.unfocus();
        _content = next;
        if (!_interactiveDragActive && _translateController.value == 0) {
          unawaited(_moveToOpen());
        }
      } else if (next == null && previous != null) {
        _requestCloseAnimation();
      }
    });

    if (open != null) {
      _content = open;
    }
    final ChannelDetailsDrawerState? panel = open ?? _content;
    if (panel == null && _translateController.value == 0) {
      return const SizedBox.shrink();
    }

    final bool deferPanelToChatGestures = _interactiveDragActive;
    final Widget panelChild = panel == null
        ? const SizedBox.shrink()
        : ChannelDetailsSheet(
            channel: _liveChannel(panel.channel),
            dm: _liveDm(panel.dm),
            initialTab: panel.initialTab,
            openSearchImmediately: panel.openSearchImmediately,
            scrollController: _scrollController,
            close: _dismissDrawer,
            closeOnLeading: true,
            completeWithResult: _dismissDrawer,
          );

    return ChatSwipeToReplyScope(
      enabled: false,
      child: RawGestureDetector(
        excludeFromSemantics: true,
        behavior: HitTestBehavior.translucent,
        gestures: deferPanelToChatGestures ? const {} : _drawerGestures(),
        child: IgnorePointer(
          ignoring: deferPanelToChatGestures,
          child: SizedBox.expand(
            child: _buildSlidingPanel(context: context, panelChild: panelChild),
          ),
        ),
      ),
    );
  }
}
