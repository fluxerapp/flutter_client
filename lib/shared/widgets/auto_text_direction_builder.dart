import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class AutoTextDirectionBuilder extends StatefulWidget {
  const AutoTextDirectionBuilder({
    required this.controller,
    required this.builder,
    super.key,
  });

  final TextEditingController? controller;
  final Widget Function(BuildContext context, TextDirection? direction) builder;

  @override
  State<AutoTextDirectionBuilder> createState() =>
      _AutoTextDirectionBuilderState();
}

class _AutoTextDirectionBuilderState extends State<AutoTextDirectionBuilder> {
  TextDirection? _direction;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_syncDirection);
    _direction = _resolveDirection();
  }

  @override
  void didUpdateWidget(AutoTextDirectionBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) {
      return;
    }
    oldWidget.controller?.removeListener(_syncDirection);
    widget.controller?.addListener(_syncDirection);
    _direction = _resolveDirection();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_syncDirection);
    super.dispose();
  }

  TextDirection? _resolveDirection() {
    final String? text = widget.controller?.text;
    return text == null ? null : firstStrongTextDirection(text);
  }

  void _syncDirection() {
    final TextDirection? next = _resolveDirection();
    if (next != _direction) {
      setState(() => _direction = next);
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _direction);
}
