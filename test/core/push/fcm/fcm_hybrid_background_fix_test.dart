import 'dart:convert';
import 'dart:io';

import 'package:fluxer_app/core/push/fcm/fcm_gcm_notification_enrichment.dart';
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
  final File messageForwarder = File(
    '${projectRoot.path}/android/app/src/fcm/kotlin/com/fluxer/FcmMessageForwarder.kt',
  );

  group('enrichGcmNotificationData', () {
    test('copies gcm notification title and body into data fields', () {
      final Map<String, String> enriched =
          enrichGcmNotificationData(<String, String>{
            kGcmNotificationTitleKey: 'Emptiest (#asdfqwer)',
            kGcmNotificationBodyKey: 'Pong!',
            'channel_id': 'dm-1',
            'url': '/channels/@me/dm-1/msg-9',
          });
      expect(enriched['title'], 'Emptiest (#asdfqwer)');
      expect(enriched['body'], 'Pong!');
      expect(enriched['channel_id'], 'dm-1');
      expect(enriched['url'], '/channels/@me/dm-1/msg-9');
    });

    test('does not overwrite existing title and body in data', () {
      final Map<String, String> enriched =
          enrichGcmNotificationData(<String, String>{
            kGcmNotificationTitleKey: 'from-gcm',
            kGcmNotificationBodyKey: 'from-gcm-body',
            'title': 'from-data',
            'body': 'from-data-body',
          });
      expect(enriched['title'], 'from-data');
      expect(enriched['body'], 'from-data-body');
    });

    test('ignores blank gcm notification fields', () {
      final Map<String, String> enriched = enrichGcmNotificationData(
        <String, String>{
          kGcmNotificationTitleKey: '   ',
          kGcmNotificationBodyKey: '',
        },
      );
      expect(enriched.containsKey('title'), isFalse);
      expect(enriched.containsKey('body'), isFalse);
    });
  });

  group('FCM hybrid background regression', () {
    test('unenriched navigable data alone reproduces generic display text', () {
      final Map<String, String> data = <String, String>{
        'channel_id': 'dm-1',
        'message_id': 'msg-9',
        'url': '/channels/@me/dm-1/msg-9',
      };
      final String title = data['title'] ?? 'Fluxer';
      final String body = data['body'] ?? 'New message';
      expect(title, 'Fluxer');
      expect(body, 'New message');
    });

    test('enriched navigable data keeps rich display text', () {
      final Map<String, String> enriched =
          enrichGcmNotificationData(<String, String>{
            kGcmNotificationTitleKey: 'Emptiest (#asdfqwer)',
            kGcmNotificationBodyKey: 'Pong!',
            'channel_id': 'dm-1',
            'message_id': 'msg-9',
            'url': '/channels/@me/dm-1/msg-9',
          });
      expect(enriched['title'], isNot('Fluxer'));
      expect(enriched['body'], isNot('New message'));
      expect(enriched['url'], '/channels/@me/dm-1/msg-9');
    });

    test('enriched tap payload json is navigable', () {
      final Map<String, String> enriched =
          enrichGcmNotificationData(<String, String>{
            kGcmNotificationTitleKey: 'Emptiest (#asdfqwer)',
            kGcmNotificationBodyKey: 'Pong!',
            'channel_id': 'dm-1',
            'message_id': 'msg-9',
            'url': '/channels/@me/dm-1/msg-9',
          });
      final String payloadJson = jsonEncode(enriched);
      final Map<String, dynamic> decoded =
          jsonDecode(payloadJson) as Map<String, dynamic>;
      expect(decoded['url'], '/channels/@me/dm-1/msg-9');
      expect(decoded['channel_id'], 'dm-1');
    });
  });

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

    test(
      'native messaging service suppresses default notification dispatch',
      () {
        final String content = messagingService.readAsStringSync();
        expect(content, contains('handleRemoteMessageIntent'));
        expect(
          content,
          contains('FcmMessageForwarder.enrichNotificationIntoData'),
        );
        expect(content, isNot(contains('forwardMessage')));
        expect(content, contains('-> handleRemoteMessageIntent(intent)'));
        expect(content, contains('else -> super.handleIntent(intent)'));
      },
    );

    test(
      'native receiver enriches and forwards to flutter background service',
      () {
        final File receiver = File(
          '${projectRoot.path}/android/app/src/fcm/kotlin/com/fluxer/FluxerFirebaseMessagingReceiver.kt',
        );
        final String content = receiver.readAsStringSync();
        expect(
          content,
          contains('FcmMessageForwarder.enrichNotificationIntoData'),
        );
        expect(content, contains('FlutterFirebaseMessagingBackgroundService'));
        expect(content, contains('FcmMessagingBridge.EXTRA_REMOTE_MESSAGE'));
      },
    );

    test('native forwarder enriches gcm notification keys', () {
      final String content = messageForwarder.readAsStringSync();
      expect(content, contains('gcm.notification.title'));
      expect(content, contains('gcm.notification.body'));
    });

    test('fcm entrypoint configures background isolate bootstrap', () {
      final String content = entrypointTemplate.readAsStringSync();
      expect(content, contains('fcmBackgroundMessageHandlerEntry'));
      expect(content, contains('_configureFcmBootstrap'));
      expect(content, contains('shouldDisplayBackgroundLocalNotification'));
      expect(content, contains('cancelFcmSystemDuplicates'));
      expect(
        content,
        contains('onBackgroundMessage: fcmBackgroundMessageHandlerEntry'),
      );
    });
  });
}
