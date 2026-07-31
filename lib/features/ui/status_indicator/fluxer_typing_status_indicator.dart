import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double _kDotSizeRatio = 0.25;
const double _kDotGapRatio = 0.12;

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
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      _TypingDot(
                        animation: _controller,
                        delay: 0,
                        size: dotSize,
                      ),
                      SizedBox(width: dotGap),
                      _TypingDot(
                        animation: _controller,
                        delay: 0.25,
                        size: dotSize,
                      ),
                      SizedBox(width: dotGap),
                      _TypingDot(
                        animation: _controller,
                        delay: 0.5,
                        size: dotSize,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TypingDot extends StatelessWidget {
  const _TypingDot({
    required this.animation,
    required this.delay,
    required this.size,
  });

  final Animation<double> animation;
  final double delay;
  final double size;

  @override
  Widget build(BuildContext context) {
    final double phase = (animation.value + delay) % 1;
    final double opacity = phase < 0.5 ? 1 : 0;
    return Opacity(
      opacity: opacity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: SizedBox(width: size, height: size),
      ),
    );
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
