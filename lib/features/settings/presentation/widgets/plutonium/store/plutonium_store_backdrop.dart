import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_waves.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreBackdrop extends StatefulWidget {
  const PremiumStoreBackdrop({
    required this.controller,
    required this.bar,
    required this.child,
    super.key,
  });

  final ScrollController controller;
  final Widget bar;
  final Widget child;

  @override
  State<PremiumStoreBackdrop> createState() => _PremiumStoreBackdropState();
}

class _PremiumStoreBackdropState extends State<PremiumStoreBackdrop> {
  double _offset = 0;
  double _viewport = 0;
  double _extent = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_sync);
    WidgetsBinding.instance.addPostFrameCallback((_) => _sync());
  }

  @override
  void didUpdateWidget(PremiumStoreBackdrop oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) {
      return;
    }
    oldWidget.controller.removeListener(_sync);
    widget.controller.addListener(_sync);
    _sync();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_sync);
    super.dispose();
  }

  void _sync() {
    if (!widget.controller.hasClients) {
      return;
    }
    final ScrollPosition position = widget.controller.position;
    final double offset = position.pixels;
    final double viewport = position.viewportDimension;
    final double extent = position.maxScrollExtent + viewport;
    if (offset == _offset && viewport == _viewport && extent == _extent) {
      return;
    }
    setState(() {
      _offset = offset;
      _viewport = viewport;
      _extent = extent;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final double extent = _extent <= 0 ? _viewport : _extent;
    final Color barColor = extent <= 0
        ? style.spaceTop
        : _colorAt(style, (_offset + _viewport) / extent);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: _PageGradientPainter(
                      style: style,
                      offset: _offset,
                      extent: extent,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: PremiumStoreWaves(controller: widget.controller),
              ),
              widget.child,
            ],
          ),
        ),
        ColoredBox(color: barColor, child: widget.bar),
      ],
    );
  }
}

Color _colorAt(PremiumStoreStyle style, double t) {
  final double clamped = t.clamp(0.0, 1.0);
  if (clamped <= 0.5) {
    return Color.lerp(style.spaceTop, style.spaceMid, clamped / 0.5)!;
  }
  return Color.lerp(style.spaceMid, style.spaceBottom, (clamped - 0.5) / 0.5)!;
}

class _PageGradientPainter extends CustomPainter {
  const _PageGradientPainter({
    required this.style,
    required this.offset,
    required this.extent,
  });

  final PremiumStoreStyle style;
  final double offset;
  final double extent;

  @override
  void paint(Canvas canvas, Size size) {
    final double span = extent <= 0 ? size.height : extent;
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [style.spaceTop, style.spaceMid, style.spaceBottom],
        stops: const [0, 0.45, 1],
      ).createShader(Rect.fromLTWH(0, -offset, size.width, span));
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(_PageGradientPainter oldDelegate) {
    return oldDelegate.style != style ||
        oldDelegate.offset != offset ||
        oldDelegate.extent != extent;
  }
}
