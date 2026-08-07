import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/favorite_media_repository.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/gif_provider.dart';
import 'package:fluxer_app/features/chat/utils/gif_category_grid_layout.dart';
import 'package:fluxer_app/features/chat/utils/gif_preview_playback_policy.dart';
import 'package:fluxer_app/features/chat/utils/klipy_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';
import 'package:fluxer_dart/export.dart' as sdk;
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kSearchDebounce = Duration(milliseconds: 400);
const _kMaxSearchLength = 100;
const _kMasonryMinColumnWidth = 227.0;
const _kMasonryHorizontalPadding = 10.0;
const _kMasonryCacheExtent = 700.0;
const double _kCategoryTileAspectRatio = 200 / 96;
const double _kCompactCategoryTileAspectRatio = 16 / 10;
const double _kCompactCategoryTileBreakpoint = 600;
const _kSkeletonTileCount = 12;

enum _GifPickerView { landing, trending }

class _GifFavoriteLookup {
  _GifFavoriteLookup.fromMemes(List<FavoriteMeme> memes)
    : _klipyBySlug = <String, FavoriteMeme>{},
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

  final Map<String, FavoriteMeme> _klipyBySlug;
  final Map<String, FavoriteMeme> _tenorBySlugId;

  FavoriteMeme? favoriteForGif(GifPickerGif gif) {
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
    this.onFavoritesTap,
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
  final VoidCallback? onFavoritesTap;
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
  }

  void _showTrending() {
    _searchDebounce?.cancel();
    _searchController.clear();
    setState(() {
      _debouncedQuery = '';
      _view = _GifPickerView.trending;
    });
  }

