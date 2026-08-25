import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_search_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/favorite_media_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/gif_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/sticker_picker_content.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

enum ExpressionPickerTab { gifs, memes, stickers, emojis }

String expressionTabLabel(ExpressionPickerTab tab, FluxerLocalizations l10n) =>
    switch (tab) {
      ExpressionPickerTab.gifs => l10n.emojiTabGifs,
      ExpressionPickerTab.memes => l10n.emojiTabMedia,
      ExpressionPickerTab.stickers => l10n.emojiTabStickers,
      ExpressionPickerTab.emojis => l10n.emojiTabEmojis,
    };

class ExpressionPicker extends ConsumerStatefulWidget {
  const ExpressionPicker({
    required this.onClose,
    this.scrollController,
    this.visibleTabs = const [
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ],
    this.initialTab = ExpressionPickerTab.emojis,
    this.showTabs,
    this.searchController,
    this.searchQuery = '',
    this.skinTone,
    this.hoveredEmojiName,
    this.onHoveredEmojiChanged,
    this.onTabChanged,
    this.onEmojiSelect,
    this.onGifSelect,
    this.onStickerSelect,
    this.onFavoriteMemeSelect,
    this.channelId,
    this.contentSearchHorizontalPadding,
    this.contentSearchTopPadding,
    this.contentSearchBottomPadding,
    this.onSearchActivated,
    this.searchFocusNode,
    this.sheetDragHandlers,
    this.trackEmojiUsageOnSelect = true,
    super.key,
  });

  final VoidCallback onClose;
  final ScrollController? scrollController;
  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;

  /// When null, tabs auto-show if there are multiple visible tabs.
  final bool? showTabs;

  /// When provided, the search bar is rendered by the parent header /
  final TextEditingController? searchController;
  final String searchQuery;
  final String? skinTone;
  final String? hoveredEmojiName;
  final ValueChanged<String?>? onHoveredEmojiChanged;
  final ValueChanged<ExpressionPickerTab>? onTabChanged;
  final void Function(String name, String surrogates)? onEmojiSelect;
  final ValueChanged<FluxerSelectedGif>? onGifSelect;
  final ValueChanged<StickerEntry>? onStickerSelect;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelect;
  final String? channelId;
  final double? contentSearchHorizontalPadding;
  final double? contentSearchTopPadding;
  final double? contentSearchBottomPadding;
  final VoidCallback? onSearchActivated;
  final FocusNode? searchFocusNode;
  final ExpandableSheetDragHandlers? sheetDragHandlers;

  /// Forwarded to [EmojiPickerContent.trackUsageOnSelect]. Set false when the
  /// picker drives reactions, which are tracked centrally in
  /// `ChatViewModel.toggleReaction`.
  final bool trackEmojiUsageOnSelect;

  @override
  ConsumerState<ExpressionPicker> createState() => _ExpressionPickerState();
}

class _ExpressionPickerState extends ConsumerState<ExpressionPicker> {
  static const _kSearchDebounce = Duration(milliseconds: 120);

  late ExpressionPickerTab _selectedTab;
  TextEditingController? _ownSearchController;
  String _ownSearchQuery = '';
  String? _ownHoveredEmoji;
  Timer? _ownSearchDebounce;

  TextEditingController get _searchController =>
      widget.searchController ??
      (_ownSearchController ??= TextEditingController());

  String get _searchQuery =>
      widget.searchController != null ? widget.searchQuery : _ownSearchQuery;

