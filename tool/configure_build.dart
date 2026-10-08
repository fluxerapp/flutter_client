// Tool script: configures pubspec optional deps and build-specific Dart sources.
// ignore_for_file: avoid_print

import 'dart:io';

enum BuildProfile { oss, androidFcm, iosStore }

const String _firebaseMarkerStart = '# BEGIN firebase optional deps';
const String _firebaseMarkerEnd = '# END firebase optional deps';
const String _firebaseDepsPath = 'pubspec.firebase.deps.yaml';
const String _storeBillingDepsPath = 'pubspec.store_billing.deps.yaml';

const List<String> _firebaseForbiddenKeys = <String>[
  'firebase_core',
  'firebase_messaging',
  'fluxer_fcm',
];
const List<String> _billingForbiddenKeys = <String>[
  'in_app_purchase',
  'in_app_purchase_android',
];

const String _servicePath =
    'lib/core/push/services/firebase_messaging_push_service.dart';
const String _serviceStub =
    'lib/core/push/services/firebase_messaging_push_service.stub.dart';
const String _serviceFcm =
    'lib/core/push/services/firebase_messaging_push_service.fcm.dart';
const String _entrypointPath = 'lib/core/push/fcm/fcm_entrypoint.dart';
const String _entrypointStub = 'lib/core/push/fcm/fcm_entrypoint_stub.dart';
const String _entrypointFcm = 'lib/core/push/fcm/fcm_entrypoint.fcm.dart';
const String _billingClientPath =
    'lib/features/settings/services/premium_store_purchase_client.dart';
const String _billingClientStub =
    'lib/features/settings/services/premium_store_purchase_client.stub.dart';
const String _billingClientBilling =
    'lib/features/settings/services/premium_store_purchase_client.billing.dart';

const String _mainManifestPath = 'android/app/src/main/AndroidManifest.xml';
const String _fcmManifestPath = 'android/app/src/fcm/AndroidManifest.xml';

Future<void> main(List<String> args) async {
  final BuildProfile profile = parseBuildProfile(args);
  final Directory root = findProjectRoot(Directory.current);
  await configureProjectBuild(root, profile);
  print('Configured build profile: ${profile.name}. Run: flutter pub get');
}

BuildProfile parseBuildProfile(List<String> args) {
  for (final String arg in args) {
    if (arg.startsWith('--profile=')) {
      final String value = arg.substring('--profile='.length);
      return switch (value) {
        'oss' => BuildProfile.oss,
        'android-fcm' => BuildProfile.androidFcm,
        'ios-store' || 'apns' => BuildProfile.iosStore,
        _ => throw ArgumentError('Unknown profile: $value'),
      };
    }
  }
  throw ArgumentError('Missing --profile=oss|android-fcm|ios-store|apns');
}

Future<void> configureProjectBuild(Directory root, BuildProfile profile) async {
  switch (profile) {
    case BuildProfile.oss:
      await _configureOss(root);
    case BuildProfile.androidFcm:
      await _configureAndroidFcm(root);
    case BuildProfile.iosStore:
      await _configureIosStore(root);
  }
}

Directory findProjectRoot(Directory start) => _findProjectRoot(start);

Future<void> _configureOss(Directory root) async {
  _stripOptionalBlock(
    root,
    markerStart: _firebaseMarkerStart,
    markerEnd: _firebaseMarkerEnd,
    forbiddenKeys: _firebaseForbiddenKeys,
  );
  _stripStoreBillingDeps(root);
  _copyIfDifferent(root, _serviceStub, _servicePath);
  _copyIfDifferent(root, _entrypointStub, _entrypointPath);
  _copyIfDifferent(root, _billingClientStub, _billingClientPath);
  _verifyMainManifestOss(root);
}

Future<void> _configureAndroidFcm(Directory root) async {
  _mergeOptionalBlock(
    root,
    depsRelative: _firebaseDepsPath,
    markerStart: _firebaseMarkerStart,
    markerEnd: _firebaseMarkerEnd,
  );
  _ensureStoreBillingDeps(root);
  _restoreStoreBillingSources(root);
  _copyIfDifferent(root, _serviceFcm, _servicePath);
  _copyIfDifferent(root, _entrypointFcm, _entrypointPath);
  _verifyFcmManifest(root);
}

