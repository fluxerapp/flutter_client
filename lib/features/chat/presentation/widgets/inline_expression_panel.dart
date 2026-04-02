import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/emoji_search_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/expression_picker.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const kCollapsedPanelHeight = 350.0;

const _kDragHandleHeight = 28.0;
const _kExpandedFraction = 0.85;

class InlineExpressionPanel extends StatefulWidget {
  const InlineExpressionPanel({
    required this.onClose,
    this.onEmojiSelect,
    super.key,
  });

  final VoidCallback onClose;
  final void Function(String name, String surrogates)? onEmojiSelect;

  @override
  State<InlineExpressionPanel> createState() => _InlineExpressionPanelState();
}

class _InlineExpressionPanelState extends State<InlineExpressionPanel>
    with TickerProviderStateMixin {
  double _panelHeight = kCollapsedPanelHeight;
  late double _expandedHeight;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _expandedHeight = MediaQuery.sizeOf(context).height * _kExpandedFraction;
  }

  @override
  void dispose() {
    _entryController.dispose();
    _snapController?.dispose();
    super.dispose();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _snapController?.stop();
    setState(() {
      _panelHeight = (_panelHeight - details.delta.dy).clamp(
        kCollapsedPanelHeight * 0.5,
        _expandedHeight,
      );
    });
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
        setState(() {
          _panelHeight = (_panelHeight + delta).clamp(
            kCollapsedPanelHeight,
            _expandedHeight,
          );
        });
        return true;
      }
    }

    if (_isExpanded && notification is OverscrollNotification) {
      final delta = notification.overscroll;
      if (delta < 0) {
        _isDraggingViaScroll = true;
        _snapController?.stop();
        setState(() {
          _panelHeight = (_panelHeight + delta).clamp(
            kCollapsedPanelHeight,
            _expandedHeight,
          );
        });
        return true;
      }
    }

    if (_isDraggingViaScroll &&
        !_isExpanded &&
        notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;
      if (delta < 0) {
        setState(() {
          _panelHeight = (_panelHeight + delta).clamp(
            kCollapsedPanelHeight,
            _expandedHeight,
          );
        });
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
    _snapController?.dispose();
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _snapAnimation = Tween(begin: _panelHeight, end: target).animate(
      CurvedAnimation(parent: _snapController!, curve: Curves.easeOutCubic),
    )..addListener(() {
      setState(() {
        _panelHeight = _snapAnimation.value;
        _isExpanded = _panelHeight >= _expandedHeight - 1;
      });
    });
    unawaited(_snapController!.forward());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SlideTransition(
      position: _entrySlide.drive(
        Tween(begin: const Offset(0, 1), end: Offset.zero),
      ),
      child: SizedBox(
        height: _panelHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
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
              _buildDragHandle(colors),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: _onScrollNotification,
                  child: _ExpressionPanelContent(
                    onClose: widget.onClose,
                    onEmojiSelect: (name, surrogates) {
                      widget.onEmojiSelect?.call(name, surrogates);
                      // Snap back to collapsed after selection if expanded
                      if (_isExpanded) {
                        _animateToHeight(kCollapsedPanelHeight);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragHandle(FluxerColorTheme colors) => GestureDetector(
    onVerticalDragUpdate: _onVerticalDragUpdate,
    onVerticalDragEnd: _onVerticalDragEnd,
    behavior: HitTestBehavior.opaque,
    child: SizedBox(
      height: _kDragHandleHeight,
      child: Center(
        child: Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: colors.backgroundModifierAccent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    ),
  );
}

class _ExpressionPanelContent extends StatefulWidget {
  const _ExpressionPanelContent({
    required this.onClose,
    this.onEmojiSelect,
  });

  final VoidCallback onClose;
  final void Function(String name, String surrogates)? onEmojiSelect;

  @override
  State<_ExpressionPanelContent> createState() =>
      _ExpressionPanelContentState();
}

class _ExpressionPanelContentState extends State<_ExpressionPanelContent> {
  ExpressionPickerTab _selectedTab = ExpressionPickerTab.emojis;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String? _hoveredEmojiName;
  String _skinTone = '';

  static const List<ExpressionPickerTab> _kVisibleTabs = [
    ExpressionPickerTab.gifs,
    ExpressionPickerTab.memes,
    ExpressionPickerTab.stickers,
    ExpressionPickerTab.emojis,
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(
      () => setState(() => _searchQuery = _searchController.text),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _tabLabel(ExpressionPickerTab tab) =>
      expressionTabLabel(tab, FluxerLocalizations.of(context));

  @override
  Widget build(BuildContext context) => Column(
    children: [
      _buildSegmentedTabs(context),
      if (_selectedTab == ExpressionPickerTab.emojis)
        EmojiSearchBar(
          controller: _searchController,
          hoveredEmojiName: _hoveredEmojiName,
          skinTone: _skinTone,
          onSkinToneChanged: (t) => setState(() => _skinTone = t),
          horizontalPadding: 16,
        ),
      const SizedBox(height: 4),
      Expanded(
        child: ExpressionPicker(
          onClose: widget.onClose,
          onEmojiSelect: widget.onEmojiSelect,
          initialTab: _selectedTab,
          showTabs: false,
          searchController: _searchController,
          searchQuery: _searchQuery,
          skinTone: _skinTone,
          hoveredEmojiName: _hoveredEmojiName,
          onHoveredEmojiChanged: (name) =>
              setState(() => _hoveredEmojiName = name),
        ),
      ),
    ],
  );

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
