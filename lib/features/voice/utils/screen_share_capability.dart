import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';

const int _kMinAndroidSdkForScreenShare = 29;

Future<bool> isScreenShareSupportedOnPlatform() async {
  if (Platform.isLinux && isFluxerRuntimeMobileFormFactor) {
    return false;
  }
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    return true;
  }
  final DeviceInfoPlugin plugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final AndroidDeviceInfo info = await plugin.androidInfo;
    return info.version.sdkInt >= _kMinAndroidSdkForScreenShare;
  }
  if (Platform.isIOS) {
    final IosDeviceInfo info = await plugin.iosInfo;
    return info.isPhysicalDevice;
  }
  return false;
}