Future<void> _configureIosStore(Directory root) async {
  _stripOptionalBlock(
    root,
    markerStart: _firebaseMarkerStart,
    markerEnd: _firebaseMarkerEnd,
    forbiddenKeys: _firebaseForbiddenKeys,
  );
  _ensureStoreBillingDeps(root);
  _restoreStoreBillingSources(root);
  _copyIfDifferent(root, _serviceStub, _servicePath);
  _copyIfDifferent(root, _entrypointStub, _entrypointPath);
}

void _stripStoreBillingDeps(Directory root) {
  final File pubspec = File('${root.path}/pubspec.yaml');
  var content = pubspec.readAsStringSync();
  final String original = content;
  content = _removeForbiddenKeys(content, _billingForbiddenKeys);
  content = content.replaceAll(RegExp(r'\n{3,}'), '\n\n');
  if (content != original) {
    pubspec.writeAsStringSync(content);
  }
}

void _restoreStoreBillingSources(Directory root) {
  _copyIfDifferent(root, _billingClientBilling, _billingClientPath);
}

void _ensureStoreBillingDeps(Directory root) {
  final File pubspec = File('${root.path}/pubspec.yaml');
  String content = pubspec.readAsStringSync();
  if (content.contains('in_app_purchase:')) {
    return;
  }
  final File depsFile = File('${root.path}/$_storeBillingDepsPath');
  if (!depsFile.existsSync()) {
    throw StateError('$_storeBillingDepsPath not found under ${root.path}');
  }
  final List<String> linesToInsert = <String>[];
  for (final String line in depsFile.readAsStringSync().split('\n')) {
    final String trimmed = line.trim();
    if (trimmed.isEmpty || trimmed == 'dependencies:') {
      continue;
    }
    if (trimmed.startsWith('in_app_purchase')) {
      linesToInsert.add('  $trimmed');
    }
  }
  if (linesToInsert.isEmpty) {
    throw StateError('No store billing deps found in $_storeBillingDepsPath');
  }
  const String anchor = '\ndependency_overrides:';
  final int insertBefore = content.indexOf(anchor);
  if (insertBefore < 0) {
    throw StateError('dependency_overrides: section not found in pubspec.yaml');
  }
  content = content.replaceRange(
    insertBefore,
    insertBefore,
    '\n${linesToInsert.join('\n')}',
  );
  pubspec.writeAsStringSync(content);
  print('Restored store billing deps in pubspec.yaml');
}

void _mergeOptionalBlock(
  Directory root, {
  required String depsRelative,
  required String markerStart,
  required String markerEnd,
}) {
  final File pubspec = File('${root.path}/pubspec.yaml');
  final File depsFile = File('${root.path}/$depsRelative');
  if (!depsFile.existsSync()) {
    throw StateError('$depsRelative not found under ${root.path}');
  }
  String content = pubspec.readAsStringSync();
  if (content.contains(markerStart)) {
    print('Optional deps block already present: $markerStart');
    return;
  }
  final String block = _buildDependencyBlock(
    depsFile.readAsStringSync(),
    markerStart: markerStart,
    markerEnd: markerEnd,
  );
  final int depsIndex = content.indexOf('\ndependencies:');
  if (depsIndex < 0) {
    throw StateError('dependencies: section not found in pubspec.yaml');
  }
  final int insertAt = content.indexOf('\n', depsIndex + 1) + 1;
  content = content.replaceRange(insertAt, insertAt, block);
  pubspec.writeAsStringSync(content);
  print('Merged optional deps from $depsRelative');
}

void _stripOptionalBlock(
  Directory root, {
  required String markerStart,
  required String markerEnd,
  required List<String> forbiddenKeys,
}) {
  final File pubspec = File('${root.path}/pubspec.yaml');
  var content = pubspec.readAsStringSync();
  final String original = content;
  final int markerStartIndex = content.indexOf(markerStart);
  if (markerStartIndex >= 0) {
    final int markerEndIndex = content.indexOf(markerEnd, markerStartIndex);
    if (markerEndIndex < 0) {
      throw StateError('Missing $markerEnd marker in pubspec.yaml');
    }
    final int removeEnd = content.indexOf(
      '\n',
      markerEndIndex + markerEnd.length,
    );
    final int rangeEnd = removeEnd >= 0 ? removeEnd + 1 : content.length;
    content = content.replaceRange(markerStartIndex, rangeEnd, '');
    print('Removed optional deps block: $markerStart');
  }
  content = _removeForbiddenKeys(content, forbiddenKeys);
  content = content.replaceAll(RegExp(r'\n{3,}'), '\n\n');
  if (content != original) {
    pubspec.writeAsStringSync(content);
  }
}

