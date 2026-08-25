import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerStatusIndicator extends StatelessWidget {
  const FluxerStatusIndicator({
    required this.status,
    this.size = 15,
    this.borderColor,
    super.key,
  });

  static const double _idleCutoutCenter = 0.25;
  static const double _idleCutoutRadius = 0.375;

  final String status;
  final double size;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final border = borderColor ?? colors.backgroundSecondary;
    final borderWidth = size * 0.05;

    return ExcludeSemantics(
      child: SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: _statusColor(context),
            shape: BoxShape.circle,
            border: Border.all(color: border, width: borderWidth),
          ),
          child: _buildInner(context),
        ),
      ),
    );
  }

  Widget? _buildInner(BuildContext context) {
    final cutoutColor = borderColor ?? context.colors.backgroundSecondary;

    if (status == 'dnd') {
      final barHeight = size * 0.2;
      return Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cutoutColor,
            borderRadius: BorderRadius.circular(barHeight / 2),
          ),
          child: SizedBox(width: size * 0.55, height: barHeight),
        ),
      );
    }

    if (status == 'idle') {
      final cutoutSize = size * _idleCutoutRadius * 2;
      final cutoutInset = size * (_idleCutoutCenter - _idleCutoutRadius);
      return ClipOval(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: cutoutInset,
              top: cutoutInset,
              width: cutoutSize,
              height: cutoutSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: cutoutColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (status == 'offline' || status == 'invisible') {
      return Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: cutoutColor, shape: BoxShape.circle),
          child: SizedBox(width: size * 0.4, height: size * 0.4),
        ),
      );
    }

    return null;
  }

  Color _statusColor(BuildContext context) {
    final colors = context.colors;
    return switch (status) {
      'online' => colors.statusOnline,
      'idle' => colors.statusIdle,
      'dnd' => colors.statusDnd,
      _ => colors.statusOffline,
    };
  }
}

@FluxerWidgetPreview(name: 'Online', group: 'FluxerStatusIndicator')
Widget fluxerStatusOnlinePreview() {
  return const FluxerStatusIndicator(status: 'online');
}

@FluxerWidgetPreview(name: 'Idle', group: 'FluxerStatusIndicator')
Widget fluxerStatusIdlePreview() {
  return const FluxerStatusIndicator(status: 'idle');
}

@FluxerWidgetPreview(name: 'DND', group: 'FluxerStatusIndicator')
Widget fluxerStatusDndPreview() {
  return const FluxerStatusIndicator(status: 'dnd');
}

@FluxerWidgetPreview(name: 'Offline', group: 'FluxerStatusIndicator')
Widget fluxerStatusOfflinePreview() {
  return const FluxerStatusIndicator(status: 'offline');
}
