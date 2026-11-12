// CLI script, output goes to stdout.
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const String modulesMarkerStart = '  # BEGIN optional modules';
const String modulesMarkerEnd = '  # END optional modules';
const String _profileRecordPath = '.dart_tool/fluxer_build_profile';
const String _stashDir = '.dart_tool/fluxer_flavor';
const String _mainManifestPath = 'android/app/src/main/AndroidManifest.xml';
const String _fcmManifestPath = 'android/app/src/fcm/AndroidManifest.xml';
const String _fixHint =
    'Run: dart tool/configure_build.dart --profile=dev && flutter pub get';

const List<String> stashedPaths = <String>[
  'pubspec.yaml',
  'pubspec.lock',
  'macos/Flutter/GeneratedPluginRegistrant.swift',
  'linux/flutter/generated_plugin_registrant.cc',
  'linux/flutter/generated_plugin_registrant.h',
  'linux/flutter/generated_plugins.cmake',
  'windows/flutter/generated_plugin_registrant.cc',
  'windows/flutter/generated_plugin_registrant.h',
  'windows/flutter/generated_plugins.cmake',
];

class Selector {
  const Selector({
    required this.path,
    required this.whenOff,
    required this.whenOn,
  });

  final String path;
  final String whenOff;
  final String whenOn;
}

class TextRule {
  const TextRule(this.path, this.pattern, this.description);

  final String path;
  final RegExp pattern;
  final String description;
}

class BuildModule {
  const BuildModule({
    required this.name,
    required this.packageName,
    required this.packagePath,
    required this.selectors,
    required this.forbiddenPubspecKeys,
    required this.forbiddenLockPackages,
    this.forbiddenWhenOff = const <TextRule>[],
    this.forbiddenOutputsWhenOff = const <TextRule>[],
    this.requiredWhenOn = const <TextRule>[],
  });

  final String name;
  final String packageName;
  final String packagePath;
  final List<Selector> selectors;
  final List<String> forbiddenPubspecKeys;
  final List<String> forbiddenLockPackages;
  final List<TextRule> forbiddenWhenOff;
  final List<TextRule> forbiddenOutputsWhenOff;
  final List<TextRule> requiredWhenOn;
}

final BuildModule fcmModule = BuildModule(
  name: 'fcm',
  packageName: 'fluxer_fcm',
  packagePath: 'packages/fluxer_fcm',
  selectors: const <Selector>[
    Selector(
      path: 'lib/core/push/services/firebase_messaging_push_service.dart',
      whenOff:
          'package:fluxer_app/core/push/services/firebase_messaging_push_service.stub.dart',
      whenOn:
          'package:fluxer_app/core/push/services/firebase_messaging_push_service.fcm.dart',
    ),
    Selector(
      path: 'lib/core/push/fcm/fcm_entrypoint.dart',
      whenOff: 'package:fluxer_app/core/push/fcm/fcm_entrypoint_stub.dart',
      whenOn: 'package:fluxer_app/core/push/fcm/fcm_entrypoint.fcm.dart',
    ),
  ],
  forbiddenPubspecKeys: const <String>[
    'fluxer_fcm',
    'firebase_core',
    'firebase_messaging',
  ],
  forbiddenLockPackages: const <String>[
    'fluxer_fcm',
    'firebase_core',
    'firebase_messaging',
  ],
  forbiddenWhenOff: <TextRule>[
    TextRule(
      _mainManifestPath,
      RegExp(r'com\.google\.firebase\.messaging'),
      'Firebase metadata in the main manifest',
    ),
  ],
  forbiddenOutputsWhenOff: <TextRule>[
    TextRule(
      'macos/Flutter/GeneratedPluginRegistrant.swift',
      RegExp('firebase', caseSensitive: false),
      'Firebase plugin registration',
    ),
    for (final String path in <String>[
      'linux/flutter/generated_plugins.cmake',
      'windows/flutter/generated_plugins.cmake',
    ])
      TextRule(path, RegExp('firebase'), 'Firebase plugin registration'),
  ],
  requiredWhenOn: <TextRule>[
    TextRule(
      _fcmManifestPath,
      RegExp('FluxerFirebaseMessagingService'),
      'FluxerFirebaseMessagingService declaration',
    ),
    TextRule(
      _fcmManifestPath,
      RegExp(r'com\.google\.firebase\.MESSAGING_EVENT'),
      'com.google.firebase.MESSAGING_EVENT intent filter',
    ),
  ],
);

