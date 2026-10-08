import 'package:fluxer_app/material_ui.dart';

const Duration kMessageListLiveTailMotionDuration = Duration(milliseconds: 200);
const double kMessageListLiveTailSlidePx = 14;

class MessageListLiveEntrance extends StatefulWidget {
  const MessageListLiveEntrance({
    required this.child,
    this.onComplete,
    super.key,
  });

  final Widget child;
  final VoidCallback? onComplete;

  @override
  State<MessageListLiveEntrance> createState() =>
      _MessageListLiveEntranceState();
}

class _MessageListLiveEntranceState extends State<MessageListLiveEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _slide;

  @override
  void initState() {
    super.initState();
    final AnimationController controller = AnimationController(
      vsync: this,
      duration: kMessageListLiveTailMotionDuration,
    );
    _controller = controller;
    _fade = CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);
    _slide = Tween<double>(
      begin: kMessageListLiveTailSlidePx,
      end: 0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));
    controller
      ..addStatusListener(_onStatus)
      ..forward();
  }

  void _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onComplete?.call();
    }
  }

  @override
  void dispose() {
    _controller
      ..removeStatusListener(_onStatus)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _fade.value,
              child: Transform.translate(
                offset: Offset(0, _slide.value),
                child: child,
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}
