import 'dart:io';

import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/push/fcm/fcm_background_handler_policy.dart';
import 'package:fluxer_app/core/push/fcm/fcm_tap_payload_cache.dart';
import 'package:fluxer_fcm/fluxer_fcm_bootstrap.dart';

Future<void> bootstrapFcmIfNeeded() async {
  if (!PushProviderGuard.isFirebaseMessaging || !Platform.isAndroid) {
    return;
  }
  FluxerFcmBootstrap.configure(
    enrichTapPayload: FcmTapPayloadCache.enrich,
    shouldSaveTapPayloadCache: shouldSaveFcmTapPayloadCache,
    saveTapPayloadCache: FcmTapPayloadCache.save,
  );
  await FluxerFcmBootstrap.bootstrapIfNeeded();
}

Future<void> bootstrapFcmAfterRunApp() async {
  if (!PushProviderGuard.isFirebaseMessaging || !Platform.isAndroid) {
    return;
  }
  await FluxerFcmBootstrap.bootstrapAfterRunApp();
}
