import 'dart:async';
import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/plutonium_upsell_banner.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_layout_index.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_precache.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_rendering_policy.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_visibility.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kGridColumns = 9;
const _kMobileGridColumns = 8;
const _kEmojiSize = 40.0;
const _kCellSize = 48.0;
const double _kMobileCategoryBarHeight = 44;
const int _kCustomEmojiRequestSize = kCustomEmojiPickerFetchSize;

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
    this.scrollController,
    this.trackUsageOnSelect = true,
    super.key,
  });

  final OnEmojiSelect? onSelect;
  final ValueChanged<String?>? onHoveredEmojiChanged;
  final String searchQuery;
  final String skinTone;
  final bool isMobile;
  final String? channelId;
  final ScrollController? scrollController;

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
  final List<FrecentEmojiItem> frecent;
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
  ScrollController? _ownedScrollController;
  final _hoverState = ValueNotifier<_HoverState>(const _HoverState());
  final _visibilityNotifier = ValueNotifier<EmojiPickerVisibilityState>(
    const EmojiPickerVisibilityState(),
  );
  final _categoryKeys = <String, GlobalKey>{};
  final _categoryButtonKeys = <String, GlobalKey>{};

  ScrollController get _scrollController =>
      widget.scrollController ??
      (_ownedScrollController ??= ScrollController());

  var _isFirstFrameSettled = false;
  var _didSchedulePrefetch = false;
  var _cancelPrefetch = false;
  var _scrollSettled = true;
  Timer? _scrollSettleTimer;
  double _viewportHeight = 0;
  EmojiPickerLayoutIndex? _layoutIndex;
  List<GuildEmojiEntry>? _searchCustomResults;
  final Set<String> _prefetchedAheadIds = <String>{};
  String? _lastEnsuredCategoryKey;

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
    _scrollController.addListener(_handleEmojiPickerScroll);
  }

  void _handleEmojiPickerScroll() {
    _scrollSettled = false;
    _scrollSettleTimer?.cancel();
    _scrollSettleTimer = Timer(kEmojiPickerScrollSettleDelay, () {
      if (!mounted) {
        return;
      }
      _scrollSettled = true;
      _syncPickerVisibility();
      _prefetchAhead();
    });
    _syncPickerVisibility();
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
    _scrollController.removeListener(_handleEmojiPickerScroll);
    _scrollSettleTimer?.cancel();
    _cancelPrefetch = true;
    _visibilityNotifier.dispose();
    _ownedScrollController?.dispose();
    _hoverState.dispose();
    super.dispose();
  }

  int get _columns => widget.isMobile ? _kMobileGridColumns : _kGridColumns;

  void _setHoveredEmoji(String? name, {GuildEmojiEntry? customEmoji}) {
    _hoverState.value = _HoverState(name: name, customEmoji: customEmoji);
    widget.onHoveredEmojiChanged?.call(name);
  }

  GlobalKey _keyForCategoryButton(String category) =>
      _categoryButtonKeys.putIfAbsent(
        category,
        () => GlobalKey(debugLabel: 'emoji-cat-btn-$category'),
      );

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

  String _displaySurrogatesFor(EmojiEntry emoji) {
    if (widget.skinTone.isNotEmpty && emoji.hasDiversity) {
      return EmojiRegistry.resolveSkinToneSurrogates(emoji, widget.skinTone);
    }
    return emoji.surrogates;
  }

  void _onEmojiSelected(EmojiEntry emoji) {
    final surrogates = _displaySurrogatesFor(emoji);
    if (widget.trackUsageOnSelect) {
      unawaited(
        ref
            .read(fluxerDatabaseProvider)
            .emojiUsageDao
            .trackUsage('unicode:${emoji.primaryName}'),
      );
      ref.invalidate(rankedEmojiUsageKeysProvider);
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
      ref.invalidate(rankedEmojiUsageKeysProvider);
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
                    ? PhosphorIconsBold.star
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

  bool _pickerShowsAllGuildEmojis({
    required String? channelId,
    required bool hasGlobalExpressions,
    required List<DmConversation> dmConversations,
    required String? currentUserId,
  }) {
    return composerHasDirectChatEmojiAccess(
      channelId: channelId,
      dmConversations: dmConversations,
      currentUserId: currentUserId,
      hasGlobalExpressions: hasGlobalExpressions,
    );
  }

  _EmojiPickerData _watchPickerData() {
    final guilds = guildsForExpressionPicker(
      organized: ref.watch(organizedGuildListProvider),
      activeGuildId: ref.watch(contextualGuildIdProvider),
    );
    final activeGuildId = ref.watch(contextualGuildIdProvider);
    final String? channelId = widget.channelId;
    final List<DmConversation> dmConversations = ref.watch(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool hasGlobalExpressions = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
    );
    final bool hasPlutoniumEmojiAccess = _pickerShowsAllGuildEmojis(
      channelId: channelId,
      hasGlobalExpressions: hasGlobalExpressions,
      dmConversations: dmConversations,
      currentUserId: currentUserId,
    );
    final canUseExternalEmojis = _watchCanUseExternalEmojis();
    final allGuildEmojis =
        ref.watch(allGuildEmojisForPickerProvider).value ?? const [];
    final favoriteKeys =
        ref.watch(favoriteEmojiKeysProvider).value ?? const <String>[];
    final collapsedCategories =
        ref.watch(collapsedEmojiPickerCategoriesProvider).value ??
        const <String>[];
    final guildEmojisByGuild = _groupedEmojisFor(
      guilds: guilds,
      activeGuildId: activeGuildId,
      isPremium: hasPlutoniumEmojiAccess,
      canUseExternalEmojis: canUseExternalEmojis,
      allGuildEmojis: allGuildEmojis,
    );
    final customEmojisById = <String, GuildEmojiEntry>{
      for (final GuildEmojiEntry emoji in guildEmojisByGuild.values.expand(
        (emojis) => emojis,
      ))
        emoji.id: emoji,
    };
    final rankedUsageKeys =
        ref.watch(rankedEmojiUsageKeysProvider).value ?? const <String>[];
    final frecent = buildPickerFrecentEmojis(
      rankedUsageKeys: rankedUsageKeys,
      availableCustomEmojisById: customEmojisById,
    );
    final favoriteItems = _favoriteEmojiItems(favoriteKeys, guildEmojisByGuild);

    return _EmojiPickerData(
      guilds: guilds,
      activeGuildId: activeGuildId,
      isPremium: hasPlutoniumEmojiAccess,
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
    return watchChannelMessagePermissionsForComposer(
      ref,
      channelId,
    ).canUseExternalEmojis;
  }

  Map<Guild, List<GuildEmojiEntry>> _readGuildEmojisByGuild() {
    final activeGuildId = ref.read(contextualGuildIdProvider);
    final guilds = guildsForExpressionPicker(
      organized: ref.read(organizedGuildListProvider),
      activeGuildId: activeGuildId,
    );
    final String? channelId = widget.channelId;
    final bool hasGlobalExpressions = ref.read(
      instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
    );
    final bool hasPlutoniumEmojiAccess = _pickerShowsAllGuildEmojis(
      channelId: channelId,
      hasGlobalExpressions: hasGlobalExpressions,
      dmConversations: ref.read(dmViewModelProvider).conversations,
      currentUserId: ref.read(currentUserIdProvider),
    );
    final canUseExternalEmojis = _readCanUseExternalEmojis();
    final emojis = ref.read(allGuildEmojisForPickerProvider).value ?? const [];
    return _groupedEmojisFor(
      guilds: guilds,
      activeGuildId: activeGuildId,
      isPremium: hasPlutoniumEmojiAccess,
      canUseExternalEmojis: canUseExternalEmojis,
      allGuildEmojis: emojis,
    );
  }

  bool _readCanUseExternalEmojis() {
    final channelId = widget.channelId;
    if (channelId == null || channelId.isEmpty) {
      return true;
    }
    return readChannelMessagePermissionsForComposer(
      ref,
      channelId,
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

  List<EmojiPickerFavoriteRowItem> _favoriteRowItems(
    List<_FavoriteEmojiItem> items,
  ) {
    return items
        .map(
          (item) => switch (item) {
            _FavoriteUnicodeEmojiItem(:final emoji) =>
              EmojiPickerFavoriteUnicodeRowItem(emoji),
            _FavoriteCustomEmojiItem(:final emoji) =>
              EmojiPickerFavoriteCustomRowItem(emoji),
          },
        )
        .toList(growable: false);
  }

  List<MapEntry<String, List<GuildEmojiEntry>>> _guildSections(
    _EmojiPickerData data,
  ) {
    return data.guildEmojisByGuild.entries
        .map((entry) => MapEntry('guild-${entry.key.id}', entry.value))
        .toList(growable: false);
  }

  List<GuildEmojiEntry> _customEmojisFromFavorites(
    List<_FavoriteEmojiItem> items,
  ) {
    return items
        .whereType<_FavoriteCustomEmojiItem>()
        .map((item) => item.emoji)
        .toList(growable: false);
  }

  List<GuildEmojiEntry> _customEmojisFromFrecent(List<FrecentEmojiItem> items) {
    return items
        .whereType<FrecentCustomEmoji>()
        .map((item) => item.emoji)
        .toList(growable: false);
  }

  EmojiPickerLayoutIndex _buildLayoutIndex({
    required _EmojiPickerData data,
    required bool includeUpsell,
  }) {
    return buildEmojiPickerLayoutIndex(
      unicodeCategories: EmojiRegistry.categories,
      favoriteItems: _favoriteRowItems(data.favoriteItems),
      frecentItems: data.frecent,
      guildSections: _guildSections(data),
      collapsedCategories: data.collapsedCategories,
      columns: _columns,
      includeUpsell: includeUpsell,
    );
  }

  void _schedulePrefetch(_EmojiPickerData data) {
    if (_didSchedulePrefetch) {
      return;
    }
    _didSchedulePrefetch = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }
      await prefetchEmojiPickerForGuildContext(
        context: context,
        allGuildEmojis: data.allGuildEmojis,
        activeGuildId: data.activeGuildId,
        favoriteCustomEmojis: _customEmojisFromFavorites(data.favoriteItems),
        frecentCustomEmojis: _customEmojisFromFrecent(data.frecent),
        isMobile: widget.isMobile,
        isCancelled: () => _cancelPrefetch,
      );
    });
  }

  void _trackEmojiGrid({
    required double viewportHeight,
    EmojiPickerLayoutIndex? layoutIndex,
    List<GuildEmojiEntry>? searchCustomResults,
  }) {
    _viewportHeight = viewportHeight;
    _layoutIndex = layoutIndex;
    _searchCustomResults = searchCustomResults;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _syncPickerVisibility();
      }
    });
  }

  bool get _isScrollSettled => _scrollSettled;

  void _syncPickerVisibility() {
    if (!_scrollController.hasClients || _viewportHeight <= 0) {
      return;
    }
    final double scrollOffset = _scrollController.offset;
    final bool scrollSettled = _isScrollSettled;
    final Set<String> animatedIds = _searchCustomResults != null
        ? animatedCustomEmojiIdsForSearchGrid(
            customResults: _searchCustomResults!,
            columns: _columns,
            scrollOffset: scrollOffset,
            viewportHeight: _viewportHeight,
            maxAnimated: kEmojiPickerMaxAnimatedEmojis,
            scrollSettled: scrollSettled,
          )
        : _layoutIndex?.animatedCustomEmojiIds(
                scrollOffset: scrollOffset,
                viewportHeight: _viewportHeight,
                maxAnimated: kEmojiPickerMaxAnimatedEmojis,
                scrollSettled: scrollSettled,
              ) ??
              const <String>{};
    final String? activeCategoryKey = _searchCustomResults == null
        ? _layoutIndex?.activeCategoryKey(scrollOffset)
        : null;
    final EmojiPickerVisibilityState next = EmojiPickerVisibilityState(
      animatedCustomEmojiIds: animatedIds,
      activeCategoryKey: activeCategoryKey,
    );
    if (next == _visibilityNotifier.value) {
      return;
    }
    _visibilityNotifier.value = next;
    _ensureActiveCategoryVisible(activeCategoryKey);
  }

  void _ensureActiveCategoryVisible(String? categoryKey) {
    if (!widget.isMobile || categoryKey == null) {
      return;
    }
    if (_lastEnsuredCategoryKey == categoryKey) {
      return;
    }
    _lastEnsuredCategoryKey = categoryKey;
    final BuildContext? buttonContext =
        _categoryButtonKeys[categoryKey]?.currentContext;
    if (buttonContext == null) {
      _lastEnsuredCategoryKey = null;
      return;
    }
    Scrollable.ensureVisible(
      buttonContext,
      duration: context.motion.normal,
      alignment: 0.5,
      curve: Curves.easeOut,
    );
  }

  void _prefetchAhead() {
    if (!mounted || _layoutIndex == null || _searchCustomResults != null) {
      return;
    }
    final List<GuildEmojiEntry> ahead = _layoutIndex!
        .customEmojisAhead(
          scrollOffset: _scrollController.offset,
          viewportHeight: _viewportHeight,
          count: kEmojiPickerScrollAheadCount,
        )
        .where((GuildEmojiEntry emoji) => _prefetchedAheadIds.add(emoji.id))
        .toList(growable: false);
    if (ahead.isEmpty) {
      return;
    }
    unawaited(
      prefetchEmojiPickerCustomEmojis(
        context: context,
        emojis: ahead,
        prefetchAnimated: emojiPickerPrefetchAnimatedUrls(
          isMobile: widget.isMobile,
        ),
        isCancelled: () => _cancelPrefetch,
        limit: ahead.length,
      ),
    );
  }

  void _scrollToCategory(String category) {
    _lastEnsuredCategoryKey = category;
    if (!_scrollController.hasClients) {
      return;
    }

    final ctx = _categoryKeys[category]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: context.motion.panel,
        curve: Curves.easeOut,
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
            duration: context.motion.panel,
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
    Scrollable.ensureVisible(
      settled,
      duration: context.motion.fast,
      curve: Curves.easeOut,
    );
  }

  double _approximateOffsetForCategory(String category) {
    if (category == 'favorites') {
      return 0;
    }

    final categories = EmojiRegistry.categories;
    final collapsedCategories =
        ref.read(collapsedEmojiPickerCategoriesProvider).value ??
        const <String>[];
    final guildEmojisByGuild = _readGuildEmojisByGuild();
    final customEmojisById = <String, GuildEmojiEntry>{
      for (final GuildEmojiEntry emoji in guildEmojisByGuild.values.expand(
        (emojis) => emojis,
      ))
        emoji.id: emoji,
    };
    final rankedUsageKeys =
        ref.read(rankedEmojiUsageKeysProvider).value ?? const <String>[];
    final frecent = buildPickerFrecentEmojis(
      rankedUsageKeys: rankedUsageKeys,
      availableCustomEmojisById: customEmojisById,
    );
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
    _schedulePrefetch(data);

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
    final Widget grid = widget.searchQuery.isNotEmpty
        ? _buildSearchResults(context, colors, data)
        : _buildCategoryGrid(context, colors, data);
    return EmojiPickerVisibilityScope(
      notifier: _visibilityNotifier,
      child: grid,
    );
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
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    final totalCount = customResults.length + unicodeResults.length;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _trackEmojiGrid(
          viewportHeight: constraints.maxHeight,
          searchCustomResults: customResults,
        );
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
      },
    );
  }

  Widget _buildCategoryGrid(
    BuildContext context,
    FluxerColorTheme colors,
    _EmojiPickerData data,
  ) {
    final shouldBuildUpsell = emojiPickerShouldBuildUpsell(
      isPremium: data.isPremium,
      hasSearchQuery: widget.searchQuery.isNotEmpty,
      isFirstFrameSettled: _isFirstFrameSettled,
    );
    final EmojiPickerLayoutIndex layoutIndex = _buildLayoutIndex(
      data: data,
      includeUpsell: shouldBuildUpsell,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _trackEmojiGrid(
          viewportHeight: constraints.maxHeight,
          layoutIndex: layoutIndex,
        );
        return CustomScrollView(
          scrollCacheExtent: ScrollCacheExtent.pixels(
            _isFirstFrameSettled
                ? emojiPickerCacheExtent(rowHeight: _kCellSize)
                : 0,
          ),
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => _buildLayoutEntry(
                    context,
                    layoutIndex.entries[index],
                    colors,
                    data,
                    shouldBuildUpsell: shouldBuildUpsell,
                  ),
                  childCount: layoutIndex.entries.length,
                  addAutomaticKeepAlives: false,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLayoutEntry(
    BuildContext context,
    EmojiPickerLayoutEntry entry,
    FluxerColorTheme colors,
    _EmojiPickerData data, {
    required bool shouldBuildUpsell,
  }) {
    return switch (entry) {
      EmojiPickerTopPaddingEntry() => const SizedBox(
        height: kEmojiPickerTopPadding,
      ),
      EmojiPickerUpsellEntry() =>
        shouldBuildUpsell
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _buildUpsellBanner(context, data),
              )
            : const SizedBox.shrink(),
      EmojiPickerSectionGapEntry() => const SizedBox(
        height: kEmojiPickerSectionGap,
      ),
      EmojiPickerSectionHeaderEntry(:final categoryKey) => KeyedSubtree(
        key: _keyForCategory(categoryKey),
        child: _buildCategoryHeader(
          categoryKey,
          colors,
          data.collapsedCategories,
          labelOverride: _headerLabelOverride(categoryKey, data),
          guild: _headerGuild(categoryKey, data),
        ),
      ),
      EmojiPickerCustomEmojiRowEntry(:final emojis) => SizedBox(
        height: kEmojiPickerCellSize,
        child: Row(
          children: [
            for (final GuildEmojiEntry emoji in emojis)
              Expanded(child: _buildCustomEmojiCell(emoji, colors)),
            for (var index = emojis.length; index < _columns; index++)
              const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
      EmojiPickerUnicodeEmojiRowEntry(:final emojis) => SizedBox(
        height: kEmojiPickerCellSize,
        child: Row(
          children: [
            for (final EmojiEntry emoji in emojis)
              Expanded(child: _buildEmojiCell(emoji, colors)),
            for (var index = emojis.length; index < _columns; index++)
              const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
      EmojiPickerFavoriteEmojiRowEntry(:final items) => SizedBox(
        height: kEmojiPickerCellSize,
        child: Row(
          children: [
            for (final EmojiPickerFavoriteRowItem item in items)
              Expanded(child: _buildFavoriteRowCell(item, colors)),
            for (var index = items.length; index < _columns; index++)
              const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
      EmojiPickerFrecentEmojiRowEntry(:final items) => SizedBox(
        height: kEmojiPickerCellSize,
        child: Row(
          children: [
            for (final FrecentEmojiItem item in items)
              Expanded(child: _buildFrecentRowCell(item, colors)),
            for (var index = items.length; index < _columns; index++)
              const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    };
  }

  String? _headerLabelOverride(String categoryKey, _EmojiPickerData data) {
    if (!categoryKey.startsWith('guild-')) {
      return null;
    }
    final String guildId = categoryKey.substring('guild-'.length);
    for (final MapEntry<Guild, List<GuildEmojiEntry>> entry
        in data.guildEmojisByGuild.entries) {
      if (entry.key.id == guildId) {
        return entry.key.name;
      }
    }
    return null;
  }

  Guild? _headerGuild(String categoryKey, _EmojiPickerData data) {
    if (!categoryKey.startsWith('guild-')) {
      return null;
    }
    final String guildId = categoryKey.substring('guild-'.length);
    for (final Guild guild in data.guildEmojisByGuild.keys) {
      if (guild.id == guildId) {
        return guild;
      }
    }
    return null;
  }

  Widget _buildFavoriteRowCell(
    EmojiPickerFavoriteRowItem item,
    FluxerColorTheme colors,
  ) {
    return switch (item) {
      EmojiPickerFavoriteUnicodeRowItem(:final emoji) => _buildEmojiCell(
        emoji,
        colors,
      ),
      EmojiPickerFavoriteCustomRowItem(:final emoji) => _buildCustomEmojiCell(
        emoji,
        colors,
      ),
    };
  }

  Widget _buildFrecentRowCell(FrecentEmojiItem item, FluxerColorTheme colors) {
    return switch (item) {
      FrecentUnicodeEmoji(:final emoji) => _buildEmojiCell(emoji, colors),
      FrecentCustomEmoji(:final emoji) => _buildCustomEmojiCell(emoji, colors),
    };
  }

  Widget _buildCategoryHeader(
    String category,
    FluxerColorTheme colors,
    List<String> collapsedCategories, {
    String? labelOverride,
    Guild? guild,
  }) {
    final l10n = FluxerLocalizations.of(context);
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

    return Semantics(
      button: true,
      expanded: !isCollapsed,
      label: label,
      child: FluxerGestureDetector(
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
              if (leadingIcon != null) ...[
                leadingIcon,
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: context.textStyles.categoryName.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.textPrimaryMuted,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedRotation(
                turns: isCollapsed ? -0.25 : 0,
                duration: context.motion.panel,
                child: PhosphorIcon(
                  PhosphorIconsBold.caretDown,
                  size: 12,
                  color: colors.textPrimaryMuted,
                ),
              ),
            ],
          ),
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
        semanticLabel: emoji.primaryName,
        onTap: () => _onEmojiSelected(emoji),
        onLongPress: () => _showUnicodeEmojiActions(emoji),
        usePressFeedback: !widget.isMobile,
        child: Center(child: sprite),
      );
    }

    return _PressableEmojiCell(
      semanticLabel: emoji.primaryName,
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

  Widget _buildCustomEmojiImage(
    GuildEmojiEntry emoji,
    FluxerColorTheme colors, {
    required bool animate,
  }) {
    return CachedEmojiImage(
      key: ValueKey(emoji.id),
      emojiId: emoji.id,
      animated: widget.isMobile && emoji.animated,
      isInView: widget.isMobile && emoji.animated ? animate : null,
      requestSize: _kCustomEmojiRequestSize,
      size: _kEmojiSize,
      errorBuilder: (ctx) => SizedBox(
        width: _kEmojiSize,
        height: _kEmojiSize,
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsBold.imageBroken,
            size: _kEmojiSize * 0.55,
            color: colors.textTertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomEmojiCell(GuildEmojiEntry emoji, FluxerColorTheme colors) {
    final usesHover = emojiPickerUsesHoverTracking(isMobile: widget.isMobile);
    final bool trackAnimation = widget.isMobile && emoji.animated;
    final Widget image = trackAnimation
        ? ListenableBuilder(
            listenable: _visibilityNotifier,
            builder: (BuildContext context, Widget? _) {
              final bool animate = EmojiPickerVisibilityScope.shouldAnimate(
                context,
                emoji.id,
              );
              return _buildCustomEmojiImage(emoji, colors, animate: animate);
            },
          )
        : _buildCustomEmojiImage(emoji, colors, animate: false);

    if (!usesHover) {
      return _PressableEmojiCell(
        semanticLabel: emoji.name,
        onTap: () => _onCustomEmojiSelected(emoji),
        onLongPress: () => _showCustomEmojiActions(emoji),
        usePressFeedback: !widget.isMobile,
        child: Center(child: image),
      );
    }

    return _PressableEmojiCell(
      semanticLabel: emoji.name,
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
      child: ListenableBuilder(
        listenable: _visibilityNotifier,
        builder: (BuildContext context, Widget? _) {
          final String? activeCategory =
              EmojiPickerVisibilityScope.activeCategory(context);
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              if (data.favoriteItems.isNotEmpty)
                _CategoryButton(
                  key: _keyForCategoryButton('favorites'),
                  icon: PhosphorIconsFill.star,
                  tooltip: 'Favorites',
                  isActive: activeCategory == 'favorites',
                  onTap: () => _scrollToCategory('favorites'),
                ),
              if (data.frecent.isNotEmpty)
                _CategoryButton(
                  key: _keyForCategoryButton('frequently-used'),
                  icon: PhosphorIconsFill.clock,
                  tooltip: l10n.emojiFrequentlyUsed,
                  isActive: activeCategory == 'frequently-used',
                  onTap: () => _scrollToCategory('frequently-used'),
                ),
              ...data.guildEmojisByGuild.keys.map(
                (Guild guild) => _GuildCategoryButton(
                  key: _keyForCategoryButton('guild-${guild.id}'),
                  guild: guild,
                  isActive: activeCategory == 'guild-${guild.id}',
                  onTap: () => _scrollToCategory('guild-${guild.id}'),
                ),
              ),
              ...kEmojiCategoryOrder.map((String cat) {
                final IconData? icon = _kCategoryIcons[cat];
                if (icon == null) {
                  return const SizedBox.shrink();
                }
                return _CategoryButton(
                  key: _keyForCategoryButton(cat),
                  icon: icon,
                  tooltip: _categoryLabel(cat, l10n),
                  isActive: activeCategory == cat,
                  onTap: () => _scrollToCategory(cat),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMobileCategoryBar(
    BuildContext context,
    FluxerColorTheme colors,
    _EmojiPickerData data,
  ) {
    final l10n = FluxerLocalizations.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
      ),
      child: SizedBox(
        height: _kMobileCategoryBarHeight,
        child: ListenableBuilder(
          listenable: _visibilityNotifier,
          builder: (BuildContext context, Widget? _) {
            final String? activeCategory =
                EmojiPickerVisibilityScope.activeCategory(context);
            return ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                if (data.favoriteItems.isNotEmpty)
                  _CategoryButton(
                    key: _keyForCategoryButton('favorites'),
                    icon: PhosphorIconsFill.star,
                    tooltip: 'Favorites',
                    isActive: activeCategory == 'favorites',
                    onTap: () => _scrollToCategory('favorites'),
                  ),
                if (data.frecent.isNotEmpty)
                  _CategoryButton(
                    key: _keyForCategoryButton('frequently-used'),
                    icon: PhosphorIconsFill.clock,
                    tooltip: l10n.emojiFrequentlyUsed,
                    isActive: activeCategory == 'frequently-used',
                    onTap: () => _scrollToCategory('frequently-used'),
                  ),
                ...data.guildEmojisByGuild.keys.map(
                  (Guild guild) => _GuildCategoryButton(
                    key: _keyForCategoryButton('guild-${guild.id}'),
                    guild: guild,
                    isActive: activeCategory == 'guild-${guild.id}',
                    onTap: () => _scrollToCategory('guild-${guild.id}'),
                  ),
                ),
                ...kEmojiCategoryOrder.map((String cat) {
                  final IconData? icon = _kCategoryIcons[cat];
                  if (icon == null) {
                    return const SizedBox.shrink();
                  }
                  return _CategoryButton(
                    key: _keyForCategoryButton(cat),
                    icon: icon,
                    tooltip: _categoryLabel(cat, l10n),
                    isActive: activeCategory == cat,
                    onTap: () => _scrollToCategory(cat),
                  );
                }),
              ],
            );
          },
        ),
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
                  animated: customEmoji.animated,
                  pauseWhenOffscreen: false,
                  requestSize: _kCustomEmojiRequestSize,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ':${customEmoji.name}:',
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                    ),
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
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                  ),
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
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.usePressFeedback = true,
  });

  final Widget child;
  final String? semanticLabel;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool usePressFeedback;

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
    Widget cell;
    if (!widget.usePressFeedback) {
      cell = FluxerGestureDetector(
        key: widget.key,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: widget.child,
      );
    } else {
      cell = FluxerGestureDetector(
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
    if (widget.semanticLabel == null) {
      return cell;
    }
    return Semantics(
      button: true,
      label: widget.semanticLabel,
      excludeSemantics: true,
      child: cell,
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.isActive = false,
    super.key,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: tooltip,
      selected: isActive,
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: ExcludeSemantics(
                child: PhosphorIcon(
                  icon,
                  size: 24,
                  color: isActive
                      ? colors.textPrimary
                      : colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GuildCategoryButton extends StatelessWidget {
  const _GuildCategoryButton({
    required this.guild,
    required this.onTap,
    this.isActive = false,
    super.key,
  });

  final Guild guild;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String label = guild.name;
    return Semantics(
      button: true,
      label: label,
      selected: isActive,
      child: Tooltip(
        message: label,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: ExcludeSemantics(
                child: DecoratedBox(
                  decoration: isActive
                      ? BoxDecoration(
                          border: Border.all(
                            color: colors.textPrimary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: _GuildIcon(guild: guild, size: isActive ? 20 : 24),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
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
      style: context.textStyles.smallText.copyWith(
        fontSize: size <= 16 ? 8 : 11,
        color: colors.textPrimaryMuted,
      ),
    ),
  );
}
