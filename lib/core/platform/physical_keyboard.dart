import 'package:flutter/services.dart';

const EventChannel _physicalKeyboardChannel = EventChannel(
  'fluxer_app/physical_keyboard',
);

Stream<bool> watchPhysicalKeyboardConnected({
  required bool supported,
}) {
  if (!supported) {
    return Stream<bool>.value(false);
  }
  return _physicalKeyboardChannel.receiveBroadcastStream().map(
    (Object? event) => event == true,
  );
}
