import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef FluxerSelectCallback = void Function(FluxerKeyModifiers modifiers);

@immutable
class FluxerKeyModifiers {
  const FluxerKeyModifiers({
    this.shift = false,
    this.alt = false,
    this.control = false,
    this.meta = false,
  });

  factory FluxerKeyModifiers.current() {
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    return FluxerKeyModifiers(
      shift: keyboard.isShiftPressed,
      alt: keyboard.isAltPressed,
      control: keyboard.isControlPressed,
      meta: keyboard.isMetaPressed,
    );
  }

  static const FluxerKeyModifiers none = FluxerKeyModifiers();

  final bool shift;
  final bool alt;
  final bool control;
  final bool meta;

  bool get any => shift || alt || control || meta;

  bool get controlOrMeta =>
      defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.iOS
      ? meta
      : control;

  @override
  bool operator ==(Object other) =>
      other is FluxerKeyModifiers &&
      other.shift == shift &&
      other.alt == alt &&
      other.control == control &&
      other.meta == meta;

  @override
  int get hashCode => Object.hash(shift, alt, control, meta);
}
