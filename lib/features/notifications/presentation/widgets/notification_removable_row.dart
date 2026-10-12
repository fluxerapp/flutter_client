import 'package:fluxer_app/material_ui.dart';

const Duration _kRemoveRowDuration = Duration(milliseconds: 200);

class NotificationRemovableRow extends StatefulWidget {
  const NotificationRemovableRow({
    required this.removing,
    required this.onRemoved,
    required this.child,
    super.key,
  });

  final bool removing;
  final VoidCallback onRemoved;
  final Widget child;

  @override
  State<NotificationRemovableRow> createState() =>
      _NotificationRemovableRowState();
}

class _NotificationRemovableRowState extends State<NotificationRemovableRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _kRemoveRowDuration,
    value: 1,
  )..addStatusListener(_onStatus);
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );

  @override
  void didUpdateWidget(NotificationRemovableRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.removing && !oldWidget.removing) {
      _controller.reverse();
    } else if (!widget.removing && oldWidget.removing) {
      _controller.forward();
    }
  }

  void _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      widget.onRemoved();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _curve,
      alignment: Alignment.topCenter,
      child: FadeTransition(opacity: _curve, child: widget.child),
    );
  }
}
