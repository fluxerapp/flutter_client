import 'dart:typed_data';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/utils/gallery_attachment_selection.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AttachmentGalleryGrid extends StatelessWidget {
  const AttachmentGalleryGrid({
    required this.items,
    required this.selectedAssetIds,
    required this.thumbnailLoader,
    required this.onCameraPressed,
    required this.onAssetPressed,
    required this.scrollController,
    this.isLoadingMore = false,
    super.key,
  });

  final List<AttachmentGalleryItem> items;
  final Set<String> selectedAssetIds;
  final Future<Uint8List?> Function(String id) thumbnailLoader;
  final VoidCallback onCameraPressed;
  final ValueChanged<AttachmentGalleryItem> onAssetPressed;
  final ScrollController scrollController;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final int extra = isLoadingMore ? 1 : 0;
    return GridView.builder(
      controller: scrollController,
      padding: EdgeInsets.fromLTRB(
        layout.s1_5,
        0,
        layout.s1_5,
        layout.s20 + layout.s2,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: layout.s1,
        crossAxisSpacing: layout.s1,
      ),
      itemCount: 1 + items.length + extra,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _CameraCell(onPressed: onCameraPressed);
        }
        final int assetIndex = index - 1;
        if (assetIndex >= items.length) {
          return const Center(child: FluxerLoadingSpinner());
        }
        final AttachmentGalleryItem item = items[assetIndex];
        return _AssetCell(
          key: ValueKey<String>(item.id),
          item: item,
          selected: selectedAssetIds.contains(item.id),
          thumbnailLoader: thumbnailLoader,
          onPressed: () => onAssetPressed(item),
        );
      },
    );
  }
}

class _CameraCell extends StatelessWidget {
  const _CameraCell({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerTappable(
      onTap: onPressed,
      semanticLabel: l10n.chatAttachmentSourceCamera,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundTertiary,
            borderRadius: layout.radiusLg,
          ),
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsFill.camera,
              color: colors.textPrimary,
              size: 28,
            ),
          ),
        );
      },
    );
  }
}

class _AssetCell extends StatefulWidget {
  const _AssetCell({
    required this.item,
    required this.selected,
    required this.thumbnailLoader,
    required this.onPressed,
    super.key,
  });

  final AttachmentGalleryItem item;
  final bool selected;
  final Future<Uint8List?> Function(String id) thumbnailLoader;
  final VoidCallback onPressed;

  @override
  State<_AssetCell> createState() => _AssetCellState();
}

class _AssetCellState extends State<_AssetCell> {
  late Future<Uint8List?> _thumbnail;

  @override
  void initState() {
    super.initState();
    _thumbnail = widget.thumbnailLoader(widget.item.id);
  }

  @override
  void didUpdateWidget(covariant _AssetCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.id != widget.item.id) {
      _thumbnail = widget.thumbnailLoader(widget.item.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return FluxerTappable(
      onTap: widget.onPressed,
      selected: widget.selected,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        return ClipRRect(
          borderRadius: layout.radiusLg,
          child: ColoredBox(
            color: colors.backgroundTertiary,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FutureBuilder<Uint8List?>(
                  future: _thumbnail,
                  builder:
                      (
                        BuildContext context,
                        AsyncSnapshot<Uint8List?> snapshot,
                      ) {
                        final Uint8List? bytes = snapshot.data;
                        if (bytes == null || bytes.isEmpty) {
                          return ColoredBox(color: colors.backgroundTertiary);
                        }
                        return Image.memory(bytes, fit: BoxFit.cover);
                      },
                ),
                if (widget.item.isVideo && widget.item.duration != null)
                  Positioned(
                    left: layout.s1_5,
                    bottom: layout.s1_5,
                    child: Text(
                      formatGalleryVideoDuration(widget.item.duration!),
                      style: context.textStyles.smallText.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (widget.selected)
                  const ColoredBox(color: Color.fromRGBO(0, 0, 0, 0.4)),
                Positioned(
                  top: layout.s1_5,
                  right: layout.s1_5,
                  child: _SelectionMark(selected: widget.selected),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SelectionMark extends StatelessWidget {
  const _SelectionMark({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    const double size = 22;
    if (!selected) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          color: const Color.fromRGBO(0, 0, 0, 0.26),
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.accentPrimary,
      ),
      alignment: Alignment.center,
      child: const PhosphorIcon(
        PhosphorIconsBold.check,
        size: 14,
        color: Colors.white,
      ),
    );
  }
}
