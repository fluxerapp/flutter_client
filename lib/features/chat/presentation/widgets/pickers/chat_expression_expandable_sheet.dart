import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_scroll_physics.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';

const Key kChatExpressionSheetKey = kExpressionPanelShellGestureBlockKey;
const Key kChatExpressionSheetDragHandleKey = Key(
  'chat-expression-sheet-drag-handle',
);
const double kExpressionSheetContentDragSlop = 8;
final GlobalKey kChatExpressionSheetDragHeaderKey = GlobalKey(
  debugLabel: 'chat-expression-sheet-drag-header',
);

class ChatExpressionExpandableSheet extends ConsumerStatefulWidget {
  const ChatExpressionExpandableSheet({
    required this.collapsedHeight,
    required this.dragHandleHeight,
    required this.parentHeight,
    this.contentBuilder,
    super.key,
  });

  final double collapsedHeight;
  final double dragHandleHeight;
  final double parentHeight;
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
  double _expandedHeightCache = 0;
  bool? _dragWasPastCollapsed;
  bool _initialized = false;
  bool _isClosing = false;
  bool _searchExpandScheduled = false;
  bool _ignoreContentDrag = false;
  double _contentDragSlopAccumulated = 0;
  Timer? _closeTimer;

  @override
  void initState() {
    super.initState();
    _heightNotifier = ValueNotifier<double>(widget.collapsedHeight);
    _isDraggingNotifier = ValueNotifier<bool>(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _refreshExpandedHeight();
      updateExpandableSheetHeight(
        heightNotifier: _heightNotifier,
        nextHeight: widget.collapsedHeight,
      );
      _initialized = true;
    }
  }

  @override
  void didUpdateWidget(ChatExpressionExpandableSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    _refreshExpandedHeight();
    if (oldWidget.collapsedHeight != widget.collapsedHeight &&
        !_isExpanded &&
        (_height - oldWidget.collapsedHeight).abs() < 1) {
      updateExpandableSheetHeight(
        heightNotifier: _heightNotifier,
        nextHeight: widget.collapsedHeight,
      );
    }
  }

