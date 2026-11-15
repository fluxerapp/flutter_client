import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final Directory root = _findProjectRoot(Directory.current);

  Map<String, Object?> readDefines(String name) =>
      jsonDecode(
            File('${root.path}/tool/dart_defines/$name').readAsStringSync(),
          )
          as Map<String, Object?>;

  test('fdroid dart defines build stable without observability reporting', () {
    final Map<String, Object?> defines = readDefines('fdroid.json');
    expect(defines['APP_ENVIRONMENT'], 'stable');
    expect(defines['OBSERVABILITY_REPORTING'], 'false');
  });

  test('fdroid flutter version matches every CI-pinned flutter version', () {
    final String fdroidVersion = File(
      '${root.path}/tool/fdroid/flutter_version.txt',
    ).readAsStringSync().trim();
    final RegExp pin = RegExp(r'flutter-version:\s*(\S+)');
    final Set<String> ciVersions = <String>{
      for (final FileSystemEntity entity in Directory(
        '${root.path}/.github/workflows',
      ).listSync())
        if (entity is File && entity.path.endsWith('.yml'))
          for (final RegExpMatch match in pin.allMatches(
            entity.readAsStringSync(),
          ))
            match.group(1)!,
    };
    expect(ciVersions, <String>{fdroidVersion});
  });

  const String vendoredPasskeys = 'packages/passkeys_android_fdroid';

  test('vendored passkeys_android matches the locked pub.dev version', () {
    final RegExp lockEntry = RegExp(
      r'^  passkeys_android:\n(?:    .*\n)*?    version: "([^"]+)"',
      multiLine: true,
    );
    final String lock = File('${root.path}/pubspec.lock').readAsStringSync();
    final String? lockedVersion = lockEntry.firstMatch(lock)?.group(1);
    final String vendoredVersion =
        RegExp(r'^version: ([^+\s]+)', multiLine: true)
            .firstMatch(
              File(
                '${root.path}/$vendoredPasskeys/pubspec.yaml',
              ).readAsStringSync(),
            )!
            .group(1)!;
    expect(lockedVersion, vendoredVersion);
  });

  test('vendored passkeys_android has no Play Services code', () {
    final List<String> offenders = <String>[
      for (final FileSystemEntity entity in Directory(
        '${root.path}/$vendoredPasskeys',
      ).listSync(recursive: true))
        if (entity is File &&
            RegExp(
              r'com\.google\.android\.gms|credentials-play-services-auth',
            ).hasMatch(entity.readAsStringSync()))
          entity.path.substring(root.path.length + 1),
    ];
    expect(offenders, isEmpty);
  });

  test('stable dart defines do not disable observability reporting', () {
    expect(
      readDefines('stable.json').containsKey('OBSERVABILITY_REPORTING'),
      isFalse,
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
