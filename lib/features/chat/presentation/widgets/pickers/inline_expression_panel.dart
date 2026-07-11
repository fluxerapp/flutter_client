import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_search_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_drag.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const double kCollapsedPanelHeight = kInlineExpressionPanelCollapsedHeight;

const _kInlineSearchHorizontalPadding = 16.0;
const _kInlineSearchTopPadding = 8.0;
const _kInlineSearchBottomPadding = 8.0;

class InlineExpressionPanel extends StatefulWidget {
  const InlineExpressionPanel({
    required this.onClose,
    this.onEmojiSelect,
    this.onGifSelect,
    this.onStickerSelect,
    this.onFavoriteMemeSelect,
    super.key,
  });

  final VoidCallback onClose;
  final void Function(String name, String surrogates)? onEmojiSelect;
  final ValueChanged<FluxerSelectedGif>? onGifSelect;
  final ValueChanged<StickerEntry>? onStickerSelect;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelect;

  @override
  State<InlineExpressionPanel> createState() => _InlineExpressionPanelState();
}

class _InlineExpressionPanelState extends State<InlineExpressionPanel>
    with TickerProviderStateMixin {
  final ValueNotifier<double> _panelHeightNotifier = ValueNotifier(
    kCollapsedPanelHeight,
  );
  double get _panelHeight => _panelHeightNotifier.value;
  double _expandedHeight = kCollapsedPanelHeight;
  bool _isExpanded = false;

  bool _isDraggingViaScroll = false;

  late final AnimationController _entryController;
  late final Animation<double> _entrySlide;
  AnimationController? _snapController;
  late Animation<double> _snapAnimation;

  @override
  void initState() {
    super.initState();
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _entrySlide = CurvedAnimation(
      parent: _entryController,
      curve: Curves.easeOut,
    );
    unawaited(_entryController.forward());
  }

  @override
  void dispose() {
    _entryController.dispose();
    _snapController?.dispose();
    _panelHeightNotifier.dispose();
    super.dispose();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _snapController?.stop();
    _setPanelHeight(
      inlineExpressionPanelHeightAfterDrag(
        currentHeight: _panelHeight,
        deltaDy: details.delta.dy,
        minHeight: kCollapsedPanelHeight * 0.5,
        maxHeight: _expandedHeight,
      ),
    );
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _snapFromVelocity(details.primaryVelocity ?? 0);
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (!_isExpanded && notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;
      if (delta > 0) {
        _isDraggingViaScroll = true;
        _snapController?.stop();
        _setPanelHeight(
          inlineExpressionPanelHeightAfterScrollExpansion(
            currentHeight: _panelHeight,
            scrollDelta: delta,
            minHeight: kCollapsedPanelHeight,
            maxHeight: _expandedHeight,
          ),
        );
        return true;
      }
    }

    if (!_isExpanded && notification is OverscrollNotification) {
      final delta = notification.overscroll;
      if (delta > 0) {
        _isDraggingViaScroll = true;
        _snapController?.stop();
        _setPanelHeight(
          inlineExpressionPanelHeightAfterScrollExpansion(
            currentHeight: _panelHeight,
            scrollDelta: delta,
            minHeight: kCollapsedPanelHeight,
            maxHeight: _expandedHeight,
          ),
        );
        return true;
      }
    }

    if (notification is OverscrollNotification &&
        inlineExpressionPanelShouldHandleTopOverscroll(
          pixels: notification.metrics.pixels,
          minScrollExtent: notification.metrics.minScrollExtent,
          overscroll: notification.overscroll,
        )) {
      final delta = notification.overscroll;
      _isDraggingViaScroll = true;
      _snapController?.stop();
      _setPanelHeight(
        inlineExpressionPanelHeightAfterTopOverscroll(
          currentHeight: _panelHeight,
          overscroll: delta,
          minHeight: kCollapsedPanelHeight * 0.5,
          maxHeight: _expandedHeight,
        ),
      );
      return true;
    }

    if (_isDraggingViaScroll &&
        !_isExpanded &&
        notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;
      if (delta < 0 &&
          notification.metrics.pixels <=
              notification.metrics.minScrollExtent + 0.5) {
        _setPanelHeight(
          inlineExpressionPanelHeightAfterTopOverscroll(
            currentHeight: _panelHeight,
            overscroll: delta,
            minHeight: kCollapsedPanelHeight * 0.5,
            maxHeight: _expandedHeight,
          ),
        );
        return true;
      }
    }

    if (notification is ScrollEndNotification && _isDraggingViaScroll) {
      _isDraggingViaScroll = false;
      _snapFromVelocity(0);
      return true;
    }

    return false;
  }

  void _setPanelHeight(double height) {
    final double clamped = height.clamp(
      kCollapsedPanelHeight * 0.5,
      _expandedHeight,
    );
    if (_panelHeightNotifier.value == clamped) {
      return;
    }
    _panelHeightNotifier.value = clamped;
    _isExpanded = clamped >= _expandedHeight - 1;
  }

  double _resolveExpandedHeight(
    BuildContext context,
    BoxConstraints constraints,
  ) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return inlineExpressionPanelExpandedHeight(
      availableHeight: constraints.maxHeight,
      screenHeight: mediaQuery.size.height,
      keyboardInset: mediaQuery.viewInsets.bottom,
      topPadding: mediaQuery.viewPadding.top,
      topMargin: context.layout.s2,
      viewPaddingBottom: mediaQuery.viewPadding.bottom,
    );
  }

  void _syncExpandedHeight(double expandedHeight) {
    _expandedHeight = expandedHeight;
    if (_panelHeightNotifier.value > expandedHeight) {
      _panelHeightNotifier.value = expandedHeight;
      _isExpanded = true;
    }
  }

  void _snapFromVelocity(double velocity) {
    final midpoint = (kCollapsedPanelHeight + _expandedHeight) / 2;

    double target;
    if (velocity < -300) {
      target = _expandedHeight;
    } else if (velocity > 300) {
      if (_panelHeight <= kCollapsedPanelHeight * 0.9) {
        widget.onClose();
        return;
      }
      target = kCollapsedPanelHeight;
    } else if (_panelHeight < kCollapsedPanelHeight * 0.7) {
      widget.onClose();
      return;
    } else {
      target = _panelHeight >= midpoint
          ? _expandedHeight
          : kCollapsedPanelHeight;
    }

    _animateToHeight(target);
  }

  void _animateToHeight(double target) {
    final clampedTarget = target.clamp(0, _expandedHeight).toDouble();
    _snapController?.dispose();
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _snapAnimation =
        Tween(begin: _panelHeight, end: clampedTarget).animate(
          CurvedAnimation(parent: _snapController!, curve: Curves.easeOutCubic),
        )..addListener(() {
          final value = _snapAnimation.value;
          _panelHeightNotifier.value = value;
          _isExpanded = value >= _expandedHeight - 1;
        });
    unawaited(_snapController!.forward());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final panelBody = GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      onVerticalDragEnd: _onVerticalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          children: [
            FluxerBottomSheetDragHandle(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              includeTopPadding: false,
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: _onScrollNotification,
                child: RepaintBoundary(
                  child: _ExpressionPanelContent(
                    onClose: widget.onClose,
                    onEmojiSelect: (name, surrogates) {
                      widget.onEmojiSelect?.call(name, surrogates);
                      if (_isExpanded) {
                        _animateToHeight(kCollapsedPanelHeight);
                      }
                    },
                    onGifSelect: widget.onGifSelect,
                    onStickerSelect: widget.onStickerSelect,
                    onFavoriteMemeSelect: widget.onFavoriteMemeSelect,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final double expandedHeight = _resolveExpandedHeight(
          context,
          constraints,
        );
        _syncExpandedHeight(expandedHeight);

        return SlideTransition(
          position: _entrySlide.drive(
            Tween(begin: const Offset(0, 1), end: Offset.zero),
          ),
          child: ValueListenableBuilder<double>(
            valueListenable: _panelHeightNotifier,
            builder: (context, height, child) {
              final clamped = height.clamp(0.0, expandedHeight);
              return SizedBox(height: clamped, child: child);
            },
            child: panelBody,
          ),
        );
      },
    );
  }
}

class _ExpressionPanelContent extends ConsumerStatefulWidget {
  const _ExpressionPanelContent({
    required this.onClose,
    this.onEmojiSelect,
    this.onGifSelect,
    this.onStickerSelect,
    this.onFavoriteMemeSelect,
  });

  final VoidCallback onClose;
  final void Function(String name, String surrogates)? onEmojiSelect;
  final ValueChanged<FluxerSelectedGif>? onGifSelect;
  final ValueChanged<StickerEntry>? onStickerSelect;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelect;

  @override
  ConsumerState<_ExpressionPanelContent> createState() =>
      _ExpressionPanelContentState();
}

class _ExpressionPanelContentState
    extends ConsumerState<_ExpressionPanelContent> {
  static const _kSearchDebounce = Duration(milliseconds: 120);

  ExpressionPickerTab _selectedTab = ExpressionPickerTab.emojis;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _searchDebounce;

  static const List<ExpressionPickerTab> _kVisibleTabs = [
    ExpressionPickerTab.gifs,
    ExpressionPickerTab.memes,
    ExpressionPickerTab.stickers,
    ExpressionPickerTab.emojis,
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final next = _searchController.text;
    if (next.isEmpty) {
      _searchDebounce?.cancel();
      if (_searchQuery.isNotEmpty) {
        setState(() => _searchQuery = '');
      }
      return;
    }
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kSearchDebounce, () {
      if (!mounted) {
        return;
      }
      setState(() => _searchQuery = _searchController.text);
    });
  }

  String _tabLabel(ExpressionPickerTab tab) =>
      expressionTabLabel(tab, FluxerLocalizations.of(context));

  @override
  Widget build(BuildContext context) {
    final skinTone = ref.watch(emojiSkinToneProvider).value ?? '';
    final channelId = ref.watch(
      chatViewModelProvider.select((state) => state.channelId),
    );

    return Column(
      children: [
        _buildSegmentedTabs(context),
        if (_selectedTab == ExpressionPickerTab.emojis)
          EmojiSearchBar(
            controller: _searchController,
            skinTone: skinTone,
            onSkinToneChanged: (t) =>
                unawaited(ref.read(emojiSkinToneProvider.notifier).set(t)),
            horizontalPadding: _kInlineSearchHorizontalPadding,
          ),
        Expanded(
          child: ExpressionPicker(
            onClose: widget.onClose,
            onEmojiSelect: widget.onEmojiSelect,
            onGifSelect: widget.onGifSelect,
            onStickerSelect: widget.onStickerSelect,
            onFavoriteMemeSelect: widget.onFavoriteMemeSelect,
            onTabChanged: (tab) => setState(() => _selectedTab = tab),
            initialTab: _selectedTab,
            showTabs: false,
            searchController: _searchController,
            searchQuery: _searchQuery,
            skinTone: skinTone,
            channelId: channelId,
            contentSearchHorizontalPadding: _kInlineSearchHorizontalPadding,
            contentSearchTopPadding: _kInlineSearchTopPadding,
            contentSearchBottomPadding: _kInlineSearchBottomPadding,
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentedTabs(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: _kVisibleTabs.map((tab) {
              final isActive = tab == _selectedTab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTab = tab),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? colors.backgroundSecondary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isActive
                          ? const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.08),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                    child: Text(
                      _tabLabel(tab),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 18 / 14,
                        color: isActive
                            ? colors.textPrimary
                            : colors.textSecondary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
