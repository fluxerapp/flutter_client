import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';

void main() {
  final Directory projectRoot = _findProjectRoot(Directory.current);

  group('conditional compilation artifacts', () {
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
      expect(
        content,
        contains(
          'com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver',
        ),
      );
    });

    test('main manifest excludes play billing queries', () {
      final File manifest = File(
        '${projectRoot.path}/android/app/src/main/AndroidManifest.xml',
      );
      final String content = manifest.readAsStringSync();
      expect(
        content,
        isNot(contains('com.android.vending.billing.InAppBillingService.BIND')),
      );
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
