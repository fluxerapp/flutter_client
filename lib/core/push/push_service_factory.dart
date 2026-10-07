import 'dart:io';

import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/services/apple_push_service.dart';
import 'package:fluxer_app/core/push/services/firebase_messaging_push_service.dart';
import 'package:fluxer_app/core/push/services/no_op_push_service.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';

PushService createPushService() {
  if (Platform.isIOS) {
    return const ApplePushService();
  }
  if (!Platform.isAndroid) {
    return const ApplePushService();
  }
  if (AppBuildConfig.pushProvider == PushProviderKind.unifiedPush) {
    return UnifiedPushService.instance;
  }
  if (AppBuildConfig.pushProvider == PushProviderKind.firebaseMessaging) {
    return const FirebaseMessagingPushService();
  }
  return const NoOpPushService();
}
