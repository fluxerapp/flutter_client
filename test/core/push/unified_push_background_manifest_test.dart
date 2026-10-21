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
    '${projectRoot.path}/android/app/src/unifiedpush/AndroidManifest.xml',
  );
  final File service = File(
    '${projectRoot.path}/android/app/src/main/kotlin/com/fluxer/FluxerUnifiedPushService.kt',
  );

  test('unifiedpush flavor replaces the connector service', () {
    final String manifestContent = manifest.readAsStringSync();
    expect(manifestContent, contains('com.fluxer.FluxerUnifiedPushService'));
    expect(
      manifestContent,
      contains('org.unifiedpush.flutter.connector.UnifiedPushService'),
    );
    expect(manifestContent, contains('tools:node="remove"'));
    expect(
      manifestContent,
      contains('org.unifiedpush.android.connector.PUSH_EVENT'),
    );
  });

  test('fluxer unified push service registers flutter plugins', () {
    final String serviceContent = service.readAsStringSync();
    expect(serviceContent, contains('GeneratedPluginRegistrant.registerWith'));
    expect(serviceContent, contains('--unifiedpush-bg'));
    expect(serviceContent, contains('PARTIAL_WAKE_LOCK'));
    expect(serviceContent, contains('noteMainEngineStopped'));
    expect(serviceContent, contains('discardBackgroundEngine'));
  });
}
