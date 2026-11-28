import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_controller.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_entry.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_scope.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSectionOutlineAnchor extends StatefulWidget {
  const FluxerSectionOutlineAnchor({
    required this.sectionId,
    required this.title,
    required this.child,
    super.key,
  });

  final String sectionId;
  final String title;
  final Widget child;

  @override
  State<FluxerSectionOutlineAnchor> createState() =>
      _FluxerSectionOutlineAnchorState();
}

class _FluxerSectionOutlineAnchorState
    extends State<FluxerSectionOutlineAnchor> {
  FluxerSectionOutlineController? _controller;

  @override
  void dispose() {
    _controller?.unregister(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerSectionOutlineController? controller =
        FluxerSectionOutlineScope.read(context);
    if (_controller != controller) {
      _controller?.unregister(this);
      _controller = controller;
    }
    controller?.register(
      this,
      context,
      FluxerSectionOutlineEntry(id: widget.sectionId, title: widget.title),
    );
    return widget.child;
  }
}
