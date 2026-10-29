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
  test('incoming call activity stays in history on a cold start', () {
    final Directory projectRoot = _findProjectRoot(Directory.current);
    final String manifest = File(
      '${projectRoot.path}/android/app/src/main/AndroidManifest.xml',
    ).readAsStringSync();
    expect(
      manifest,
      contains('com.hiennv.flutter_callkit_incoming.CallkitIncomingActivity'),
    );
    expect(manifest, contains('android:noHistory="false"'));
    expect(manifest, contains('tools:replace="android:noHistory"'));
  });
}
