import 'dart:async';
import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/utils/gif_media_selection.dart';
import 'package:fluxer_app/features/chat/utils/gif_preview_playback_policy.dart';
import 'package:fluxer_app/features/chat/utils/gif_preview_player_config.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kGridGap = 8.0;
const _kGridHorizontalPadding = 10.0;
const _kMaxColumnWidth = 227.0;
const _kMinTileHeight = 96.0;
const _kMinNonImageTileHeight = 128.0;
const _kMaxTileHeight = 320.0;
const _kMasonryCacheExtent = 700.0;
const _kFavoriteMediaVideoResumeDelay = Duration(milliseconds: 220);
const _kFavoriteMediaVideoHttpHeaders = <String, String>{
  'Accept': 'video/webm,video/mp4,video/*,*/*',
};

typedef OnFavoriteMemeSelect = void Function(FavoriteMemeSelection selection);

class FavoriteMediaPickerContent extends ConsumerStatefulWidget {
  const FavoriteMediaPickerContent({
    this.onSelect,
    this.searchHorizontalPadding,
    this.searchTopPadding,
    this.searchBottomPadding,
    this.onSearchActivated,
    this.sheetDragHandlers,
    this.scrollController,
    super.key,
  });

  final OnFavoriteMemeSelect? onSelect;
  final double? searchHorizontalPadding;
  final double? searchTopPadding;
  final double? searchBottomPadding;
  final VoidCallback? onSearchActivated;
  final ExpandableSheetDragHandlers? sheetDragHandlers;
  final ScrollController? scrollController;

  @override
  ConsumerState<FavoriteMediaPickerContent> createState() =>
      _FavoriteMediaPickerContentState();
}

