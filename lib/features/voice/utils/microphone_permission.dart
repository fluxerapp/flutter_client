import 'package:permission_handler/permission_handler.dart';

/// Returns whether microphone access is already granted for voice.
Future<bool> hasMicrophonePermissionForVoice() async {
  final PermissionStatus status = await Permission.microphone.status;
  return status.isGranted;
}

/// Requests microphone access for voice channels and calls.
Future<bool> requestMicrophonePermissionForVoice() async {
  final PermissionStatus status = await Permission.microphone.request();
  return status.isGranted;
}
