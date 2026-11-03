import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final Directory root = _findProjectRoot(Directory.current);

  test(
    'sync-beta-android-release writes properties and pubspec build suffix',
    () {
      final Directory temp = Directory.systemTemp.createTempSync(
        'fluxer-release-version-',
      );
      addTearDown(() {
        if (temp.existsSync()) {
          temp.deleteSync(recursive: true);
        }
      });

      final File pubspec = File('${temp.path}/pubspec.yaml')
        ..writeAsStringSync('''
name: fluxer_app
version: 2026.11.100+1
''');

      final File script = File('${root.path}/.github/scripts/app_version.py');
      final ProcessResult result = Process.runSync('python3', [
        script.path,
        'sync-beta-android-release',
        '2026.11.100-beta.2',
        '4242',
      ], workingDirectory: temp.path);

      expect(result.exitCode, 0, reason: result.stderr.toString());

      final File properties = File(
        '${temp.path}/tool/release/android_release_version.properties',
      );
      expect(
        properties.readAsStringSync(),
        contains('versionName=2026.11.100-beta.2'),
      );
      expect(properties.readAsStringSync(), contains('versionCode=4242'));
      expect(pubspec.readAsStringSync(), contains('version: 2026.11.100+4242'));

      final File changelog = File(
        '${temp.path}/fastlane/metadata/android/en-US/changelogs/4242.txt',
      );
      expect(
        changelog.readAsStringSync(),
        contains('feedback.fluxer.com/changelog'),
      );
    },
  );
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