class _FavoriteMediaPickerContentState
    extends ConsumerState<FavoriteMediaPickerContent> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  FavoriteMemeMediaFilter _filter = FavoriteMemeMediaFilter.all;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(
      () => setState(() => _searchQuery = _searchController.text),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _select(FavoriteMeme meme) {
    unawaited(
      ref
          .read(fluxerDatabaseProvider)
          .emojiUsageDao
          .trackUsage('meme:${meme.id}'),
    );
    ref.invalidate(favoriteMemeFrecencyKeysProvider);
    final autoSend = !HardwareKeyboard.instance.isShiftPressed;
    widget.onSelect?.call(
      FavoriteMemeSelection(meme: meme, autoSend: autoSend),
    );
  }

  void _showActions(FavoriteMeme meme) {
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: meme.name,
        variant: FluxerBottomSheetVariant.menu,
        builder: (sheetContext, close) => FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: 'Edit',
                icon: PhosphorIconsFill.pencilSimple,
                onTap: () {
                  close();
                  unawaited(_showEditSheet(meme));
                },
              ),
              FluxerBottomSheetMenuItem(
                label: 'Delete',
                icon: PhosphorIconsFill.trash,
                isDanger: true,
                onTap: () {
                  close();
                  unawaited(_showDeleteSheet(meme));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showEditSheet(FavoriteMeme meme) {
    return FluxerBottomSheet.show<void>(
      context,
      title: 'Edit saved media',
      builder: (sheetContext, close) =>
          _FavoriteMediaEditSheet(meme: meme, close: close),
    );
  }

  Future<void> _showDeleteSheet(FavoriteMeme meme) {
    return FluxerBottomSheet.show<void>(
      context,
      title: 'Delete saved media',
      builder: (sheetContext, close) =>
          _FavoriteMediaDeleteSheet(meme: meme, close: close),
    );
  }

  @override
  Widget build(BuildContext context) {
    final memes = ref.watch(favoriteMemesProvider);

    return Column(
      children: [
        _wrapSearchHeader(
          PickerSearchInput(
            controller: _searchController,
            hintText: 'Search saved media',
            horizontalPadding: widget.searchHorizontalPadding ?? 12,
            topPadding: widget.searchTopPadding ?? 12,
            bottomPadding: widget.searchBottomPadding ?? 8,
            onActivated: widget.onSearchActivated,
          ),
        ),
        _FilterPills(
          selected: _filter,
          onSelected: (filter) => setState(() => _filter = filter),
        ),
        Expanded(
          child: memes.when(
            data: _buildBody,
            loading: () => const _FavoriteMediaSkeleton(),
            error: (_, _) => const _FavoriteMediaEmptyState(
              icon: PhosphorIconsDuotone.smileySad,
              title: 'Saved Media Unavailable',
              description: 'Try again in a moment.',
            ),
          ),
        ),
      ],
    );
  }

  Widget _wrapSearchHeader(Widget child) {
    final ExpandableSheetDragHandlers? handlers = widget.sheetDragHandlers;
    if (handlers == null) {
      return child;
    }
    return handlers.wrapChrome(child);
  }

  Widget _buildBody(List<FavoriteMeme> allMemes) {
    if (allMemes.isEmpty) {
      return const _FavoriteMediaEmptyState(
        icon: PhosphorIconsDuotone.smileySad,
        title: 'No Saved Media',
        description: 'Save some media from messages to get started!',
      );
    }

    var filtered = filterFavoriteMemes(
      allMemes,
      query: _searchQuery,
      filter: _filter,
    );
    if (_searchQuery.trim().isNotEmpty) {
      filtered = sortFavoriteMemesForSearchFrecency(
        filtered,
        ref.watch(favoriteMemeFrecencyKeysProvider).value ?? const <String>[],
      );
    }
    if (filtered.isEmpty) {
      return const _FavoriteMediaEmptyState(
        icon: PhosphorIconsDuotone.smileySad,
        title: 'No Results',
        description: 'Try a different search term or filter',
      );
    }

    return _FavoriteMediaMasonryGrid(
      scrollController: widget.scrollController,
      memes: filtered,
      onTap: _select,
      onLongPress: _showActions,
    );
  }
}

class _FilterPills extends StatelessWidget {
  const _FilterPills({required this.selected, required this.onSelected});

  final FavoriteMemeMediaFilter selected;
  final ValueChanged<FavoriteMemeMediaFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    final options =
        <({FavoriteMemeMediaFilter filter, String label, IconData? icon})>[
          (filter: FavoriteMemeMediaFilter.all, label: 'All', icon: null),
          (
            filter: FavoriteMemeMediaFilter.images,
            label: 'Images',
            icon: PhosphorIconsFill.image,
          ),
          (
            filter: FavoriteMemeMediaFilter.videos,
            label: 'Videos',
            icon: PhosphorIconsFill.videoCamera,
          ),
          (
            filter: FavoriteMemeMediaFilter.audio,
            label: 'Audio',
            icon: PhosphorIconsFill.musicNote,
          ),
          (
            filter: FavoriteMemeMediaFilter.gifs,
            label: 'GIFs',
            icon: PhosphorIconsFill.gif,
          ),
        ];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final option = options[index];
          final active = option.filter == selected;
          return _FilterPill(
            label: option.label,
            icon: option.icon,
            active: active,
            onTap: () => onSelected(option.filter),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemCount: options.length,
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.label,
    required this.active,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: active
              ? colors.backgroundModifierSelected
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon case final iconData?) ...[
              PhosphorIcon(iconData, size: 14, color: colors.textPrimaryMuted),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: active ? colors.textPrimary : colors.textPrimaryMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteMediaEditSheet extends ConsumerStatefulWidget {
  const _FavoriteMediaEditSheet({required this.meme, required this.close});

  final FavoriteMeme meme;
  final VoidCallback close;

  @override
  ConsumerState<_FavoriteMediaEditSheet> createState() =>
      _FavoriteMediaEditSheetState();
}

class _FavoriteMediaEditSheetState
    extends ConsumerState<_FavoriteMediaEditSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _altTextController;
  late final TextEditingController _tagsController;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.meme.name);
    _altTextController = TextEditingController(text: widget.meme.altText ?? '');
    _tagsController = TextEditingController(text: widget.meme.tags.join(', '));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _altTextController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _errorText = null);
    try {
      await ref
          .read(favoriteMediaRepositoryProvider)
          .updateFavoriteMeme(
            meme: widget.meme,
            name: _nameController.text,
            altText: _altTextController.text,
            tags: _parseTags(_tagsController.text),
          );
      if (mounted) {
        widget.close();
      }
    } on Object {
      if (mounted) {
        setState(() => _errorText = 'Could not update saved media.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;

    return FluxerBottomSheetContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _SavedMediaTextField(
            controller: _nameController,
            label: 'Name',
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: layout.s3),
          _SavedMediaTextField(
            controller: _altTextController,
            label: 'Alt text',
            maxLines: 2,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: layout.s3),
          _SavedMediaTextField(
            controller: _tagsController,
            label: 'Tags',
            hintText: 'funny, reaction, work',
            textInputAction: TextInputAction.done,
          ),
          if (_errorText != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _errorText!,
              style: TextStyle(color: colors.accentDanger, fontSize: 13),
            ),
          ],
          SizedBox(height: layout.s4),
          FluxerButton.primary(label: 'Save', onPressedAsync: _save),
        ],
      ),
    );
  }
}

