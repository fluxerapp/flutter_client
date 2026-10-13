import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_segmented_tabs.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:fluxer_app/features/chat/utils/composer/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/inline_expression_panel_scroll_physics.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';

const Key kChatExpressionSheetKey = kExpressionPanelShellGestureBlockKey;
const Key kChatExpressionSheetDragHandleKey = Key(
  'chat-expression-sheet-drag-handle',
);
const double kExpressionSheetContentDragSlop = 8;
const double kExpressionPanelMinContentHeight = 1;
const double kExpressionSheetCornerRadius = 14;
const double kExpressionSheetRubberBandLimit = 60;
const double kExpressionSheetRubberBandSpan = 150;
const double kExpressionSheetScrimOpacity = 0.5;
final GlobalKey kChatExpressionSheetDragHeaderKey = GlobalKey(
  debugLabel: 'chat-expression-sheet-drag-header',
);

double expressionSheetRubberBandOffset(double overshoot) {
  if (overshoot <= 0) {
    return 0;
  }
  return kExpressionSheetRubberBandLimit *
      (1 - 1 / (overshoot / kExpressionSheetRubberBandSpan + 1));
}

class ChatExpressionExpandableSheet extends ConsumerStatefulWidget {
  const ChatExpressionExpandableSheet({
    required this.collapsedHeight,
    required this.dragHandleHeight,
    this.contentBuilder,
    super.key,
  });

  final double collapsedHeight;
  final double dragHandleHeight;
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )?
  contentBuilder;

  @override
  ConsumerState<ChatExpressionExpandableSheet> createState() =>
      ChatExpressionExpandableSheetState();
}

