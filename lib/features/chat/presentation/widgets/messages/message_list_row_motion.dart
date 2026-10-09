import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_live_entrance.dart';
import 'package:fluxer_app/material_ui.dart';

class MessageListRowResize extends StatelessWidget {
  const MessageListRowResize({
    required this.child,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (!enabled || MediaQuery.disableAnimationsOf(context)) {
      return child;
    }
    return AnimatedSize(
      duration: kMessageListLiveTailMotionDuration,
      curve: Curves.easeOutCubic,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}

class MessageListLiveRemoval extends StatefulWidget {
  const MessageListLiveRemoval({
    required this.child,
    this.onComplete,
    super.key,
  });

  final Widget child;
  final VoidCallback? onComplete;

  @override
  State<MessageListLiveRemoval> createState() => _MessageListLiveRemovalState();
}

class _MessageListLiveRemovalState extends State<MessageListLiveRemoval>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeFactor;
  late final Animation<double> _opacity;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: kMessageListLiveTailMotionDuration,
    );
    final CurvedAnimation sizeCurve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    );
    final CurvedAnimation fadeCurve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _sizeFactor = Tween<double>(begin: 1, end: 0).animate(sizeCurve);
    _opacity = Tween<double>(begin: 1, end: 0).animate(fadeCurve);
    _controller.addStatusListener(_onStatus);
    _controller.forward();
  }

  void _onStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed || _completed) {
      return;
    }
    _completed = true;
    widget.onComplete?.call();
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
    if (MediaQuery.disableAnimationsOf(context)) {
      return widget.child;
    }
    return RepaintBoundary(
      child: ClipRect(
        child: FadeTransition(
          opacity: _opacity,
          child: SizeTransition(
            sizeFactor: _sizeFactor,
            alignment: Alignment.topCenter,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