class _FavoriteMediaDeleteSheet extends ConsumerStatefulWidget {
  const _FavoriteMediaDeleteSheet({required this.meme, required this.close});

  final FavoriteMeme meme;
  final VoidCallback close;

  @override
  ConsumerState<_FavoriteMediaDeleteSheet> createState() =>
      _FavoriteMediaDeleteSheetState();
}

class _FavoriteMediaDeleteSheetState
    extends ConsumerState<_FavoriteMediaDeleteSheet> {
  String? _errorText;

  Future<void> _delete() async {
    setState(() => _errorText = null);
    try {
      await ref
          .read(favoriteMediaRepositoryProvider)
          .deleteFavoriteMeme(widget.meme);
      if (mounted) {
        widget.close();
      }
    } on Object {
      if (mounted) {
        setState(() => _errorText = 'Could not delete saved media.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;

    return FluxerBottomSheetContent(
      scrollable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Remove "${widget.meme.name}" from your saved media?',
            style: TextStyle(color: colors.textSecondary, fontSize: 14),
          ),
          if (_errorText != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _errorText!,
              style: TextStyle(color: colors.accentDanger, fontSize: 13),
            ),
          ],
          SizedBox(height: layout.s4),
          FluxerButton.dangerPrimary(label: 'Delete', onPressedAsync: _delete),
          SizedBox(height: layout.s2),
          FluxerButton.secondary(label: 'Cancel', onPressed: widget.close),
        ],
      ),
    );
  }
}

class _SavedMediaTextField extends StatelessWidget {
  const _SavedMediaTextField({
    required this.controller,
    required this.label,
    this.hintText,
    this.maxLines = 1,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String label;
  final String? hintText;
  final int maxLines;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TextField(
      controller: controller,
      maxLines: maxLines,
      textInputAction: textInputAction,
      style: TextStyle(color: colors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        filled: true,
        fillColor: colors.backgroundTertiary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.backgroundModifierAccent),
        ),
      ),
    );
  }
}

List<String> _parseTags(String value) => value
    .split(',')
    .map((tag) => tag.trim())
    .where((tag) => tag.isNotEmpty)
    .toSet()
    .toList(growable: false);

class _FavoriteMediaMasonryGrid extends StatefulWidget {
  const _FavoriteMediaMasonryGrid({
    required this.memes,
    required this.onTap,
    required this.onLongPress,
    this.scrollController,
  });

  final List<FavoriteMeme> memes;
  final ValueChanged<FavoriteMeme> onTap;
  final ValueChanged<FavoriteMeme> onLongPress;
  final ScrollController? scrollController;

  @override
  State<_FavoriteMediaMasonryGrid> createState() =>
      _FavoriteMediaMasonryGridState();
}

class _FavoriteMediaMasonryGridState extends State<_FavoriteMediaMasonryGrid> {
  ScrollController? _ownedScrollController;
  var _itemsVersion = 0;
  int? _layoutItemsVersion;
  double? _layoutColumnWidth;
  int? _layoutColumnCount;
  List<_FavoriteMediaPosition> _layoutPositions =
      const <_FavoriteMediaPosition>[];
  var _layoutContentHeight = 0.0;
  var _scrollUpdateScheduled = false;
  var _isScrollActive = false;
  Timer? _videoResumeTimer;