  String? get _hoveredEmoji => widget.searchController != null
      ? widget.hoveredEmojiName
      : _ownHoveredEmoji;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
    if (widget.searchController == null) {
      _ownSearchController = TextEditingController();
      _ownSearchController!.addListener(_onOwnSearchChanged);
    }
  }

  @override
  void didUpdateWidget(ExpressionPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialTab != oldWidget.initialTab) {
      _selectedTab = widget.initialTab;
    }
  }

  @override
  void dispose() {
    _ownSearchDebounce?.cancel();
    _ownSearchController?.dispose();
    super.dispose();
  }

  void _onOwnSearchChanged() {
    final controller = _ownSearchController;
    if (controller == null) {
      return;
    }
    final next = controller.text;
    if (next.isEmpty) {
      _ownSearchDebounce?.cancel();
      if (_ownSearchQuery.isNotEmpty) {
        setState(() => _ownSearchQuery = '');
      }
      return;
    }
    _ownSearchDebounce?.cancel();
    _ownSearchDebounce = Timer(_kSearchDebounce, () {
      if (!mounted) {
        return;
      }
      setState(() => _ownSearchQuery = controller.text);
    });
  }

  String _tabLabel(ExpressionPickerTab tab) =>
      expressionTabLabel(tab, FluxerLocalizations.of(context));

  void _selectTab(ExpressionPickerTab tab) {
    if (_selectedTab == tab) {
      return;
    }
    setState(() => _selectedTab = tab);
    widget.onTabChanged?.call(tab);
  }

  void _onHoveredChanged(String? name) {
    if (widget.onHoveredEmojiChanged != null) {
      widget.onHoveredEmojiChanged!(name);
    } else {
      setState(() => _ownHoveredEmoji = name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final shouldShowTabs = widget.showTabs ?? widget.visibleTabs.length > 1;
    final hasExternalSearch = widget.searchController != null;
    final skinTone = ref.watch(emojiSkinToneProvider).value ?? '';

    return Column(
      children: [
        if (shouldShowTabs) _buildTabBar(context, colors),
        if (!hasExternalSearch && _selectedTab == ExpressionPickerTab.emojis)
          EmojiSearchBar(
            controller: _searchController,
            hoveredEmojiName: _hoveredEmoji,
            skinTone: skinTone,
            onSkinToneChanged: (t) =>
                unawaited(ref.read(emojiSkinToneProvider.notifier).set(t)),
          ),
        Expanded(child: _buildContent(context, colors, skinTone)),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context, FluxerColorTheme colors) {
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s3, layout.s3, layout.s3, 0),
      child: Row(
        children: widget.visibleTabs.map((tab) {
          final isActive = tab == _selectedTab;
          return Padding(
            padding: const EdgeInsets.only(right: 4),
            child: FluxerGestureDetector(
              onTap: () => _selectTab(tab),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: layout.s2,
                  vertical: layout.s1,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? colors.backgroundModifierSelected
                      : Colors.transparent,
                  borderRadius: layout.radiusMd,
                ),
                child: Text(
                  _tabLabel(tab),
                  style: context.textStyles.categoryName.copyWith(
                    color: isActive
                        ? colors.textPrimary
                        : colors.textPrimaryMuted,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    FluxerColorTheme colors,
    String skinTone,
  ) {
    if (_selectedTab == ExpressionPickerTab.emojis) {
      return EmojiPickerContent(
        scrollController: widget.scrollController,
        isMobile: isMobileLayout(context),
        searchQuery: _searchQuery,
        skinTone: widget.skinTone ?? skinTone,
        onHoveredEmojiChanged: _onHoveredChanged,
        onSelect: widget.onEmojiSelect,
        channelId: widget.channelId,
        trackUsageOnSelect: widget.trackEmojiUsageOnSelect,
      );
    }
    if (_selectedTab == ExpressionPickerTab.gifs) {
      return GifPickerContent(
        scrollController: widget.scrollController,
        onClose: widget.onClose,
        onFavoritesTap: widget.visibleTabs.contains(ExpressionPickerTab.memes)
            ? () => _selectTab(ExpressionPickerTab.memes)
            : null,
        onGifSelect: widget.onGifSelect,
        searchHorizontalPadding: widget.contentSearchHorizontalPadding,
        searchTopPadding: widget.contentSearchTopPadding,
        searchBottomPadding: widget.contentSearchBottomPadding,
        onSearchActivated: widget.onSearchActivated,
        searchFocusNode: widget.searchFocusNode,
        sheetDragHandlers: widget.sheetDragHandlers,
      );
    }
    if (_selectedTab == ExpressionPickerTab.stickers) {
      return StickerPickerContent(
        scrollController: widget.scrollController,
        isMobile: isMobileLayout(context),
        onSelect: widget.onStickerSelect,
        channelId: widget.channelId,
        searchHorizontalPadding: widget.contentSearchHorizontalPadding,
        searchTopPadding: widget.contentSearchTopPadding,
        searchBottomPadding: widget.contentSearchBottomPadding,
        onSearchActivated: widget.onSearchActivated,
        searchFocusNode: widget.searchFocusNode,
        sheetDragHandlers: widget.sheetDragHandlers,
      );
    }
    return FavoriteMediaPickerContent(
      scrollController: widget.scrollController,
      onSelect: widget.onFavoriteMemeSelect,
      searchHorizontalPadding: widget.contentSearchHorizontalPadding,
      searchTopPadding: widget.contentSearchTopPadding,
      searchBottomPadding: widget.contentSearchBottomPadding,
      onSearchActivated: widget.onSearchActivated,
      searchFocusNode: widget.searchFocusNode,
      sheetDragHandlers: widget.sheetDragHandlers,
    );
  }
}
