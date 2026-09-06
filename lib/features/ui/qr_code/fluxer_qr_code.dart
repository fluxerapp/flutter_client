import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:qr/qr.dart';

class FluxerQrCode extends StatefulWidget {
  const FluxerQrCode({
    required this.data,
    this.size = 200,
    this.semanticLabel,
    super.key,
  });

  final String data;
  final double size;
  final String? semanticLabel;

  @override
  State<FluxerQrCode> createState() => _FluxerQrCodeState();
}

class _FluxerQrCodeState extends State<FluxerQrCode> {
  late QrImage _qrImage;

  @override
  void initState() {
    super.initState();
    _qrImage = _encode(widget.data);
  }

  @override
  void didUpdateWidget(covariant FluxerQrCode oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _qrImage = _encode(widget.data);
    }
  }

  static QrImage _encode(String data) {
    return QrImage(QrCode(payload: QrPayload.fromString(data)));
  }

  @override
  Widget build(BuildContext context) {
    final Widget qr = SizedBox.square(
      dimension: widget.size,
      child: RepaintBoundary(
        child: CustomPaint(painter: _QrPainter(qrImage: _qrImage)),
      ),
    );
    final String? semanticLabel = widget.semanticLabel;
    if (semanticLabel == null) {
      return qr;
    }
    return Semantics(
      label: semanticLabel,
      image: true,
      child: ExcludeSemantics(child: qr),
    );
  }
}

class _QrPainter extends CustomPainter {
  const _QrPainter({required this.qrImage});

  static const int _quietZoneModules = 4;

  final QrImage qrImage;

  @override
  void paint(Canvas canvas, Size size) {
    final int moduleCount = qrImage.moduleCount;
    final int totalModules = moduleCount + _quietZoneModules * 2;
    final double moduleSize = size.shortestSide / totalModules;
    final double quiet = moduleSize * _quietZoneModules;
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFFFFFFFF),
    );
    final Paint darkPaint = Paint()..color = const Color(0xFF000000);
    final Path path = Path();
    final double overlap = moduleSize * 0.05;

    for (int row = 0; row < moduleCount; row++) {
      for (int col = 0; col < moduleCount; col++) {
        if (!qrImage.isDark(row, col)) {
          continue;
        }
        path.addRect(
          Rect.fromLTWH(
            quiet + col * moduleSize,
            quiet + row * moduleSize,
            moduleSize + overlap,
            moduleSize + overlap,
          ),
        );
      }
    }
    canvas.drawPath(path, darkPaint);
  }

  @override
  bool shouldRepaint(covariant _QrPainter oldDelegate) {
    return oldDelegate.qrImage != qrImage;
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerQrCode')
Widget fluxerQrCodePreview() {
  return const ColoredBox(
    color: Color(0xFF2B2D31),
    child: Padding(
      padding: EdgeInsets.all(24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: FluxerQrCode(
            data:
                'otpauth://totp/Fluxer:user@example.com?secret=JBSWY3DPEHPK3PXP&issuer=Fluxer',
            size: 160,
          ),
        ),
      ),
    ),
  );
}
