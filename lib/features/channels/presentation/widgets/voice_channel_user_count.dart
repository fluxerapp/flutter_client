import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

/// Split badge showing how many users are in a voice channel vs its limit
class VoiceChannelUserCount extends StatelessWidget {
  final int currentUserCount;
  final int userLimit;

  const VoiceChannelUserCount({
    required this.currentUserCount,
    required this.userLimit,
    super.key,
  });

  static const double _height = 17;
  static const double _leftWidth = 29;
  static const double _rightWidth = 21;
  static const double _totalWidth = _leftWidth + _rightWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String current = currentUserCount.toString().padLeft(2, '0');
    final String limit = userLimit.toString().padLeft(2, '0');
    final style = context.textStyles.timestamp.copyWith(
      fontWeight: FontWeight.w500,
      color: colors.textTertiary,
      fontFeatures: const [FontFeature.tabularFigures()],
      height: 1.1,
    );

    return CustomPaint(
      painter: _BadgePainter(
        leftColor: colors.backgroundSecondary,
        rightColor: colors.backgroundModifierSelected,
        borderColor: colors.borderColor,
      ),
      child: SizedBox(
        width: _totalWidth,
        height: _height,
        child: Row(
          children: [
            SizedBox(
              width: _leftWidth,
              child: Center(child: Text(current, style: style)),
            ),
            SizedBox(
              width: _rightWidth,
              child: Center(child: Text(limit, style: style)),
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgePainter extends CustomPainter {
  static const double _notchWidth = 5;

  final Color leftColor;
  final Color rightColor;
  final Color borderColor;

  const _BadgePainter({
    required this.leftColor,
    required this.rightColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double leftWidth = VoiceChannelUserCount._leftWidth;
    const radius = Radius.circular(4);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      radius,
    );
    canvas
      ..clipRRect(rrect)
      ..drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = leftColor,
      );
    final rightPath = Path()
      ..moveTo(leftWidth, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(leftWidth - _notchWidth, size.height)
      ..close();
    canvas
      ..drawPath(rightPath, Paint()..color = rightColor)
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
          radius,
        ),
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
      );
  }

  @override
  bool shouldRepaint(_BadgePainter old) =>
      old.leftColor != leftColor ||
      old.rightColor != rightColor ||
      old.borderColor != borderColor;
}
