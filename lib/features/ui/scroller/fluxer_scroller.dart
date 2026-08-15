import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:material_ui/material_ui.dart';

class FluxerScroller extends StatefulWidget {
  const FluxerScroller({required this.child, this.controller, super.key});

  final Widget child;
  final ScrollController? controller;

  @override
  State<FluxerScroller> createState() => _FluxerScrollerState();
}

class _FluxerScrollerState extends State<FluxerScroller> {
  ScrollController? _internalController;

  ScrollController get _effectiveController =>
      widget.controller ?? (_internalController ??= ScrollController());

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(controller: _effectiveController, child: widget.child);
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerScroller')
Widget fluxerScrollerPreview() {
  return SizedBox(
    height: 160,
    width: 220,
    child: FluxerScroller(
      child: ListView(
        children: List.generate(
          12,
          (int i) => ListTile(title: Text('Row ${i + 1}')),
        ),
      ),
    ),
  );
}
