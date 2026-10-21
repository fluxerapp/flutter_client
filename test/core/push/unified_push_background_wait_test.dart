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
  final File service = File(
    '${_findProjectRoot(Directory.current).path}'
    '/lib/core/push/services/unified_push_service.dart',
  );

  test('background isolate wait completes only from onMessage', () {
    final String content = service.readAsStringSync();
    expect(content, contains('void _completeBackgroundMessageWait()'));
    expect(content, contains('_completeBackgroundMessageWait();'));
    expect(content, isNot(contains('_finishBackgroundEvent')));
    expect(content, isNot(contains('_backgroundWork')));
  });
}
