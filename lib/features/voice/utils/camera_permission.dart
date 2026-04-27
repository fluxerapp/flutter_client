import 'package:permission_handler/permission_handler.dart';

/// Requests camera access for voice channel video.
Future<bool> requestCameraPermissionForVoice() async {
  final PermissionStatus status = await Permission.camera.request();
  return status.isGranted;
}
