import 'package:fluxer_app/material_ui.dart';

class FluxerModalSlot {
  Future<void>? _open;

  Future<void> show(Future<void> Function() open) =>
      _open ??= open().whenComplete(_release);

  void _release() => _open = null;
}

class FluxerModalSlotScope extends StatefulWidget {
  const FluxerModalSlotScope({
    required this.slot,
    required this.child,
    super.key,
  });

  final FluxerModalSlot slot;
  final Widget child;

  @override
  State<FluxerModalSlotScope> createState() => _FluxerModalSlotScopeState();
}

class _FluxerModalSlotScopeState extends State<FluxerModalSlotScope> {
  @override
  void dispose() {
    widget.slot._release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
