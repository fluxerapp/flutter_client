import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kIdleBiteCenter = 0.25;
const double _kIdleBiteRadius = 0.375;
const double _kDndBarWidth = 0.73;
const double _kDndBarHeight = 0.23;
const double _kOfflineHoleDiameter = 0.47;

Color resolveStatusColor(BuildContext context, String status) {
  final colors = context.colors;
  return switch (status) {
    'online' => colors.statusOnline,
    'idle' => colors.statusIdle,
    'dnd' => colors.statusDnd,
    _ => colors.statusOffline,
  };
}

class FluxerStatusIndicator extends StatelessWidget {
  const FluxerStatusIndicator({
    required this.status,
    this.size = 15,
    this.color,
    super.key,
  });

  final String status;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: CustomPaint(
        size: Size.square(size),
        painter: FluxerStatusPainter(
          status: status,
          color: color ?? resolveStatusColor(context, status),
        ),
      ),
    );
  }
}

class FluxerStatusPainter extends CustomPainter {
  const FluxerStatusPainter({required this.status, required this.color});

  final String status;
  final Color color;

  static Path glyphPath(String status, Rect bounds) {
    final double side = bounds.shortestSide;
    final Rect square = Rect.fromCenter(
      center: bounds.center,
      width: side,
      height: side,
    );
    final Path shape = Path()
      ..addRRect(RRect.fromRectAndRadius(bounds, Radius.circular(side / 2)));
    final Path? hole = switch (status) {
      'idle' =>
        Path()..addOval(
          Rect.fromCircle(
            center: square.topLeft + Offset(side, side) * _kIdleBiteCenter,
            radius: side * _kIdleBiteRadius,
          ),
        ),
      'dnd' =>
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: square.center,
              width: side * _kDndBarWidth,
              height: side * _kDndBarHeight,
            ),
            Radius.circular(side * _kDndBarHeight / 2),
          ),
        ),
      'offline' || 'invisible' =>
        Path()..addOval(
          Rect.fromCircle(
            center: square.center,
            radius: side * _kOfflineHoleDiameter / 2,
          ),
        ),
      _ => null,
    };
    if (hole == null) {
      return shape;
    }
    return Path.combine(PathOperation.difference, shape, hole);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    canvas.drawPath(
      glyphPath(status, Offset.zero & size),
      Paint()
        ..color = color
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(FluxerStatusPainter oldDelegate) =>
      status != oldDelegate.status || color != oldDelegate.color;
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
