import 'dart:async';
import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/plutonium_upsell_banner.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_rendering_policy.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kGridColumns = 9;
const _kMobileGridColumns = 8;
const _kEmojiSize = 40.0;
const _kCellSize = 48.0;
const _kCustomEmojiRequestSize = 48;

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
    this.channelId,
    this.trackUsageOnSelect = true,
    super.key,
  });

  final OnEmojiSelect? onSelect;
  final ValueChanged<String?>? onHoveredEmojiChanged;
  final String searchQuery;
  final String skinTone;
  final bool isMobile;
  final String? channelId;

  /// Whether selecting an emoji records it in the local frecency store.
  /// Disabled when the picker drives reactions, since those are tracked
  /// centrally in `ChatViewModel.toggleReaction` to avoid double-counting.
  final bool trackUsageOnSelect;

  @override
  ConsumerState<EmojiPickerContent> createState() => _EmojiPickerContentState();
}

class _EmojiPickerData {
  const _EmojiPickerData({
    required this.guilds,
    required this.activeGuildId,
    required this.isPremium,
    required this.canUseExternalEmojis,
    required this.allGuildEmojis,
    required this.frecent,
    required this.favoriteItems,
    required this.collapsedCategories,
    required this.guildEmojisByGuild,
  });

  final List<Guild> guilds;
  final String? activeGuildId;
  final bool isPremium;
  final bool canUseExternalEmojis;
  final List<GuildEmojiEntry> allGuildEmojis;
  final List<EmojiEntry> frecent;
  final List<_FavoriteEmojiItem> favoriteItems;
  final List<String> collapsedCategories;
  final Map<Guild, List<GuildEmojiEntry>> guildEmojisByGuild;
}

sealed class _FavoriteEmojiItem {
  const _FavoriteEmojiItem();

  String get favoriteKey;
}

class _FavoriteUnicodeEmojiItem extends _FavoriteEmojiItem {
  const _FavoriteUnicodeEmojiItem(this.emoji);

  final EmojiEntry emoji;

  @override
  String get favoriteKey => unicodeEmojiFavoriteKey(emoji);
}

class _FavoriteCustomEmojiItem extends _FavoriteEmojiItem {
  const _FavoriteCustomEmojiItem(this.emoji);

  final GuildEmojiEntry emoji;

  @override
  String get favoriteKey => emoji.favoriteKey;
}

@immutable
class _HoverState {
  const _HoverState({this.name, this.customEmoji});

  final String? name;
  final GuildEmojiEntry? customEmoji;

  @override
  bool operator ==(Object other) =>
      other is _HoverState &&
      other.name == name &&
      identical(other.customEmoji, customEmoji);

  @override
  int get hashCode => Object.hash(name, customEmoji);
}

class _EmojiPickerContentState extends ConsumerState<EmojiPickerContent> {
  final _scrollController = ScrollController();
  final _hoverState = ValueNotifier<_HoverState>(const _HoverState());
  final _categoryKeys = <String, GlobalKey>{};

  var _isFirstFrameSettled = false;

  List<Guild>? _cachedGuilds;
  String? _cachedActiveGuildId;
  bool? _cachedIsPremium;
  bool? _cachedCanUseExternalEmojis;
  List<GuildEmojiEntry>? _cachedAllGuildEmojis;
  Map<Guild, List<GuildEmojiEntry>>? _cachedGroupedEmojis;
  List<String>? _cachedFavoriteKeys;
  Map<Guild, List<GuildEmojiEntry>>? _cachedFavoriteGuildEmojisByGuild;
  List<_FavoriteEmojiItem>? _cachedFavoriteItems;

  late final int _upsellPreviewSeed;

