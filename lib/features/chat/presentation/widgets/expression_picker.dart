import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/emoji_picker_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/emoji_search_bar.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum ExpressionPickerTab { gifs, memes, stickers, emojis }

String expressionTabLabel(
  ExpressionPickerTab tab,
  FluxerLocalizations l10n,
) => switch (tab) {
  ExpressionPickerTab.gifs => l10n.emojiTabGifs,
  ExpressionPickerTab.memes => l10n.emojiTabMedia,
  ExpressionPickerTab.stickers => l10n.emojiTabStickers,
  ExpressionPickerTab.emojis => l10n.emojiTabEmojis,
};

class ExpressionPicker extends StatefulWidget {
  const ExpressionPicker({
    required this.onClose,
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
    this.onEmojiSelect,
    super.key,
  });

  final VoidCallback onClose;
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
  final void Function(String name, String surrogates)? onEmojiSelect;

  @override
  State<ExpressionPicker> createState() => _ExpressionPickerState();
}

class _ExpressionPickerState extends State<ExpressionPicker> {
  late ExpressionPickerTab _selectedTab;
  TextEditingController? _ownSearchController;
  String _ownSearchQuery = '';
  String? _ownHoveredEmoji;
  String _skinTone = '';

  TextEditingController get _searchController =>
      widget.searchController ??
      (_ownSearchController ??= TextEditingController());

  String get _searchQuery =>
      widget.searchController != null ? widget.searchQuery : _ownSearchQuery;

  String? get _hoveredEmoji =>
      widget.searchController != null
          ? widget.hoveredEmojiName
          : _ownHoveredEmoji;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
    if (widget.searchController == null) {
      _ownSearchController = TextEditingController();
      _ownSearchController!.addListener(
        () => setState(() => _ownSearchQuery = _ownSearchController!.text),
      );
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
    _ownSearchController?.dispose();
    super.dispose();
  }

  String _tabLabel(ExpressionPickerTab tab) =>
      expressionTabLabel(tab, FluxerLocalizations.of(context));

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

    return Column(
      children: [
        if (shouldShowTabs) _buildTabBar(context, colors),
        if (!hasExternalSearch && _selectedTab == ExpressionPickerTab.emojis)
          EmojiSearchBar(
            controller: _searchController,
            hoveredEmojiName: _hoveredEmoji,
            skinTone: _skinTone,
            onSkinToneChanged: (t) => setState(() => _skinTone = t),
          ),
        Expanded(child: _buildContent(context, colors)),
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
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = tab),
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
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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

  Widget _buildContent(BuildContext context, FluxerColorTheme colors) {
    if (_selectedTab == ExpressionPickerTab.emojis) {
      return EmojiPickerContent(
        isMobile: isMobileLayout(context),
        searchQuery: _searchQuery,
        skinTone: widget.skinTone ?? _skinTone,
        onHoveredEmojiChanged: _onHoveredChanged,
        onSelect: widget.onEmojiSelect,
      );
    }
    return Center(
      child: Text(
        _tabLabel(_selectedTab),
        style: TextStyle(color: colors.textTertiaryMuted, fontSize: 14),
      ),
    );
  }
}
