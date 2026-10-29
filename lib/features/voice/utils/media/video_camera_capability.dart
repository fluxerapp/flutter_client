import 'package:livekit_client/livekit_client.dart';

Future<bool> isVideoCameraAvailableOnDevice() async {
  try {
    final List<MediaDevice> devices = await Hardware.instance
        .enumerateDevices();
    return devices.any((MediaDevice device) => device.kind == 'videoinput');
  } on Object {
    return false;
  }
}