  ScrollController get _scrollController =>
      widget.scrollController ??
      (_ownedScrollController ??= ScrollController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(_FavoriteMediaMasonryGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameMemes(oldWidget.memes, widget.memes)) {
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
    _videoResumeTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    if (widget.scrollController == null) {
      _ownedScrollController?.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    _markScrollActive();
    _scheduleScrollUpdate();
  }

  void _markScrollActive() {
    _videoResumeTimer?.cancel();
    _isScrollActive = true;
    _videoResumeTimer = Timer(_kFavoriteMediaVideoResumeDelay, () {
      if (!mounted || !_isScrollActive) {
        return;
      }
      setState(() => _isScrollActive = false);
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

  bool _sameMemes(List<FavoriteMeme> previous, List<FavoriteMeme> next) {
    if (previous.length != next.length) {
      return false;
    }
    for (var i = 0; i < previous.length; i++) {
      final previousMeme = previous[i];
      final nextMeme = next[i];
      if (previousMeme.id != nextMeme.id ||
          previousMeme.url != nextMeme.url ||
          previousMeme.mediaType != nextMeme.mediaType ||
          previousMeme.aspectRatio != nextMeme.aspectRatio) {
        return false;
      }
    }
    return true;
  }

  void _invalidateLayoutCache() {
    _layoutItemsVersion = null;
    _layoutPositions = const <_FavoriteMediaPosition>[];
    _layoutContentHeight = 0;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width <= 0) {
        return const SizedBox.shrink();
      }

      final columns = _columnsForWidth(width);
      final availableWidth = width - (_kGridHorizontalPadding * 2);
      final columnWidth =
          (availableWidth - (columns - 1) * _kGridGap) / columns;
      final positions = _positionsForLayout(
        columnWidth: columnWidth,
        columnCount: columns,
      );
      final scrollOffset = _scrollController.hasClients
          ? _scrollController.offset
          : 0.0;
      final viewportHeight = constraints.maxHeight.isFinite
          ? constraints.maxHeight
          : MediaQuery.sizeOf(context).height;
      final visibleTop = scrollOffset - _kMasonryCacheExtent;
      final visibleBottom =
          scrollOffset + viewportHeight + _kMasonryCacheExtent;
      final viewportBottom = scrollOffset + viewportHeight;
      final visiblePositions = positions
          .where(
            (position) =>
                position.bottom >= visibleTop && position.top <= visibleBottom,
          )
          .toList(growable: false);
      final videoPlaybackIndexes = _allowedVideoIndexes(
        positions: positions,
        viewportTop: scrollOffset,
        viewportBottom: viewportBottom,
      );
      final animatedImagePlaybackIndexes = _allowedAnimatedImageIndexes(
        positions: positions,
        viewportTop: scrollOffset,
        viewportBottom: viewportBottom,
      );

      return SingleChildScrollView(
        controller: _scrollController,
        child: SizedBox(
          height: _layoutContentHeight,
          child: Stack(
            children: [
              for (final position in visiblePositions)
                Positioned(
                  key: ValueKey<String>(widget.memes[position.index].id),
                  left: position.left,
                  top: position.top,
                  width: position.width,
                  height: position.height,
                  child: RepaintBoundary(
                    child: _FavoriteMediaTile(
                      meme: widget.memes[position.index],
                      isVisible:
                          position.bottom >= scrollOffset &&
                          position.top <= viewportBottom,
                      allowVideoPlayback: videoPlaybackIndexes.contains(
                        position.index,
                      ),
                      allowAnimatedImagePlayback: animatedImagePlaybackIndexes
                          .contains(position.index),
                      onTap: () => widget.onTap(widget.memes[position.index]),
                      onLongPress: () =>
                          widget.onLongPress(widget.memes[position.index]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );

  Set<int> _allowedVideoIndexes({
    required List<_FavoriteMediaPosition> positions,
    required double viewportTop,
    required double viewportBottom,
  }) => gifVideoPreviewPlaybackPolicy.allowedVideoIndexes(
    candidates: _playbackCandidatesForPositions(
      positions,
      isCandidate: _isVideoPlaybackCandidate,
    ),
    viewportTop: viewportTop,
    viewportBottom: viewportBottom,
    isScrollActive: _isScrollActive,
  );

  Set<int> _allowedAnimatedImageIndexes({
    required List<_FavoriteMediaPosition> positions,
    required double viewportTop,
    required double viewportBottom,
  }) => gifAnimatedImagePreviewPlaybackPolicy.allowedVideoIndexes(
    candidates: _playbackCandidatesForPositions(
      positions,
      isCandidate: _isAnimatedImagePlaybackCandidate,
    ),
    viewportTop: viewportTop,
    viewportBottom: viewportBottom,
    isScrollActive: _isScrollActive,
  );

  Iterable<GifPreviewPlaybackCandidate> _playbackCandidatesForPositions(
    List<_FavoriteMediaPosition> positions, {
    required bool Function(FavoriteMeme meme) isCandidate,
  }) sync* {
    for (final position in positions) {
      if (!isCandidate(widget.memes[position.index])) {
        continue;
      }
      yield GifPreviewPlaybackCandidate(
        index: position.index,
        top: position.top,
        bottom: position.bottom,
        left: position.left,
      );
    }
  }

  bool _isVideoPlaybackCandidate(FavoriteMeme meme) =>
      meme.mediaType == FavoriteMemeMediaType.video;

  bool _isAnimatedImagePlaybackCandidate(FavoriteMeme meme) =>
      meme.mediaType == FavoriteMemeMediaType.gif;

  List<_FavoriteMediaPosition> _positionsForLayout({
    required double columnWidth,
    required int columnCount,
  }) {
    if (_layoutItemsVersion == _itemsVersion &&
        _layoutColumnWidth == columnWidth &&
        _layoutColumnCount == columnCount) {
      return _layoutPositions;
    }

    final positions = _computeMasonryPositions(
      columnWidth: columnWidth,
      columnCount: columnCount,
    );
    _layoutItemsVersion = _itemsVersion;
    _layoutColumnWidth = columnWidth;
    _layoutColumnCount = columnCount;
    _layoutPositions = positions;
    _layoutContentHeight = positions.isEmpty
        ? 0.0
        : positions.map((p) => p.bottom).reduce(max) + _kGridHorizontalPadding;
    return positions;
  }

  List<_FavoriteMediaPosition> _computeMasonryPositions({
    required double columnWidth,
    required int columnCount,
  }) {
    final columnHeights = List<double>.filled(columnCount, 0);
    final positions = <_FavoriteMediaPosition>[];

    for (var i = 0; i < widget.memes.length; i++) {
      var column = 0;
      for (var j = 1; j < columnHeights.length; j++) {
        if (columnHeights[j] < columnHeights[column]) {
          column = j;
        }
      }

      final meme = widget.memes[i];
      final itemHeight = _tileHeight(columnWidth, meme);
      final left = _kGridHorizontalPadding + column * (columnWidth + _kGridGap);
      final top = columnHeights[column];
      positions.add(
        _FavoriteMediaPosition(
          index: i,
          left: left,
          top: top,
          width: columnWidth,
          height: itemHeight,
        ),
      );
      columnHeights[column] += itemHeight + _kGridGap;
    }

    return positions;
  }

  int _columnsForWidth(double width) {
    final availableWidth = width - (_kGridHorizontalPadding * 2);
    return max(2, (availableWidth / _kMaxColumnWidth).floor());
  }
}

class _FavoriteMediaPosition {
  const _FavoriteMediaPosition({
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

class _FavoriteMediaTile extends StatelessWidget {
  const _FavoriteMediaTile({
    required this.meme,
    required this.isVisible,
    required this.allowVideoPlayback,
    required this.allowAnimatedImagePlayback,
    required this.onTap,
    required this.onLongPress,
  });

  final FavoriteMeme meme;
  final bool isVisible;
  final bool allowVideoPlayback;
  final bool allowAnimatedImagePlayback;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: DecoratedBox(
          decoration: BoxDecoration(color: colors.backgroundTertiary),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = _tileHeight(width, meme);
              return SizedBox(
                height: height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _FavoriteMediaPreview(
                      meme: meme,
                      isVisible: isVisible,
                      allowVideoPlayback: allowVideoPlayback,
                      allowAnimatedImagePlayback: allowAnimatedImagePlayback,
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.28),
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.32),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (meme.mediaType == FavoriteMemeMediaType.gif)
                      const Positioned(
                        left: 8,
                        top: 8,
                        child: _MediaBadge(label: 'GIF'),
                      ),
                    Positioned(
                      left: 8,
                      right: 8,
                      bottom: 8,
                      child: Text(
                        meme.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          shadows: [Shadow(blurRadius: 4)],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FavoriteMediaPreview extends StatelessWidget {
  const _FavoriteMediaPreview({
    required this.meme,
    required this.isVisible,
    required this.allowVideoPlayback,
    required this.allowAnimatedImagePlayback,
  });

  final FavoriteMeme meme;
  final bool isVisible;
  final bool allowVideoPlayback;
  final bool allowAnimatedImagePlayback;

  @override
  Widget build(BuildContext context) {
    switch (meme.mediaType) {
      case FavoriteMemeMediaType.gif:
        return _buildAnimatedGif();
      case FavoriteMemeMediaType.video:
        return _FavoriteMediaVideoPreview(
          url: meme.url,
          isVisible: isVisible,
          allowPlayback: allowVideoPlayback,
        );
      case FavoriteMemeMediaType.audio:
        return _AudioPreview(meme: meme);
      case FavoriteMemeMediaType.image:
        if (meme.isVideoLike) {
          return _IconPreview(
            icon: PhosphorIconsFill.file,
            label: meme.filename,
          );
        }
        return _buildStaticImage();
      case FavoriteMemeMediaType.unknown:
        return _IconPreview(icon: PhosphorIconsFill.file, label: meme.filename);
    }
  }

  Widget _buildAnimatedGif() {
    final chosen = gifPreviewMediaForPicker(
      src: meme.url,
      proxySrc: meme.url,
      width: meme.width ?? 0,
      height: meme.height ?? 0,
      media: meme.media,
    );
    final base = chosen.proxySrc.isNotEmpty ? chosen.proxySrc : chosen.src;
    return FluxerAnimatedImage(
      animatedUrl: buildMediaProxyUrl(base, format: 'webp', animated: true),
      playing: allowAnimatedImagePlayback,
      placeholder: const _PreviewPlaceholder(),
    );
  }

  Widget _buildStaticImage() => LayoutBuilder(
    builder: (context, constraints) {
      final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
      final cache = coverDecodeCacheSize(
        cellWidth: constraints.maxWidth,
        cellHeight: constraints.maxHeight,
        devicePixelRatio: devicePixelRatio,
        sourceWidth: meme.width,
        sourceHeight: meme.height,
      );
      return CachedNetworkImage(
        imageUrl: meme.url,
        fit: BoxFit.cover,
        memCacheWidth: cache.width,
        memCacheHeight: cache.height,
        maxWidthDiskCache: cache.width,
        maxHeightDiskCache: cache.height,
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        placeholder: (_, _) => const _PreviewPlaceholder(),
        errorBuilder: (_, _, _) => const _PreviewPlaceholder(),
      );
    },
  );
}

class _FavoriteMediaVideoPreview extends StatefulWidget {
  const _FavoriteMediaVideoPreview({
    required this.url,
    required this.isVisible,
    required this.allowPlayback,
  });

  final String url;
  final bool isVisible;
  final bool allowPlayback;

  @override
  State<_FavoriteMediaVideoPreview> createState() =>
      _FavoriteMediaVideoPreviewState();
}

class _FavoriteMediaVideoPreviewState
    extends State<_FavoriteMediaVideoPreview> {
  Player? _player;
  mkv.VideoController? _controller;
  String? _openedUrl;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _syncPlayback();
  }

  @override
  void didUpdateWidget(_FavoriteMediaVideoPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _disposePlayer();
      _failed = false;
    }
    if (oldWidget.url != widget.url ||
        oldWidget.isVisible != widget.isVisible ||
        oldWidget.allowPlayback != widget.allowPlayback) {
      _syncPlayback();
    }
  }

  @override
  void dispose() {
    _disposePlayer();
    super.dispose();
  }

  void _syncPlayback() {
    if (!widget.isVisible || !widget.allowPlayback) {
      final player = _player;
      if (player != null) {
        unawaited(player.pause());
      }
      return;
    }

    final player = _player;
    if (player != null && _openedUrl == widget.url) {
      unawaited(player.play());
      return;
    }

    _openVideoPlayer(widget.url);
  }

  void _openVideoPlayer(String url) {
    final player = Player(configuration: gifPreviewPlayerConfiguration);
    _player = player;
    _controller = mkv.VideoController(
      player,
      configuration: gifPreviewVideoControllerConfiguration(),
    );
    _openedUrl = url;
    unawaited(player.setPlaylistMode(PlaylistMode.loop));
    unawaited(_openPlayer(player, url));
  }

  Future<void> _openPlayer(Player player, String url) async {
    try {
      await player.open(
        Media(url, httpHeaders: _kFavoriteMediaVideoHttpHeaders),
        play: widget.isVisible && widget.allowPlayback,
      );
      if (!mounted || _player != player) {
        return;
      }
      if (widget.isVisible && widget.allowPlayback) {
        await player.play();
      } else {
        await player.pause();
      }
    } on Object {
      if (mounted && _player == player) {
        setState(() => _failed = true);
      }
    }
  }

  void _disposePlayer() {
    final player = _player;
    _player = null;
    _controller = null;
    _openedUrl = null;
    if (player != null) {
      unawaited(player.dispose());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_failed) {
      return const _PreviewPlaceholder();
    }
    final controller = _controller;
    if (controller == null) {
      return const _PreviewPlaceholder();
    }
    return mkv.Video(
      controller: controller,
      fit: BoxFit.cover,
      fill: Colors.transparent,
      controls: null,
      wakelock: false,
    );
  }
}

class _AudioPreview extends StatelessWidget {
  const _AudioPreview({required this.meme});

  final FavoriteMeme meme;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      color: colors.brandPrimary,
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PhosphorIcon(
            PhosphorIconsFill.musicNote,
            color: Colors.white,
            size: 42,
          ),
          const SizedBox(height: 10),
          if (meme.duration != null)
            Text(
              _formatDuration(meme.duration!),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          const SizedBox(height: 6),
          Text(
            meme.filename,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconPreview extends StatelessWidget {
  const _IconPreview({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      color: colors.backgroundModifierSelected,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(icon, color: colors.textPrimaryMuted, size: 44),
          const SizedBox(height: 10),
          Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colors.textPrimaryMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaBadge extends StatelessWidget {
  const _MediaBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: 0.62),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

class _PreviewPlaceholder extends StatelessWidget {
  const _PreviewPlaceholder();

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: context.colors.backgroundModifierSelected,
    child: Center(
      child: PhosphorIcon(
        PhosphorIconsDuotone.image,
        size: 34,
        color: context.colors.textTertiaryMuted,
      ),
    ),
  );
}

class _FavoriteMediaSkeleton extends StatelessWidget {
  const _FavoriteMediaSkeleton();

  @override
  Widget build(BuildContext context) => const Center(
    child: SizedBox(width: 28, height: 28, child: FluxerLoadingSpinner()),
  );
}

class _FavoriteMediaEmptyState extends StatelessWidget {
  const _FavoriteMediaEmptyState({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              icon,
              size: 42,
              color: colors.textPrimaryMuted.withValues(alpha: 0.7),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.textPrimaryMuted, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

double _tileHeight(double columnWidth, FavoriteMeme meme) {
  final minHeight = switch (meme.mediaType) {
    FavoriteMemeMediaType.image => _kMinTileHeight,
    FavoriteMemeMediaType.gif when !meme.isVideoLike => _kMinTileHeight,
    FavoriteMemeMediaType.gif ||
    FavoriteMemeMediaType.video ||
    FavoriteMemeMediaType.audio ||
    FavoriteMemeMediaType.unknown => _kMinNonImageTileHeight,
  };
  return (columnWidth / meme.aspectRatio).clamp(minHeight, _kMaxTileHeight);
}

String _formatDuration(double seconds) {
  final totalSeconds = seconds.round();
  final minutes = totalSeconds ~/ 60;
  final remainder = totalSeconds % 60;
  return '$minutes:${remainder.toString().padLeft(2, '0')}';
}
