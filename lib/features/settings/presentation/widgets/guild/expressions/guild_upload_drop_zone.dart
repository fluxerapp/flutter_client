import 'dart:ui' show PathMetric;

import 'package:desktop_drop/desktop_drop.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class GuildUploadDropZone extends StatefulWidget {
  const GuildUploadDropZone({
    required this.description,
    required this.onFilesDropped,
    super.key,
  });

  final String description;
  final ValueChanged<List<DropItem>> onFilesDropped;

  @override
  State<GuildUploadDropZone> createState() => _GuildUploadDropZoneState();
}

class _GuildUploadDropZoneState extends State<GuildUploadDropZone> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    final layout = context.layout;
    if (usesDesktopPointerUi(context)) {
      return _buildDesktopPointer(context);
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s3, layout.s4, 0),
      child: DropTarget(
        onDragEntered: (_) => setState(() => _isDragging = true),
        onDragExited: (_) => setState(() => _isDragging = false),
        onDragDone: (DropDoneDetails details) {
          setState(() => _isDragging = false);
          widget.onFilesDropped(details.files);
        },
        child: AnimatedContainer(
          duration: context.motion.fast,
          width: double.infinity,
          padding: EdgeInsets.all(layout.s6),
          decoration: BoxDecoration(
            borderRadius: layout.radiusLg,
            border: Border.all(
              color: _isDragging ? colors.borderColorHover : colors.borderColor,
            ),
            color: _isDragging
                ? colors.backgroundModifierHover.withValues(alpha: 0.35)
                : colors.backgroundSecondaryAlt,
          ),
          child: Text(
            widget.description,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyMedium.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopPointer(BuildContext context) {
    final colors = context.colors;
    final Color borderColor = _isDragging
        ? colors.textPrimary
        : colors.backgroundHeaderSecondary;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropTarget(
        onDragEntered: (_) => setState(() => _isDragging = true),
        onDragExited: (_) => setState(() => _isDragging = false),
        onDragDone: (DropDoneDetails details) {
          setState(() => _isDragging = false);
          widget.onFilesDropped(details.files);
        },
        child: CustomPaint(
          foregroundPainter: _DashedBorderPainter(color: borderColor),
          child: AnimatedContainer(
            duration: context.motion.normal,
            curve: Curves.easeInOut,
            width: double.infinity,
            padding: const EdgeInsets.all(34),
            decoration: BoxDecoration(
              borderRadius: context.layout.radiusMd,
              color: _isDragging
                  ? colors.backgroundHeaderSecondary
                  : colors.backgroundTertiary,
            ),
            child: Column(
              children: <Widget>[
                PhosphorIcon(
                  PhosphorIconsRegular.uploadSimple,
                  size: 48,
                  color: colors.textPrimaryMuted,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodyMedium.copyWith(
                    fontSize: 14,
                    height: 20 / 14,
                    color: colors.textPrimaryMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 2;
    const double dash = 6;
    const double gap = 4;
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final RRect rrect = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(strokeWidth / 2),
      const Radius.circular(5),
    );
    final Path path = Path()..addRRect(rrect);
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(metric.extractPath(distance, distance + dash), paint);
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color;
}
