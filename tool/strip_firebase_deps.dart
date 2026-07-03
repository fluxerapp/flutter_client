// Tool script: removes Firebase merge artifacts from OSS / UnifiedPush builds.
// ignore_for_file: avoid_print

import 'dart:io';

const String _markerStart = '# BEGIN firebase optional deps';
const String _markerEnd = '# END firebase optional deps';
const List<String> _forbiddenPubspecKeys = <String>[
  'firebase_core',
  'firebase_messaging',
  'fluxer_fcm',
];
const String _servicePath =
    'lib/core/push/services/firebase_messaging_push_service.dart';
const String _serviceStub =
    'lib/core/push/services/firebase_messaging_push_service.stub.dart';
const String _entrypointPath = 'lib/core/push/fcm/fcm_entrypoint.dart';
const String _entrypointStub = 'lib/core/push/fcm/fcm_entrypoint_stub.dart';
const String _mainManifestPath = 'android/app/src/main/AndroidManifest.xml';

Future<void> main(List<String> args) async {
  final Directory root = _findProjectRoot(Directory.current);
  var changed = false;
  if (_stripPubspec(root)) {
    changed = true;
  }
  if (_restoreStubSources(root)) {
    changed = true;
  }
  _verifyMainManifest(root);
  if (!changed) {
    print('No Firebase artifacts to remove.');
    return;
  }
  print('Removed Firebase artifacts. Run: flutter pub get');
}

bool _stripPubspec(Directory root) {
  final File pubspec = File('${root.path}/pubspec.yaml');
  var content = pubspec.readAsStringSync();
  final String original = content;
  final int markerStart = content.indexOf(_markerStart);
  if (markerStart >= 0) {
    final int markerEnd = content.indexOf(_markerEnd, markerStart);
    if (markerEnd < 0) {
      throw StateError('Missing $_markerEnd marker in pubspec.yaml');
    }
    final int removeEnd = content.indexOf('\n', markerEnd + _markerEnd.length);
    final int rangeEnd = removeEnd >= 0 ? removeEnd + 1 : content.length;
    content = content.replaceRange(markerStart, rangeEnd, '');
    print('Removed Firebase merge block from pubspec.yaml');
  }
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
    for (final String key in _forbiddenPubspecKeys) {
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
  content = kept.join('\n');
  content = content.replaceAll(RegExp(r'\n{3,}'), '\n\n');
  if (content == original) {
    return false;
  }
  pubspec.writeAsStringSync(content);
  return true;
}

bool _restoreStubSources(Directory root) {
  var changed = false;
  if (_copyIfDifferent(
    root,
    sourceRelative: _serviceStub,
    targetRelative: _servicePath,
  )) {
    changed = true;
  }
  if (_copyIfDifferent(
    root,
    sourceRelative: _entrypointStub,
    targetRelative: _entrypointPath,
  )) {
    changed = true;
  }
  return changed;
}

bool _copyIfDifferent(
  Directory root, {
  required String sourceRelative,
  required String targetRelative,
}) {
  final File source = File('${root.path}/$sourceRelative');
  final File target = File('${root.path}/$targetRelative');
  if (!source.existsSync()) {
    throw StateError('Template not found: $sourceRelative');
  }
  final String stubContent = source.readAsStringSync();
  if (target.existsSync() && target.readAsStringSync() == stubContent) {
    return false;
  }
  target.writeAsStringSync(stubContent);
  print('Restored $targetRelative');
  return true;
}

void _verifyMainManifest(Directory root) {
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
  print('Verified $_mainManifestPath has no Firebase metadata');
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
