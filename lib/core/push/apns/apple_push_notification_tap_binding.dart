import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/push_notification_tap_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apple_push_notification_tap_binding.g.dart';

const EventChannel _applePushTapChannel = EventChannel(
  'fluxer_app/apple_push/taps',
);

@Riverpod(keepAlive: true)
void applePushNotificationTapBinding(Ref ref) {
  if (!PushProviderGuard.isApple) {
    return;
  }
  final StreamSubscription<dynamic> subscription = _applePushTapChannel
      .receiveBroadcastStream()
      .listen(
        (Object? event) {
          final Map<String, String>? payload = _castPayload(event);
          if (payload == null) {
            return;
          }
          ref
              .read(pushNotificationTapHandlerProvider.notifier)
              .handlePayload(payload);
        },
        onError: (Object err, StackTrace st) {
          if (kDebugMode) {
            debugPrint('[ApplePushTapBinding] stream error: $err\n$st');
          }
        },
      );
  ref.onDispose(() {
    unawaited(subscription.cancel());
  });
}

Map<String, String>? _castPayload(Object? event) {
  if (event is! Map<Object?, Object?>) {
    return null;
  }
  return event.map(
    (Object? key, Object? value) =>
        MapEntry<String, String>(key.toString(), value?.toString() ?? ''),
  );
}
