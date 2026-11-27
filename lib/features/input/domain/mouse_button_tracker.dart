import 'package:flutter/gestures.dart';

const Set<int> kRecordableMouseButtons = <int>{1, 3, 4};

const Map<int, int> _kDomButtonForFlutterButton = <int, int>{
  kPrimaryMouseButton: 0,
  kMiddleMouseButton: 1,
  kSecondaryMouseButton: 2,
  kBackMouseButton: 3,
  kForwardMouseButton: 4,
};

List<int> _domButtons(int buttons) => <int>[
  for (final MapEntry<int, int> entry in _kDomButtonForFlutterButton.entries)
    if (buttons & entry.key != 0) entry.value,
];

class MouseButtonChange {
  const MouseButtonChange({required this.pressed, required this.released});

  final List<int> pressed;
  final List<int> released;
}

class MouseButtonTracker {
  final Map<int, int> _buttonsByDevice = <int, int>{};

  void reset() => _buttonsByDevice.clear();

  MouseButtonChange? track(PointerEvent event) {
    if (event.kind != PointerDeviceKind.mouse) {
      return null;
    }
    final int previous = _buttonsByDevice[event.device] ?? 0;
    final int current =
        event is PointerUpEvent ||
            event is PointerCancelEvent ||
            event is PointerRemovedEvent
        ? 0
        : event.buttons;
    if (current == previous) {
      return null;
    }
    if (current == 0) {
      _buttonsByDevice.remove(event.device);
    } else {
      _buttonsByDevice[event.device] = current;
    }
    return MouseButtonChange(
      pressed: _domButtons(current & ~previous),
      released: _domButtons(previous & ~current),
    );
  }
}