  @override
  void dispose() {
    _closeTimer?.cancel();
    _isDraggingNotifier.dispose();
    _heightNotifier.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  double get _height => _heightNotifier.value;

  double get _minHeight => widget.collapsedHeight;

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

  bool get _isExpanded => _height >= _expandedHeightCache - 1;

  bool get _isDocked => (_height - widget.collapsedHeight).abs() < 1;

  ExpandableSheetDragHandlers get _sheetDragHandlers {
    return ExpandableSheetDragHandlers(
      onVerticalDragStart: _onHeaderDragStart,
      onVerticalDragUpdate: _onHeaderDragUpdate,
      onVerticalDragEnd: _onHeaderDragEnd,
    );
  }

  void _refreshExpandedHeight() {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double totalExpanded = inlineExpressionPanelExpandedHeight(
      availableHeight: screenHeight * kInlineExpressionPanelMaxScreenFraction,
      screenHeight: screenHeight,
      keyboardInset: 0,
      topPadding: mediaQuery.viewPadding.top + kMobileChannelHeaderHeight,
      topMargin: context.layout.s2,
      viewPaddingBottom: mediaQuery.viewPadding.bottom,
    ).clamp(0, screenHeight * kInlineExpressionPanelMaxScreenFraction);
    _expandedHeightCache = (totalExpanded - widget.dragHandleHeight).clamp(
      widget.collapsedHeight,
      screenHeight,
    );
  }

  void _onSearchActivated() {
    if (_isExpanded || _searchExpandScheduled) {
      return;
    }
    _searchExpandScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchExpandScheduled = false;
      if (!mounted || _isExpanded) {
        return;
      }
      _refreshExpandedHeight();
      _snapToHeight(_expandedHeightCache);
    });
  }

  void _adjustSheetHeight(double deltaDy) {
    final double collapsed = _minHeight;
    final double expanded = _maxHeight;
    final double previousHeight = _height;
    final double nextHeight = (previousHeight - deltaDy).clamp(
      collapsed,
      expanded,
    );
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
    _adjustSheetHeight(details.delta.dy);
  }

  double _resolveHeaderDragVelocity(DragEndDetails details) {
    final double? primary = details.primaryVelocity;
    if (primary != null) {
      return primary;
    }
    return details.velocity.pixelsPerSecond.dy;
  }

  void _onHeaderDragEnd(DragEndDetails details) {
    _snapFromVelocity(_resolveHeaderDragVelocity(details));
  }

  void _onContentPointerDown(PointerDownEvent event) {
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
    if (!_isExpanded && event.delta.dy < 0) {
      return;
    }
    if (!inlineExpressionPanelControllerIsAtTop(_scrollController)) {
      return;
    }
    if (event.delta.dy <= 0) {
      return;
    }
    _contentDragSlopAccumulated += event.delta.dy;
    if (_contentDragSlopAccumulated < kExpressionSheetContentDragSlop) {
      return;
    }
    _adjustSheetHeight(event.delta.dy);
  }

  void _onContentPointerEnd(PointerEvent event) {
    _contentDragSlopAccumulated = 0;
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
          anchorHeight: widget.collapsedHeight,
          expandedHeight: _expandedHeightCache,
        );
    switch (target) {
      case InlineExpressionPanelSnapTarget.close:
        _beginCloseAnimation();
      case InlineExpressionPanelSnapTarget.anchor:
        _snapToHeight(widget.collapsedHeight);
      case InlineExpressionPanelSnapTarget.expanded:
        _snapToHeight(_expandedHeightCache);
    }
  }

  void _snapToHeight(double target) {
    final double clampedTarget = target.clamp(_minHeight, _maxHeight);
    updateExpandableSheetHeight(
      heightNotifier: _heightNotifier,
      nextHeight: clampedTarget,
    );
    _isDraggingNotifier.value = false;
    _resetDragHaptics();
    if (clampedTarget <= widget.collapsedHeight + 1) {
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

  void _beginCloseAnimation() {
    _closeTimer?.cancel();
    updateExpandableSheetHeight(heightNotifier: _heightNotifier, nextHeight: 0);
    _isDraggingNotifier.value = false;
    setState(() {
      _isClosing = true;
    });
    _resetDragHaptics();
    playExpandableSheetDismissHaptic();
    _closeTimer = Timer(
      expandableSheetSnapDuration(context, isDragging: false),
      () {
        if (!mounted) {
          return;
        }
        setState(() => _isClosing = false);
        ref.read(expressionPanelProvider.notifier).close();
      },
    );
  }

  void _closePanel() {
    _beginCloseAnimation();
  }

  void _snapToDockedIfNeeded() {
    if (!_isDocked) {
      _snapToHeight(widget.collapsedHeight);
    }
  }

  void _onEmojiSelect(String name, String surrogates) {
    ref.read(pendingEmojiInsertProvider.notifier).emit(name, surrogates);
    _snapToDockedIfNeeded();
  }

  void _onGifSelect(FluxerSelectedGif selection) {
    ref.read(pendingGifSelectionProvider.notifier).emit(selection);
    _snapToDockedIfNeeded();
  }

  void _onStickerSelect(StickerEntry selection) {
    ref.read(pendingStickerSelectionProvider.notifier).emit(selection);
    _snapToDockedIfNeeded();
  }

  void _onFavoriteMemeSelect(FavoriteMemeSelection selection) {
    ref.read(pendingFavoriteMemeSelectionProvider.notifier).emit(selection);
    _snapToDockedIfNeeded();
  }

  @visibleForTesting
  void closeForTest() {
    _beginCloseAnimation();
  }

  @visibleForTesting
  void onEmojiSelectForTest(String name, String surrogates) {
    _onEmojiSelect(name, surrogates);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.parentHeight <= 0 || widget.collapsedHeight <= 0) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    final double homeIndicatorInset = inlineExpressionPanelHomeIndicatorInset(
      MediaQuery.of(context),
    );
    final Widget sheetBody = ExpandableSheetHeightBuilder(
      heightNotifier: _heightNotifier,
      isDraggingNotifier: _isDraggingNotifier,
      sizeBuilder:
          (
            BuildContext context,
            double height,
            bool isDragging,
            Widget shellChild,
          ) {
            return expandableSheetAnimatedSize(
              context: context,
              isDragging: isDragging,
              height: _totalHeightFor(height),
              child: ClipRect(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundSecondary,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 12,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: height <= 0 || _isClosing
                        ? const SizedBox.shrink()
                        : Column(
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
                                    child: FluxerBottomSheetDragHandle(
                                      includeTopPadding: false,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: shellChild),
                            ],
                          ),
                  ),
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
          sheetDragHandlers: _sheetDragHandlers,
          onEmojiSelect: _onEmojiSelect,
          onGifSelect: _onGifSelect,
          onStickerSelect: _onStickerSelect,
          onFavoriteMemeSelect: _onFavoriteMemeSelect,
          contentBuilder: widget.contentBuilder,
        ),
      ),
    );
    if (homeIndicatorInset <= 0) {
      return ColoredBox(
        key: kChatExpressionSheetKey,
        color: colors.backgroundSecondary,
        child: sheetBody,
      );
    }
    return Column(
      key: kChatExpressionSheetKey,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        sheetBody,
        ColoredBox(
          color: colors.backgroundSecondary,
          child: SizedBox(height: homeIndicatorInset),
        ),
      ],
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
    required this.sheetDragHandlers,
    required this.onEmojiSelect,
    required this.onGifSelect,
    required this.onStickerSelect,
    required this.onFavoriteMemeSelect,
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
  final ExpandableSheetDragHandlers sheetDragHandlers;
  final void Function(String name, String surrogates) onEmojiSelect;
  final ValueChanged<FluxerSelectedGif> onGifSelect;
  final ValueChanged<StickerEntry> onStickerSelect;
  final ValueChanged<FavoriteMemeSelection> onFavoriteMemeSelect;
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )?
  contentBuilder;

  @override
  State<_ExpressionSheetBody> createState() => _ExpressionSheetBodyState();
}

