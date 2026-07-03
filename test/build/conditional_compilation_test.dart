import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';

void main() {
  final Directory projectRoot = _findProjectRoot(Directory.current);

  group('conditional compilation artifacts', () {
    test('active firebase messaging service uses the OSS stub', () {
      final File serviceFile = File(
        '${projectRoot.path}/lib/core/push/services/firebase_messaging_push_service.dart',
      );
      final File stubFile = File(
        '${projectRoot.path}/lib/core/push/services/firebase_messaging_push_service.stub.dart',
      );
      expect(serviceFile.readAsStringSync(), stubFile.readAsStringSync());
      expect(serviceFile.readAsStringSync(), isNot(contains('fluxer_fcm')));
    });

    test('active fcm entrypoint uses the OSS stub', () {
      final File entrypointFile = File(
        '${projectRoot.path}/lib/core/push/fcm/fcm_entrypoint.dart',
      );
      final File stubFile = File(
        '${projectRoot.path}/lib/core/push/fcm/fcm_entrypoint_stub.dart',
      );
      expect(entrypointFile.readAsStringSync(), stubFile.readAsStringSync());
      expect(entrypointFile.readAsStringSync(), isNot(contains('fluxer_fcm')));
    });

    test('fcm template sources include firebase integration', () {
      final File serviceTemplate = File(
        '${projectRoot.path}/lib/core/push/services/firebase_messaging_push_service.fcm.dart',
      );
      final File entrypointTemplate = File(
        '${projectRoot.path}/lib/core/push/fcm/fcm_entrypoint.fcm.dart',
      );
      expect(serviceTemplate.readAsStringSync(), contains('fluxer_fcm'));
      expect(entrypointTemplate.readAsStringSync(), contains('fluxer_fcm'));
    });

    test('main manifest excludes firebase metadata', () {
      final File manifest = File(
        '${projectRoot.path}/android/app/src/main/AndroidManifest.xml',
      );
      final String content = manifest.readAsStringSync();
      expect(content, isNot(contains('com.google.firebase.messaging')));
    });

    test('fcm flavor manifest declares firebase messaging service', () {
      final File manifest = File(
        '${projectRoot.path}/android/app/src/fcm/AndroidManifest.xml',
      );
      final String content = manifest.readAsStringSync();
      expect(content, contains('FluxerFirebaseMessagingService'));
      expect(content, contains('FluxerFirebaseMessagingReceiver'));
      expect(content, contains('com.google.firebase.MESSAGING_EVENT'));
      expect(content, contains('com.google.android.c2dm.intent.RECEIVE'));
      expect(content, contains('tools:node="remove"'));
      expect(
        content,
        contains(
          'io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingReceiver',
        ),
      );
      expect(
        content,
        contains('com.google.firebase.messaging.default_notification_icon'),
      );
    });

    test('pubspec excludes firebase dependencies in OSS tree', () {
      final File pubspec = File('${projectRoot.path}/pubspec.yaml');
      final String content = pubspec.readAsStringSync();
      expect(content, isNot(contains('firebase_core:')));
      expect(content, isNot(contains('firebase_messaging:')));
      expect(content, isNot(contains('fluxer_fcm:')));
    });
  });

  group('runtime push provider guard', () {
    test('defaults to apple push provider outside FCM builds', () {
      expect(AppBuildConfig.pushProvider, PushProviderKind.apple);
    });
  });
}

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
