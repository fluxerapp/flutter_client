import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';

const MethodChannel _backgroundDeliveryChannel = MethodChannel(
  'fluxer_app/unified_push_background_delivery',
);

bool _supported() => PushProviderGuard.isUnifiedPush && Platform.isAndroid;

Future<bool> isUnifiedPushBackgroundDeliveryRestricted() async {
  if (!_supported()) {
    return false;
  }
  try {
    final bool? restricted = await _backgroundDeliveryChannel
        .invokeMethod<bool>('isRestricted');
    return restricted ?? false;
  } on PlatformException {
    return false;
  } on MissingPluginException {
    return false;
  }
}

Future<bool> requestUnifiedPushBackgroundDeliveryExemption() async {
  if (!_supported()) {
    return false;
  }
  try {
    final bool? launched = await _backgroundDeliveryChannel.invokeMethod<bool>(
      'requestExemption',
    );
    return launched ?? false;
  } on PlatformException {
    return false;
  } on MissingPluginException {
    return false;
  }
}
