import 'package:flutter/services.dart';

const MethodChannel _kAndroidNotificationsChannel = MethodChannel(
  'fluxer_app/android_notifications',
);

Future<String?> androidPushImageContentUri(String path) async {
  try {
    return await _kAndroidNotificationsChannel.invokeMethod<String>(
      'contentUriForImage',
      <String, String>{'path': path},
    );
  } on MissingPluginException {
    return null;
  } on PlatformException {
    return null;
  }
}

Future<bool> publishAndroidConversationShortcut({
  required String id,
  required String label,
  String? iconPath,
}) async {
  try {
    final bool? published = await _kAndroidNotificationsChannel
        .invokeMethod<bool>('publishConversationShortcut', <String, String>{
          'id': id,
          'label': label,
          'iconPath': ?iconPath,
        });
    return published ?? false;
  } on MissingPluginException {
    return false;
  } on PlatformException {
    return false;
  }
}
