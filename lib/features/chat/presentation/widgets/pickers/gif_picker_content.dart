import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/l10n/api_locale.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/favorite_media_repository.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/favorite_gif_first_time_prompt_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_segmented_tabs.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/gif_provider.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_category_grid_layout.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_media_selection.dart';
import 'package:fluxer_app/features/chat/utils/media/gif_preview_playback_policy.dart';
import 'package:fluxer_app/features/chat/utils/media/klipy_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_favorite_state.dart';
import 'package:fluxer_app/features/chat/utils/media/media_proxy_url.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_dart/export.dart' as sdk;
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kSearchDebounce = Duration(milliseconds: 400);
const _kMaxSearchLength = 100;
const _kMasonryMinColumnWidth = 227.0;
const _kMasonryHorizontalPadding = 8.0;
const _kMasonryCacheExtent = 700.0;
const _kGifTileFadeInDuration = Duration(milliseconds: 100);
const _kGifCategoryPressHold = Duration(milliseconds: 60);
const Color _kGifCategoryPressDim = Color.fromRGBO(0, 0, 0, 0.42);
const Color _kGifFavoritesTileOverlay = Color.fromRGBO(76, 70, 218, 0.6);
const Color _kGifFavoritesEmptyTileOverlay = Color.fromRGBO(76, 70, 218, 1);
const double _kCategoryTileAspectRatio = 200 / 96;
const double _kCompactCategoryTileAspectRatio = 189 / 82;
const double _kCompactCategoryTileBreakpoint = 600;
const _kSkeletonTileCount = 12;
const List<double> _kSkeletonAspectRatios = <double>[
  1,
  1.78,
  0.8,
  1.33,
  1.5,
  0.75,
];

enum _GifPickerView { landing, trending, favorites }

class _GifFavoriteLookup {
  _GifFavoriteLookup({
    required List<FavoriteMeme> memes,
    required Iterable<FavoriteGifEntry> urlFavorites,
    required this.saveAsSavedMedia,
  }) : _urlFavoriteUrls = urlFavorites.map((entry) => entry.url).toSet(),
       _klipyBySlug = <String, FavoriteMeme>{},
       _tenorBySlugId = <String, FavoriteMeme>{} {
    for (final meme in memes) {
      final klipySlug = meme.klipySlug?.trim();
      if (klipySlug != null && klipySlug.isNotEmpty) {
        _klipyBySlug.putIfAbsent(klipySlug, () => meme);
      }

      final tenorSlugId = meme.tenorSlugId?.trim();
      if (tenorSlugId != null && tenorSlugId.isNotEmpty) {
        _tenorBySlugId.putIfAbsent(tenorSlugId, () => meme);
      }
    }
  }

  final bool saveAsSavedMedia;
  final Set<String> _urlFavoriteUrls;
  final Map<String, FavoriteMeme> _klipyBySlug;
  final Map<String, FavoriteMeme> _tenorBySlugId;

  bool isFavorite(GifPickerGif gif) {
    return isGifFavoriteActive(
      hasUrlOnlyFavorite: hasUrlFavorite(favoriteGifUrl(gif)),
      hasSavedMediaFavorite: favoriteMemeForGif(gif) != null,
      saveAsSavedMedia: saveAsSavedMedia,
    );
  }

  bool hasUrlFavorite(String url) => _urlFavoriteUrls.contains(url);

  FavoriteMeme? favoriteMemeForGif(GifPickerGif gif) {
    final shareId = gifShareId(gif);
    return switch (gif.provider) {
      GifProviderKind.klipy => _klipyBySlug[shareId],
      GifProviderKind.tenor => _tenorBySlugId[shareId],
    };
  }
}

class GifPickerContent extends ConsumerStatefulWidget {
  const GifPickerContent({
    required this.onClose,
    this.onShowSavedMedia,
    this.onGifSelect,
    this.searchHorizontalPadding,
    this.searchTopPadding,
    this.searchBottomPadding,
    this.onSearchActivated,
    this.searchFocusNode,
    this.sheetDragHandlers,
    this.scrollController,
    super.key,
  });

  final VoidCallback onClose;
  final VoidCallback? onShowSavedMedia;
  final ValueChanged<FluxerSelectedGif>? onGifSelect;
  final double? searchHorizontalPadding;
  final double? searchTopPadding;
  final double? searchBottomPadding;
  final VoidCallback? onSearchActivated;
  final FocusNode? searchFocusNode;
  final ExpandableSheetDragHandlers? sheetDragHandlers;
  final ScrollController? scrollController;

  @override
  ConsumerState<GifPickerContent> createState() => _GifPickerContentState();
}

