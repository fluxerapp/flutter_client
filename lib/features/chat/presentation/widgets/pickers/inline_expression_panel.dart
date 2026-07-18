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
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

const double kExpressionPanelSearchHorizontalPadding = 16;
const double kExpressionPanelSearchTopPadding = 8;
const double kExpressionPanelSearchBottomPadding = 8;
const Duration kExpressionPanelContentFadeDuration = Duration(milliseconds: 80);

class ExpressionPanelContent extends ConsumerStatefulWidget {
  const ExpressionPanelContent({
    required this.onClose,
    required this.scrollController,
    this.onEmojiSelect,
    this.onGifSelect,
    this.onStickerSelect,
    this.onFavoriteMemeSelect,
    this.onSearchActivated,
    this.sheetDragHandlers,
    super.key,
  });

  final VoidCallback onClose;
  final ScrollController scrollController;
  final void Function(String name, String surrogates)? onEmojiSelect;
  final ValueChanged<FluxerSelectedGif>? onGifSelect;
  final ValueChanged<StickerEntry>? onStickerSelect;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelect;
  final VoidCallback? onSearchActivated;
  final ExpandableSheetDragHandlers? sheetDragHandlers;

  @override
  ConsumerState<ExpressionPanelContent> createState() =>
      _ExpressionPanelContentState();
}

class _ExpressionPanelContentState extends ConsumerState<ExpressionPanelContent>
    with SingleTickerProviderStateMixin {
  static const Duration _kSearchDebounce = Duration(milliseconds: 120);

  ExpressionPickerTab _selectedTab = ExpressionPickerTab.emojis;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _searchDebounce;
  late final AnimationController _fadeController;
  late final Animation<double> _contentFade;

  static const List<ExpressionPickerTab> _kVisibleTabs = <ExpressionPickerTab>[
    ExpressionPickerTab.gifs,
    ExpressionPickerTab.memes,
    ExpressionPickerTab.stickers,
    ExpressionPickerTab.emojis,
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _fadeController = AnimationController(
      vsync: this,
      duration: kExpressionPanelContentFadeDuration,
    );
    _contentFade = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    unawaited(_fadeController.forward());
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final String next = _searchController.text;
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
    final String skinTone = ref.watch(emojiSkinToneProvider).value ?? '';
    final String? channelId = ref.watch(
      chatViewModelProvider.select((state) => state.channelId),
    );
    return FadeTransition(
      opacity: _contentFade,
      child: Column(
        children: <Widget>[
          _buildDraggableChrome(context, skinTone),
          Expanded(
            child: ExpressionPicker(
              onClose: widget.onClose,
              onEmojiSelect: widget.onEmojiSelect,
              onGifSelect: widget.onGifSelect,
              onStickerSelect: widget.onStickerSelect,
              onFavoriteMemeSelect: widget.onFavoriteMemeSelect,
              onTabChanged: (ExpressionPickerTab tab) {
                if (tab != _selectedTab) {
                  if (widget.scrollController.hasClients) {
                    widget.scrollController.jumpTo(0);
                  }
                  setState(() => _selectedTab = tab);
                }
              },
              initialTab: _selectedTab,
              showTabs: false,
              searchController: _searchController,
              searchQuery: _searchQuery,
              skinTone: skinTone,
              channelId: channelId,
              scrollController: widget.scrollController,
              contentSearchHorizontalPadding:
                  kExpressionPanelSearchHorizontalPadding,
              contentSearchTopPadding: kExpressionPanelSearchTopPadding,
              contentSearchBottomPadding: kExpressionPanelSearchBottomPadding,
              onSearchActivated: widget.onSearchActivated,
              sheetDragHandlers: widget.sheetDragHandlers,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDraggableChrome(BuildContext context, String skinTone) {
    final Widget chrome = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSegmentedTabs(context),
        if (_selectedTab == ExpressionPickerTab.emojis)
          EmojiSearchBar(
            controller: _searchController,
            skinTone: skinTone,
            onSkinToneChanged: (String tone) =>
                unawaited(ref.read(emojiSkinToneProvider.notifier).set(tone)),
            horizontalPadding: kExpressionPanelSearchHorizontalPadding,
            onActivated: widget.onSearchActivated,
          ),
      ],
    );
    final ExpandableSheetDragHandlers? handlers = widget.sheetDragHandlers;
    if (handlers == null) {
      return chrome;
    }
    return handlers.wrapChrome(chrome);
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
            children: _kVisibleTabs.map((ExpressionPickerTab tab) {
              final bool isActive = tab == _selectedTab;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (tab != _selectedTab) {
                      if (widget.scrollController.hasClients) {
                        widget.scrollController.jumpTo(0);
                      }
                      setState(() => _selectedTab = tab);
                    }
                  },
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
                          ? const <BoxShadow>[
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
