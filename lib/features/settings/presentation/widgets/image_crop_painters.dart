import 'package:crop_your_image/crop_your_image.dart';
import 'package:material_ui/material_ui.dart';

const imageCropCornerHandleSize = 52.0;
const _cornerArmLength = 18.0;
const _cornerStrokeWidth = 2.5;
const _frameStrokeWidth = 1.5;
const _guideStrokeWidth = 1.0;

class ImageCropCornerHandle extends StatelessWidget {
  const ImageCropCornerHandle({
    required this.packageDotSize,
    required this.alignment,
    required this.color,
    super.key,
  });

  final double packageDotSize;
  final EdgeAlignment alignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final offset = (packageDotSize - imageCropCornerHandleSize) / 2;

    return Transform.translate(
      offset: Offset(offset, offset),
      child: SizedBox(
        width: imageCropCornerHandleSize,
        height: imageCropCornerHandleSize,
        child: CustomPaint(
          painter: ImageCropCornerBracketPainter(
            alignment: alignment,
            color: color,
          ),
        ),
      ),
    );
  }
}

class ImageCropCornerBracketPainter extends CustomPainter {
  const ImageCropCornerBracketPainter({
    required this.alignment,
    required this.color,
  });

  final EdgeAlignment alignment;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = _cornerStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const inset = _cornerStrokeWidth / 2;
    final (
      Offset corner,
      Offset horizontalEnd,
      Offset verticalEnd,
    ) = switch (alignment) {
      EdgeAlignment.topLeft => (
        const Offset(inset, inset),
        const Offset(_cornerArmLength, inset),
        const Offset(inset, _cornerArmLength),
      ),
      EdgeAlignment.topRight => (
        Offset(size.width - inset, inset),
        Offset(size.width - _cornerArmLength, inset),
        Offset(size.width - inset, _cornerArmLength),
      ),
      EdgeAlignment.bottomLeft => (
        Offset(inset, size.height - inset),
        Offset(_cornerArmLength, size.height - inset),
        Offset(inset, size.height - _cornerArmLength),
      ),
      EdgeAlignment.bottomRight => (
        Offset(size.width - inset, size.height - inset),
        Offset(size.width - _cornerArmLength, size.height - inset),
        Offset(size.width - inset, size.height - _cornerArmLength),
      ),
    };

    canvas
      ..drawLine(corner, horizontalEnd, paint)
      ..drawLine(corner, verticalEnd, paint);
  }

  @override
  bool shouldRepaint(covariant ImageCropCornerBracketPainter oldDelegate) {
    return oldDelegate.alignment != alignment || oldDelegate.color != color;
  }
}

class ImageCropFramePainter extends CustomPainter {
  const ImageCropFramePainter({
    required this.isCircle,
    required this.borderColor,
    required this.guideColor,
  });

  final bool isCircle;
  final Color borderColor;
  final Color guideColor;

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _frameStrokeWidth;

    if (isCircle) {
      canvas.drawCircle(
        size.center(Offset.zero),
        size.shortestSide / 2,
        borderPaint,
      );
      return;
    }

    canvas.drawRect(Offset.zero & size, borderPaint);

    final guidePaint = Paint()
      ..color = guideColor
      ..strokeWidth = _guideStrokeWidth;

    final thirdWidth = size.width / 3;
    final thirdHeight = size.height / 3;
    canvas
      ..drawLine(
        Offset(thirdWidth, 0),
        Offset(thirdWidth, size.height),
        guidePaint,
      )
      ..drawLine(
        Offset(thirdWidth * 2, 0),
        Offset(thirdWidth * 2, size.height),
        guidePaint,
      )
      ..drawLine(
        Offset(0, thirdHeight),
        Offset(size.width, thirdHeight),
        guidePaint,
      )
      ..drawLine(
        Offset(0, thirdHeight * 2),
        Offset(size.width, thirdHeight * 2),
        guidePaint,
      );
  }

  @override
  bool shouldRepaint(covariant ImageCropFramePainter oldDelegate) {
    return oldDelegate.isCircle != isCircle ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.guideColor != guideColor;
  }
}
