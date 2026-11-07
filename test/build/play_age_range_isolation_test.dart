import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final Directory projectRoot = _findProjectRoot(Directory.current);

  test('Play libraries are only declared for the FCM flavor', () {
    final List<String> declarations =
        File('${projectRoot.path}/android/app/build.gradle.kts')
            .readAsLinesSync()
            .where((String line) => line.contains('com.google.android.play:'))
            .toList();
    expect(declarations, isNotEmpty);
    expect(
      declarations.every(
        (String line) => line.contains('add("fcmImplementation"'),
      ),
      isTrue,
      reason: declarations.join('\n'),
    );
  });

  test('Play libraries are only imported from the FCM source set', () {
    final List<String> offenders = <String>[
      for (final String path in <String>[
        'android/app/src/main',
        'android/app/src/unifiedpush',
        'lib',
      ])
        ...Directory('${projectRoot.path}/$path')
            .listSync(recursive: true)
            .whereType<File>()
            .where((File file) {
              final String name = file.path;
              return name.endsWith('.kt') ||
                  name.endsWith('.java') ||
                  name.endsWith('.dart');
            })
            .where(
              (File file) =>
                  file.readAsStringSync().contains('com.google.android.play.'),
            )
            .map((File file) => file.path),
    ];
    expect(offenders, isEmpty);
  });

  test('both push flavors define the bridge MainActivity registers', () {
    final String fcm = File(
      '${projectRoot.path}/android/app/src/fcm/kotlin/com/fluxer/PlayAgeRangeBridge.kt',
    ).readAsStringSync();
    final String unifiedPush = File(
      '${projectRoot.path}/android/app/src/unifiedpush/kotlin/com/fluxer/PlayAgeRangeBridge.kt',
    ).readAsStringSync();
    expect(fcm, contains('class PlayAgeRangeBridge('));
    expect(unifiedPush, contains('class PlayAgeRangeBridge('));
    expect(unifiedPush, isNot(contains('com.google')));
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
