import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final Directory root = _findProjectRoot(Directory.current);

  test('fdroid dart defines disable observability reporting', () {
    final File defines = File('${root.path}/tool/dart_defines/fdroid.json');
    expect(defines.readAsStringSync(), contains('"OBSERVABILITY_REPORTING"'));
    expect(defines.readAsStringSync(), contains('"false"'));
  });

  test('beta dart defines do not disable observability reporting', () {
    final File defines = File('${root.path}/tool/dart_defines/beta.json');
    final String content = defines.readAsStringSync();
    expect(content, isNot(contains('OBSERVABILITY_REPORTING')));
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
