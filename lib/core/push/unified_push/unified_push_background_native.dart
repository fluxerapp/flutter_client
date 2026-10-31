import 'dart:io';

import 'package:flutter/services.dart';

const MethodChannel _kUnifiedPushBackgroundChannel = MethodChannel(
  'com.fluxer/unified_push_background',
);

Future<void> prepareUnifiedPushBackgroundNative() async {
  if (!Platform.isAndroid) {
    return;
  }
  try {
    await _kUnifiedPushBackgroundChannel.invokeMethod<void>('prepare');
  } on Object {
    return;
  }
}

Future<void> finishUnifiedPushBackgroundNative() async {
  if (!Platform.isAndroid) {
    return;
  }
  try {
    await _kUnifiedPushBackgroundChannel.invokeMethod<void>('finish');
  } on Object {
    return;
  }
}