String _removeForbiddenKeys(String content, List<String> forbiddenKeys) {
  final List<String> lines = content.split('\n');
  final List<String> kept = <String>[];
  var skippingNested = false;
  for (final String line in lines) {
    if (skippingNested) {
      if (line.startsWith('    ')) {
        continue;
      }
      skippingNested = false;
    }
    var removeLine = false;
    for (final String key in forbiddenKeys) {
      if (RegExp('^\\s+$key:\\s*\$').hasMatch(line) ||
          RegExp('^\\s+$key:\\s+').hasMatch(line)) {
        removeLine = true;
        if (line.trim() == '$key:') {
          skippingNested = true;
        }
        break;
      }
    }
    if (removeLine) {
      print('Removed from pubspec.yaml: ${line.trim()}');
      continue;
    }
    kept.add(line);
  }
  return kept.join('\n');
}

String _buildDependencyBlock(
  String depsYaml, {
  required String markerStart,
  required String markerEnd,
}) {
  final List<String> lines = depsYaml.split('\n');
  final StringBuffer buffer = StringBuffer()..writeln(markerStart);
  var index = 0;
  while (index < lines.length) {
    final String line = lines[index];
    final String trimmed = line.trim();
    if (trimmed.isEmpty || trimmed == 'dependencies:') {
      index++;
      continue;
    }
    if (trimmed.endsWith(':') && !trimmed.contains(': ')) {
      buffer.writeln('  $trimmed');
      index++;
      while (index < lines.length && lines[index].startsWith('    ')) {
        buffer.writeln(lines[index]);
        index++;
      }
      continue;
    }
    if (trimmed.contains(': ')) {
      buffer.writeln('  $trimmed');
    }
    index++;
  }
  buffer.writeln(markerEnd);
  return '$buffer\n';
}

void _copyIfDifferent(
  Directory root,
  String sourceRelative,
  String targetRelative,
) {
  final File source = File('${root.path}/$sourceRelative');
  final File target = File('${root.path}/$targetRelative');
  if (!source.existsSync()) {
    throw StateError('Template not found: $sourceRelative');
  }
  final String content = source.readAsStringSync();
  if (target.existsSync() && target.readAsStringSync() == content) {
    return;
  }
  target.writeAsStringSync(content);
  print('Wrote $targetRelative');
}

void _verifyMainManifestOss(Directory root) {
  final File manifest = File('${root.path}/$_mainManifestPath');
  if (!manifest.existsSync()) {
    throw StateError('Missing $_mainManifestPath');
  }
  final String content = manifest.readAsStringSync();
  if (content.contains('com.google.firebase.messaging')) {
    throw StateError(
      '$_mainManifestPath must not contain Firebase metadata in OSS builds',
    );
  }
  if (content.contains(
    'com.android.vending.billing.InAppBillingService.BIND',
  )) {
    throw StateError(
      '$_mainManifestPath must not declare Play Billing queries in OSS builds',
    );
  }
  print('Verified $_mainManifestPath for OSS');
}

void _verifyFcmManifest(Directory root) {
  final File manifest = File('${root.path}/$_fcmManifestPath');
  if (!manifest.existsSync()) {
    throw StateError('Missing $_fcmManifestPath');
  }
  final String content = manifest.readAsStringSync();
  if (!content.contains('FluxerFirebaseMessagingService')) {
    throw StateError(
      '$_fcmManifestPath must declare FluxerFirebaseMessagingService',
    );
  }
  if (!content.contains('com.google.firebase.MESSAGING_EVENT')) {
    throw StateError(
      '$_fcmManifestPath must handle com.google.firebase.MESSAGING_EVENT',
    );
  }
  print('Verified $_fcmManifestPath');
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
