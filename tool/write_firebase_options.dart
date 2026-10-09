// Tool script: writes packages/fluxer_fcm/lib/firebase_options.dart from CI secrets.
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const String _outputPath = 'packages/fluxer_fcm/lib/firebase_options.dart';

Future<void> main(List<String> args) async {
  final Directory root = _findProjectRoot(Directory.current);
  final String environment = _readEnvironmentArg(args);
  final String? jsonSource = _resolveJsonSource(environment);
  if (jsonSource != null && jsonSource.trim().isNotEmpty) {
    final String generated = _generateFromJson(jsonSource);
    await _writeFile(root, generated);
    print('Wrote $_outputPath from ${_secretName(environment)}.');
    return;
  }
  final File existing = File('${root.path}/$_outputPath');
  if (existing.existsSync() &&
      !existing.readAsStringSync().contains('REPLACE_ME')) {
    print('Using existing $_outputPath (no secret set).');
    return;
  }
  stderr.writeln(
    'No Firebase options secret found. Set ${_secretName(environment)} '
    'or FIREBASE_OPTIONS_JSON.\n'
    'Generate JSON: dart run tool/generate_firebase_options_json.dart '
    '--file android/app/google-services.json',
  );
  exit(1);
}

String _secretName(String environment) {
  if (environment == 'canary') {
    return 'FIREBASE_OPTIONS_JSON_CANARY';
  }
  return 'FIREBASE_OPTIONS_JSON';
}

String _readEnvironmentArg(List<String> args) {
  for (var index = 0; index < args.length; index++) {
    final String arg = args[index];
    if (arg.startsWith('--environment=')) {
      return arg.split('=').last.trim().toLowerCase();
    }
    if (arg == '--environment' && index + 1 < args.length) {
      return args[index + 1].trim().toLowerCase();
    }
  }
  return 'stable';
}

String? _resolveJsonSource(String environment) {
  if (environment == 'canary') {
    final String? canary = Platform.environment['FIREBASE_OPTIONS_JSON_CANARY'];
    if (canary != null && canary.trim().isNotEmpty) {
      return canary;
    }
  }
  return Platform.environment['FIREBASE_OPTIONS_JSON'];
}

Future<void> _writeFile(Directory root, String content) async {
  final File output = File('${root.path}/$_outputPath');
  await output.parent.create(recursive: true);
  output.writeAsStringSync('${content.trim()}\n');
}

String _generateFromJson(String jsonSource) {
  final Object? decoded = jsonDecode(jsonSource);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('FIREBASE_OPTIONS_JSON must be a JSON object');
  }
  final Object? android = decoded['android'];
  if (android is! Map<String, dynamic>) {
    throw const FormatException(
      'FIREBASE_OPTIONS_JSON must contain an "android" object',
    );
  }
  final String apiKey = _requireString(android, 'apiKey');
  final String appId = _requireString(android, 'appId');
  final String messagingSenderId = _requireString(android, 'messagingSenderId');
  final String projectId = _requireString(android, 'projectId');
  final String? storageBucket = _optionalString(android, 'storageBucket');
  final String storageLine = storageBucket == null
      ? ''
      : "\n    storageBucket: '$storageBucket',";
  return '''
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are only configured for Android FCM builds.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '$apiKey',
    appId: '$appId',
    messagingSenderId: '$messagingSenderId',
    projectId: '$projectId',$storageLine
  );
}
''';
}

String _requireString(Map<String, dynamic> map, String key) {
  final String? value = _optionalString(map, key);
  if (value == null || value.isEmpty) {
    throw FormatException('FIREBASE_OPTIONS_JSON.android.$key is required');
  }
  return value;
}

String? _optionalString(Map<String, dynamic> map, String key) {
  final Object? value = map[key];
  if (value == null) {
    return null;
  }
  return value.toString();
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
