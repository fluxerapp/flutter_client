import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// Wraps an embed subtree with the spoiler overlay
Widget wrapEmbedSpoiler({
  required EmbedType type,
  required bool isSpoiler,
  required bool revealSpoilers,
  required FluxerSpoilerSyncController? spoilerSyncController,
  required List<String> spoilerSyncKeys,
  required Widget child,
}) {
  final BorderRadius borderRadius =
      type == EmbedType.image ||
          type == EmbedType.gifv ||
          type == EmbedType.video
      ? const BorderRadius.all(Radius.circular(4))
      : const BorderRadius.all(Radius.circular(8));

  return SpoilerOverlay(
    isSpoiler: isSpoiler,
    initiallyRevealed: revealSpoilers,
    spoilerSyncController: spoilerSyncController,
    syncKeys: spoilerSyncKeys,
    borderRadius: borderRadius,
    child: child,
  );
}
