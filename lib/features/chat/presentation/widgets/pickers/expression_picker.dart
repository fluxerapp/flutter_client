import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_search_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker_tab_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/favorite_media_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/gif_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/sticker_picker_content.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/expression_grid_navigation.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

enum ExpressionPickerTab { gifs, memes, stickers, emojis }

Color expressionPickerSurfaceColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.light
    ? context.colors.backgroundPrimary
    : context.colors.backgroundTertiary;

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
    this.onEmojiBackspace,
    this.autofocusSearch = false,
    this.desktopPopout = false,
    this.roleIconGuildId,
    super.key,
  });

  final VoidCallback onClose;
  final ScrollController? scrollController;
  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;

  final bool? showTabs;

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
  final VoidCallback? onEmojiBackspace;
  final bool autofocusSearch;
  final bool desktopPopout;
  final String? roleIconGuildId;

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
  FocusNode? _ownSearchFocus;
  final ExpressionGridKeyboard _gridKeyboard = ExpressionGridKeyboard();

  FocusNode? get _searchFocusNode =>
      widget.searchFocusNode ??
      (_autofocusDesktopSearch
          ? (_ownSearchFocus ??= FocusNode(debugLabel: 'expression-search'))
          : null);

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
    if (_autofocusDesktopSearch) {
      _scheduleSearchFocus();
    }
  }

  bool get _autofocusDesktopSearch =>
      widget.desktopPopout && widget.autofocusSearch;

  void _scheduleSearchFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final FocusNode? node = _searchFocusNode;
      if (node != null && node.context != null && !node.hasFocus) {
        node.requestFocus();
      }
    });
  }

  @override
  void didUpdateWidget(ExpressionPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialTab != oldWidget.initialTab &&
        widget.initialTab != _selectedTab) {
      _selectedTab = widget.initialTab;
      if (_autofocusDesktopSearch) {
        _scheduleSearchFocus();
      }
    }
  }

  @override
  void dispose() {
    _ownSearchDebounce?.cancel();
    _ownSearchController?.dispose();
    _ownSearchFocus?.dispose();
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

  void _selectTab(ExpressionPickerTab tab, {bool focusSearch = true}) {
    if (_selectedTab == tab) {
      return;
    }
    setState(() => _selectedTab = tab);
    widget.onTabChanged?.call(tab);
    if (focusSearch && _autofocusDesktopSearch) {
      _scheduleSearchFocus();
    }
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
    final bool showEmojiSearch =
        !hasExternalSearch && _selectedTab == ExpressionPickerTab.emojis;

    if (widget.desktopPopout) {
      return Focus(
        canRequestFocus: false,
        skipTraversal: true,
        onKeyEvent: (FocusNode node, KeyEvent event) =>
            _gridKeyboard.handle(event),
        child: Column(
          children: [
            if (shouldShowTabs || showEmojiSearch)
              _buildDesktopHeader(
                context,
                showTabs: shouldShowTabs,
                showEmojiSearch: showEmojiSearch,
                skinTone: skinTone,
              ),
            Expanded(
              child: ColoredBox(
                color: colors.backgroundPrimary,
                child: _buildContent(context, colors, skinTone),
              ),
            ),
          ],
        ),
      );
    }

    final layout = context.layout;
    return Column(
      children: [
        if (shouldShowTabs)
          Padding(
            padding: EdgeInsets.fromLTRB(layout.s3, layout.s3, layout.s3, 0),
            child: _buildTabBar(),
          ),
        if (showEmojiSearch)
          _buildEmojiSearchBar(
            skinTone,
            autofocus: widget.autofocusSearch,
            focusNode: widget.searchFocusNode,
            showSkinTone: !isMobileLayout(context),
            topPadding: widget.contentSearchTopPadding ?? 8,
          ),
        Expanded(child: _buildContent(context, colors, skinTone)),
      ],
    );
  }

  Widget _buildTabBar() => ExpressionPickerTabBar(
    tabs: widget.visibleTabs,
    selected: _selectedTab,
    onSelected: (ExpressionPickerTab tab, {required bool viaKeyboard}) =>
        _selectTab(tab, focusSearch: !viaKeyboard),
  );

  Widget _buildEmojiSearchBar(
    String skinTone, {
    required FocusNode? focusNode,
    required double topPadding,
    bool autofocus = false,
    bool showSkinTone = true,
    double horizontalPadding = 12,
  }) => EmojiSearchBar(
    controller: _searchController,
    hoveredEmojiName: _hoveredEmoji,
    skinTone: skinTone,
    onSkinToneChanged: (t) =>
        unawaited(ref.read(emojiSkinToneProvider.notifier).set(t)),
    autofocus: autofocus,
    focusNode: focusNode,
    showSkinTone: showSkinTone,
    horizontalPadding: horizontalPadding,
    topPadding: topPadding,
  );

  BoxDecoration _desktopHeaderDecoration(
    BuildContext context, {
    bool filled = false,
  }) => BoxDecoration(
    color: filled ? expressionPickerSurfaceColor(context) : null,
    border: Border(
      bottom: BorderSide(color: context.colors.backgroundModifierHover),
    ),
  );

  Widget Function(Widget child)? get _searchHeaderDecorator =>
      widget.desktopPopout
      ? (Widget child) => DecoratedBox(
          decoration: _desktopHeaderDecoration(context, filled: true),
          child: child,
        )
      : null;

  ExpressionGridKeyboard? get _contentGridKeyboard =>
      widget.desktopPopout ? _gridKeyboard : null;

  Widget _buildDesktopHeader(
    BuildContext context, {
    required bool showTabs,
    required bool showEmojiSearch,
    required String skinTone,
  }) {
    const double padding = 12;
    final bool bordered =
        _selectedTab == ExpressionPickerTab.emojis || !showTabs;
    return DecoratedBox(
      decoration: bordered
          ? _desktopHeaderDecoration(context)
          : const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          padding,
          padding,
          padding,
          showEmojiSearch ? padding - 4 : (bordered ? padding : 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: padding,
          children: <Widget>[
            if (showTabs) _buildTabBar(),
            if (showEmojiSearch)
              _buildEmojiSearchBar(
                skinTone,
                focusNode: _searchFocusNode,
                horizontalPadding: 0,
                topPadding: 0,
              ),
          ],
        ),
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
        roleIconGuildId: widget.roleIconGuildId,
        onBackspace: widget.onEmojiBackspace,
        gridKeyboard: _contentGridKeyboard,
        columnsFromWidth: widget.desktopPopout,
      );
    }
    if (_selectedTab == ExpressionPickerTab.gifs) {
      return GifPickerContent(
        scrollController: widget.scrollController,
        onClose: widget.onClose,
        onShowSavedMedia: widget.visibleTabs.contains(ExpressionPickerTab.memes)
            ? () => _selectTab(ExpressionPickerTab.memes)
            : null,
        onGifSelect: widget.onGifSelect,
        searchHorizontalPadding: widget.contentSearchHorizontalPadding,
        searchTopPadding: widget.contentSearchTopPadding,
        searchBottomPadding: widget.contentSearchBottomPadding,
        onSearchActivated: widget.onSearchActivated,
        searchFocusNode: _searchFocusNode,
        sheetDragHandlers: widget.sheetDragHandlers,
        searchHeaderDecorator: _searchHeaderDecorator,
        desktopPopout: widget.desktopPopout,
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
        searchFocusNode: _searchFocusNode,
        sheetDragHandlers: widget.sheetDragHandlers,
        searchHeaderDecorator: _searchHeaderDecorator,
        gridKeyboard: _contentGridKeyboard,
      );
    }
    return FavoriteMediaPickerContent(
      scrollController: widget.scrollController,
      onSelect: widget.onFavoriteMemeSelect,
      searchHorizontalPadding: widget.contentSearchHorizontalPadding,
      searchTopPadding: widget.contentSearchTopPadding,
      searchBottomPadding: widget.contentSearchBottomPadding,
      onSearchActivated: widget.onSearchActivated,
      searchFocusNode: _searchFocusNode,
      sheetDragHandlers: widget.sheetDragHandlers,
      searchHeaderDecorator: _searchHeaderDecorator,
      desktopPopout: widget.desktopPopout,
    );
  }
}
