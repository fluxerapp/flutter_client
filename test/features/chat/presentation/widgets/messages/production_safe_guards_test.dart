import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('chat lib code never gates behavior on debug-only Element getters', () {
    final Directory chatLib = Directory('lib/features/chat');
    final List<String> offenders = <String>[];
    for (final FileSystemEntity entity in chatLib.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) {
        continue;
      }
      final List<String> lines = entity.readAsLinesSync();
      for (int i = 0; i < lines.length; i += 1) {
        final String line = lines[i];
        if (line.trimLeft().startsWith('//')) {
          continue;
        }
        if (line.contains('debugIsActive') || line.contains('debugIsDefunct')) {
          offenders.add('${entity.path}:${i + 1}: ${line.trim()}');
        }
      }
    }
    expect(
      offenders,
      isEmpty,
      reason:
          'debug-only Element getters are constant-false in profile/release '
          'builds; use context.mounted instead',
    );
  });
}
