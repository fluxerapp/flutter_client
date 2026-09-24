import 'dart:io';

import 'package:test/test.dart';

Directory _findProjectRoot(Directory start) {
  Directory? current = start;
  while (current != null) {
    if (File('${current.path}/pubspec.yaml').existsSync()) {
      return current;
    }
    current = current.parent;
  }
  throw StateError('Could not find project root (pubspec.yaml)');
}

void main() {
  final Directory projectRoot = _findProjectRoot(Directory.current);
  final File manifest = File(
    '${projectRoot.path}/android/app/src/fcm/AndroidManifest.xml',
  );
  final File entrypointTemplate = File(
    '${projectRoot.path}/lib/core/push/fcm/fcm_entrypoint.fcm.dart',
  );
  final File messagingService = File(
    '${projectRoot.path}/android/app/src/fcm/kotlin/com/fluxer/FluxerFirebaseMessagingService.kt',
  );

  group('FCM Android integration contract', () {
    test('fcm manifest replaces plugin messaging service and receiver', () {
      final String content = manifest.readAsStringSync();
      expect(content, contains('com.fluxer.FluxerFirebaseMessagingService'));
      expect(content, contains('com.fluxer.FluxerFirebaseMessagingReceiver'));
      expect(
        content,
        contains(
          'io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingService',
        ),
      );
      expect(
        content,
        contains(
          'io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingReceiver',
        ),
      );
      expect(content, contains('tools:node="remove"'));
      expect(content, contains('com.google.firebase.MESSAGING_EVENT'));
      expect(content, contains('com.google.android.c2dm.intent.RECEIVE'));
      expect(
        content,
        isNot(
          contains('com.google.firebase.messaging.FirebaseMessagingService'),
        ),
      );
    });

    test('native messaging service does not copy gcm notification text', () {
      final String content = messagingService.readAsStringSync();
      expect(content, contains('handleRemoteMessageIntent'));
      expect(content, contains('gcm.notification.title'));
      expect(content, isNot(contains('putString("title"')));
      expect(content, isNot(contains('forwardMessage')));
    });

    test('native receiver forwards data-only messages', () {
      final File receiver = File(
        '${projectRoot.path}/android/app/src/fcm/kotlin/com/fluxer/FluxerFirebaseMessagingReceiver.kt',
      );
      final String content = receiver.readAsStringSync();
      expect(content, contains('FlutterFirebaseMessagingBackgroundService'));
      expect(content, contains('FcmMessagingBridge.EXTRA_REMOTE_MESSAGE'));
      expect(content, contains('goAsync()'));
      expect(content, isNot(contains('putString("title"')));
    });

    test('fcm entrypoint decrypts ciphertext in the background isolate', () {
      final String content = entrypointTemplate.readAsStringSync();
      expect(content, contains('fcmBackgroundMessageHandlerEntry'));
      expect(content, contains('DartPluginRegistrant.ensureInitialized'));
      expect(content, contains('_configureFcmBootstrap'));
      expect(content, contains('FcmCiphertextHooks.onCiphertext'));
      expect(content, contains('AndroidPushPipeline.handleCiphertext'));
      expect(
        content,
        contains('onBackgroundMessage: fcmBackgroundMessageHandlerEntry'),
      );
    });

    test('background handler registers dart plugins before decrypt', () {
      final File handler = File(
        '${projectRoot.path}/packages/fluxer_fcm/lib/fcm_background_handler.dart',
      );
      final String content = handler.readAsStringSync();
      expect(content, contains('DartPluginRegistrant.ensureInitialized'));
      expect(content, contains('extractFcmCiphertext'));
      expect(content, contains('backgroundMode: true'));
    });

    test('web push key store does not wipe secrets on android read errors', () {
      final File keyStore = File(
        '${projectRoot.path}/lib/core/push/web_push/web_push_key_store.dart',
      );
      expect(
        keyStore.readAsStringSync(),
        contains('AndroidOptions(resetOnError: false)'),
      );
    });
  });
}
