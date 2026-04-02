import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_markdown.dart';
import 'package:fluxer_app/features/chat/providers/emoji_picker_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kGridColumns = 9;
const _kMobileGridColumns = 8;
const _kEmojiSize = 40.0;
const _kCellSize = 48.0;

const Map<String, IconData> _kCategoryIcons = {
  'people': PhosphorIconsFill.smiley,
  'nature': PhosphorIconsFill.leaf,
  'food': PhosphorIconsFill.bowlFood,
  'activity': PhosphorIconsFill.gameController,
  'travel': PhosphorIconsFill.bicycle,
  'objects': PhosphorIconsFill.magnet,
  'symbols': PhosphorIconsFill.heart,
  'flags': PhosphorIconsFill.flag,
};

String _categoryLabel(String category, FluxerLocalizations l10n) =>
    switch (category) {
      'people' => l10n.emojiCategoryPeople,
      'nature' => l10n.emojiCategoryNature,
      'food' => l10n.emojiCategoryFood,
      'activity' => l10n.emojiCategoryActivity,
      'travel' => l10n.emojiCategoryTravel,
      'objects' => l10n.emojiCategoryObjects,
      'symbols' => l10n.emojiCategorySymbols,
      'flags' => l10n.emojiCategoryFlags,
      _ => category,
    };

typedef OnEmojiSelect = void Function(String name, String surrogates);

class EmojiPickerContent extends ConsumerStatefulWidget {
  const EmojiPickerContent({
    this.onSelect,
    this.onHoveredEmojiChanged,
    this.searchQuery = '',
    this.skinTone = '',
    this.isMobile = false,
    super.key,
  });

  final OnEmojiSelect? onSelect;
  final ValueChanged<String?>? onHoveredEmojiChanged;
  final String searchQuery;
  final String skinTone;
  final bool isMobile;

  @override
  ConsumerState<EmojiPickerContent> createState() =>
      _EmojiPickerContentState();
}

class _EmojiPickerContentState extends ConsumerState<EmojiPickerContent> {
  final _scrollController = ScrollController();
  String? _hoveredEmojiName;
  final _collapsedCategories = <String>{};
  final _categoryKeys = <String, GlobalKey>{};

