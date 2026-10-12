import 'package:fluxer_app/material_ui.dart';

class MessageDoubleTapExemption {
  int? pointer;
}

class MessageDoubleTapExemptionScope extends InheritedWidget {
  const MessageDoubleTapExemptionScope({
    required this.exemption,
    required super.child,
    super.key,
  });

  final MessageDoubleTapExemption exemption;

  @override
  bool updateShouldNotify(MessageDoubleTapExemptionScope oldWidget) =>
      exemption != oldWidget.exemption;
}

class MessageDoubleTapExempt extends StatelessWidget {
  const MessageDoubleTapExempt({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MessageDoubleTapExemption? exemption = context
        .getInheritedWidgetOfExactType<MessageDoubleTapExemptionScope>()
        ?.exemption;
    if (exemption == null) {
      return child;
    }
    return Listener(
      onPointerDown: (PointerDownEvent event) =>
          exemption.pointer = event.pointer,
      child: child,
    );
  }
}
