import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final Directory root = _findProjectRoot(Directory.current);

  void expectSync({
    required String pubspecVersion,
    required String versionName,
    required String versionCode,
    required String expectedPubspecVersion,
  }) {
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
version: $pubspecVersion
''');

    final File script = File('${root.path}/.github/scripts/app_version.py');
    final ProcessResult result = Process.runSync('python3', [
      script.path,
      'sync-android-release',
      versionName,
      versionCode,
    ], workingDirectory: temp.path);

    expect(result.exitCode, 0, reason: result.stderr.toString());

    final String properties = File(
      '${temp.path}/tool/release/android_release_version.properties',
    ).readAsStringSync();
    expect(properties, contains('versionName=$versionName\n'));
    expect(properties, contains('versionCode=$versionCode\n'));
    expect(
      pubspec.readAsStringSync(),
      contains('version: $expectedPubspecVersion'),
    );

    final File changelog = File(
      '${temp.path}/fastlane/metadata/android/en-US/changelogs/$versionCode.txt',
    );
    expect(
      changelog.readAsStringSync(),
      contains('feedback.fluxer.com/changelog'),
    );
  }

  test('sync-android-release writes beta properties and pubspec build', () {
    expectSync(
      pubspecVersion: '2026.11.100+1',
      versionName: '2026.11.100-beta.2',
      versionCode: '4242',
      expectedPubspecVersion: '2026.11.100+4242',
    );
  });

  test('sync-android-release writes stable properties and pubspec build', () {
    expectSync(
      pubspecVersion: '2026.11.100+4242',
      versionName: '2026.11.100',
      versionCode: '4250',
      expectedPubspecVersion: '2026.11.100+4250',
    );
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
