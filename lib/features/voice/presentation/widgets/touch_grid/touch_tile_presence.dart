import 'dart:async';

import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_motion.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchTilePresence extends StatefulWidget {
  const VoiceTouchTilePresence({
    required this.departing,
    required this.duration,
    required this.child,
    this.onDeparted,
    super.key,
  });

  final bool departing;
  final Duration duration;
  final Widget child;
  final VoidCallback? onDeparted;

  @override
  State<VoiceTouchTilePresence> createState() => _VoiceTouchTilePresenceState();
}

class _VoiceTouchTilePresenceState extends State<VoiceTouchTilePresence>
    with SingleTickerProviderStateMixin {
  static const double _kEnterScale = 0.96;

  late final AnimationController _controller;
  late final CurvedAnimation _curve;
  late final Animation<double> _scale;
  final GlobalKey _childKey = GlobalKey();
  bool _leaveNotified = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _curve = CurvedAnimation(parent: _controller, curve: kVoiceGridMoveCurve);
    _scale = Tween<double>(begin: _kEnterScale, end: 1).animate(_curve);
    if (widget.duration == Duration.zero || widget.departing) {
      _controller.value = 1;
    }
    _controller.addStatusListener(_onStatus);
    if (widget.departing) {
      _leave();
    } else if (widget.duration != Duration.zero) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(VoiceTouchTilePresence oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (widget.departing && !oldWidget.departing) {
      _leave();
    } else if (!widget.departing && oldWidget.departing) {
      _leaveNotified = false;
      if (widget.duration == Duration.zero) {
        _controller.value = 1;
      } else {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_onStatus);
    _curve.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onStatus(AnimationStatus status) {
    if (mounted && status == AnimationStatus.completed && !widget.departing) {
      setState(() {});
    }
  }

  void _leave() {
    if (widget.duration == Duration.zero) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _notifyDeparted());
      return;
    }
    unawaited(_controller.reverse().whenComplete(_notifyDeparted));
  }

  void _notifyDeparted() {
    if (!mounted || !widget.departing || _leaveNotified) {
      return;
    }
    _leaveNotified = true;
    widget.onDeparted?.call();
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = KeyedSubtree(key: _childKey, child: widget.child);
    final bool settled =
        widget.duration == Duration.zero ||
        (_controller.isCompleted && !widget.departing);
    if (settled) {
      return child;
    }
    return FadeTransition(
      opacity: _curve,
      child: ScaleTransition(scale: _scale, child: child),
    );
  }
}
