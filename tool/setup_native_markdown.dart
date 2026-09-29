// Prepares the Rust markdown parser before a VS Code launch.
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const List<String> _rustTargets = <String>[
  'aarch64-linux-android',
  'armv7-linux-androideabi',
  'x86_64-linux-android',
  'aarch64-apple-ios',
  'aarch64-apple-ios-sim',
  'x86_64-apple-ios',
];

Future<void> main() async {
  final Directory root = _findProjectRoot(Directory.current);
  final Map<String, String> environment = _environmentWithCargo();
  try {
    await _ensureNativeAssets(environment);
    await _ensureRustTargets(environment);
    await _ensureCrate(root, environment);
  } on ProcessException catch (error) {
    stderr.writeln('Could not run ${error.executable}: ${error.message}');
    exit(1);
  }
  print('Native markdown parser toolchain is ready.');
}

Future<void> _ensureNativeAssets(Map<String, String> environment) async {
  if (_nativeAssetsEnabled()) {
    return;
  }
  await _run('flutter', <String>[
    'config',
    '--enable-native-assets',
  ], environment);
}

Future<void> _ensureRustTargets(Map<String, String> environment) async {
  final ProcessResult listed = await Process.run('rustup', <String>[
    'target',
    'list',
    '--installed',
  ], environment: environment);
  if (listed.exitCode != 0) {
    stderr.write(listed.stderr);
    exit(listed.exitCode);
  }
  final Set<String> installed = listed.stdout
      .toString()
      .split('\n')
      .map((String line) => line.trim())
      .where((String line) => line.isNotEmpty)
      .toSet();
  final List<String> missing = _rustTargets
      .where((String target) => !installed.contains(target))
      .toList();
  if (missing.isEmpty) {
    return;
  }
  await _run('rustup', <String>['target', 'add', ...missing], environment);
}

Future<void> _ensureCrate(
  Directory root,
  Map<String, String> environment,
) async {
  final File crate = File(
    '${root.path}/fluxer/packages/markdown_parser/rust/Cargo.toml',
  );
  if (crate.existsSync()) {
    return;
  }
  await _run(
    'git',
    <String>['submodule', 'update', '--init', '--', 'fluxer'],
    environment,
    workingDirectory: root.path,
  );
  if (!crate.existsSync()) {
    stderr.writeln('Missing ${crate.path} after submodule update.');
    exit(1);
  }
}

bool _nativeAssetsEnabled() {
  final File settings = _flutterSettingsFile();
  if (!settings.existsSync()) {
    return false;
  }
  final Object? decoded;
  try {
    decoded = jsonDecode(settings.readAsStringSync());
  } on FormatException {
    return false;
  }
  if (decoded is! Map) {
    return false;
  }
  final Map<Object?, Object?> values = Map<Object?, Object?>.from(decoded);
  return values['enable-native-assets'] == true;
}

File _flutterSettingsFile() {
  final String home = Platform.environment['HOME'] ?? '.';
  final File legacy = File('$home/.flutter_settings');
  if (Platform.isWindows || legacy.existsSync()) {
    return legacy;
  }
  final String? xdg = Platform.environment['XDG_CONFIG_HOME'];
  final String dir = (xdg == null || xdg.isEmpty)
      ? '$home/.config/flutter'
      : xdg;
  return File('$dir/settings');
}

Map<String, String> _environmentWithCargo() {
  final Map<String, String> environment = Map<String, String>.from(
    Platform.environment,
  );
  final String? home = environment['HOME'];
  final List<String> prefix = <String>[
    if (home != null) '$home/.cargo/bin',
    '/opt/homebrew/bin',
    '/usr/local/bin',
  ];
  final String path = environment['PATH'] ?? '';
  final String separator = Platform.isWindows ? ';' : ':';
  environment['PATH'] = <String>[...prefix, path].join(separator);
  return environment;
}

Future<void> _run(
  String executable,
  List<String> args,
  Map<String, String> environment, {
  String? workingDirectory,
}) async {
  final Process process = await Process.start(
    executable,
    args,
    environment: environment,
    workingDirectory: workingDirectory,
    mode: ProcessStartMode.inheritStdio,
  );
  final int code = await process.exitCode;
  if (code != 0) {
    exit(code);
  }
}

Directory _findProjectRoot(Directory start) {
  Directory? current = start;
  while (current != null) {
    if (File('${current.path}/pubspec.yaml').existsSync() &&
        File('${current.path}/.gitmodules').existsSync()) {
      return current;
    }
    current = current.parent;
  }
  throw StateError('Could not find project root');
}
