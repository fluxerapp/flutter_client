import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:material_ui/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double _kDotSizeRatio = 0.25;
const double _kDotGapRatio = 0.12;
const int _kDotCount = 3;
const List<double> _kDotDelays = <double>[0, 0.25, 0.5];

double typingDotOpacity(double progress, double delay) {
  final double phase = (progress + delay) % 1;
  return phase < 0.5 ? 1 : 0;
}

Color resolveStatusColor(BuildContext context, String status) {
  final colors = context.colors;
  return switch (status) {
    'online' => colors.statusOnline,
    'idle' => colors.statusIdle,
    'dnd' => colors.statusDnd,
    _ => colors.statusOffline,
  };
}

class FluxerTypingStatusIndicator extends StatefulWidget {
  const FluxerTypingStatusIndicator({
    required this.status,
    required this.width,
    required this.height,
    this.borderColor,
    super.key,
  });

  final String status;
  final double width;
  final double height;
  final Color? borderColor;

  @override
  State<FluxerTypingStatusIndicator> createState() =>
      _FluxerTypingStatusIndicatorState();
}

class _FluxerTypingStatusIndicatorState
    extends State<FluxerTypingStatusIndicator>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _controller;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.syncWithVisibility(isVisible: _isVisible);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _controller.syncWithVisibility(isVisible: _isVisible);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final bool visible = info.visibleFraction > 0;
    if (_isVisible == visible) {
      return;
    }
    _isVisible = visible;
    _controller.syncWithVisibility(isVisible: _isVisible);
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = resolveStatusColor(context, widget.status);
    final Color border =
        widget.borderColor ?? context.colors.backgroundSecondary;
    final double borderWidth = widget.height * 0.05;
    final double dotSize = widget.height * _kDotSizeRatio;
    final double dotGap = widget.height * _kDotGapRatio;
    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    _controller.syncWithVisibility(
      isVisible: _isVisible,
      animationsEnabled: animationsEnabled,
    );

    return VisibilityDetector(
      key: ObjectKey(this),
      onVisibilityChanged: _onVisibilityChanged,
      child: ExcludeSemantics(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(widget.height / 2),
              border: Border.all(color: border, width: borderWidth),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: _TypingDotsPainter(
                    progress: _controller.value,
                    dotSize: dotSize,
                    dotGap: dotGap,
                    delays: _kDotDelays,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TypingDotsPainter extends CustomPainter {
  const _TypingDotsPainter({
    required this.progress,
    required this.dotSize,
    required this.dotGap,
    required this.delays,
  });

  final double progress;
  final double dotSize;
  final double dotGap;
  final List<double> delays;

  @override
  void paint(Canvas canvas, Size size) {
    final double totalWidth = _kDotCount * dotSize + (_kDotCount - 1) * dotGap;
    double x = (size.width - totalWidth) / 2;
    final double y = size.height / 2;
    final Paint paint = Paint();
    for (int index = 0; index < _kDotCount; index++) {
      final double opacity = typingDotOpacity(progress, delays[index]);
      paint.color = Colors.white.withValues(alpha: opacity);
      final double radius = dotSize / 2;
      canvas.drawCircle(Offset(x + dotSize / 2, y), radius, paint);
      x += dotSize + dotGap;
    }
  }

  @override
  bool shouldRepaint(covariant _TypingDotsPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.dotSize != dotSize ||
        oldDelegate.dotGap != dotGap;
  }
}

@FluxerWidgetPreview(
  name: 'Online typing',
  group: 'FluxerTypingStatusIndicator',
)
Widget fluxerTypingStatusOnlinePreview() {
  return const FluxerTypingStatusIndicator(
    status: 'online',
    width: 22,
    height: 12,
  );
}

@FluxerWidgetPreview(name: 'Idle typing', group: 'FluxerTypingStatusIndicator')
Widget fluxerTypingStatusIdlePreview() {
  return const FluxerTypingStatusIndicator(
    status: 'idle',
    width: 22,
    height: 12,
  );
}
