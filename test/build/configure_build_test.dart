import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/configure_build.dart';

const String _manifestMain = 'android/app/src/main/AndroidManifest.xml';
const String _manifestFcm = 'android/app/src/fcm/AndroidManifest.xml';

List<String> _selectorPaths() => <String>[
  for (final BuildModule module in allModules)
    for (final Selector selector in module.selectors) selector.path,
];

Directory _copyProject(Directory projectRoot) {
  final Directory copy = Directory.systemTemp.createTempSync('configure_build');
  File('${copy.path}/tool/configure_build.dart').createSync(recursive: true);
  for (final String path in <String>[
    ...stashedPaths,
    _manifestMain,
    _manifestFcm,
  ]) {
    final File source = File('${projectRoot.path}/$path');
    if (!source.existsSync()) {
      continue;
    }
    File('${copy.path}/$path')
      ..createSync(recursive: true)
      ..writeAsBytesSync(source.readAsBytesSync());
  }
  return copy;
}

Map<String, String> _read(Directory root, List<String> paths) =>
    <String, String>{
      for (final String path in paths)
        if (File('${root.path}/$path').existsSync())
          path: File('${root.path}/$path').readAsStringSync(),
    };

void main() {
  final Directory projectRoot = findProjectRoot(Directory.current);
  late Directory copy;

  setUp(() => copy = _copyProject(projectRoot));
  tearDown(() => copy.deleteSync(recursive: true));

  test('committed pubspec matches the canonical profile', () {
    final String pubspec = File(
      '${projectRoot.path}/pubspec.yaml',
    ).readAsStringSync();
    expect(applyModulesToPubspec(pubspec, canonicalProfile), pubspec);
  });

  test('selectors are not tracked by git', () {
    final ProcessResult result = Process.runSync('git', <String>[
      'ls-files',
      '--cached',
      '--',
      ..._selectorPaths(),
    ], workingDirectory: projectRoot.path);
    expect((result.stdout as String).trim(), isEmpty);
  });

  test('profile aliases resolve to the canonical profile', () {
    for (final String alias in <String>['dev', 'ios-store', 'apns']) {
      expect(buildProfileFromName(alias), BuildProfile.dev);
    }
    expect(parseBuildProfile(const <String>[]), canonicalProfile);
    expect(() => buildProfileFromName('nope'), throwsArgumentError);
  });

  for (final BuildProfile profile in BuildProfile.values) {
    group(profile.cliName, () {
      test('pubspec and selectors follow the module registry', () async {
        await configureProjectBuild(copy, profile);
        final String pubspec = File(
          '${copy.path}/pubspec.yaml',
        ).readAsStringSync();
        final int blockStart = pubspec.indexOf(modulesMarkerStart);
        final int blockEnd = pubspec.indexOf(modulesMarkerEnd);
        final String block = pubspec.substring(blockStart, blockEnd);
        for (final BuildModule module in allModules) {
          final bool on = profile.enables(module);
          expect(
            block.contains('${module.packageName}:'),
            on,
            reason: '${module.packageName} in ${profile.cliName}',
          );
          for (final Selector selector in module.selectors) {
            expect(
              File('${copy.path}/${selector.path}').readAsStringSync(),
              selectorSource(on ? selector.whenOn : selector.whenOff),
            );
            expect(
              File(
                '${projectRoot.path}/lib/${(on ? selector.whenOn : selector.whenOff).split('package:fluxer_app/').last}',
              ).existsSync(),
              isTrue,
            );
          }
        }
        expect(readRecordedProfile(copy), profile);
      });

      test('switching back to dev restores the original bytes', () async {
        final Map<String, String> before = _read(copy, stashedPaths);
        await configureProjectBuild(copy, profile);
        File(
          '${copy.path}/pubspec.lock',
        ).writeAsStringSync('${before['pubspec.lock']}\n# pub get output\n');
        await configureProjectBuild(copy, BuildProfile.dev);
        expect(_read(copy, stashedPaths), before);
      }, skip: profile == BuildProfile.dev);
    });
  }

  test(
    'dev re-applies modules when pubspec was edited while flavored',
    () async {
      final String original = File(
        '${copy.path}/pubspec.yaml',
      ).readAsStringSync();
      await configureProjectBuild(copy, BuildProfile.oss);
      final File pubspec = File('${copy.path}/pubspec.yaml');
      pubspec.writeAsStringSync(
        pubspec.readAsStringSync().replaceFirst(
          'dependencies:\n',
          'dependencies:\n  extra_dep: ^1.0.0\n',
        ),
      );
      await configureProjectBuild(copy, BuildProfile.dev);
      expect(
        pubspec.readAsStringSync(),
        original.replaceFirst(
          'dependencies:\n',
          'dependencies:\n  extra_dep: ^1.0.0\n',
        ),
      );
    },
  );

  test('optional packages outside the module block are rejected', () {
    final String pubspec = File(
      '${projectRoot.path}/pubspec.yaml',
    ).readAsStringSync();
    final String polluted = pubspec.replaceFirst(
      'dependencies:\n',
      'dependencies:\n  firebase_core: ^4.0.0\n',
    );
    expect(
      () => applyModulesToPubspec(polluted, BuildProfile.oss),
      throwsA(isA<ConfigureBuildException>()),
    );
  });

  test('check accepts the canonical tree and flags flavored files', () async {
    expect(checkCanonicalTree(copy, staged: false), isEmpty);
    await configureProjectBuild(copy, BuildProfile.androidFcm);
    final String lock = File('${copy.path}/pubspec.lock').readAsStringSync();
    File(
      '${copy.path}/pubspec.lock',
    ).writeAsStringSync('$lock  firebase_core:\n    dependency: transitive\n');
    final List<String> violations = checkCanonicalTree(copy, staged: false);
    expect(violations, contains(startsWith('pubspec.yaml:')));
    expect(
      violations,
      contains(contains('pubspec.lock: must not contain firebase_core')),
    );
  });

  test('profile rules hold for the committed manifests', () {
    for (final BuildProfile profile in BuildProfile.values) {
      expect(
        verifyProfileRules(
          profile,
          (String path) => File('${projectRoot.path}/$path').existsSync()
              ? File('${projectRoot.path}/$path').readAsStringSync()
              : null,
        ),
        isEmpty,
        reason: profile.cliName,
      );
    }
  });
}