class _ExpressionSheetBodyState extends State<_ExpressionSheetBody> {
  late final ScrollPhysics _dockedScrollPhysics;
  late final ScrollPhysics _expandedScrollPhysics;
  late ScrollPhysics _scrollPhysics;
  late bool _isSheetExpanded;

  @override
  void initState() {
    super.initState();
    _dockedScrollPhysics = inlineExpressionPanelContentScrollPhysics(
      isSheetExpanded: false,
    );
    _expandedScrollPhysics = inlineExpressionPanelContentScrollPhysics(
      isSheetExpanded: true,
    );
    _isSheetExpanded = _isExpandedHeight(widget.heightNotifier.value);
    _scrollPhysics = _isSheetExpanded
        ? _expandedScrollPhysics
        : _dockedScrollPhysics;
    widget.heightNotifier.addListener(_onHeightChanged);
  }

  @override
  void didUpdateWidget(_ExpressionSheetBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expandedHeight != widget.expandedHeight) {
      final double height = widget.heightNotifier.value;
      final bool nextExpanded = _isExpandedHeight(height);
      if (nextExpanded != _isSheetExpanded) {
        setState(() {
          _isSheetExpanded = nextExpanded;
          _scrollPhysics = nextExpanded
              ? _expandedScrollPhysics
              : _dockedScrollPhysics;
        });
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
    setState(() {
      _isSheetExpanded = nextExpanded;
      _scrollPhysics = nextExpanded
          ? _expandedScrollPhysics
          : _dockedScrollPhysics;
    });
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
        behavior: ScrollConfiguration.of(
          context,
        ).copyWith(physics: _scrollPhysics),
        child: RepaintBoundary(
          child:
              widget.contentBuilder?.call(context, widget.scrollController) ??
              ExpressionPanelContent(
                scrollController: widget.scrollController,
                onClose: widget.onClose,
                onSearchActivated: widget.onSearchActivated,
                sheetDragHandlers: widget.sheetDragHandlers,
                onEmojiSelect: widget.onEmojiSelect,
                onGifSelect: widget.onGifSelect,
                onStickerSelect: widget.onStickerSelect,
                onFavoriteMemeSelect: widget.onFavoriteMemeSelect,
              ),
        ),
      ),
    );
  }
}
