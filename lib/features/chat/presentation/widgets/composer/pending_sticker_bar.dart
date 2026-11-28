import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/pending_composer_sticker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class ComposerPendingStickerBar extends ConsumerStatefulWidget {
  const ComposerPendingStickerBar({required this.channelId, super.key});

  final String channelId;

  @override
  ConsumerState<ComposerPendingStickerBar> createState() =>
      _ComposerPendingStickerBarState();
}

class _ComposerPendingStickerBarState
    extends ConsumerState<ComposerPendingStickerBar> {
  static const double _kPreviewExtent = 64;
  static const double _kPreviewRadius = 6;
  static const double _kImageInset = 4;
  static const double _kRemoveExtent = 32;
  static const double _kRemoveIconSize = 20;
  static const double _kGap = 8;
  static const EdgeInsets _kPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  bool _hovered = false;

  void _remove() =>
      ref.read(pendingComposerStickerProvider.notifier).clear(widget.channelId);

  @override
  Widget build(BuildContext context) {
    final StickerEntry? sticker = ref.watch(
      pendingComposerStickerProvider.select(
        (Map<String, StickerEntry> staged) => staged[widget.channelId],
      ),
    );
    if (sticker == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String description = sticker.description.trim();
    return Padding(
      padding: _kPadding,
      child: Row(
        spacing: _kGap,
        children: <Widget>[
          MouseRegion(
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            child: Container(
              width: _kPreviewExtent,
              height: _kPreviewExtent,
              padding: const EdgeInsets.all(_kImageInset),
              decoration: BoxDecoration(
                color: context.colors.backgroundTertiary,
                borderRadius: BorderRadius.circular(_kPreviewRadius),
              ),
              child: CachedNetworkImage(
                imageUrl: FluxerMediaUrl.sticker(
                  id: sticker.id,
                  animated: sticker.animated && _hovered,
                ),
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ':${sticker.name}:',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodyMedium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.colors.textPrimary,
                  ),
                ),
                if (description.isNotEmpty)
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.smallText.copyWith(
                      fontSize: 12,
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
              ],
            ),
          ),
          if (usesDesktopPointerUi(context))
            FluxerButton.desktop(
              icon: PhosphorIconsRegular.trash,
              semanticLabel: l10n.composerPendingStickerRemove,
              showTooltip: true,
              extent: _kRemoveExtent,
              iconSize: _kRemoveIconSize,
              borderRadius: _kPreviewRadius,
              onPressed: _remove,
            )
          else
            FluxerButton.circleAlt(
              icon: PhosphorIconsRegular.trash,
              semanticLabel: l10n.composerPendingStickerRemove,
              onPressed: _remove,
            ),
        ],
      ),
    );
  }
}