class _GifPickerContentState extends ConsumerState<GifPickerContent> {
  final _searchController = TextEditingController();
  Timer? _searchDebounce;
  String _debouncedQuery = '';
  _GifPickerView _view = _GifPickerView.landing;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  Widget? _gifAttributionLabel(
    BuildContext context,
    GifProviderKind? provider,
  ) {
    final ({bool attributionRequired, String? displayName}) gif = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) => (
          attributionRequired: config.gifAttributionRequired,
          displayName: config.gifDisplayName,
        ),
      ),
    );
    final String? label = gif.displayName;
    if (!gif.attributionRequired ||
        provider == GifProviderKind.klipy ||
        label == null) {
      return null;
    }
    return _PoweredByLabel(label);
  }

  void _onSearchChanged() {
    final nextQuery = _searchController.text.trim();
    _searchDebounce?.cancel();

    if (nextQuery.isEmpty) {
      if (_debouncedQuery.isEmpty && _view == _GifPickerView.landing) {
        setState(() {});
        return;
      }
      setState(() {
        _debouncedQuery = '';
        _view = _GifPickerView.landing;
      });
      return;
    }

    setState(() => _view = _GifPickerView.landing);
    _searchDebounce = Timer(_kSearchDebounce, () {
      if (!mounted) {
        return;
      }
      setState(() => _debouncedQuery = nextQuery);
    });
  }

  void _flushSearch(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return;
    }
    _searchDebounce?.cancel();
    setState(() {
      _debouncedQuery = trimmed;
      _view = _GifPickerView.landing;
    });
  }

  void _setSearchTerm(String term) {
    _searchDebounce?.cancel();
    final limited = term.length > _kMaxSearchLength
        ? term.substring(0, _kMaxSearchLength)
        : term;
    _searchController.value = TextEditingValue(
      text: limited,
      selection: TextSelection.collapsed(offset: limited.length),
    );
    setState(() {
      _debouncedQuery = limited.trim();
      _view = _GifPickerView.landing;
    });
    widget.sheetDragHandlers?.expand?.call();
  }

  void _showTrending() {
    _searchDebounce?.cancel();
    _searchController.clear();
    setState(() {
      _debouncedQuery = '';
      _view = _GifPickerView.trending;
    });
    widget.sheetDragHandlers?.expand?.call();
  }

  void _goToLanding() {
    _searchDebounce?.cancel();
    _searchController.clear();
    setState(() {
      _debouncedQuery = '';
      _view = _GifPickerView.landing;
    });
  }

  void _onFavoritesTileTap() {
    final bool saveAsSavedMedia = ref
        .read(advancedPreferencesProvider)
        .saveGifFavoritesAsSavedMedia;
    final bool hasUrlFavorites = ref
        .read(favoriteGifsProvider)
        .entries
        .isNotEmpty;
    final VoidCallback? onShowSavedMedia = widget.onShowSavedMedia;
    if (saveAsSavedMedia && !hasUrlFavorites && onShowSavedMedia != null) {
      onShowSavedMedia();
      return;
    }
    _searchDebounce?.cancel();
    _searchController.clear();
    setState(() {
      _debouncedQuery = '';
      _view = _GifPickerView.favorites;
    });
    widget.sheetDragHandlers?.expand?.call();
  }

  @override
  Widget build(BuildContext context) {
    final locale = apiLocaleFromFlutterLocale(Localizations.localeOf(context));
    final provider = ref.watch(activeGifProviderProvider).value;

    return ColoredBox(
      key: const ValueKey<String>('gif-picker-content-surface'),
      color: context.colors.chatInputBackground,
      child: Column(
        children: [
          _buildHeader(context, provider),
          Expanded(child: _buildBody(context, locale)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, GifProviderKind? provider) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    if (_view != _GifPickerView.landing) {
      return _wrapSearchHeader(
        SizedBox(
          height: 56,
          child: Row(
            children: [
              FluxerTappable(
                onTap: _goToLanding,
                minSize: const Size(40, 44),
                builder: (context, states) => Padding(
                  padding: const EdgeInsets.only(left: 16, right: 10),
                  child: PhosphorIcon(
                    PhosphorIconsBold.caretLeft,
                    size: 16,
                    color: colors.textPrimary,
                  ),
                ),
              ),
              Text(
                _view == _GifPickerView.trending
                    ? l10n.gifPickerTrending
                    : l10n.gifPickerFavorites,
                style: context.textStyles.channelName.copyWith(
                  color: colors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _wrapSearchHeader(
      PickerSearchInput(
        controller: _searchController,
        hintText: switch (provider) {
          GifProviderKind.klipy => l10n.gifPickerSearchKlipy,
          GifProviderKind.tenor => l10n.gifPickerSearchTenor,
          null => l10n.gifPickerSearch,
        },
        rightCustomElement: _gifAttributionLabel(context, provider),
        horizontalPadding: widget.searchHorizontalPadding ?? layout.s4,
        topPadding: widget.searchTopPadding ?? layout.s3,
        bottomPadding: math.max(
          widget.searchBottomPadding ?? layout.s3,
          layout.s2,
        ),
        onSubmitted: _flushSearch,
        focusNode: widget.searchFocusNode,
        onActivated: widget.onSearchActivated,
      ),
    );
  }

  Widget _wrapSearchHeader(Widget child) {
    final ExpandableSheetDragHandlers? handlers = widget.sheetDragHandlers;
    if (handlers == null) {
      return child;
    }
    return handlers.wrapChrome(child);
  }

  Widget _buildBody(BuildContext context, sdk.Locale locale) {
    final favoriteMemes =
        ref.watch(favoriteMemesProvider).value ?? const <FavoriteMeme>[];
    final saveAsSavedMedia = ref.watch(
      advancedPreferencesProvider.select(
        (state) => state.saveGifFavoritesAsSavedMedia,
      ),
    );
    final urlFavorites = ref.watch(favoriteGifsProvider).entries;
    final favoriteLookup = _GifFavoriteLookup(
      memes: favoriteMemes,
      urlFavorites: urlFavorites,
      saveAsSavedMedia: saveAsSavedMedia,
    );
    if (_view == _GifPickerView.favorites) {
      if (urlFavorites.isEmpty) {
        final l10n = FluxerLocalizations.of(context);
        return _GifEmptyState(
          title: l10n.gifPickerFavoritesEmptyTitle,
          description: l10n.gifPickerFavoritesEmptyDescription,
        );
      }
      final favoriteGifs = urlFavorites.reversed
          .map(_favoriteEntryToPickerGif)
          .toList();
      return _GifGrid(
        scrollController: widget.scrollController,
        gifs: favoriteGifs,
        onGifTap: (gif) => _selectGif(gif, locale),
        isGifFavorite: favoriteLookup.isFavorite,
        onGifLongPress: (gif) => _showGifActions(gif, favoriteLookup),
      );
    }
    if (_view == _GifPickerView.trending) {
      final trending = ref.watch(gifTrendingProvider(locale));
      return _AsyncGifGrid(
        scrollController: widget.scrollController,
        gifs: trending,
        onGifTap: (gif) => _selectGif(gif, locale),
        isGifFavorite: favoriteLookup.isFavorite,
        onGifLongPress: (gif) => _showGifActions(gif, favoriteLookup),
      );
    }

    final rawQuery = _searchController.text.trim();
    if (rawQuery.isNotEmpty) {
      final searchIsPending = rawQuery != _debouncedQuery;
      return searchIsPending || _debouncedQuery.isEmpty
          ? const _GifLoadingState()
          : _AsyncGifGrid(
              scrollController: widget.scrollController,
              gifs: ref.watch(
                gifSearchProvider((query: _debouncedQuery, locale: locale)),
              ),
              emptyTitle: FluxerLocalizations.of(
                context,
              ).gifPickerNoResultsTitle,
              emptyDescription: FluxerLocalizations.of(
                context,
              ).gifPickerNoResultsDescription,
              onGifTap: (gif) => _selectGif(gif, locale),
              isGifFavorite: favoriteLookup.isFavorite,
              onGifLongPress: (gif) => _showGifActions(gif, favoriteLookup),
            );
    }

    final featured = ref.watch(gifFeaturedProvider(locale));
    return featured.when(
      data: (data) => _FeaturedGifLanding(
        scrollController: widget.scrollController,
        featured: data,
        favoritePreview: urlFavorites.isEmpty
            ? null
            : _favoriteEntryToPickerGif(urlFavorites.last),
        onFavoritesTap: _onFavoritesTileTap,
        onTrendingTap: _showTrending,
        onCategoryTap: _setSearchTerm,
      ),
      error: (_, _) => _GifEmptyState(
        title: FluxerLocalizations.of(context).gifPickerLoadFailedTitle,
        description: FluxerLocalizations.of(context).gifPickerLoadFailedBody,
      ),
      loading: () => const _GifLoadingState(),
    );
  }

  GifPickerGif _favoriteEntryToPickerGif(FavoriteGifEntry entry) {
    final String? klipySlug = extractKlipySlug(entry.url);
    final String slug = klipySlug ?? extractTenorSlugId(entry.url) ?? '';
    final media = sdkMediaFromFavoriteGif(entry.media);
    final preview = gifPreviewMediaForPicker(
      src: entry.proxyUrl,
      proxySrc: entry.proxyUrl,
      width: entry.width,
      height: entry.height,
      media: media,
    );
    return GifPickerGif(
      provider: klipySlug != null
          ? GifProviderKind.klipy
          : GifProviderKind.tenor,
      id: slug,
      title: '',
      url: entry.url,
      src: preview.src,
      proxySrc: preview.proxySrc,
      width: preview.width > 0 ? preview.width : entry.width,
      height: preview.height > 0 ? preview.height : entry.height,
      slug: slug,
      media: media,
    );
  }

  void _selectGif(GifPickerGif gif, sdk.Locale locale) {
    final shareId = gifShareId(gif);
    final query = _searchController.text.trim();
    if (shareId.isNotEmpty) {
      unawaited(
        ref
            .read(gifRepositoryProvider)
            .registerShare(
              provider: gif.provider,
              id: shareId,
              query: query,
              locale: locale,
            ),
      );
    }

    final shiftPressed = HardwareKeyboard.instance.isShiftPressed;
    final autoSend =
        ref.read(chatPreferencesProvider).autoSendKlipyGifs && !shiftPressed;
    final shareUrl = switch (gif.provider) {
      GifProviderKind.klipy => resolveKlipyShareUrl(
        url: gif.url,
        fallbackSlug: shareId,
      ),
      GifProviderKind.tenor =>
        shareId.isEmpty ? gif.url : buildTenorShareUrl(shareId),
    };

    widget.onGifSelect?.call(
      FluxerSelectedGif(url: shareUrl, autoSend: autoSend),
    );

    if (!shiftPressed) {
      widget.onClose();
    }
  }

  void _showGifActions(GifPickerGif gif, _GifFavoriteLookup favoriteLookup) {
    FluxerHaptics.medium();
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        showDragHandle: false,
        builder: (sheetContext, close) => _GifActionsSheet(
          gif: gif,
          isFavorite: favoriteLookup.isFavorite(gif),
          onToggleFavorite: () {
            close();
            unawaited(_toggleGifFavorite(gif, favoriteLookup));
          },
          onCopyLink: () {
            close();
            unawaited(copyToClipboard(context: context, value: gif.url));
          },
        ),
      ),
    );
  }

  Future<void> _toggleGifFavorite(
    GifPickerGif gif,
    _GifFavoriteLookup favoriteLookup,
  ) async {
    try {
      final String url = favoriteGifUrl(gif);
      final notifier = ref.read(favoriteGifsProvider.notifier);
      final hasUrlFavorite = favoriteLookup.hasUrlFavorite(url);
      if (hasUrlFavorite) {
        notifier.removeByUrl(url);
      }

      if (favoriteLookup.saveAsSavedMedia) {
        final repository = ref.read(favoriteMediaRepositoryProvider);
        final favorite = favoriteLookup.favoriteMemeForGif(gif);
        if (favorite != null) {
          await repository.deleteFavoriteMeme(favorite);
        } else {
          await repository.createFromGif(gif);
        }
        return;
      }

      if (hasUrlFavorite) {
        return;
      }

      final bool seenPrompt = ref
          .read(favoriteGifsProvider)
          .seenFirstTimePrompt;
      Future<void> addFavorite() async {
        notifier.addFromGif(gif);
      }

      if (!seenPrompt && mounted) {
        await showFavoriteGifFirstTimePrompt(
          context: context,
          onConfirm: addFavorite,
        );
        return;
      }
      await addFavorite();
    } on Object {
      ref
          .read(toastProvider.notifier)
          .show(
            const FluxerToast(
              message: 'Could not update GIF favorite.',
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }
}

class _FeaturedGifLanding extends StatelessWidget {
  const _FeaturedGifLanding({
    required this.featured,
    required this.onTrendingTap,
    required this.onCategoryTap,
    required this.onFavoritesTap,
    this.favoritePreview,
    this.scrollController,
  });

  final GifPickerFeatured featured;
  final GifPickerGif? favoritePreview;
  final VoidCallback onFavoritesTap;
  final VoidCallback onTrendingTap;
  final ValueChanged<String> onCategoryTap;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final categories = <_GifCategoryData>[
      _GifCategoryData(
        title: l10n.gifPickerFavorites,
        previewUrl: _bestPreviewUrl(favoritePreview),
        sourceUrl: _bestSourceUrl(favoritePreview),
        icon: PhosphorIconsFill.star,
        overlayColor: favoritePreview == null
            ? _kGifFavoritesEmptyTileOverlay
            : _kGifFavoritesTileOverlay,
        onTap: onFavoritesTap,
      ),
      _GifCategoryData(
        title: l10n.gifPickerTrending,
        previewUrl: _bestPreviewUrl(
          featured.gifs.isEmpty ? null : featured.gifs.first,
        ),
        sourceUrl: _bestSourceUrl(
          featured.gifs.isEmpty ? null : featured.gifs.first,
        ),
        icon: PhosphorIconsFill.trendUp,
        onTap: onTrendingTap,
      ),
      ...featured.categories.map(
        (category) => _GifCategoryData(
          title: category.name,
          previewUrl: category.proxySrc.isNotEmpty
              ? category.proxySrc
              : category.src,
          sourceUrl: category.src,
          onTap: () => onCategoryTap(category.name),
        ),
      ),
    ];

    return _CategoryGrid(
      scrollController: scrollController,
      categories: categories,
    );
  }

  static String _bestPreviewUrl(GifPickerGif? gif) {
    if (gif == null) {
      return '';
    }
    if (gif.proxySrc.isNotEmpty) {
      return gif.proxySrc;
    }
    if (gif.src.isNotEmpty) {
      return gif.src;
    }
    return gif.url;
  }

  static String _bestSourceUrl(GifPickerGif? gif) {
    if (gif == null) {
      return '';
    }
    if (gif.src.isNotEmpty) {
      return gif.src;
    }
    return gif.url;
  }
}

class _AsyncGifGrid extends StatelessWidget {
  const _AsyncGifGrid({
    required this.gifs,
    required this.onGifTap,
    required this.isGifFavorite,
    required this.onGifLongPress,
    this.scrollController,
    this.emptyTitle,
    this.emptyDescription,
  });

  final AsyncValue<List<GifPickerGif>> gifs;
  final ValueChanged<GifPickerGif> onGifTap;
  final bool Function(GifPickerGif gif) isGifFavorite;
  final ValueChanged<GifPickerGif> onGifLongPress;
  final ScrollController? scrollController;
  final String? emptyTitle;
  final String? emptyDescription;

  @override
  Widget build(BuildContext context) => gifs.when(
    data: (items) {
      if (items.isEmpty) {
        return _GifEmptyState(
          title:
              emptyTitle ??
              FluxerLocalizations.of(context).gifPickerNoResultsTitle,
          description:
              emptyDescription ??
              FluxerLocalizations.of(context).gifPickerNoResultsDescription,
        );
      }
      return _GifGrid(
        scrollController: scrollController,
        gifs: items,
        onGifTap: onGifTap,
        isGifFavorite: isGifFavorite,
        onGifLongPress: onGifLongPress,
      );
    },
    error: (_, _) => _GifEmptyState(
      title: FluxerLocalizations.of(context).gifPickerLoadFailedTitle,
      description: FluxerLocalizations.of(context).gifPickerLoadFailedBody,
    ),
    loading: () => const _GifLoadingState(),
  );
}

class _GifGrid extends StatelessWidget {
  const _GifGrid({
    required this.gifs,
    required this.onGifTap,
    required this.isGifFavorite,
    required this.onGifLongPress,
    this.scrollController,
  });

  final List<GifPickerGif> gifs;
  final ValueChanged<GifPickerGif> onGifTap;
  final bool Function(GifPickerGif gif) isGifFavorite;
  final ValueChanged<GifPickerGif> onGifLongPress;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => _VirtualMasonryGrid(
    scrollController: scrollController,
    items: List<Object>.from(gifs),
    aspectRatioFor: (item) {
      final gif = item as GifPickerGif;
      return _aspectRatioFromDimensions(gif.width, gif.height);
    },
    itemKeyFor: (item) {
      final gif = item as GifPickerGif;
      return '${gif.provider.name}:${gif.id}:${gif.url}';
    },
    itemBuilder: (context, item, {required isAnimatedImagePlaybackAllowed}) {
      final gif = item as GifPickerGif;
      final title = gif.title.trim().isEmpty
          ? parseKlipyTitleFromUrl(gif.url)
          : gif.title;
      return _GifTile(
        title: title,
        previewUrl: gif.proxySrc.isNotEmpty ? gif.proxySrc : gif.src,
        sourceUrl: gif.src,
        allowAnimatedImagePlayback: isAnimatedImagePlaybackAllowed,
        isFavorite: isGifFavorite(gif),
        onTap: () => onGifTap(gif),
        onLongPress: () => onGifLongPress(gif),
      );
    },
  );
}

class _CategoryGrid extends StatefulWidget {
  const _CategoryGrid({required this.categories, this.scrollController});

  final List<_GifCategoryData> categories;
  final ScrollController? scrollController;

  @override
  State<_CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<_CategoryGrid> {
  ScrollController? _ownedScrollController;
  var _scrollUpdateScheduled = false;
  int? _pressedIndex;
  Timer? _pressTimer;

  ScrollController get _scrollController =>
      widget.scrollController ??
      (_ownedScrollController ??= ScrollController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleScrollUpdate);
  }

  @override
  void dispose() {
    _pressTimer?.cancel();
    _scrollController.removeListener(_scheduleScrollUpdate);
    if (widget.scrollController == null) {
      _ownedScrollController?.dispose();
    }
    super.dispose();
  }

  void _onCategoryTap(int index) {
    if (_pressedIndex != null) {
      return;
    }
    final VoidCallback onTap = widget.categories[index].onTap;
    setState(() => _pressedIndex = index);
    _pressTimer = Timer(_kGifCategoryPressHold, () {
      onTap();
      if (mounted) {
        setState(() => _pressedIndex = null);
      }
    });
  }

  void _scheduleScrollUpdate() {
    if (_scrollUpdateScheduled) {
      return;
    }

    _scrollUpdateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollUpdateScheduled = false;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final gap = layout.s2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width <= 0) {
          return const SizedBox.shrink();
        }

        final columnCount = _masonryColumnCountForWidth(width);
        final tileWidth =
            (width -
                (_kMasonryHorizontalPadding * 2) -
                gap * (columnCount - 1)) /
            columnCount;
        final tileHeight = tileWidth / _categoryTileAspectRatioFor(context);
        final viewportHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : MediaQuery.sizeOf(context).height;
        final scrollOffset = _scrollController.hasClients
            ? _scrollController.offset
            : 0.0;
        final visibleIndexes = visibleGifCategoryIndexes(
          itemCount: widget.categories.length,
          columnCount: columnCount,
          tileHeight: tileHeight,
          gap: gap,
          scrollOffset: scrollOffset,
          viewportHeight: viewportHeight,
        );
        final animatedImagePlaybackIndexes = _allowedCategoryPreviewIndexes(
          tileWidth: tileWidth,
          tileHeight: tileHeight,
          columnCount: columnCount,
          gap: gap,
          scrollOffset: scrollOffset,
          viewportHeight: viewportHeight,
        );
        final contentHeight = gifCategoryGridContentHeight(
          itemCount: widget.categories.length,
          columnCount: columnCount,
          tileHeight: tileHeight,
          gap: gap,
          bottomPadding: _kMasonryHorizontalPadding,
        );

        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: contentHeight,
            child: Stack(
              children: [
                for (final index in visibleIndexes)
                  _buildPositionedCategoryTile(
                    index: index,
                    tileWidth: tileWidth,
                    tileHeight: tileHeight,
                    columnCount: columnCount,
                    gap: gap,
                    allowAnimatedImagePlayback: animatedImagePlaybackIndexes
                        .contains(index),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPositionedCategoryTile({
    required int index,
    required double tileWidth,
    required double tileHeight,
    required int columnCount,
    required double gap,
    required bool allowAnimatedImagePlayback,
  }) {
    final category = widget.categories[index];
    final row = index ~/ columnCount;
    final column = index % columnCount;
    final top = row * (tileHeight + gap);
    final left = _kMasonryHorizontalPadding + column * (tileWidth + gap);

    return Positioned(
      key: ValueKey<String>('${category.title}:${category.previewUrl}'),
      left: left,
      top: top,
      width: tileWidth,
      height: tileHeight,
      child: RepaintBoundary(
        child: _GifTile(
          title: category.title,
          previewUrl: category.previewUrl,
          sourceUrl: category.sourceUrl,
          icon: category.icon,
          isCategory: true,
          categoryOverlayColor: category.overlayColor,
          allowAnimatedImagePlayback: allowAnimatedImagePlayback,
          dimmed: index == _pressedIndex,
          onTap: () => _onCategoryTap(index),
        ),
      ),
    );
  }

  Set<int> _allowedCategoryPreviewIndexes({
    required double tileWidth,
    required double tileHeight,
    required int columnCount,
    required double gap,
    required double scrollOffset,
    required double viewportHeight,
  }) {
    final rowStride = tileHeight + gap;
    final viewportBottom = scrollOffset + viewportHeight;

    return gifAnimatedImagePreviewPlaybackPolicy.allowedVideoIndexes(
      candidates: _categoryPreviewCandidates(
        tileWidth: tileWidth,
        tileHeight: tileHeight,
        rowStride: rowStride,
        columnCount: columnCount,
        gap: gap,
      ),
      viewportTop: scrollOffset,
      viewportBottom: viewportBottom,
      isScrollActive: false,
    );
  }

  Iterable<GifPreviewPlaybackCandidate> _categoryPreviewCandidates({
    required double tileWidth,
    required double tileHeight,
    required double rowStride,
    required int columnCount,
    required double gap,
  }) sync* {
    for (var index = 0; index < widget.categories.length; index++) {
      final category = widget.categories[index];
      if (category.previewUrl.isEmpty && category.sourceUrl.isEmpty) {
        continue;
      }
      final row = index ~/ columnCount;
      final column = index % columnCount;
      final top = row * rowStride;
      final left = _kMasonryHorizontalPadding + column * (tileWidth + gap);
      yield GifPreviewPlaybackCandidate(
        index: index,
        top: top,
        bottom: top + tileHeight,
        left: left,
      );
    }
  }
}

class _VirtualMasonryGrid extends StatefulWidget {
  const _VirtualMasonryGrid({
    required this.items,
    required this.aspectRatioFor,
    required this.itemKeyFor,
    required this.itemBuilder,
    this.scrollController,
    super.key,
  });

  final List<Object> items;
  final double Function(Object item) aspectRatioFor;
  final String Function(Object item) itemKeyFor;
  final Widget Function(
    BuildContext context,
    Object item, {
    required bool isAnimatedImagePlaybackAllowed,
  })
  itemBuilder;
  final ScrollController? scrollController;

  @override
  State<_VirtualMasonryGrid> createState() => _VirtualMasonryGridState();
}

class _VirtualMasonryGridState extends State<_VirtualMasonryGrid> {
  ScrollController? _ownedScrollController;
  var _itemsVersion = 0;
  int? _layoutItemsVersion;
  double? _layoutColumnWidth;
  int? _layoutColumnCount;
  double? _layoutGap;
  List<_MasonryPosition> _layoutPositions = const <_MasonryPosition>[];
  var _layoutContentHeight = 0.0;
  var _scrollUpdateScheduled = false;

  ScrollController get _scrollController =>
      widget.scrollController ??
      (_ownedScrollController ??= ScrollController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleScrollUpdate);
  }

  @override
  void didUpdateWidget(_VirtualMasonryGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameItems(oldWidget, widget)) {
      _itemsVersion++;
      _invalidateLayoutCache();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _scrollController.hasClients) {
          _scrollController.jumpTo(0);
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scheduleScrollUpdate);
    if (widget.scrollController == null) {
      _ownedScrollController?.dispose();
    }
    super.dispose();
  }

  void _scheduleScrollUpdate() {
    if (_scrollUpdateScheduled) {
      return;
    }

    _scrollUpdateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollUpdateScheduled = false;
      if (mounted) {
        setState(() {});
      }
    });
  }

  bool _sameItems(_VirtualMasonryGrid previous, _VirtualMasonryGrid next) {
    if (previous.items.length != next.items.length) {
      return false;
    }
    for (var i = 0; i < previous.items.length; i++) {
      final previousItem = previous.items[i];
      final nextItem = next.items[i];
      if (previous.itemKeyFor(previousItem) != next.itemKeyFor(nextItem)) {
        return false;
      }
      if (previous.aspectRatioFor(previousItem) !=
          next.aspectRatioFor(nextItem)) {
        return false;
      }
    }
    return true;
  }

  void _invalidateLayoutCache() {
    _layoutItemsVersion = null;
    _layoutPositions = const <_MasonryPosition>[];
    _layoutContentHeight = 0;
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final gap = layout.s2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width <= 0) {
          return const SizedBox.shrink();
        }

        final columnCount = _columnCountForWidth(width);
        final columnWidth =
            (width -
                (_kMasonryHorizontalPadding * 2) -
                gap * (columnCount - 1)) /
            columnCount;
        final positions = _positionsForLayout(
          columnWidth: columnWidth,
          columnCount: columnCount,
          gap: gap,
        );
        final contentHeight = _layoutContentHeight;
        final scrollOffset = _scrollController.hasClients
            ? _scrollController.offset
            : 0.0;
        final viewportHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : MediaQuery.sizeOf(context).height;
        final visibleTop = scrollOffset - _kMasonryCacheExtent;
        final visibleBottom =
            scrollOffset + viewportHeight + _kMasonryCacheExtent;
        final visiblePositions = positions
            .where(
              (position) =>
                  position.bottom >= visibleTop &&
                  position.top <= visibleBottom,
            )
            .toList(growable: false);
        final viewportBottom = scrollOffset + viewportHeight;
        final animatedImagePlaybackIndexes = _allowedAnimatedImageIndexes(
          positions: positions,
          viewportTop: scrollOffset,
          viewportBottom: viewportBottom,
        );

        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: contentHeight,
            child: Stack(
              children: [
                for (final position in visiblePositions)
                  Positioned(
                    key: ValueKey<String>(
                      widget.itemKeyFor(widget.items[position.index]),
                    ),
                    left: position.left,
                    top: position.top,
                    width: position.width,
                    height: position.height,
                    child: widget.itemBuilder(
                      context,
                      widget.items[position.index],
                      isAnimatedImagePlaybackAllowed:
                          animatedImagePlaybackIndexes.contains(position.index),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Set<int> _allowedAnimatedImageIndexes({
    required List<_MasonryPosition> positions,
    required double viewportTop,
    required double viewportBottom,
  }) => gifAnimatedImagePreviewPlaybackPolicy.allowedVideoIndexes(
    candidates: _playbackCandidatesForPositions(positions).where((candidate) {
      final item = widget.items[candidate.index];
      return _isAnimatedImagePlaybackCandidate(item);
    }),
    viewportTop: viewportTop,
    viewportBottom: viewportBottom,
    isScrollActive: false,
  );

  Iterable<GifPreviewPlaybackCandidate> _playbackCandidatesForPositions(
    List<_MasonryPosition> positions,
  ) => positions.map(
    (position) => GifPreviewPlaybackCandidate(
      index: position.index,
      top: position.top,
      bottom: position.bottom,
      left: position.left,
    ),
  );

  bool _isAnimatedImagePlaybackCandidate(Object item) => item is GifPickerGif;

  List<_MasonryPosition> _positionsForLayout({
    required double columnWidth,
    required int columnCount,
    required double gap,
  }) {
    if (_layoutItemsVersion == _itemsVersion &&
        _layoutColumnWidth == columnWidth &&
        _layoutColumnCount == columnCount &&
        _layoutGap == gap) {
      return _layoutPositions;
    }

    final positions = _computeMasonryPositions(
      columnWidth: columnWidth,
      columnCount: columnCount,
      gap: gap,
    );
    _layoutItemsVersion = _itemsVersion;
    _layoutColumnWidth = columnWidth;
    _layoutColumnCount = columnCount;
    _layoutGap = gap;
    _layoutPositions = positions;
    _layoutContentHeight = positions.isEmpty
        ? 0.0
        : positions.map((p) => p.bottom).reduce((a, b) => a > b ? a : b) +
              _kMasonryHorizontalPadding;
    return positions;
  }

  List<_MasonryPosition> _computeMasonryPositions({
    required double columnWidth,
    required int columnCount,
    required double gap,
  }) {
    final columnHeights = List<double>.filled(columnCount, 0);
    final positions = <_MasonryPosition>[];

    for (var i = 0; i < widget.items.length; i++) {
      var column = 0;
      for (var j = 1; j < columnHeights.length; j++) {
        if (columnHeights[j] < columnHeights[column]) {
          column = j;
        }
      }

      final aspectRatio = widget.aspectRatioFor(widget.items[i]);
      final itemHeight = aspectRatio > 0
          ? columnWidth / aspectRatio
          : columnWidth;
      final left = _kMasonryHorizontalPadding + column * (columnWidth + gap);
      final top = columnHeights[column];
      positions.add(
        _MasonryPosition(
          index: i,
          left: left,
          top: top,
          width: columnWidth,
          height: itemHeight,
        ),
      );
      columnHeights[column] += itemHeight + gap;
    }

    return positions;
  }

  int _columnCountForWidth(double width) => _masonryColumnCountForWidth(width);
}

int _masonryColumnCountForWidth(double width) {
  final availableWidth = width - (_kMasonryHorizontalPadding * 2);
  final count = (availableWidth / _kMasonryMinColumnWidth).floor();
  return count.clamp(2, 4);
}

double _categoryTileAspectRatioFor(BuildContext context) {
  final screenSize = MediaQuery.sizeOf(context);
  if (screenSize.shortestSide < _kCompactCategoryTileBreakpoint) {
    return _kCompactCategoryTileAspectRatio;
  }
  return _kCategoryTileAspectRatio;
}

class _MasonryPosition {
  const _MasonryPosition({
    required this.index,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  final int index;
  final double left;
  final double top;
  final double width;
  final double height;

  double get bottom => top + height;
}

class _GifCategoryData {
  const _GifCategoryData({
    required this.title,
    required this.previewUrl,
    required this.sourceUrl,
    required this.onTap,
    this.icon,
    this.overlayColor,
  });

  final String title;
  final String previewUrl;
  final String sourceUrl;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? overlayColor;
}

class _GifTile extends StatelessWidget {
  const _GifTile({
    required this.title,
    required this.previewUrl,
    required this.sourceUrl,
    required this.onTap,
    this.onLongPress,
    this.icon,
    this.isCategory = false,
    this.categoryOverlayColor,
    this.isFavorite = false,
    this.allowAnimatedImagePlayback = true,
    this.dimmed = false,
  });

  final String title;
  final String previewUrl;
  final String sourceUrl;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final IconData? icon;
  final bool isCategory;
  final Color? categoryOverlayColor;
  final bool isFavorite;
  final bool allowAnimatedImagePlayback;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;
    final isLight = Theme.of(context).brightness == Brightness.light;
    final borderRadius = layout.radiusSm;

    return FluxerTappable(
      onTap: onTap,
      onLongPress: onLongPress,
      semanticLabel: title,
      builder: (context, states) {
        final isHovered = states.contains(WidgetState.hovered);
        final overlayColor =
            categoryOverlayColor ??
            (isCategory
                ? (isLight
                      ? const Color.fromRGBO(255, 255, 255, 0.56)
                      : const Color.fromRGBO(0, 0, 0, 0.6))
                : (isLight
                      ? const Color.fromRGBO(255, 255, 255, 0.16)
                      : const Color.fromRGBO(0, 0, 0, 0.18)));
        final textColor = categoryOverlayColor != null
            ? Colors.white
            : isCategory && isLight
            ? colors.textPrimary
            : Colors.white;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            borderRadius: borderRadius,
            border: Border.all(
              color: isHovered
                  ? colors.backgroundModifierAccentFocus
                  : Colors.transparent,
            ),
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _GifMediaPreview(
                  url: previewUrl,
                  sourceUrl: sourceUrl,
                  allowAnimatedImagePlayback: allowAnimatedImagePlayback,
                ),
                ColoredBox(color: overlayColor),
                if (isCategory)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: layout.s2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null) ...[
                            PhosphorIcon(icon!, size: 16, color: textColor),
                            const SizedBox(width: 6),
                          ],
                          Flexible(
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: context.textStyles.channelName.copyWith(
                                color: textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                height: 1,
                                shadows: isLight
                                    ? null
                                    : const [
                                        Shadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 1,
                                        ),
                                      ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (dimmed) const ColoredBox(color: _kGifCategoryPressDim),
                if (!isCategory && isFavorite)
                  Positioned(
                    top: layout.s2,
                    right: layout.s2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.62),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(layout.s1),
                        child: const PhosphorIcon(
                          PhosphorIconsFill.star,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GifMediaPreview extends StatelessWidget {
  const _GifMediaPreview({
    required this.url,
    required this.sourceUrl,
    required this.allowAnimatedImagePlayback,
  });

  final String url;
  final String sourceUrl;
  final bool allowAnimatedImagePlayback;

  @override
  Widget build(BuildContext context) {
    final base = url.isNotEmpty ? url : sourceUrl;
    if (base.isEmpty) {
      return const _GifMediaPlaceholder();
    }
    return FluxerAnimatedImage(
      animatedUrl: buildMediaProxyUrl(base, format: 'webp', animated: true),
      playing: allowAnimatedImagePlayback,
      placeholder: const _GifMediaPlaceholder(),
      fadeInDuration: _kGifTileFadeInDuration,
    );
  }
}

double _aspectRatioFromDimensions(int width, int height) {
  if (width <= 0 || height <= 0) {
    return 1;
  }
  return width / height;
}

class _GifLoadingState extends StatelessWidget {
  const _GifLoadingState();

  @override
  Widget build(BuildContext context) => const _GifSkeletonGrid();
}

class _GifSkeletonGrid extends StatelessWidget {
  const _GifSkeletonGrid();

  @override
  Widget build(BuildContext context) => _VirtualMasonryGrid(
    key: const ValueKey<String>('gif-picker-skeleton-grid'),
    items: List<Object>.generate(_kSkeletonTileCount, _GifSkeletonItem.new),
    aspectRatioFor: (item) =>
        _kSkeletonAspectRatios[(item as _GifSkeletonItem).index %
            _kSkeletonAspectRatios.length],
    itemKeyFor: (item) => 'gif-skeleton-${(item as _GifSkeletonItem).index}',
    itemBuilder: (context, item, {required isAnimatedImagePlaybackAllowed}) {
      return _GifSkeletonTile(index: (item as _GifSkeletonItem).index);
    },
  );
}

class _GifSkeletonItem {
  const _GifSkeletonItem(this.index);

  final int index;
}

class _GifSkeletonTile extends StatelessWidget {
  const _GifSkeletonTile({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return DecoratedBox(
      key: ValueKey<String>('gif-picker-skeleton-tile-$index'),
      decoration: BoxDecoration(
        color: expressionTabsTrackColor(context),
        borderRadius: layout.radiusSm,
      ),
    );
  }
}

class _GifEmptyState extends StatelessWidget {
  const _GifEmptyState({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsBold.smileySad,
              size: 42,
              color: colors.textTertiary,
            ),
            SizedBox(height: layout.s2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.channelName.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: layout.s1),
            Text(
              description,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GifMediaPlaceholder extends StatelessWidget {
  const _GifMediaPlaceholder();

  @override
  Widget build(BuildContext context) =>
      ColoredBox(color: expressionTabsTrackColor(context));
}

class _PoweredByLabel extends StatelessWidget {
  const _PoweredByLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      label,
      style: context.textStyles.smallText.copyWith(
        color: colors.textTertiary,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    );
  }
}

class _GifActionsSheet extends StatelessWidget {
  const _GifActionsSheet({
    required this.gif,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onCopyLink,
  });

  final GifPickerGif gif;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onCopyLink;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final double maxPreviewHeight = MediaQuery.sizeOf(context).height * 0.5;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FluxerBottomSheetEdgeHandle(height: 31),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxPreviewHeight),
            child: AspectRatio(
              aspectRatio: _aspectRatioFromDimensions(gif.width, gif.height),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _GifMediaPreview(
                  url: gif.proxySrc,
                  sourceUrl: gif.src,
                  allowAnimatedImagePlayback: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (isFavorite)
            FluxerButton.secondary(
              label: l10n.favoritesRemoveFromFavorites,
              size: FluxerButtonSize.small,
              onPressed: onToggleFavorite,
            )
          else
            FluxerButton.primary(
              label: l10n.favoritesAddToFavorites,
              size: FluxerButtonSize.small,
              onPressed: onToggleFavorite,
            ),
          if (gif.url.isNotEmpty) ...[
            const SizedBox(height: 8),
            FluxerButton.secondary(
              label: l10n.mediaViewerCopyLink,
              size: FluxerButtonSize.small,
              onPressed: onCopyLink,
            ),
          ],
        ],
      ),
    );
  }
}