  void _goToLanding() {
    _searchDebounce?.cancel();
    _searchController.clear();
    setState(() {
      _debouncedQuery = '';
      _view = _GifPickerView.landing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = gifLocaleFromFlutterLocale(Localizations.localeOf(context));
    final provider = ref.watch(activeGifProviderProvider).value;

    return ColoredBox(
      key: const ValueKey<String>('gif-picker-content-surface'),
      color: context.colors.backgroundPrimary,
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

    if (_view == _GifPickerView.trending) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          layout.s3,
          layout.s3,
          layout.s3,
          layout.s2,
        ),
        child: Row(
          children: [
            FluxerTappable(
              onTap: _goToLanding,
              minSize: const Size(36, 36),
              builder: (context, states) => Center(
                child: PhosphorIcon(
                  PhosphorIconsBold.arrowLeft,
                  size: 20,
                  color: colors.textPrimary,
                ),
              ),
            ),
            SizedBox(width: layout.s2),
            Text(
              l10n.gifPickerTrending,
              style: context.textStyles.channelName.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
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
        showBackButton: _searchController.text.isNotEmpty,
        onBackButtonClick: _searchController.clear,
        rightCustomElement: provider == GifProviderKind.klipy
            ? _PoweredByKlipyLabel()
            : null,
        horizontalPadding: widget.searchHorizontalPadding ?? layout.s4,
        topPadding: widget.searchTopPadding ?? layout.s3,
        bottomPadding: widget.searchBottomPadding ?? layout.s3,
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
    final favoriteLookup = _GifFavoriteLookup.fromMemes(favoriteMemes);
    if (_view == _GifPickerView.trending) {
      final trending = ref.watch(gifTrendingProvider(locale));
      return _AsyncGifGrid(
        scrollController: widget.scrollController,
        gifs: trending,
        onGifTap: (gif) => _selectGif(gif, locale),
        favoriteForGif: favoriteLookup.favoriteForGif,
        onGifLongPress: _showGifActions,
      );
    }

    final rawQuery = _searchController.text.trim();
    if (rawQuery.isNotEmpty) {
      final searchIsPending = rawQuery != _debouncedQuery;
      return Column(
        children: [
          if (_debouncedQuery.isNotEmpty)
            _SuggestionChips(
              suggestions: ref.watch(
                gifSuggestionsProvider((
                  query: _debouncedQuery,
                  locale: locale,
                )),
              ),
              onSuggestionTap: _setSearchTerm,
            ),
          Expanded(
            child: searchIsPending || _debouncedQuery.isEmpty
                ? const _GifLoadingState()
                : _AsyncGifGrid(
                    scrollController: widget.scrollController,
                    gifs: ref.watch(
                      gifSearchProvider((
                        query: _debouncedQuery,
                        locale: locale,
                      )),
                    ),
                    emptyTitle: FluxerLocalizations.of(
                      context,
                    ).gifPickerNoResultsTitle,
                    emptyDescription: FluxerLocalizations.of(
                      context,
                    ).gifPickerNoResultsDescription,
                    onGifTap: (gif) => _selectGif(gif, locale),
                    favoriteForGif: favoriteLookup.favoriteForGif,
                    onGifLongPress: _showGifActions,
                  ),
          ),
        ],
      );
    }

    final featured = ref.watch(gifFeaturedProvider(locale));
    return featured.when(
      data: (data) => _FeaturedGifLanding(
        scrollController: widget.scrollController,
        featured: data,
        onFavoritesTap: widget.onFavoritesTap,
        onTrendingTap: _showTrending,
        onCategoryTap: _setSearchTerm,
        onGifTap: (gif) => _selectGif(gif, locale),
        favoriteForGif: favoriteLookup.favoriteForGif,
        onGifLongPress: _showGifActions,
      ),
      error: (_, _) => _GifEmptyState(
        title: FluxerLocalizations.of(context).gifPickerLoadFailedTitle,
        description: FluxerLocalizations.of(context).gifPickerLoadFailedBody,
      ),
      loading: () => const _GifLoadingState(),
    );
  }

  void _selectGif(GifPickerGif gif, sdk.Locale locale) {
    final shareId = gif.provider == GifProviderKind.klipy
        ? extractKlipySlug(gif.url) ?? gif.id
        : gif.id;
    if (shareId.trim().isEmpty) {
      return;
    }

    final query = _searchController.text.trim();
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

    final shiftPressed = HardwareKeyboard.instance.isShiftPressed;
    final autoSend =
        ref.read(chatPreferencesProvider).autoSendKlipyGifs && !shiftPressed;
    final title = gif.title.trim().isEmpty
        ? parseKlipyTitleFromUrl(gif.url)
        : gif.title;
    final shareUrl = gif.provider == GifProviderKind.klipy
        ? resolveKlipyShareUrl(url: gif.url, fallbackSlug: shareId)
        : gif.url;

    widget.onGifSelect?.call(
      FluxerSelectedGif(
        provider: gif.provider,
        id: shareId,
        title: title,
        url: shareUrl,
        src: gif.src,
        proxySrc: gif.proxySrc,
        width: gif.width,
        height: gif.height,
        autoSend: autoSend,
      ),
    );

    if (!shiftPressed) {
      widget.onClose();
    }
  }

  void _showGifActions(GifPickerGif gif, FavoriteMeme? favorite) {
    final isFavorite = favorite != null;
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: gif.title.trim().isEmpty ? 'GIF' : gif.title.trim(),
        variant: FluxerBottomSheetVariant.menu,
        builder: (sheetContext, close) => FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: isFavorite
                    ? 'Remove from Favorites'
                    : 'Save to Favorites',
                icon: isFavorite
                    ? PhosphorIconsBold.star
                    : PhosphorIconsFill.star,
                onTap: () {
                  close();
                  unawaited(_toggleGifFavorite(gif, favorite));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _toggleGifFavorite(
    GifPickerGif gif,
    FavoriteMeme? favorite,
  ) async {
    try {
      final repository = ref.read(favoriteMediaRepositoryProvider);
      if (favorite != null) {
        await repository.deleteFavoriteMeme(favorite);
      } else {
        await repository.createFromGif(
          gif,
          saveAsSavedMedia: ref.read(
            advancedPreferencesProvider.select(
              (state) => state.saveGifFavoritesAsSavedMedia,
            ),
          ),
        );
      }
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
    required this.onGifTap,
    required this.favoriteForGif,
    required this.onGifLongPress,
    this.onFavoritesTap,
    this.scrollController,
  });

  final GifPickerFeatured featured;
  final VoidCallback? onFavoritesTap;
  final VoidCallback onTrendingTap;
  final ValueChanged<String> onCategoryTap;
  final ValueChanged<GifPickerGif> onGifTap;
  final FavoriteMeme? Function(GifPickerGif gif) favoriteForGif;
  final void Function(GifPickerGif gif, FavoriteMeme? favorite) onGifLongPress;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final categories = <_GifCategoryData>[
      if (onFavoritesTap != null)
        _GifCategoryData(
          title: l10n.gifPickerFavorites,
          previewUrl: '',
          sourceUrl: '',
          icon: PhosphorIconsFill.star,
          overlayColor: const Color.fromRGBO(76, 70, 218, 0.6),
          onTap: onFavoritesTap!,
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

    if (categories.length == 1 &&
        onFavoritesTap == null &&
        featured.gifs.isNotEmpty) {
      return _GifGrid(
        scrollController: scrollController,
        gifs: featured.gifs,
        onGifTap: onGifTap,
        favoriteForGif: favoriteForGif,
        onGifLongPress: onGifLongPress,
      );
    }

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
    required this.favoriteForGif,
    required this.onGifLongPress,
    this.scrollController,
    this.emptyTitle,
    this.emptyDescription,
  });

  final AsyncValue<List<GifPickerGif>> gifs;
  final ValueChanged<GifPickerGif> onGifTap;
  final FavoriteMeme? Function(GifPickerGif gif) favoriteForGif;
  final void Function(GifPickerGif gif, FavoriteMeme? favorite) onGifLongPress;
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
        favoriteForGif: favoriteForGif,
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
    required this.favoriteForGif,
    required this.onGifLongPress,
    this.scrollController,
  });

  final List<GifPickerGif> gifs;
  final ValueChanged<GifPickerGif> onGifTap;
  final FavoriteMeme? Function(GifPickerGif gif) favoriteForGif;
  final void Function(GifPickerGif gif, FavoriteMeme? favorite) onGifLongPress;
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
      final favorite = favoriteForGif(gif);
      final title = gif.title.trim().isEmpty
          ? parseKlipyTitleFromUrl(gif.url)
          : gif.title;
      return _GifTile(
        title: title,
        previewUrl: gif.proxySrc.isNotEmpty ? gif.proxySrc : gif.src,
        sourceUrl: gif.src,
        allowAnimatedImagePlayback: isAnimatedImagePlaybackAllowed,
        isFavorite: favorite != null,
        onTap: () => onGifTap(gif),
        onLongPress: () => onGifLongPress(gif, favorite),
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
          onTap: category.onTap,
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
                      : const Color.fromRGBO(0, 0, 0, 0.68))
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
                            PhosphorIcon(icon!, size: 20, color: textColor),
                            SizedBox(width: layout.s1),
                          ],
                          Flexible(
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: context.textStyles.channelName.copyWith(
                                color: textColor,
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
    );
  }
}

double _aspectRatioFromDimensions(int width, int height) {
  if (width <= 0 || height <= 0) {
    return 1;
  }
  return width / height;
}

class _SuggestionChips extends StatelessWidget {
  const _SuggestionChips({
    required this.suggestions,
    required this.onSuggestionTap,
  });

  final AsyncValue<List<String>> suggestions;
  final ValueChanged<String> onSuggestionTap;

  @override
  Widget build(BuildContext context) => suggestions.maybeWhen(
    data: (items) {
      if (items.isEmpty) {
        return const SizedBox.shrink();
      }

      final layout = context.layout;
      final colors = context.colors;
      return SizedBox(
        height: 46,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: layout.s3),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final suggestion = items[index];
            return Center(
              child: FluxerTappable(
                onTap: () => onSuggestionTap(suggestion),
                builder: (context, states) {
                  final hovered = states.contains(WidgetState.hovered);
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: hovered
                          ? colors.backgroundModifierHover
                          : colors.backgroundModifierAccent,
                      borderRadius: layout.radiusFull,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: layout.s2,
                        vertical: layout.s1,
                      ),
                      child: Text(
                        suggestion,
                        style: context.textStyles.smallText.copyWith(
                          color: colors.textPrimary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: layout.s1),
          itemCount: items.length,
        ),
      );
    },
    orElse: () => const SizedBox.shrink(),
  );
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
    aspectRatioFor: (_) => 1,
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
    final colors = context.colors;
    final layout = context.layout;
    return DecoratedBox(
      key: ValueKey<String>('gif-picker-skeleton-tile-$index'),
      decoration: BoxDecoration(
        color: colors.backgroundModifierAccent,
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
  Widget build(BuildContext context) => ColoredBox(
    color: context.colors.backgroundModifierAccent,
    child: Center(
      child: PhosphorIcon(
        PhosphorIconsFill.gif,
        size: 28,
        color: context.colors.textTertiary,
      ),
    ),
  );
}

class _PoweredByKlipyLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      FluxerLocalizations.of(context).gifPickerPoweredByKlipy,
      style: context.textStyles.smallText.copyWith(
        color: colors.textTertiary,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    );
  }
}
