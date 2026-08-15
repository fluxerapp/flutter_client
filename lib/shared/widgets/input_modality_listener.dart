import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:material_ui/material_ui.dart';

class InputModalityListener extends ConsumerStatefulWidget {
  const InputModalityListener({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<InputModalityListener> createState() =>
      _InputModalityListenerState();
}

class _InputModalityListenerState extends ConsumerState<InputModalityListener> {
  @override
  void initState() {
    super.initState();
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
  }

  @override
  void dispose() {
    GestureBinding.instance.pointerRouter.removeGlobalRoute(
      _handlePointerEvent,
    );
    super.dispose();
  }

  void _handlePointerEvent(PointerEvent event) {
    if (event is PointerDownEvent || event is PointerHoverEvent) {
      ref.read(inputModalityProvider.notifier).handlePointerEvent(event);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
