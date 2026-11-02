import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/platform/android_animator_duration_scale.dart';

void main() {
  test('animator duration scale is only read on Android', () async {
    expect(androidAnimatorDurationScaleSupported, Platform.isAndroid);
    if (Platform.isAndroid) {
      return;
    }
    expect(await watchAndroidAnimatorDurationDisabled().first, isFalse);
  });
}
