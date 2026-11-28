import 'dart:async';

import 'package:fluxer_app/features/chat/utils/media/media_kit_player_lifecycle.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;

Future<void> showPendingVideoPreview(
  BuildContext context, {
  required String path,
  int? width,
  int? height,
}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: FluxerLocalizations.of(context).mediaViewerImagePreview,
    barrierColor: Colors.black.withValues(alpha: 0.85),
    pageBuilder: (BuildContext dialogContext, _, _) =>
        PendingVideoPreview(path: path, width: width, height: height),
    transitionBuilder: (_, Animation<double> animation, _, Widget child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

class PendingVideoPreview extends StatefulWidget {
  const PendingVideoPreview({
    required this.path,
    this.width,
    this.height,
    super.key,
  });

  static const double _kViewportFraction = 0.8;

  final String path;
  final int? width;
  final int? height;

  @override
  State<PendingVideoPreview> createState() => _PendingVideoPreviewState();
}

class _PendingVideoPreviewState extends State<PendingVideoPreview> {
  late final Player _player = MediaKitPlayerLifecycleCoordinator.instance
      .createPlayer();
  late final mkv.VideoController _controller = mkv.VideoController(_player);

  @override
  void initState() {
    super.initState();
    unawaited(_player.open(Media(widget.path)));
  }

  @override
  void dispose() {
    unawaited(
      MediaKitPlayerLifecycleCoordinator.instance.stopAndDispose(_player),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size viewport = MediaQuery.sizeOf(context);
    final int? width = widget.width;
    final int? height = widget.height;
    final double aspectRatio = width != null && height != null && height > 0
        ? width / height
        : 16 / 9;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: viewport.width * PendingVideoPreview._kViewportFraction,
          maxHeight: viewport.height * PendingVideoPreview._kViewportFraction,
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: mkv.Video(controller: _controller),
        ),
      ),
    );
  }
}
