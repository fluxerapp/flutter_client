import 'package:permission_handler/permission_handler.dart';

/// Requests microphone access for voice channels and calls.
Future<bool> requestMicrophonePermissionForVoice() async {
  final PermissionStatus status = await Permission.microphone.request();
  return status.isGranted;
}