class ChatExpressionExpandableSheetState
    extends ConsumerState<ChatExpressionExpandableSheet> {
  final ScrollController _scrollController = ScrollController();
  final VelocityTracker _contentVelocityTracker = VelocityTracker.withKind(
    PointerDeviceKind.touch,
  );
  final VelocityTracker _headerVelocityTracker = VelocityTracker.withKind(
    PointerDeviceKind.touch,
  );
  late final ValueNotifier<double> _heightNotifier;
  late final ValueNotifier<bool> _isDraggingNotifier;
  late final FocusNode _searchFocusNode;
  double _expandedHeightCache = 0;
  double? _lockedCollapsedHeight;
  double? _dragVirtualHeight;
  Curve _snapCurve = kComposerPanelMotionCurve;
  final OverlayPortalController _scrimController = OverlayPortalController();
  bool? _dragWasPastCollapsed;
  bool _initialized = false;
  bool _isClosing = false;
  double? _closingContentHeight;
  BottomInputSlot? _closingSlot;
  ComposerPanelClosing? _closingPanel;
  bool _isSearchFocused = false;
  bool _searchExpandScheduled = false;
  bool _suppressSearchExpand = false;
  bool _ignoreContentDrag = false;
  bool _dragDismissedKeyboard = false;
  double _contentDragSlopAccumulated = 0;
  Timer? _closeTimer;
  int _lastHandledDismissRequest = 0;

  @override
  void initState() {
    super.initState();
    _heightNotifier = ValueNotifier<double>(0);
    _isDraggingNotifier = ValueNotifier<bool>(false);
    _searchFocusNode = FocusNode();
    _searchFocusNode.addListener(_onSearchFocusChanged);
    _scrimController.show();
  }

  double _effectiveCollapsedHeight(double collapsedHeight) {
    return math.max(collapsedHeight, kExpressionPanelMinContentHeight);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _refreshExpandedHeight();
      final double target = _effectiveCollapsedHeight(widget.collapsedHeight);
      final MobileKeyboardMetricsState metrics = ref.read(
        mobileKeyboardMetricsProvider,
      );
      final BottomInputTransition transition = ref.read(
        bottomInputSlotProvider.select(
          (BottomInputSlotState state) => state.transition,
        ),
      );
      final bool shouldAnimateOpen =
          !metrics.isKeyboardVisible &&
          transition == BottomInputTransition.idle &&
          target > widget.dragHandleHeight;
      if (shouldAnimateOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          _snapToHeight(target);
        });
      } else {
        updateExpandableSheetHeight(
          heightNotifier: _heightNotifier,
          nextHeight: target,
        );
      }
      _initialized = true;
    }
  }

  @override
  void didUpdateWidget(ChatExpressionExpandableSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.contentBuilder == null) != (widget.contentBuilder == null) &&
        _scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    _refreshExpandedHeight();
    if (_isSearchFocused || _isExpanded) {
      return;
    }
    final double nextCollapsed = _effectiveCollapsedHeight(
      widget.collapsedHeight,
    );
    if (oldWidget.collapsedHeight != widget.collapsedHeight &&
        (_height - _effectiveCollapsedHeight(oldWidget.collapsedHeight)).abs() <
            1) {
      updateExpandableSheetHeight(
        heightNotifier: _heightNotifier,
        nextHeight: nextCollapsed,
      );
    }
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    if (_isClosing) {
      _closingSlot?.clearHeldSlotHeight();
      _closingPanel?.reset();
    }
    _searchFocusNode
      ..removeListener(_onSearchFocusChanged)
      ..dispose();
    _isDraggingNotifier.dispose();
    _heightNotifier.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchFocusChanged() {
    final bool hasFocus = _searchFocusNode.hasFocus;
    if (hasFocus == _isSearchFocused) {
      return;
    }
    if (hasFocus) {
      _suppressSearchExpand = false;
      _lockedCollapsedHeight ??= _height;
    } else {
      _lockedCollapsedHeight = null;
    }
    setState(() => _isSearchFocused = hasFocus);
  }

  double get _height => _heightNotifier.value;

  double get _minHeight =>
      _lockedCollapsedHeight ??
      _effectiveCollapsedHeight(widget.collapsedHeight);

  double get _maxHeight => _expandedHeightCache;

  double _totalHeightFor(double contentHeight) {
    if (contentHeight <= 0) {
      return 0;
    }
    return inlineExpressionPanelDockedTotalHeight(
      contentHeight: contentHeight,
      dragHandleHeight: widget.dragHandleHeight,
    );
  }

  bool get _isExpanded {
    if (_expandedHeightCache <= _minHeight + 1) {
      return false;
    }
    return _height >= _expandedHeightCache - 1;
  }

  ExpandableSheetDragHandlers get _sheetDragHandlers {
    return ExpandableSheetDragHandlers(
      onVerticalDragStart: _onHeaderDragStart,
      onVerticalDragUpdate: _onHeaderDragUpdate,
      onVerticalDragEnd: _onHeaderDragEnd,
      expand: _expandForBrowse,
    );
  }

  void _expandForBrowse() {
    _refreshExpandedHeight();
    if (_isExpanded) {
      return;
    }
    _snapToHeight(_expandedHeightCache);
  }

  void _refreshExpandedHeight() {
    final MediaQueryData mediaQuery = MediaQueryData.fromView(View.of(context));
    final double screenHeight = mediaQuery.size.height;
    final double totalExpanded = inlineExpressionPanelExpandedHeight(
      availableHeight: screenHeight,
      screenHeight: screenHeight,
      keyboardInset: 0,
      topPadding: mediaQuery.viewPadding.top + kExpressionSheetTopInset,
      topMargin: 0,
      viewPaddingBottom: mediaQuery.viewPadding.bottom,
    );
    _expandedHeightCache = (totalExpanded - widget.dragHandleHeight).clamp(
      widget.collapsedHeight,
      screenHeight,
    );
  }

  void _onSearchActivated() {
    if (_suppressSearchExpand || _isExpanded || _searchExpandScheduled) {
      return;
    }
    _searchExpandScheduled = true;
    _lockedCollapsedHeight ??= _height;
    _refreshExpandedHeight();
    final bool keyboardVisible = ref.read(
      mobileKeyboardMetricsProvider.select(
        (MobileKeyboardMetricsState metrics) => metrics.isKeyboardVisible,
      ),
    );
    if (keyboardVisible) {
      _snapToHeightInstant(_expandedHeightCache);
    } else {
      _snapToHeight(_expandedHeightCache);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchExpandScheduled = false;
      if (!mounted ||
          _suppressSearchExpand ||
          !ref.read(expressionPanelProvider)) {
        return;
      }
      if (!_searchFocusNode.hasFocus) {
        _searchFocusNode.requestFocus();
      }
    });
  }

  void _snapToHeightInstant(double target) {
    _isDraggingNotifier.value = true;
    _snapToHeight(target);
    _isDraggingNotifier.value = false;
  }

  void _adjustSheetHeight(double deltaDy, {bool rubberBand = false}) {
    final double collapsed = _minHeight;
    final double expanded = _maxHeight;
    final double previousHeight = _height;
    final double virtualHeight =
        (_dragVirtualHeight ?? previousHeight) - deltaDy;
    _dragVirtualHeight = virtualHeight.clamp(
      rubberBand ? double.negativeInfinity : collapsed,
      expanded,
    );
    final double nextHeight = virtualHeight >= collapsed
        ? math.min(virtualHeight, expanded)
        : collapsed -
              expressionSheetRubberBandOffset(collapsed - virtualHeight);
    if (nextHeight == previousHeight && _isDraggingNotifier.value) {
      return;
    }
    if (!_isDraggingNotifier.value) {
      _isDraggingNotifier.value = true;
    }
    updateExpandableSheetHeight(
      heightNotifier: _heightNotifier,
      nextHeight: nextHeight,
    );
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

  void _onHeaderDragStart(DragStartDetails details) {
    _dragVirtualHeight = _height;
    _isDraggingNotifier.value = true;
    _headerVelocityTracker.addPosition(
      details.sourceTimeStamp ?? Duration.zero,
      details.globalPosition,
    );
  }

  void _onHeaderDragUpdate(DragUpdateDetails details) {
    _headerVelocityTracker.addPosition(
      details.sourceTimeStamp ?? Duration.zero,
      details.globalPosition,
    );
    if (_dragDismissedKeyboard) {
      return;
    }
    if (details.delta.dy > 0 && _searchFocusNode.hasFocus) {
      _dismissKeyboardForDrag();
      return;
    }
    _adjustSheetHeight(details.delta.dy, rubberBand: true);
  }

  void _dismissKeyboardForDrag() {
    _dragDismissedKeyboard = true;
    _searchFocusNode.unfocus();
  }

  bool _finishKeyboardDismissDrag() {
    if (!_dragDismissedKeyboard) {
      return false;
    }
    _dragDismissedKeyboard = false;
    _isDraggingNotifier.value = false;
    _resetDragHaptics();
    return true;
  }

  double _resolveHeaderDragVelocity(DragEndDetails details) {
    final double? primary = details.primaryVelocity;
    if (primary != null) {
      return primary;
    }
    return details.velocity.pixelsPerSecond.dy;
  }

  void _onHeaderDragEnd(DragEndDetails details) {
    if (_finishKeyboardDismissDrag()) {
      return;
    }
    _snapFromVelocity(_resolveHeaderDragVelocity(details));
  }

  void _onContentPointerDown(PointerDownEvent event) {
    _dragVirtualHeight = null;
    _contentVelocityTracker.addPosition(event.timeStamp, event.position);
    _contentDragSlopAccumulated = 0;
    _ignoreContentDrag = _isPointerOverEditable(event);
  }

  bool _isPointerOverEditable(PointerEvent event) {
    final HitTestResult result = HitTestResult();
    WidgetsBinding.instance.hitTestInView(result, event.position, event.viewId);
    for (final HitTestEntry entry in result.path) {
      if (entry.target is RenderEditable) {
        return true;
      }
    }
    return false;
  }

  void _onContentPointerMove(PointerMoveEvent event) {
    if (_ignoreContentDrag) {
      return;
    }
    _contentVelocityTracker.addPosition(event.timeStamp, event.position);
    if (!inlineExpressionPanelControllerIsAtTop(_scrollController)) {
      return;
    }
    final double deltaDy = event.delta.dy;
    if (_dragDismissedKeyboard) {
      return;
    }
    if (deltaDy > 0 && _searchFocusNode.hasFocus) {
      _contentDragSlopAccumulated += deltaDy;
      if (_contentDragSlopAccumulated >= kExpressionSheetContentDragSlop) {
        _dismissKeyboardForDrag();
      }
      return;
    }
    if (deltaDy > 0 && _height <= _minHeight + 1) {
      return;
    }
    if (deltaDy < 0 && _height >= _maxHeight - 1) {
      return;
    }
    if (deltaDy == 0) {
      return;
    }
    _contentDragSlopAccumulated += deltaDy.abs();
    if (_contentDragSlopAccumulated < kExpressionSheetContentDragSlop) {
      return;
    }
    _adjustSheetHeight(deltaDy);
  }

  void _onContentPointerEnd(PointerEvent event) {
    _contentDragSlopAccumulated = 0;
    if (_finishKeyboardDismissDrag()) {
      _ignoreContentDrag = false;
      return;
    }
    if (_ignoreContentDrag) {
      _ignoreContentDrag = false;
      return;
    }
    if (!_isDraggingNotifier.value) {
      return;
    }
    final double velocity = _contentVelocityTracker
        .getVelocity()
        .pixelsPerSecond
        .dy;
    _snapFromVelocity(velocity);
  }

  void _snapFromVelocity(double velocity) {
    final InlineExpressionPanelSnapTarget target =
        inlineExpressionPanelSnapTarget(
          currentHeight: _height,
          velocity: velocity,
          anchorHeight: _minHeight,
          expandedHeight: _expandedHeightCache,
        );
    switch (target) {
      case InlineExpressionPanelSnapTarget.close:
        _beginCloseAnimation();
      case InlineExpressionPanelSnapTarget.anchor:
        _snapToHeight(_minHeight, releaseVelocity: velocity);
      case InlineExpressionPanelSnapTarget.expanded:
        _snapToHeight(_expandedHeightCache, releaseVelocity: velocity);
    }
  }

  void _snapToHeight(double target, {double releaseVelocity = 0}) {
    _dragVirtualHeight = null;
    final double clampedTarget = target.clamp(_minHeight, _maxHeight);
    _snapCurve = _height < _minHeight
        ? kComposerPanelMotionCurve
        : ComposerPanelSpringCurve.fromRelease(
            fromHeight: _height,
            toHeight: clampedTarget,
            heightVelocity: -releaseVelocity,
          );
    updateExpandableSheetHeight(
      heightNotifier: _heightNotifier,
      nextHeight: clampedTarget,
    );
    _isDraggingNotifier.value = false;
    _resetDragHaptics();
    if (clampedTarget <= _minHeight + 1) {
      ref
          .read(bottomInputSlotProvider.notifier)
          .settlePanelHeight(
            inlineExpressionPanelDockedTotalHeight(
              contentHeight: clampedTarget,
              dragHandleHeight: widget.dragHandleHeight,
            ),
          );
    }
  }

  void _beginCloseAnimation({bool playDismissHaptic = true}) {
    if (_isClosing) {
      return;
    }
    _closeTimer?.cancel();

    final double startContentHeight = _height;
    final BottomInputSlotState slot = ref.read(bottomInputSlotProvider);
    final double animateSlotFrom = slot.slotHeight > 0
        ? slot.slotHeight
        : _totalHeightFor(startContentHeight);
    _closingContentHeight = _minHeight;
    if (animateSlotFrom > 0) {
      ref
          .read(bottomInputSlotProvider.notifier)
          .holdSlotHeight(
            slot.transition == BottomInputTransition.lockingToKeyboard
                ? animateSlotFrom
                : bottomInputKeyboardSpacerHeight(
                    slotHeight: 0,
                    homeIndicatorInset: bottomInputHomeIndicatorInset(
                      MediaQuery.of(context),
                    ),
                  ),
          );
    }

    final ComposerPanelClosing closingPanel = ref.read(
      composerPanelClosingProvider.notifier,
    );
    _closingSlot = ref.read(bottomInputSlotProvider.notifier);
    _closingPanel = closingPanel;
    closingPanel.start();
    _snapCurve = kComposerPanelMotionCurve;
    updateExpandableSheetHeight(heightNotifier: _heightNotifier, nextHeight: 0);
    _isDraggingNotifier.value = false;
    setState(() {
      _isClosing = true;
    });
    _resetDragHaptics();
    if (playDismissHaptic) {
      playExpandableSheetDismissHaptic();
    }

    final Duration duration = composerPanelMotionDuration(context);
    if (duration == Duration.zero) {
      _completeCloseAnimation();
      return;
    }

    _closeTimer = Timer(duration, () {
      if (!mounted) {
        return;
      }
      _completeCloseAnimation();
    });
  }

  void _completeCloseAnimation() {
    _closeTimer?.cancel();
    _closeTimer = null;
    if (!mounted) {
      return;
    }
    setState(() {
      _isClosing = false;
      _closingContentHeight = null;
    });
    ref.read(bottomInputSlotProvider.notifier).clearHeldSlotHeight();
    ref.read(composerPanelClosingProvider.notifier).reset();
    _closingSlot = null;
    _closingPanel = null;
    ref.read(expressionPanelProvider.notifier).close();
    ref.read(attachmentPanelProvider.notifier).close();
  }

  void _closePanel() {
    _beginCloseAnimation();
  }

  void _snapToDockedIfNeeded() {
    _suppressSearchExpand = true;
    _searchExpandScheduled = false;
    if (_searchFocusNode.hasFocus) {
      _searchFocusNode.unfocus();
    }
    _lockedCollapsedHeight = null;
    if ((_height - _minHeight).abs() >= 1) {
      _snapToHeight(_minHeight);
    }
  }

  void _onEmojiSelect(String name, String surrogates) {
    ref.read(pendingEmojiInsertProvider.notifier).emit(name, surrogates);
    _snapToDockedIfNeeded();
  }

  void _onGifSelect(FluxerSelectedGif selection) {
    ref.read(pendingGifSelectionProvider.notifier).setSelection(selection);
    _snapToDockedIfNeeded();
  }

  void _onStickerSelect(StickerEntry selection) {
    ref.read(pendingStickerSelectionProvider.notifier).setSelection(selection);
    _snapToDockedIfNeeded();
  }

  void _onFavoriteMemeSelect(FavoriteMemeSelection selection) {
    ref
        .read(pendingFavoriteMemeSelectionProvider.notifier)
        .setSelection(selection);
    _snapToDockedIfNeeded();
  }

  void _onBackspace() {
    ref.read(pendingComposerBackspaceProvider.notifier).request();
  }

  @visibleForTesting
  void closeForTest() {
    _beginCloseAnimation();
  }

  @visibleForTesting
  void onEmojiSelectForTest(String name, String surrogates) {
    _onEmojiSelect(name, surrogates);
  }

  @visibleForTesting
  void onSearchActivatedForTest() {
    _onSearchActivated();
  }

  @visibleForTesting
  FocusNode get searchFocusNodeForTest => _searchFocusNode;

  @visibleForTesting
  double get sheetContentHeightForTest => _heightNotifier.value;

  @override
  Widget build(BuildContext context) {
    ref
      ..watch(expressionPanelProvider)
      ..watch(attachmentPanelProvider)
      ..listen<int>(composerPanelDismissRequestProvider, (_, int next) {
        if (next <= _lastHandledDismissRequest || _isClosing) {
          return;
        }
        _lastHandledDismissRequest = next;
        if (!isComposerPanelOpen(
          expressionPanelOpen: ref.read(expressionPanelProvider),
          attachmentPanelOpen: ref.read(attachmentPanelProvider),
        )) {
          return;
        }
        _beginCloseAnimation(playDismissHaptic: false);
      });
    final Color sheetBackground = expressionSheetSurfaceColor(context);
    final double homeIndicatorInset = inlineExpressionPanelHomeIndicatorInset(
      MediaQuery.of(context),
    );
    final Widget sheetBody = ExpandableSheetHeightBuilder(
      heightNotifier: _heightNotifier,
      isDraggingNotifier: _isDraggingNotifier,
      sizeBuilder:
          (
            BuildContext context,
            double height, {
            required bool isDragging,
            required Widget child,
          }) {
            return expandableSheetAnimatedSize(
              context: context,
              isDragging: isDragging,
              composerPanelMotion: true,
              composerPanelCurve: _snapCurve,
              height: _totalHeightFor(height),
              decoration: BoxDecoration(
                color: sheetBackground,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(kExpressionSheetCornerRadius),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: IgnorePointer(
                ignoring: _isClosing,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double columnHeight = math.max(
                      constraints.maxHeight,
                      widget.dragHandleHeight,
                    );
                    return OverflowBox(
                      alignment: Alignment.topCenter,
                      minHeight: columnHeight,
                      maxHeight: columnHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ExpandableSheetDragTarget(
                            key: kChatExpressionSheetDragHeaderKey,
                            onVerticalDragStart: _onHeaderDragStart,
                            onVerticalDragUpdate: _onHeaderDragUpdate,
                            onVerticalDragEnd: _onHeaderDragEnd,
                            child: SizedBox(
                              key: kChatExpressionSheetDragHandleKey,
                              height: widget.dragHandleHeight,
                              width: double.infinity,
                              child: const IgnorePointer(
                                child: _ExpressionSheetHandle(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ClipRect(
                              child: OverflowBox(
                                alignment: Alignment.topCenter,
                                maxHeight: double.infinity,
                                child: SizedBox(
                                  height:
                                      _closingContentHeight ??
                                      math.max(height, _minHeight),
                                  width: double.infinity,
                                  child: child,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
      child: RepaintBoundary(
        child: _ExpressionSheetBody(
          heightNotifier: _heightNotifier,
          expandedHeight: _expandedHeightCache,
          scrollController: _scrollController,
          onContentPointerDown: _onContentPointerDown,
          onContentPointerMove: _onContentPointerMove,
          onContentPointerEnd: _onContentPointerEnd,
          onClose: _closePanel,
          onSearchActivated: _onSearchActivated,
          searchFocusNode: _searchFocusNode,
          sheetDragHandlers: _sheetDragHandlers,
          onEmojiSelect: _onEmojiSelect,
          onGifSelect: _onGifSelect,
          onStickerSelect: _onStickerSelect,
          onFavoriteMemeSelect: _onFavoriteMemeSelect,
          onBackspace: _onBackspace,
          contentBuilder: widget.contentBuilder,
        ),
      ),
    );
    return OverlayPortal(
      controller: _scrimController,
      overlayChildBuilder: _buildScrim,
      child: Column(
        key: kChatExpressionSheetKey,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          sheetBody,
          expandableSheetAnimatedSize(
            context: context,
            isDragging: false,
            composerPanelMotion: true,
            height: _isClosing ? 0 : homeIndicatorInset,
            decoration: BoxDecoration(color: sheetBackground),
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildScrim(BuildContext context) {
    return ExpandableSheetHeightBuilder(
      heightNotifier: _heightNotifier,
      isDraggingNotifier: _isDraggingNotifier,
      sizeBuilder:
          (
            BuildContext context,
            double height, {
            required bool isDragging,
            required Widget child,
          }) {
            final MediaQueryData mediaQuery = MediaQuery.of(context);
            final double span = _maxHeight - _minHeight;
            final double progress = _isClosing || span <= 1
                ? 0
                : ((height - _minHeight) / span).clamp(0.0, 1.0);
            final double sheetTop =
                mediaQuery.size.height -
                inlineExpressionPanelHomeIndicatorInset(mediaQuery) -
                _totalHeightFor(height);
            final Duration duration = isDragging
                ? Duration.zero
                : composerPanelMotionDuration(context);
            return Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: duration,
                  curve: _snapCurve,
                  left: 0,
                  right: 0,
                  top: 0,
                  height: math.max(0, sheetTop + kExpressionSheetCornerRadius),
                  child: ClipPath(
                    clipper: const _SheetCornerScrimClipper(),
                    child: IgnorePointer(
                      ignoring: progress <= 0,
                      child: FluxerGestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _snapToDockedIfNeeded,
                        child: AnimatedOpacity(
                          duration: duration,
                          curve: _snapCurve,
                          opacity: progress,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
      child: const ColoredBox(
        color: Color.fromRGBO(0, 0, 0, kExpressionSheetScrimOpacity),
      ),
    );
  }
}

class _SheetCornerScrimClipper extends CustomClipper<Path> {
  const _SheetCornerScrimClipper();

  @override
  Path getClip(Size size) {
    const double radius = kExpressionSheetCornerRadius;
    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      Path()..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(0, size.height - radius, size.width, size.height),
          topLeft: const Radius.circular(radius),
          topRight: const Radius.circular(radius),
        ),
      ),
    );
  }

  @override
  bool shouldReclip(_SheetCornerScrimClipper oldClipper) => false;
}

class _ExpressionSheetHandle extends StatelessWidget {
  const _ExpressionSheetHandle();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: kFluxerSheetHandleTop),
        child: FluxerSheetHandleBar(),
      ),
    );
  }
}

class _ExpressionSheetBody extends StatefulWidget {
  const _ExpressionSheetBody({
    required this.heightNotifier,
    required this.expandedHeight,
    required this.scrollController,
    required this.onContentPointerDown,
    required this.onContentPointerMove,
    required this.onContentPointerEnd,
    required this.onClose,
    required this.onSearchActivated,
    required this.searchFocusNode,
    required this.sheetDragHandlers,
    required this.onEmojiSelect,
    required this.onGifSelect,
    required this.onStickerSelect,
    required this.onFavoriteMemeSelect,
    required this.onBackspace,
    this.contentBuilder,
  });

  final ValueNotifier<double> heightNotifier;
  final double expandedHeight;
  final ScrollController scrollController;
  final void Function(PointerDownEvent event) onContentPointerDown;
  final void Function(PointerMoveEvent event) onContentPointerMove;
  final void Function(PointerEvent event) onContentPointerEnd;
  final VoidCallback onClose;
  final VoidCallback onSearchActivated;
  final FocusNode searchFocusNode;
  final ExpandableSheetDragHandlers sheetDragHandlers;
  final void Function(String name, String surrogates) onEmojiSelect;
  final ValueChanged<FluxerSelectedGif> onGifSelect;
  final ValueChanged<StickerEntry> onStickerSelect;
  final ValueChanged<FavoriteMemeSelection> onFavoriteMemeSelect;
  final VoidCallback onBackspace;
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )?
  contentBuilder;

  @override
  State<_ExpressionSheetBody> createState() => _ExpressionSheetBodyState();
}

class _ExpressionSheetBodyState extends State<_ExpressionSheetBody> {
  ScrollPhysics? _parentScrollPhysics;
  late ScrollPhysics _dockedScrollPhysics;
  late ScrollPhysics _expandedScrollPhysics;
  late bool _isSheetExpanded;

  @override
  void initState() {
    super.initState();
    _isSheetExpanded = _isExpandedHeight(widget.heightNotifier.value);
    widget.heightNotifier.addListener(_onHeightChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ScrollPhysics parent = ScrollConfiguration.of(
      context,
    ).getScrollPhysics(context);
    if (identical(parent, _parentScrollPhysics)) {
      return;
    }
    _parentScrollPhysics = parent;
    _dockedScrollPhysics = inlineExpressionPanelContentScrollPhysics(
      isSheetExpanded: false,
      parent: parent,
    );
    _expandedScrollPhysics = inlineExpressionPanelContentScrollPhysics(
      isSheetExpanded: true,
      parent: parent,
    );
  }

  @override
  void didUpdateWidget(_ExpressionSheetBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expandedHeight != widget.expandedHeight) {
      final double height = widget.heightNotifier.value;
      final bool nextExpanded = _isExpandedHeight(height);
      if (nextExpanded != _isSheetExpanded) {
        setState(() => _isSheetExpanded = nextExpanded);
      }
    }
  }

  @override
  void dispose() {
    widget.heightNotifier.removeListener(_onHeightChanged);
    super.dispose();
  }

  bool _isExpandedHeight(double height) {
    return height >= widget.expandedHeight - 1;
  }

  void _onHeightChanged() {
    final bool nextExpanded = _isExpandedHeight(widget.heightNotifier.value);
    if (nextExpanded == _isSheetExpanded) {
      return;
    }
    setState(() => _isSheetExpanded = nextExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: widget.onContentPointerDown,
      onPointerMove: widget.onContentPointerMove,
      onPointerUp: widget.onContentPointerEnd,
      onPointerCancel: widget.onContentPointerEnd,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          physics: _isSheetExpanded
              ? _expandedScrollPhysics
              : _dockedScrollPhysics,
        ),
        child: RepaintBoundary(
          child:
              widget.contentBuilder?.call(context, widget.scrollController) ??
              ExpressionPanelContent(
                scrollController: widget.scrollController,
                onClose: widget.onClose,
                onSearchActivated: widget.onSearchActivated,
                searchFocusNode: widget.searchFocusNode,
                sheetDragHandlers: widget.sheetDragHandlers,
                onEmojiSelect: widget.onEmojiSelect,
                onGifSelect: widget.onGifSelect,
                onStickerSelect: widget.onStickerSelect,
                onFavoriteMemeSelect: widget.onFavoriteMemeSelect,
                onBackspace: widget.onBackspace,
              ),
        ),
      ),
    );
  }
}
