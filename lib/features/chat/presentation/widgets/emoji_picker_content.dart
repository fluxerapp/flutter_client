import 'dart:async';
import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/plutonium_upsell_banner.dart';
import 'package:fluxer_app/features/chat/providers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
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

  GuildEmojiEntry? _hoveredCustomEmoji;

  late final int _upsellPreviewSeed;

  @override
  void initState() {
    super.initState();
    _upsellPreviewSeed = Random().nextInt(0x7fffffff);
    _preloadSkinToneSpriteSheet();
  }

  @override
  void didUpdateWidget(covariant EmojiPickerContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.skinTone != widget.skinTone) {
      _preloadSkinToneSpriteSheet();
    }
  }

  void _preloadSkinToneSpriteSheet() {
    if (widget.skinTone.isEmpty) {
      return;
    }
    unawaited(EmojiSpriteSheet.preload(skinTone: widget.skinTone));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int get _columns => widget.isMobile ? _kMobileGridColumns : _kGridColumns;

  void _setHoveredEmoji(String? name, {GuildEmojiEntry? customEmoji}) {
    setState(() {
      _hoveredEmojiName = name;
      _hoveredCustomEmoji = customEmoji;
    });
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

  void _onCustomEmojiSelected(GuildEmojiEntry emoji) {
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .emojiUsageDao
          .trackUsage('custom:${emoji.guildId}:${emoji.id}'),
    );
    ref.invalidate(frecentEmojisProvider);
    widget.onSelect?.call(emoji.name, emoji.markdown);
  }

  bool get _isPremium => ref.watch(currentUserPremiumTypeProvider) > 0;

  Map<Guild, List<GuildEmojiEntry>> _getGuildEmojisByGuild() {
    final guilds = ref.watch(guildListViewModelProvider).guilds;
    final activeGuildId = ref.watch(activeGuildIdProvider);
    final isPremium = _isPremium;

    final targetGuilds = isPremium
        ? guilds
        : guilds.where((g) => g.id == activeGuildId).toList();

    final result = <Guild, List<GuildEmojiEntry>>{};
    for (final guild in targetGuilds) {
      final emojis =
          ref.watch(guildEmojisForPickerProvider(guild.id)).value ?? const [];
      if (emojis.isNotEmpty) {
        result[guild] = emojis;
      }
    }
    return result;
  }

  Map<Guild, List<GuildEmojiEntry>> _readGuildEmojisByGuild() {
    final guilds = ref.read(guildListViewModelProvider).guilds;
    final activeGuildId = ref.read(activeGuildIdProvider);
    final isPremium = ref.read(currentUserPremiumTypeProvider) > 0;

    final targetGuilds = isPremium
        ? guilds
        : guilds.where((g) => g.id == activeGuildId).toList();

    final result = <Guild, List<GuildEmojiEntry>>{};
    for (final guild in targetGuilds) {
      final emojis =
          ref.read(guildEmojisForPickerProvider(guild.id)).value ?? const [];
      if (emojis.isNotEmpty) {
        result[guild] = emojis;
      }
    }
    return result;
  }

  List<GuildEmojiEntry> _getGuildEmojis() =>
      _getGuildEmojisByGuild().values.expand((e) => e).toList();

  void _scrollToCategory(String category) {
    final categories = EmojiRegistry.categories;
    final frecent = ref.read(frecentEmojisProvider).value ?? [];
    final guildEmojisByGuild = _readGuildEmojisByGuild();

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

    for (final entry in guildEmojisByGuild.entries) {
      final guildKey = 'guild-${entry.key.id}';
      if (category == guildKey) {
        unawaited(
          _scrollController.animateTo(
            offset.clamp(0, _scrollController.position.maxScrollExtent),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          ),
        );
        return;
      }
      offset += 12 + 26;
      if (!_collapsedCategories.contains(guildKey)) {
        offset += (entry.value.length / _columns).ceil() * _kCellSize;
      }
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

  Widget _buildUpsellBanner(BuildContext context) {
    if (_isPremium) {
      return const SizedBox.shrink();
    }
    final allGuilds = ref.watch(guildListViewModelProvider).guilds;
    final activeGuildId = ref.watch(activeGuildIdProvider);
    final lockedGuilds = allGuilds
        .where((g) => g.id != activeGuildId)
        .toList();
    if (lockedGuilds.isEmpty) {
      return const SizedBox.shrink();
    }
    final allLockedEmojis = lockedGuilds
        .expand<GuildEmojiEntry>(
          (g) =>
              ref.watch(guildEmojisForPickerProvider(g.id)).value ??
              const <GuildEmojiEntry>[],
        )
        .toList();
    if (allLockedEmojis.isEmpty) {
      return const SizedBox.shrink();
    }
    final previewEmojis = pickRandomItems<GuildEmojiEntry>(
      allLockedEmojis,
      4,
      _upsellPreviewSeed,
    );
    return PlutoniumUpsellBanner(
      lockedEmojiCount: allLockedEmojis.length,
      lockedGuilds: lockedGuilds,
      previewEmojis: previewEmojis,
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
    final unicodeResults = EmojiRegistry.search(widget.searchQuery);
    final guildEmojis = _getGuildEmojis();
    final query = widget.searchQuery.toLowerCase();
    final customResults =
        guildEmojis.where((e) => e.name.toLowerCase().contains(query)).toList();

    if (unicodeResults.isEmpty && customResults.isEmpty) {
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

    final totalCount = customResults.length + unicodeResults.length;
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
        mainAxisExtent: _kCellSize,
      ),
      itemCount: totalCount,
      itemBuilder: (context, i) {
        if (i < customResults.length) {
          return _buildCustomEmojiCell(customResults[i], colors);
        }
        return _buildEmojiCell(
          unicodeResults[i - customResults.length],
          colors,
        );
      },
    );
  }

  Widget _buildCategoryGrid(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final categories = EmojiRegistry.categories;
    final frecent = ref.watch(frecentEmojisProvider).value ?? [];
    final guildEmojisByGuild = _getGuildEmojisByGuild();
    final hasFrecent = frecent.isNotEmpty;
    final guildEntries = guildEmojisByGuild.entries.toList();
    final upsell = _buildUpsellBanner(context);
    final hasUpsell = !_isPremium;

    final sectionCount = kEmojiCategoryOrder.length +
        (hasFrecent ? 1 : 0) +
        guildEntries.length +
        (hasUpsell ? 1 : 0);

    return ListView.builder(
      key: ValueKey('emoji-grid-$sectionCount'),
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      itemCount: sectionCount,
      itemBuilder: (context, rawIndex) {
        var idx = rawIndex;

        if (hasUpsell && idx == 0) {
          return upsell;
        }
        if (hasUpsell) {
          idx--;
        }

        if (hasFrecent && idx == 0) {
          return Column(
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
        if (hasFrecent) {
          idx--;
        }

        if (idx < guildEntries.length) {
          final guild = guildEntries[idx].key;
          final emojis = guildEntries[idx].value;
          final guildKey = 'guild-${guild.id}';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildCategoryHeader(guildKey, colors, labelOverride: guild.name),
              if (!_collapsedCategories.contains(guildKey))
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _columns,
                    mainAxisExtent: _kCellSize,
                  ),
                  itemCount: emojis.length,
                  itemBuilder: (context, i) =>
                      _buildCustomEmojiCell(emojis[i], colors),
                ),
            ],
          );
        }
        idx -= guildEntries.length;

        final category = kEmojiCategoryOrder[idx];
        final emojis = categories[category];
        if (emojis == null || emojis.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
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

  Widget _buildCategoryHeader(
    String category,
    FluxerColorTheme colors, {
    String? labelOverride,
  }) {
    final l10n = FluxerLocalizations.of(context);
    final isCollapsed = _collapsedCategories.contains(category);
    final label = labelOverride ??
        (category == 'frequently-used'
            ? l10n.emojiFrequentlyUsed
            : _categoryLabel(category, l10n));

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

    return GestureDetector(
      onTap: () => _onEmojiSelected(emoji),
      child: MouseRegion(
        onEnter: (_) => _setHoveredEmoji(emoji.primaryName),
        onExit: (_) => _setHoveredEmoji(null),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _hoveredEmojiName == emoji.primaryName &&
                    _hoveredCustomEmoji == null
                ? colors.backgroundModifierSelected
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: hasTone
              ? SpriteEmoji(
                  index: emoji.spriteIndex,
                  diversityIndex: emoji.diversityIndex,
                  size: _kEmojiSize,
                  skinTone: widget.skinTone,
                )
              : SpriteEmoji(index: emoji.spriteIndex, size: _kEmojiSize),
        ),
      ),
    );
  }

  Widget _buildCustomEmojiCell(
    GuildEmojiEntry emoji,
    FluxerColorTheme colors,
  ) => GestureDetector(
    onTap: () => _onCustomEmojiSelected(emoji),
    child: MouseRegion(
      onEnter: (_) =>
          _setHoveredEmoji(emoji.name, customEmoji: emoji),
      onExit: (_) => _setHoveredEmoji(null),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _hoveredCustomEmoji?.id == emoji.id
              ? colors.backgroundModifierSelected
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: _RetryEmojiImage(
          emojiId: emoji.id,
          url: emoji.url,
          size: _kEmojiSize,
        ),
      ),
    ),
  );

  Widget _buildDesktopCategorySidebar(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final frecent = ref.watch(frecentEmojisProvider).value ?? [];
    final guildEmojisByGuild = _getGuildEmojisByGuild();
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
          ...guildEmojisByGuild.keys.map(
            (guild) => _GuildCategoryButton(
              guild: guild,
              onTap: () => _scrollToCategory('guild-${guild.id}'),
            ),
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
    final guildEmojisByGuild = _getGuildEmojisByGuild();
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
          ...guildEmojisByGuild.keys.map(
            (guild) => _GuildCategoryButton(
              guild: guild,
              onTap: () => _scrollToCategory('guild-${guild.id}'),
            ),
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
    final customEmoji = _hoveredCustomEmoji;
    final name = _hoveredEmojiName;

    // Custom emoji hovered
    if (customEmoji != null) {
      return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colors.backgroundPrimary,
          border: Border(
            top: BorderSide(color: colors.backgroundModifierAccent),
          ),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: customEmoji.url,
              cacheKey: 'emoji_${customEmoji.id}',
              width: 32,
              height: 32,
              memCacheWidth: 32,
              memCacheHeight: 32,
              fit: BoxFit.contain,
              placeholder: (_, _) => const SizedBox(width: 32, height: 32),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                ':${customEmoji.name}:',
                style: TextStyle(fontSize: 14, color: colors.textPrimary),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    // Unicode emoji hovered
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
              SpriteEmoji(
                index: emoji.spriteIndex,
                diversityIndex: emoji.diversityIndex,
                size: 32,
                skinTone: widget.skinTone,
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

class _GuildCategoryButton extends StatelessWidget {
  const _GuildCategoryButton({required this.guild, required this.onTap});

  final Guild guild;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final iconUrl = guild.iconUrl;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Center(
          child: iconUrl != null
              ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: iconUrl,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        _GuildInitial(name: guild.name, colors: colors),
                  ),
                )
              : _GuildInitial(name: guild.name, colors: colors),
        ),
      ),
    );
  }
}

class _GuildInitial extends StatelessWidget {
  const _GuildInitial({required this.name, required this.colors});

  final String name;
  final FluxerColorTheme colors;

  @override
  Widget build(BuildContext context) => Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: colors.backgroundSecondary,
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    child: Text(
      name.isNotEmpty ? name[0].toUpperCase() : '?',
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: colors.textPrimaryMuted,
      ),
    ),
  );
}

class _RetryEmojiImage extends StatefulWidget {
  const _RetryEmojiImage({
    required this.emojiId,
    required this.url,
    required this.size,
  });

  final String emojiId;
  final String url;
  final double size;

  @override
  State<_RetryEmojiImage> createState() => _RetryEmojiImageState();
}

class _RetryEmojiImageState extends State<_RetryEmojiImage> {
  static const _kMaxRetries = 3;
  static const _kBaseDelay = Duration(milliseconds: 500);

  int _attempt = 0;
  late int _cacheBuster;

  @override
  void initState() {
    super.initState();
    _cacheBuster = 0;
  }

  void _onError() {
    if (_attempt >= _kMaxRetries || !mounted) {
      return;
    }
    final delay = _kBaseDelay * (1 << _attempt);
    Future.delayed(delay, () {
      if (!mounted) {
        return;
      }
      setState(() {
        _attempt++;
        _cacheBuster++;
      });
    });
  }

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    imageUrl: widget.url,
    cacheKey:
        'emoji_${widget.emojiId}${_cacheBuster > 0 ? '_r$_cacheBuster' : ''}',
    width: widget.size,
    height: widget.size,
    memCacheWidth: widget.size.toInt(),
    memCacheHeight: widget.size.toInt(),
    fit: BoxFit.contain,
    placeholder: (_, _) => SizedBox(width: widget.size, height: widget.size),
    errorBuilder: (_, _, _) {
      _onError();
      return SizedBox(width: widget.size, height: widget.size);
    },
  );
}
