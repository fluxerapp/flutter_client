// Tool script: intentional stdout and no public API docs.
// ignore_for_file: avoid_print

import 'dart:io';

const String _markerStart = '# BEGIN firebase optional deps';
const String _markerEnd = '# END firebase optional deps';

const String _servicePath =
    'lib/core/push/services/firebase_messaging_push_service.dart';
const String _serviceFcmTemplate =
    'lib/core/push/services/firebase_messaging_push_service.fcm.dart';
const String _entrypointPath = 'lib/core/push/fcm/fcm_entrypoint.dart';
const String _entrypointFcmTemplate =
    'lib/core/push/fcm/fcm_entrypoint.fcm.dart';
const String _fcmManifestPath = 'android/app/src/fcm/AndroidManifest.xml';

Future<void> main(List<String> args) async {
  final Directory root = _findProjectRoot(Directory.current);
  await _mergePubspec(root);
  await _copyTemplate(
    root,
    sourceRelative: _serviceFcmTemplate,
    targetRelative: _servicePath,
  );
  await _copyTemplate(
    root,
    sourceRelative: _entrypointFcmTemplate,
    targetRelative: _entrypointPath,
  );
  _verifyFcmManifest(root);
  print('Merged Firebase deps and FCM sources. Run: flutter pub get');
}

Future<void> _mergePubspec(Directory root) async {
  final File pubspec = File('${root.path}/pubspec.yaml');
  final File firebaseDeps = File('${root.path}/pubspec.firebase.deps.yaml');
  if (!pubspec.existsSync()) {
    throw StateError('pubspec.yaml not found under ${root.path}');
  }
  if (!firebaseDeps.existsSync()) {
    throw StateError('pubspec.firebase.deps.yaml not found under ${root.path}');
  }
  String content = pubspec.readAsStringSync();
  if (content.contains(_markerStart)) {
    print('Firebase deps block already present in pubspec.yaml');
    return;
  }
  final String block = _buildDependencyBlock(firebaseDeps.readAsStringSync());
  final int depsIndex = content.indexOf('\ndependencies:');
  if (depsIndex < 0) {
    throw StateError('dependencies: section not found in pubspec.yaml');
  }
  final int insertAt = content.indexOf('\n', depsIndex + 1) + 1;
  content = content.replaceRange(insertAt, insertAt, block);
  pubspec.writeAsStringSync(content);
}

String _buildDependencyBlock(String firebaseYaml) {
  final List<String> lines = firebaseYaml.split('\n');
  final StringBuffer buffer = StringBuffer()..writeln(_markerStart);
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
  buffer.writeln(_markerEnd);
  return '$buffer\n';
}

Future<void> _copyTemplate(
  Directory root, {
  required String sourceRelative,
  required String targetRelative,
}) async {
  final File source = File('${root.path}/$sourceRelative');
  final File target = File('${root.path}/$targetRelative');
  if (!source.existsSync()) {
    throw StateError('Template not found: $sourceRelative');
  }
  target.writeAsStringSync(source.readAsStringSync());
  print('Wrote $targetRelative');
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
