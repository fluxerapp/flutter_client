import 'dart:io';

import 'package:flutter/services.dart';

const EventChannel _androidAnimatorDurationScaleChannel = EventChannel(
  'fluxer_app/android_animator_duration_scale',
);

bool get androidAnimatorDurationScaleSupported => Platform.isAndroid;

Stream<bool> watchAndroidAnimatorDurationDisabled() {
  if (!androidAnimatorDurationScaleSupported) {
    return Stream<bool>.value(false);
  }
  return _androidAnimatorDurationScaleChannel.receiveBroadcastStream().map(
    (Object? event) => event == true,
  );
}
