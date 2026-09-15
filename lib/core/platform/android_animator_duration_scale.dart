import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const EventChannel _androidAnimatorDurationScaleChannel = EventChannel(
  'fluxer_app/android_animator_duration_scale',
);

bool get androidAnimatorDurationScaleSupported =>
    !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

Stream<bool> watchAndroidAnimatorDurationDisabled() {
  if (!androidAnimatorDurationScaleSupported) {
    return Stream<bool>.value(false);
  }
  return _androidAnimatorDurationScaleChannel.receiveBroadcastStream().map(
    (Object? event) => event == true,
  );
}