final BuildModule billingModule = BuildModule(
  name: 'billing',
  packageName: 'fluxer_billing',
  packagePath: 'packages/fluxer_billing',
  selectors: const <Selector>[
    Selector(
      path: 'lib/features/settings/services/premium_store_purchase_client.dart',
      whenOff:
          'package:fluxer_app/features/settings/services/premium_store_purchase_client.stub.dart',
      whenOn:
          'package:fluxer_app/features/settings/services/premium_store_purchase_client.billing.dart',
    ),
  ],
  forbiddenPubspecKeys: const <String>[
    'fluxer_billing',
    'in_app_purchase',
    'in_app_purchase_android',
    'in_app_purchase_storekit',
  ],
  forbiddenLockPackages: const <String>[
    'fluxer_billing',
    'in_app_purchase',
    'in_app_purchase_android',
    'in_app_purchase_storekit',
  ],
  forbiddenWhenOff: <TextRule>[
    TextRule(
      _mainManifestPath,
      RegExp(r'com\.android\.vending\.billing\.InAppBillingService\.BIND'),
      'Play Billing queries in the main manifest',
    ),
  ],
);

final List<BuildModule> allModules = <BuildModule>[fcmModule, billingModule];

enum BuildProfile {
  dev(<String>{'billing'}),
  oss(<String>{}),
  androidFcm(<String>{'fcm', 'billing'});

  const BuildProfile(this.moduleNames);

  final Set<String> moduleNames;

  String get cliName => switch (this) {
    BuildProfile.dev => 'dev',
    BuildProfile.oss => 'oss',
    BuildProfile.androidFcm => 'android-fcm',
  };

  List<BuildModule> get modules => allModules
      .where((BuildModule module) => moduleNames.contains(module.name))
      .toList();

  bool enables(BuildModule module) => moduleNames.contains(module.name);
}

const BuildProfile canonicalProfile = BuildProfile.dev;

class ConfigureBuildException implements Exception {
  const ConfigureBuildException(this.message);

  final String message;

  @override
  String toString() => message;
}

BuildProfile? tryBuildProfileFromName(String value) => switch (value) {
  'dev' || 'ios-store' || 'apns' => BuildProfile.dev,
  'oss' => BuildProfile.oss,
  'android-fcm' => BuildProfile.androidFcm,
  _ => null,
};

BuildProfile buildProfileFromName(String value) =>
    tryBuildProfileFromName(value) ??
    (throw ArgumentError(
      'Unknown profile: $value (expected dev|oss|android-fcm|ios-store|apns)',
    ));

BuildProfile parseBuildProfile(List<String> args) {
  for (final String arg in args) {
    if (arg.startsWith('--profile=')) {
      return buildProfileFromName(arg.substring('--profile='.length));
    }
  }
  return canonicalProfile;
}

Future<void> main(List<String> args) async {
  final Directory root = findProjectRoot(Directory.current);
  if (args.contains('--status')) {
    print(readRecordedProfile(root)?.cliName ?? 'unknown');
    return;
  }
  if (args.contains('--check')) {
    final List<String> violations = checkCanonicalTree(
      root,
      staged: args.contains('--staged'),
    );
    if (violations.isEmpty) {
      print('Build tree is canonical.');
      return;
    }
    stderr.writeln('Flavor-specific changes detected:');
    for (final String violation in violations) {
      stderr.writeln('  - $violation');
    }
    stderr.writeln(_fixHint);
    exitCode = 1;
    return;
  }
  final BuildProfile profile = parseBuildProfile(args);
  await configureProjectBuild(root, profile);
  print('Configured build profile: ${profile.cliName}. Run: flutter pub get');
}

Directory findProjectRoot(Directory start) {
  Directory? current = start.absolute;
  while (current != null) {
    if (File('${current.path}/pubspec.yaml').existsSync() &&
        File('${current.path}/tool/configure_build.dart').existsSync()) {
      return current;
    }
    final Directory parent = current.parent;
    if (parent.path == current.path) {
      break;
    }
    current = parent;
  }
  throw const ConfigureBuildException(
    'Could not find project root (pubspec.yaml)',
  );
}

Future<void> configureProjectBuild(Directory root, BuildProfile profile) async {
  final BuildProfile? previous = readRecordedProfile(root);
  if (profile == canonicalProfile) {
    _restoreStash(root);
  } else if (previous == null || previous == canonicalProfile) {
    _writeStash(root);
  }
  final File pubspec = File('${root.path}/pubspec.yaml');
  final String before = pubspec.readAsStringSync();
  final String after = applyModulesToPubspec(before, profile);
  if (after != before) {
    pubspec.writeAsStringSync(after);
    print('Updated optional modules in pubspec.yaml');
  }
  if (profile != canonicalProfile) {
    _recordWrittenPubspec(root, after);
  }
  writeSelectors(root, profile);
  final List<String> violations = verifyProfileRules(
    profile,
    (String path) => _readOrNull(File('${root.path}/$path')),
  );
  if (violations.isNotEmpty) {
    throw ConfigureBuildException(violations.join('\n'));
  }
  _writeRecordedProfile(root, profile);
}

