import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

const String _pendingTapFileName = 'fcm_pending_notification_tap.json';

final class FcmPendingNotificationTap {
  FcmPendingNotificationTap._();

  static Future<void> save(String? payloadJson) async {
    if (payloadJson == null || payloadJson.isEmpty) {
      return;
    }
    try {
      final File file = await _pendingTapFile();
      await file.writeAsString(payloadJson);
    } on Object catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          '[FcmPendingNotificationTap] save failed: $error\n$stackTrace',
        );
      }
    }
  }

  static Future<void> flushToHandler(
    void Function(String? payloadJson) handler,
  ) async {
    final String? payloadJson = await readAndClear();
    if (payloadJson == null) {
      return;
    }
    handler(payloadJson);
  }

  static Future<String?> readAndClear() async {
    try {
      final File file = await _pendingTapFile();
      if (!file.existsSync()) {
        return null;
      }
      final String payloadJson = await file.readAsString();
      await file.delete();
      if (payloadJson.isEmpty) {
        return null;
      }
      return payloadJson;
    } on Object catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          '[FcmPendingNotificationTap] read failed: $error\n$stackTrace',
        );
      }
      return null;
    }
  }

  static Future<File> _pendingTapFile() async {
    final Directory dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$_pendingTapFileName');
  }
}
