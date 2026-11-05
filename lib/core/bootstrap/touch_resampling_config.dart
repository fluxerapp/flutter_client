import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

const Duration kAndroidTouchSamplingOffset = Duration(milliseconds: -16);

void configureFluxerTouchResampling() {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
    return;
  }
  GestureBinding.instance
    ..resamplingEnabled = true
    ..samplingOffset = kAndroidTouchSamplingOffset;
}
