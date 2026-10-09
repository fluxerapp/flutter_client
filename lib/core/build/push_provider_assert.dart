import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';

/// Warns in debug when Android is built without an explicit push provider.
void assertPushProviderBuildConfig() {
  assert(() {
    if (!Platform.isAndroid) {
      return true;
    }
    if (AppBuildConfig.pushProvider == PushProviderKind.apple) {
      debugPrint(
        '[Push] PUSH_PROVIDER defaults to apns on Android. '
        'Use --dart-define=PUSH_PROVIDER=unifiedpush or fcm '
        'to match the Gradle push flavor.',
      );
    }
    return true;
  }(), 'Android push provider should be set via dart-define');
}
