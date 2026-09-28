import 'dart:math' as math;

import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_tray_registry.dart';

Future<void> drainPushTrayRegistry(PushTrayRegistry registry) async {
  final List<MapEntry<String, String>> entries = registry.drain();
  if (entries.isEmpty) {
    return;
  }
  for (
    var index = 0;
    index < entries.length;
    index += kPushTrayDrainBatchSize
  ) {
    final int end = math.min(index + kPushTrayDrainBatchSize, entries.length);
    for (final MapEntry<String, String> entry in entries.sublist(index, end)) {
      await PushNotificationClear.cancelForChannel(
        entry.key,
        upToMessageId: entry.value,
      );
    }
  }
}
