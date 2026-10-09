import 'package:fluxer_app/material_ui.dart';

const Duration kMessageListLiveTailMotionDuration = Duration(milliseconds: 200);
const double kMessageListLiveTailSlidePx = 14;

class MessageListLiveEntrance extends StatelessWidget {
  const MessageListLiveEntrance({
    required this.fade,
    required this.slide,
    required this.child,
    super.key,
  });

  final Animation<double> fade;
  final Animation<double> slide;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRect(
        child: AnimatedBuilder(
          animation: Listenable.merge(<Listenable>[fade, slide]),
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: fade.value,
              child: Transform.translate(
                offset: Offset(0, slide.value),
                child: child,
              ),
            );
          },
          child: child,
        ),
      ),
    );
  }
}

class MessageListLiveEntranceStandalone extends StatefulWidget {
  const MessageListLiveEntranceStandalone({
    required this.child,
    this.onComplete,
    super.key,
  });

  final Widget child;
  final VoidCallback? onComplete;

  @override
  State<MessageListLiveEntranceStandalone> createState() =>
      _MessageListLiveEntranceStandaloneState();
}

class _MessageListLiveEntranceStandaloneState
    extends State<MessageListLiveEntranceStandalone>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: kMessageListLiveTailMotionDuration,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _slide = Tween<double>(
      begin: kMessageListLiveTailSlidePx,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.addStatusListener(_onStatus);
    _controller.forward();
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
    return MessageListLiveEntrance(
      fade: _fade,
      slide: _slide,
      child: widget.child,
    );
  }
}
