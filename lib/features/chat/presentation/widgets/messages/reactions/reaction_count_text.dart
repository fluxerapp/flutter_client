import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kReactionCountSlide = 20;
const Duration _kReactionCountDuration = Duration(milliseconds: 200);

class ReactionCountText extends StatefulWidget {
  const ReactionCountText({
    required this.count,
    required this.style,
    super.key,
  });

  final int count;
  final TextStyle style;

  @override
  State<ReactionCountText> createState() => _ReactionCountTextState();
}

class _ReactionCountTextState extends State<ReactionCountText> {
  bool _increasing = true;

  @override
  void didUpdateWidget(ReactionCountText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _increasing = widget.count > oldWidget.count;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Duration duration =
        MediaQuery.disableAnimationsOf(context) ||
            context.motion.fast == Duration.zero
        ? Duration.zero
        : _kReactionCountDuration;
    final Widget label = Text(
      '${widget.count}',
      key: ValueKey<int>(widget.count),
      style: widget.style,
    );
    if (duration == Duration.zero) {
      return label;
    }
    return ClipRect(
      child: AnimatedSwitcher(
        duration: duration,
        layoutBuilder: (Widget? current, List<Widget> previous) => Stack(
          alignment: Alignment.center,
          children: <Widget>[...previous, ?current],
        ),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final bool entering = child.key == ValueKey<int>(widget.count);
          final double direction = _increasing ? 1 : -1;
          final double from = entering
              ? -direction * _kReactionCountSlide
              : direction * _kReactionCountSlide;
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? inner) => Opacity(
              opacity: animation.value,
              child: Transform.translate(
                offset: Offset(0, from * (1 - animation.value)),
                child: inner,
              ),
            ),
            child: child,
          );
        },
        child: label,
      ),
    );
  }
}