String applyModulesToPubspec(String content, BuildProfile profile) {
  final int start = content.indexOf(modulesMarkerStart);
  final int end = content.indexOf(modulesMarkerEnd);
  if (start < 0 || end < start) {
    throw const ConfigureBuildException(
      'pubspec.yaml must contain "$modulesMarkerStart" and "$modulesMarkerEnd" '
      'inside dependencies:',
    );
  }
  final String outside =
      content.substring(0, start) +
      content.substring(end + modulesMarkerEnd.length);
  for (final BuildModule module in allModules) {
    for (final String key in module.forbiddenPubspecKeys) {
      if (_yamlKeyPattern(key).hasMatch(outside)) {
        throw ConfigureBuildException(
          '$key must only appear inside the optional modules block of '
          'pubspec.yaml (module ${module.name})',
        );
      }
    }
  }
  final StringBuffer block = StringBuffer('$modulesMarkerStart\n');
  for (final BuildModule module in profile.modules) {
    block
      ..writeln('  ${module.packageName}:')
      ..writeln('    path: ${module.packagePath}');
  }
  block.write(modulesMarkerEnd);
  return content.replaceRange(
    start,
    end + modulesMarkerEnd.length,
    block.toString(),
  );
}

String selectorSource(String target) => "export '$target';\n";

void writeSelectors(Directory root, BuildProfile profile) {
  for (final BuildModule module in allModules) {
    final bool on = profile.enables(module);
    for (final Selector selector in module.selectors) {
      final File file = File('${root.path}/${selector.path}');
      final String content = selectorSource(
        on ? selector.whenOn : selector.whenOff,
      );
      if (_readOrNull(file) == content) {
        continue;
      }
      file
        ..createSync(recursive: true)
        ..writeAsStringSync(content);
      print('Wrote ${selector.path}');
    }
  }
}

List<String> verifyProfileRules(
  BuildProfile profile,
  String? Function(String path) read,
) {
  final List<String> violations = <String>[];
  for (final BuildModule module in allModules) {
    final bool on = profile.enables(module);
    for (final TextRule rule
        in on ? module.requiredWhenOn : const <TextRule>[]) {
      final String? text = read(rule.path);
      if (text == null || !rule.pattern.hasMatch(text)) {
        violations.add('${rule.path}: missing ${rule.description}');
      }
    }
    for (final TextRule rule
        in on ? const <TextRule>[] : module.forbiddenWhenOff) {
      final String? text = read(rule.path);
      if (text != null && rule.pattern.hasMatch(text)) {
        violations.add(
          '${rule.path}: must not contain ${rule.description} '
          '(module ${module.name} is off in ${profile.cliName})',
        );
      }
    }
  }
  return violations;
}

List<String> checkCanonicalTree(Directory root, {required bool staged}) {
  final List<String> violations = <String>[];
  final Set<String>? stagedPaths = staged ? _stagedPaths(root) : null;
  String? read(String path) {
    if (stagedPaths == null) {
      return _readOrNull(File('${root.path}/$path'));
    }
    return _gitShowIndex(root, path);
  }

  bool inScope(String path) =>
      stagedPaths == null || stagedPaths.contains(path);

  final List<String> trackedSelectors = _trackedPaths(root, <String>[
    for (final BuildModule module in allModules)
      for (final Selector selector in module.selectors) selector.path,
  ]);
  for (final String path in trackedSelectors) {
    violations.add(
      '$path is generated by tool/configure_build.dart and must not be '
      'committed (git rm --cached $path)',
    );
  }

  if (inScope('pubspec.yaml')) {
    final String? pubspec = read('pubspec.yaml');
    if (pubspec != null) {
      try {
        if (applyModulesToPubspec(pubspec, canonicalProfile) != pubspec) {
          violations.add(
            'pubspec.yaml: optional modules block does not match the '
            '${canonicalProfile.cliName} profile',
          );
        }
      } on ConfigureBuildException catch (error) {
        violations.add('pubspec.yaml: ${error.message}');
      }
    }
  }

  if (inScope('pubspec.lock')) {
    final String? lock = read('pubspec.lock');
    if (lock != null) {
      for (final BuildModule module in allModules) {
        final bool on = canonicalProfile.enables(module);
        for (final String package in module.forbiddenLockPackages) {
          final bool present = RegExp(
            '^  $package:\\s*\$',
            multiLine: true,
          ).hasMatch(lock);
          if (on && !present) {
            violations.add(
              'pubspec.lock: missing $package (module ${module.name} is on '
              'in ${canonicalProfile.cliName})',
            );
          } else if (!on && present) {
            violations.add(
              'pubspec.lock: must not contain $package (module '
              '${module.name} is off in ${canonicalProfile.cliName})',
            );
          }
        }
      }
    }
  }

  for (final BuildModule module in allModules) {
    if (canonicalProfile.enables(module)) {
      continue;
    }
    for (final TextRule rule in <TextRule>[
      ...module.forbiddenWhenOff,
      ...module.forbiddenOutputsWhenOff,
    ]) {
      if (!inScope(rule.path)) {
        continue;
      }
      final String? text = read(rule.path);
      if (text != null && rule.pattern.hasMatch(text)) {
        violations.add('${rule.path}: must not contain ${rule.description}');
      }
    }
  }
  return violations;
}