  @override
  void initState() {
    super.initState();
    _upsellPreviewSeed = Random().nextInt(0x7fffffff);
    unawaited(EmojiRegistry.ensureLoaded());
    _preloadSkinToneSpriteSheet();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _isFirstFrameSettled = true);
      }
    });
  }

  @override
  void didUpdateWidget(covariant EmojiPickerContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.skinTone != widget.skinTone) {
      _preloadSkinToneSpriteSheet();
    }
  }

  void _preloadSkinToneSpriteSheet() {
    unawaited(EmojiSpriteSheet.preload());
    if (widget.skinTone.isNotEmpty) {
      unawaited(EmojiSpriteSheet.preload(skinTone: widget.skinTone));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hoverState.dispose();
    super.dispose();
  }

  int get _columns => widget.isMobile ? _kMobileGridColumns : _kGridColumns;

  void _setHoveredEmoji(String? name, {GuildEmojiEntry? customEmoji}) {
    _hoverState.value = _HoverState(name: name, customEmoji: customEmoji);
    widget.onHoveredEmojiChanged?.call(name);
  }

  GlobalKey _keyForCategory(String category) => _categoryKeys.putIfAbsent(
    category,
    () => GlobalKey(debugLabel: 'emoji-cat-$category'),
  );

  Map<Guild, List<GuildEmojiEntry>> _groupedEmojisFor({
    required List<Guild> guilds,
    required String? activeGuildId,
    required bool isPremium,
    required bool canUseExternalEmojis,
    required List<GuildEmojiEntry> allGuildEmojis,
  }) {
    final cached = _cachedGroupedEmojis;
    if (cached != null &&
        identical(_cachedGuilds, guilds) &&
        _cachedActiveGuildId == activeGuildId &&
        _cachedIsPremium == isPremium &&
        _cachedCanUseExternalEmojis == canUseExternalEmojis &&
        identical(_cachedAllGuildEmojis, allGuildEmojis)) {
      return cached;
    }
    final grouped = guildEmojiEntriesForPicker(
      guilds: guilds,
      emojis: allGuildEmojis,
      activeGuildId: activeGuildId,
      isPremium: isPremium,
      canUseExternalEmojis: canUseExternalEmojis,
    );
    _cachedGuilds = guilds;
    _cachedActiveGuildId = activeGuildId;
    _cachedIsPremium = isPremium;
    _cachedCanUseExternalEmojis = canUseExternalEmojis;
    _cachedAllGuildEmojis = allGuildEmojis;
    _cachedGroupedEmojis = grouped;
    return grouped;
  }

  void _onEmojiSelected(EmojiEntry emoji) {
    final hasTone = widget.skinTone.isNotEmpty && emoji.hasDiversity;
    final surrogates = hasTone
        ? emoji.surrogates + widget.skinTone
        : emoji.surrogates;
    if (widget.trackUsageOnSelect) {
      unawaited(
        ref
            .read(fluxerDatabaseProvider)
            .emojiUsageDao
            .trackUsage('unicode:${emoji.primaryName}'),
      );
      ref.invalidate(frecentEmojisProvider);
    }
    widget.onSelect?.call(emoji.primaryName, surrogates);
  }

  void _onCustomEmojiSelected(GuildEmojiEntry emoji) {
    if (widget.trackUsageOnSelect) {
      unawaited(
        ref
            .read(fluxerDatabaseProvider)
            .emojiUsageDao
            .trackUsage('custom:${emoji.guildId}:${emoji.id}'),
      );
      ref.invalidate(frecentEmojisProvider);
    }
    widget.onSelect?.call(emoji.name, emoji.markdown);
  }

  void _showUnicodeEmojiActions(EmojiEntry emoji) {
    if (!widget.isMobile) {
      return;
    }
    final key = unicodeEmojiFavoriteKey(emoji);
    _showFavoriteActionSheet(
      title: ':${emoji.primaryName}:',
      favoriteKey: key,
      isFavorite: _isFavoriteEmoji(key),
    );
  }

  void _showCustomEmojiActions(GuildEmojiEntry emoji) {
    if (!widget.isMobile) {
      return;
    }
    final key = emoji.favoriteKey;
    _showFavoriteActionSheet(
      title: ':${emoji.name}:',
      favoriteKey: key,
      isFavorite: _isFavoriteEmoji(key),
    );
  }

  bool _isFavoriteEmoji(String key) =>
      (ref.read(favoriteEmojiKeysProvider).value ?? const <String>[]).contains(
        key,
      );

  void _showFavoriteActionSheet({
    required String title,
    required String favoriteKey,
    required bool isFavorite,
  }) {
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: title,
        variant: FluxerBottomSheetVariant.menu,
        builder: (sheetContext, close) => FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: isFavorite
                    ? 'Remove from Favorites'
                    : 'Add to Favorites',
                icon: isFavorite
                    ? PhosphorIconsRegular.star
                    : PhosphorIconsFill.star,
                onTap: () {
                  close();
                  unawaited(
                    ref
                        .read(favoriteEmojiKeysProvider.notifier)
                        .toggle(favoriteKey),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _EmojiPickerData _watchPickerData() {
    final guilds = ref.watch(guildListViewModelProvider).guilds;
    final activeGuildId = ref.watch(activeGuildIdProvider);
    final hasGlobalExpressions = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
    );
    final canUseExternalEmojis = _watchCanUseExternalEmojis();
    final allGuildEmojis =
        ref.watch(allGuildEmojisForPickerProvider).value ?? const [];
    final frecent = ref.watch(frecentEmojisProvider).value ?? const [];
    final favoriteKeys =
        ref.watch(favoriteEmojiKeysProvider).value ?? const <String>[];
    final collapsedCategories =
        ref.watch(collapsedEmojiPickerCategoriesProvider).value ??
        const <String>[];
    final guildEmojisByGuild = _groupedEmojisFor(
      guilds: guilds,
      activeGuildId: activeGuildId,
      isPremium: hasGlobalExpressions,
      canUseExternalEmojis: canUseExternalEmojis,
      allGuildEmojis: allGuildEmojis,
    );
    final favoriteItems = _favoriteEmojiItems(favoriteKeys, guildEmojisByGuild);

    return _EmojiPickerData(
      guilds: guilds,
      activeGuildId: activeGuildId,
      isPremium: hasGlobalExpressions,
      canUseExternalEmojis: canUseExternalEmojis,
      allGuildEmojis: allGuildEmojis,
      frecent: frecent,
      favoriteItems: favoriteItems,
      collapsedCategories: collapsedCategories,
      guildEmojisByGuild: guildEmojisByGuild,
    );
  }

  bool _watchCanUseExternalEmojis() {
    final channelId = widget.channelId;
    if (channelId == null || channelId.isEmpty) {
      return true;
    }
    return channelMessagePermissionsForComposer(
      ref.watch(channelMessagePermissionsProvider(channelId)),
    ).canUseExternalEmojis;
  }

  Map<Guild, List<GuildEmojiEntry>> _readGuildEmojisByGuild() {
    final guilds = ref.read(guildListViewModelProvider).guilds;
    final activeGuildId = ref.read(activeGuildIdProvider);
    final hasGlobalExpressions = ref.read(
      instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
    );
    final canUseExternalEmojis = _readCanUseExternalEmojis();
    final emojis = ref.read(allGuildEmojisForPickerProvider).value ?? const [];
    return _groupedEmojisFor(
      guilds: guilds,
      activeGuildId: activeGuildId,
      isPremium: hasGlobalExpressions,
      canUseExternalEmojis: canUseExternalEmojis,
      allGuildEmojis: emojis,
    );
  }

  bool _readCanUseExternalEmojis() {
    final channelId = widget.channelId;
    if (channelId == null || channelId.isEmpty) {
      return true;
    }
    return channelMessagePermissionsForComposer(
      ref.read(channelMessagePermissionsProvider(channelId)),
    ).canUseExternalEmojis;
  }

  List<_FavoriteEmojiItem> _favoriteEmojiItems(
    List<String> favoriteKeys,
    Map<Guild, List<GuildEmojiEntry>> guildEmojisByGuild,
  ) {
    final cached = _cachedFavoriteItems;
    if (cached != null &&
        identical(_cachedFavoriteKeys, favoriteKeys) &&
        identical(_cachedFavoriteGuildEmojisByGuild, guildEmojisByGuild)) {
      return cached;
    }

    if (favoriteKeys.isEmpty) {
      _cachedFavoriteKeys = favoriteKeys;
      _cachedFavoriteGuildEmojisByGuild = guildEmojisByGuild;
      _cachedFavoriteItems = const <_FavoriteEmojiItem>[];
      return const <_FavoriteEmojiItem>[];
    }
    final customByKey = <String, GuildEmojiEntry>{};
    for (final emoji in guildEmojisByGuild.values.expand((entry) => entry)) {
      customByKey[emoji.favoriteKey] = emoji;
    }

    final items = <_FavoriteEmojiItem>[];
    for (final key in favoriteKeys) {
      if (key.startsWith('unicode:')) {
        final emoji = EmojiRegistry.entryByName(
          key.substring('unicode:'.length),
        );
        if (emoji != null) {
          items.add(_FavoriteUnicodeEmojiItem(emoji));
        }
        continue;
      }
      final customEmoji = customByKey[key];
      if (customEmoji != null) {
        items.add(_FavoriteCustomEmojiItem(customEmoji));
      }
    }
    _cachedFavoriteKeys = favoriteKeys;
    _cachedFavoriteGuildEmojisByGuild = guildEmojisByGuild;
    _cachedFavoriteItems = items;
    return items;
  }

  void _scrollToCategory(String category) {
    if (!_scrollController.hasClients) {
      return;
    }

    final ctx = _categoryKeys[category]?.currentContext;
    if (ctx != null) {
      unawaited(
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        ),
      );
      return;
    }

    final approxOffset = _approximateOffsetForCategory(category);
    final clamped = approxOffset.clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    unawaited(
      _scrollController
          .animateTo(
            clamped,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          )
          .then((_) => _refineScrollToCategory(category)),
    );
  }

  void _refineScrollToCategory(String category) {
    if (!mounted) {
      return;
    }
    final settled = _categoryKeys[category]?.currentContext;
    if (settled == null) {
      return;
    }
    unawaited(
      Scrollable.ensureVisible(
        settled,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      ),
    );
  }

  double _approximateOffsetForCategory(String category) {
    if (category == 'favorites') {
      return 0;
    }

    final categories = EmojiRegistry.categories;
    final frecent = ref.read(frecentEmojisProvider).value ?? const [];
    final collapsedCategories =
        ref.read(collapsedEmojiPickerCategoriesProvider).value ??
        const <String>[];
    final guildEmojisByGuild = _readGuildEmojisByGuild();
    final favoriteItems = _favoriteEmojiItems(
      ref.read(favoriteEmojiKeysProvider).value ?? const <String>[],
      guildEmojisByGuild,
    );

    double offset = 0;

    if (favoriteItems.isNotEmpty) {
      offset += 26;
      if (!collapsedCategories.contains('favorites')) {
        offset += (favoriteItems.length / _columns).ceil() * _kCellSize;
      }
      offset += 12;
    }

    if (category == 'frequently-used') {
      return offset;
    }

    if (frecent.isNotEmpty) {
      offset += 26;
      if (!collapsedCategories.contains('frequently-used')) {
        offset += (frecent.length / _columns).ceil() * _kCellSize;
      }
      offset += 12;
    }

    for (final entry in guildEmojisByGuild.entries) {
      final guildKey = 'guild-${entry.key.id}';
      if (category == guildKey) {
        return offset;
      }
      offset += 12 + 26;
      if (!collapsedCategories.contains(guildKey)) {
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
      if (!collapsedCategories.contains(cat)) {
        offset += (emojis.length / _columns).ceil() * _kCellSize;
      }
    }

    return offset;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final data = _watchPickerData();

    if (widget.isMobile) {
      return Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              child: _buildEmojiGrid(context, colors, data),
            ),
          ),
          _buildMobileCategoryBar(context, colors, data),
        ],
      );
    }

    return Row(
      children: [
        _buildDesktopCategorySidebar(context, colors, data),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: RepaintBoundary(
                  child: _buildEmojiGrid(context, colors, data),
                ),
              ),
              _buildInspector(context, colors),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUpsellBanner(BuildContext context, _EmojiPickerData data) {
    final lockedGuilds = data.guilds
        .where((guild) => guild.id != data.activeGuildId)
        .toList();
    if (lockedGuilds.isEmpty) {
      return const SizedBox.shrink();
    }
    final allLockedEmojis = lockedGuildEmojiEntriesForUpsell(
      guilds: data.guilds,
      emojis: data.allGuildEmojis,
      activeGuildId: data.activeGuildId,
      isPremium: data.isPremium,
      canUseExternalEmojis: data.canUseExternalEmojis,
    );
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

  Widget _buildEmojiGrid(
    BuildContext context,
    FluxerColorTheme colors,
    _EmojiPickerData data,
  ) {
    if (widget.searchQuery.isNotEmpty) {
      return _buildSearchResults(context, colors, data);
    }
    return _buildCategoryGrid(context, colors, data);
  }

  Widget _buildSearchResults(
    BuildContext context,
    FluxerColorTheme colors,
    _EmojiPickerData data,
  ) {
    final unicodeResults = EmojiRegistry.search(widget.searchQuery);
    final guildEmojis = data.guildEmojisByGuild.values.expand((e) => e);
    final query = widget.searchQuery.toLowerCase();
    final customResults = guildEmojis
        .where((e) => e.name.toLowerCase().contains(query))
        .toList();

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
      scrollCacheExtent: ScrollCacheExtent.pixels(
        _isFirstFrameSettled
            ? emojiPickerCacheExtent(rowHeight: _kCellSize)
            : 0,
      ),
      controller: _scrollController,
      addAutomaticKeepAlives: false,
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
    _EmojiPickerData data,
  ) {
    final categories = EmojiRegistry.categories;
    final favoriteItems = data.favoriteItems;
    final hasFrecent = data.frecent.isNotEmpty;
    final guildEntries = data.guildEmojisByGuild.entries.toList();
    final shouldBuildUpsell = emojiPickerShouldBuildUpsell(
      isPremium: data.isPremium,
      hasSearchQuery: widget.searchQuery.isNotEmpty,
      isFirstFrameSettled: _isFirstFrameSettled,
    );

    return CustomScrollView(
      scrollCacheExtent: ScrollCacheExtent.pixels(
        _isFirstFrameSettled
            ? emojiPickerCacheExtent(rowHeight: _kCellSize)
            : 0,
      ),
      controller: _scrollController,
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 4)),
        if (shouldBuildUpsell)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverToBoxAdapter(
              child: _buildUpsellBanner(context, data),
            ),
          ),
        if (favoriteItems.isNotEmpty) ...[
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _keyForCategory('favorites'),
                child: _buildCategoryHeader('favorites', colors),
              ),
            ),
          ),
          if (!data.collapsedCategories.contains('favorites'))
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: _buildFavoriteEmojiGridSliver(favoriteItems, colors),
            ),
        ],
        if (hasFrecent) ...[
          if (favoriteItems.isNotEmpty)
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _keyForCategory('frequently-used'),
                child: _buildCategoryHeader('frequently-used', colors),
              ),
            ),
          ),
          if (!data.collapsedCategories.contains('frequently-used'))
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: _buildUnicodeEmojiGridSliver(data.frecent, colors),
            ),
        ],
        for (final entry in guildEntries) ...[
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _keyForCategory('guild-${entry.key.id}'),
                child: _buildCategoryHeader(
                  'guild-${entry.key.id}',
                  colors,
                  labelOverride: entry.key.name,
                  guild: entry.key,
                ),
              ),
            ),
          ),
          if (!data.collapsedCategories.contains('guild-${entry.key.id}'))
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: _buildCustomEmojiGridSliver(entry.value, colors),
            ),
        ],
        for (final category in kEmojiCategoryOrder)
          if (categories[category]?.isNotEmpty ?? false) ...[
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _keyForCategory(category),
                  child: _buildCategoryHeader(category, colors),
                ),
              ),
            ),
            if (!data.collapsedCategories.contains(category))
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                sliver: _buildUnicodeEmojiGridSliver(
                  categories[category]!,
                  colors,
                ),
              ),
          ],
        const SliverToBoxAdapter(child: SizedBox(height: 4)),
      ],
    );
  }

  SliverGrid _buildUnicodeEmojiGridSliver(
    List<EmojiEntry> emojis,
    FluxerColorTheme colors,
  ) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
        mainAxisExtent: _kCellSize,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildEmojiCell(emojis[index], colors),
        childCount: emojis.length,
        addAutomaticKeepAlives: false,
      ),
    );
  }

  SliverGrid _buildFavoriteEmojiGridSliver(
    List<_FavoriteEmojiItem> emojis,
    FluxerColorTheme colors,
  ) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
        mainAxisExtent: _kCellSize,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = emojis[index];
          return switch (item) {
            _FavoriteUnicodeEmojiItem(:final emoji) => _buildEmojiCell(
              emoji,
              colors,
            ),
            _FavoriteCustomEmojiItem(:final emoji) => _buildCustomEmojiCell(
              emoji,
              colors,
            ),
          };
        },
        childCount: emojis.length,
        addAutomaticKeepAlives: false,
      ),
    );
  }

  SliverGrid _buildCustomEmojiGridSliver(
    List<GuildEmojiEntry> emojis,
    FluxerColorTheme colors,
  ) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
        mainAxisExtent: _kCellSize,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildCustomEmojiCell(emojis[index], colors),
        childCount: emojis.length,
        addAutomaticKeepAlives: false,
      ),
    );
  }

  Widget _buildCategoryHeader(
    String category,
    FluxerColorTheme colors, {
    String? labelOverride,
    Guild? guild,
  }) {
    final l10n = FluxerLocalizations.of(context);
    final collapsedCategories =
        ref.watch(collapsedEmojiPickerCategoriesProvider).value ??
        const <String>[];
    final isCollapsed = collapsedCategories.contains(category);
    final label =
        labelOverride ??
        switch (category) {
          'favorites' => 'Favorites',
          'frequently-used' => l10n.emojiFrequentlyUsed,
          _ => _categoryLabel(category, l10n),
        };
    final leadingIcon = guild != null
        ? _GuildIcon(guild: guild, size: 16)
        : category == 'favorites'
        ? PhosphorIcon(
            PhosphorIconsFill.star,
            size: 16,
            color: colors.textPrimaryMuted,
          )
        : category == 'frequently-used'
        ? PhosphorIcon(
            PhosphorIconsFill.clock,
            size: 16,
            color: colors.textPrimaryMuted,
          )
        : null;

    return GestureDetector(
      onTap: () => unawaited(
        ref
            .read(collapsedEmojiPickerCategoriesProvider.notifier)
            .toggle(category),
      ),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            if (leadingIcon != null) ...[leadingIcon, const SizedBox(width: 8)],
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
    final usesHover = emojiPickerUsesHoverTracking(isMobile: widget.isMobile);
    final sprite = hasTone
        ? SpriteEmoji(
            index: emoji.spriteIndex,
            diversityIndex: emoji.diversityIndex,
            size: _kEmojiSize,
            skinTone: widget.skinTone,
          )
        : SpriteEmoji(index: emoji.spriteIndex, size: _kEmojiSize);

    if (!usesHover) {
      return _PressableEmojiCell(
        onTap: () => _onEmojiSelected(emoji),
        onLongPress: () => _showUnicodeEmojiActions(emoji),
        child: Center(child: sprite),
      );
    }

    return _PressableEmojiCell(
      onTap: () => _onEmojiSelected(emoji),
      onLongPress: () => _showUnicodeEmojiActions(emoji),
      child: MouseRegion(
        onEnter: (_) => _setHoveredEmoji(emoji.primaryName),
        onExit: (_) => _setHoveredEmoji(null),
        child: ValueListenableBuilder<_HoverState>(
          valueListenable: _hoverState,
          builder: (context, state, child) {
            final isHovered =
                state.name == emoji.primaryName && state.customEmoji == null;
            return DecoratedBox(
              decoration: BoxDecoration(
                color: isHovered
                    ? colors.backgroundModifierSelected
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: child,
            );
          },
          child: Center(child: sprite),
        ),
      ),
    );
  }

  Widget _buildCustomEmojiCell(GuildEmojiEntry emoji, FluxerColorTheme colors) {
    final usesHover = emojiPickerUsesHoverTracking(isMobile: widget.isMobile);
    // Picker only renders the first frame, so always request the static WebP.
    // Animated WebPs carry per-frame metadata that makes _initEncoded
    // substantially heavier even when only the first frame is consumed.
    final image = CachedEmojiImage(
      key: ValueKey(emoji.id),
      emojiId: emoji.id,
      animated: false,
      requestSize: _kCustomEmojiRequestSize,
      size: _kEmojiSize,
      errorBuilder: (ctx) => SizedBox(
        width: _kEmojiSize,
        height: _kEmojiSize,
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsRegular.imageBroken,
            size: _kEmojiSize * 0.55,
            color: colors.textTertiary,
          ),
        ),
      ),
    );

    if (!usesHover) {
      return _PressableEmojiCell(
        onTap: () => _onCustomEmojiSelected(emoji),
        onLongPress: () => _showCustomEmojiActions(emoji),
        child: Center(child: image),
      );
    }

    return _PressableEmojiCell(
      onTap: () => _onCustomEmojiSelected(emoji),
      onLongPress: () => _showCustomEmojiActions(emoji),
      child: MouseRegion(
        onEnter: (_) => _setHoveredEmoji(emoji.name, customEmoji: emoji),
        onExit: (_) => _setHoveredEmoji(null),
        child: ValueListenableBuilder<_HoverState>(
          valueListenable: _hoverState,
          builder: (context, state, child) {
            final isHovered = state.customEmoji?.id == emoji.id;
            return DecoratedBox(
              decoration: BoxDecoration(
                color: isHovered
                    ? colors.backgroundModifierSelected
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: child,
            );
          },
          child: Center(child: image),
        ),
      ),
    );
  }

  Widget _buildDesktopCategorySidebar(
    BuildContext context,
    FluxerColorTheme colors,
    _EmojiPickerData data,
  ) {
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
          if (data.favoriteItems.isNotEmpty)
            _CategoryButton(
              icon: PhosphorIconsFill.star,
              tooltip: 'Favorites',
              onTap: () => _scrollToCategory('favorites'),
            ),
          if (data.frecent.isNotEmpty)
            _CategoryButton(
              icon: PhosphorIconsFill.clock,
              tooltip: l10n.emojiFrequentlyUsed,
              onTap: () => _scrollToCategory('frequently-used'),
            ),
          ...data.guildEmojisByGuild.keys.map(
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
    _EmojiPickerData data,
  ) {
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
          if (data.favoriteItems.isNotEmpty)
            _CategoryButton(
              icon: PhosphorIconsFill.star,
              tooltip: 'Favorites',
              onTap: () => _scrollToCategory('favorites'),
            ),
          if (data.frecent.isNotEmpty)
            _CategoryButton(
              icon: PhosphorIconsFill.clock,
              tooltip: l10n.emojiFrequentlyUsed,
              onTap: () => _scrollToCategory('frequently-used'),
            ),
          ...data.guildEmojisByGuild.keys.map(
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
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
      ),
      child: ValueListenableBuilder<_HoverState>(
        valueListenable: _hoverState,
        builder: (context, state, _) {
          final customEmoji = state.customEmoji;
          if (customEmoji != null) {
            return Row(
              children: [
                CachedEmojiImage(
                  emojiId: customEmoji.id,
                  animated: false,
                  requestSize: _kCustomEmojiRequestSize,
                  size: 32,
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
            );
          }

          final name = state.name;
          final emoji = name != null ? EmojiRegistry.entryByName(name) : null;
          if (emoji == null) {
            return const SizedBox.shrink();
          }
          final hasTone = widget.skinTone.isNotEmpty && emoji.hasDiversity;

          return Row(
            children: [
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
          );
        },
      ),
    );
  }
}

class _PressableEmojiCell extends StatefulWidget {
  const _PressableEmojiCell({
    required this.child,
    this.onTap,
    this.onLongPress,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  State<_PressableEmojiCell> createState() => _PressableEmojiCellState();
}

class _PressableEmojiCellState extends State<_PressableEmojiCell> {
  bool _isPressed = false;

  void _setPressed(bool value) {
    if (_isPressed == value) {
      return;
    }
    setState(() => _isPressed = value);
  }

  void _handleTapDown(TapDownDetails details) => _setPressed(true);

  void _handleTapUp(TapUpDetails details) => _setPressed(false);

  void _handleTapCancel() => _setPressed(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: widget.key,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 120),
        opacity: _isPressed ? 0.6 : 1,
        child: widget.child,
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
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(6),
    child: SizedBox(
      width: 36,
      height: 36,
      child: Center(child: _GuildIcon(guild: guild, size: 24)),
    ),
  );
}

class _GuildIcon extends StatelessWidget {
  const _GuildIcon({required this.guild, required this.size});

  final Guild guild;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final iconUrl = guild.iconUrl;

    if (iconUrl == null) {
      return _GuildInitial(name: guild.name, colors: colors, size: size);
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: iconUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) =>
            _GuildInitial(name: guild.name, colors: colors, size: size),
      ),
    );
  }
}

class _GuildInitial extends StatelessWidget {
  const _GuildInitial({
    required this.name,
    required this.colors,
    required this.size,
  });

  final String name;
  final FluxerColorTheme colors;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: colors.backgroundSecondary,
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    child: Text(
      name.isNotEmpty ? name[0].toUpperCase() : '?',
      style: TextStyle(
        fontSize: size <= 16 ? 8 : 11,
        fontWeight: FontWeight.w600,
        color: colors.textPrimaryMuted,
      ),
    ),
  );
}