  @override
  void initState() {
    super.initState();
    _categoryKeys['frequently-used'] = GlobalKey();
    for (final cat in kEmojiCategoryOrder) {
      _categoryKeys[cat] = GlobalKey();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int get _columns => widget.isMobile ? _kMobileGridColumns : _kGridColumns;

  void _setHoveredEmoji(String? name) {
    setState(() => _hoveredEmojiName = name);
    widget.onHoveredEmojiChanged?.call(name);
  }

  void _onEmojiSelected(EmojiEntry emoji) {
    final hasTone = widget.skinTone.isNotEmpty && emoji.hasDiversity;
    final surrogates =
        hasTone ? emoji.surrogates + widget.skinTone : emoji.surrogates;
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .emojiUsageDao
          .trackUsage('unicode:${emoji.primaryName}'),
    );
    ref.invalidate(frecentEmojisProvider);
    widget.onSelect?.call(emoji.primaryName, surrogates);
  }

  void _scrollToCategory(String category) {
    final categories = EmojiRegistry.categories;
    final frecent = ref.read(frecentEmojisProvider).value ?? [];

    if (category == 'frequently-used') {
      unawaited(
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        ),
      );
      return;
    }

    double offset = 0;
    if (frecent.isNotEmpty) {
      offset += 26;
      if (!_collapsedCategories.contains('frequently-used')) {
        offset += (frecent.length / _columns).ceil() * _kCellSize;
      }
      offset += 12;
    }

    for (final cat in kEmojiCategoryOrder) {
      if (cat == category) {
        break;
      }
      final emojis = categories[cat];
      if (emojis == null || emojis.isEmpty) {
        continue;
      }
      offset += 12 + 26;
      if (!_collapsedCategories.contains(cat)) {
        offset += (emojis.length / _columns).ceil() * _kCellSize;
      }
    }

    unawaited(
      _scrollController.animateTo(
        offset.clamp(0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (widget.isMobile) {
      return Column(
        children: [
          Expanded(child: _buildEmojiGrid(context, colors)),
          _buildMobileCategoryBar(context, colors),
        ],
      );
    }

    return Row(
      children: [
        _buildDesktopCategorySidebar(context, colors),
        Expanded(
          child: Column(
            children: [
              Expanded(child: _buildEmojiGrid(context, colors)),
              _buildInspector(context, colors),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmojiGrid(BuildContext context, FluxerColorTheme colors) {
    if (widget.searchQuery.isNotEmpty) {
      return _buildSearchResults(context, colors);
    }
    return _buildCategoryGrid(context, colors);
  }

  Widget _buildSearchResults(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final results = EmojiRegistry.search(widget.searchQuery);
    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsDuotone.smileySad,
              size: 42,
              color: colors.textPrimaryMuted.withValues(alpha: 0.7),
            ),
            const SizedBox(height: 8),
            Text(
              FluxerLocalizations.of(context).emojiSearchEmpty,
              style: TextStyle(
                fontSize: 14,
                color: colors.textPrimaryMuted.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
        mainAxisExtent: _kCellSize,
      ),
      itemCount: results.length,
      itemBuilder: (context, i) => _buildEmojiCell(results[i], colors),
    );
  }

  Widget _buildCategoryGrid(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final categories = EmojiRegistry.categories;
    final frecent = ref.watch(frecentEmojisProvider).value ?? [];
    final hasFrecent = frecent.isNotEmpty;
    final itemCount =
        kEmojiCategoryOrder.length + (hasFrecent ? 1 : 0);

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      itemCount: itemCount,
      itemBuilder: (context, rawIndex) {
        if (hasFrecent && rawIndex == 0) {
          return Column(
            key: _categoryKeys['frequently-used'],
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('frequently-used', colors),
              if (!_collapsedCategories.contains('frequently-used'))
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _columns,
                    mainAxisExtent: _kCellSize,
                  ),
                  itemCount: frecent.length,
                  itemBuilder: (context, i) =>
                      _buildEmojiCell(frecent[i], colors),
                ),
            ],
          );
        }

        final catIndex = hasFrecent ? rawIndex - 1 : rawIndex;
        final category = kEmojiCategoryOrder[catIndex];
        final emojis = categories[category];
        if (emojis == null || emojis.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          key: _categoryKeys[category],
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildCategoryHeader(category, colors),
            if (!_collapsedCategories.contains(category))
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _columns,
                  mainAxisExtent: _kCellSize,
                ),
                itemCount: emojis.length,
                itemBuilder: (context, i) =>
                    _buildEmojiCell(emojis[i], colors),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCategoryHeader(String category, FluxerColorTheme colors) {
    final l10n = FluxerLocalizations.of(context);
    final isCollapsed = _collapsedCategories.contains(category);
    final label = category == 'frequently-used'
        ? l10n.emojiFrequentlyUsed
        : _categoryLabel(category, l10n);

    return GestureDetector(
      onTap: () => setState(() {
        if (isCollapsed) {
          _collapsedCategories.remove(category);
        } else {
          _collapsedCategories.add(category);
        }
      }),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: colors.textPrimaryMuted,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedRotation(
              turns: isCollapsed ? -0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: PhosphorIcon(
                PhosphorIconsBold.caretDown,
                size: 12,
                color: colors.textPrimaryMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiCell(EmojiEntry emoji, FluxerColorTheme colors) {
    final hasTone = widget.skinTone.isNotEmpty && emoji.hasDiversity;
    final surrogates =
        hasTone ? emoji.surrogates + widget.skinTone : emoji.surrogates;

    return GestureDetector(
      onTap: () => _onEmojiSelected(emoji),
      child: MouseRegion(
        onEnter: (_) => _setHoveredEmoji(emoji.primaryName),
        onExit: (_) => _setHoveredEmoji(null),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _hoveredEmojiName == emoji.primaryName
                ? colors.backgroundModifierSelected
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: hasTone
              ? _TwemojiSvg(surrogates: surrogates, size: _kEmojiSize)
              : SpriteEmoji(index: emoji.spriteIndex, size: _kEmojiSize),
        ),
      ),
    );
  }

  Widget _buildDesktopCategorySidebar(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final frecent = ref.watch(frecentEmojisProvider).value ?? [];
    final l10n = FluxerLocalizations.of(context);

    return Container(
      width: 46,
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        border: Border(
          right: BorderSide(color: colors.backgroundModifierAccent),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          if (frecent.isNotEmpty)
            _CategoryButton(
              icon: PhosphorIconsFill.clock,
              tooltip: l10n.emojiFrequentlyUsed,
              onTap: () => _scrollToCategory('frequently-used'),
            ),
          ...kEmojiCategoryOrder.map((cat) {
            final icon = _kCategoryIcons[cat];
            if (icon == null) {
              return const SizedBox.shrink();
            }
            return _CategoryButton(
              icon: icon,
              tooltip: _categoryLabel(cat, l10n),
              onTap: () => _scrollToCategory(cat),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMobileCategoryBar(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final frecent = ref.watch(frecentEmojisProvider).value ?? [];
    final l10n = FluxerLocalizations.of(context);

    return Container(
      height: 44,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          if (frecent.isNotEmpty)
            _CategoryButton(
              icon: PhosphorIconsFill.clock,
              tooltip: l10n.emojiFrequentlyUsed,
              onTap: () => _scrollToCategory('frequently-used'),
            ),
          ...kEmojiCategoryOrder.map((cat) {
            final icon = _kCategoryIcons[cat];
            if (icon == null) {
              return const SizedBox.shrink();
            }
            return _CategoryButton(
              icon: icon,
              tooltip: _categoryLabel(cat, l10n),
              onTap: () => _scrollToCategory(cat),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildInspector(BuildContext context, FluxerColorTheme colors) {
    final name = _hoveredEmojiName;
    final emoji = name != null
        ? EmojiRegistry.allEmojis
            .where((e) => e.primaryName == name)
            .firstOrNull
        : null;
    final hasTone =
        widget.skinTone.isNotEmpty && (emoji?.hasDiversity ?? false);

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
      ),
      child: Row(
        children: [
          if (emoji != null) ...[
            if (hasTone)
              _TwemojiSvg(
                surrogates: emoji.surrogates + widget.skinTone,
                size: 32,
              )
            else
              SpriteEmoji(index: emoji.spriteIndex, size: 32),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                ':${emoji.primaryName}:',
                style: TextStyle(fontSize: 14, color: colors.textPrimary),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(6),
    child: SizedBox(
      width: 36,
      height: 36,
      child: Center(
        child: PhosphorIcon(
          icon,
          size: 24,
          color: context.colors.textPrimaryMuted,
        ),
      ),
    ),
  );
}

/// Skin-toned emoji via Twemoji CDN SVG, cached in [SvgCache].
class _TwemojiSvg extends StatelessWidget {
  const _TwemojiSvg({required this.surrogates, required this.size});

  final String surrogates;
  final double size;

  @override
  Widget build(BuildContext context) {
    final url = getTwemojiUrl(surrogates);
    if (url == null) {
      return Text(surrogates, style: TextStyle(fontSize: size * 0.8));
    }
    return FutureBuilder<Uint8List>(
      future: SvgCache.load(url),
      builder: (context, snap) {
        if (!snap.hasData) {
          return SizedBox(width: size, height: size);
        }
        return SvgPicture.memory(snap.data!, width: size, height: size);
      },
    );
  }
}