BuildProfile? readRecordedProfile(Directory root) {
  final String? recorded = _readOrNull(
    File('${root.path}/$_profileRecordPath'),
  );
  if (recorded != null) {
    return tryBuildProfileFromName(recorded.trim());
  }
  final String? pubspec = _readOrNull(File('${root.path}/pubspec.yaml'));
  if (pubspec == null) {
    return null;
  }
  for (final BuildProfile profile in BuildProfile.values) {
    try {
      if (applyModulesToPubspec(pubspec, profile) == pubspec) {
        return profile;
      }
    } on ConfigureBuildException {
      return null;
    }
  }
  return null;
}

void _writeRecordedProfile(Directory root, BuildProfile profile) {
  File('${root.path}/$_profileRecordPath')
    ..createSync(recursive: true)
    ..writeAsStringSync('${profile.cliName}\n');
}

void _writeStash(Directory root) {
  final Directory dir = Directory('${root.path}/$_stashDir/files');
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
  for (final String path in stashedPaths) {
    final File source = File('${root.path}/$path');
    if (!source.existsSync()) {
      continue;
    }
    File('${dir.path}/$path')
      ..createSync(recursive: true)
      ..writeAsBytesSync(source.readAsBytesSync());
  }
}

void _recordWrittenPubspec(Directory root, String content) {
  File('${root.path}/$_stashDir/written_pubspec.yaml')
    ..createSync(recursive: true)
    ..writeAsStringSync(content);
}

void _restoreStash(Directory root) {
  final Directory dir = Directory('${root.path}/$_stashDir/files');
  final File written = File('${root.path}/$_stashDir/written_pubspec.yaml');
  if (!dir.existsSync()) {
    return;
  }
  final String? current = _readOrNull(File('${root.path}/pubspec.yaml'));
  final bool untouched =
      written.existsSync() && written.readAsStringSync() == current;
  if (untouched) {
    for (final String path in stashedPaths) {
      final File saved = File('${dir.path}/$path');
      if (saved.existsSync()) {
        File('${root.path}/$path').writeAsBytesSync(saved.readAsBytesSync());
      }
    }
    print('Restored pubspec, lockfile and plugin registrants from stash');
  } else {
    print(
      'pubspec.yaml changed since it was flavored; re-applying the '
      '${canonicalProfile.cliName} modules instead of restoring the stash',
    );
  }
  Directory('${root.path}/$_stashDir').deleteSync(recursive: true);
}

Set<String> _stagedPaths(Directory root) {
  final ProcessResult result = Process.runSync('git', <String>[
    'diff',
    '--cached',
    '--name-only',
    '--diff-filter=ACMR',
  ], workingDirectory: root.path);
  if (result.exitCode != 0) {
    throw ConfigureBuildException('git diff --cached failed: ${result.stderr}');
  }
  return const LineSplitter()
      .convert(result.stdout as String)
      .where((String line) => line.isNotEmpty)
      .toSet();
}

String? _gitShowIndex(Directory root, String path) {
  final ProcessResult result = Process.runSync('git', <String>[
    'show',
    ':$path',
  ], workingDirectory: root.path);
  return result.exitCode == 0 ? result.stdout as String : null;
}

List<String> _trackedPaths(Directory root, List<String> paths) {
  final ProcessResult result = Process.runSync('git', <String>[
    'ls-files',
    '--cached',
    '--',
    ...paths,
  ], workingDirectory: root.path);
  if (result.exitCode != 0) {
    return const <String>[];
  }
  return const LineSplitter()
      .convert(result.stdout as String)
      .where((String line) => line.isNotEmpty)
      .toList();
}

RegExp _yamlKeyPattern(String key) =>
    RegExp('^\\s+${RegExp.escape(key)}:', multiLine: true);

String? _readOrNull(File file) =>
    file.existsSync() ? file.readAsStringSync() : null;
