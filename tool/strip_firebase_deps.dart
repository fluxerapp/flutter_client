// Tool script: removes Firebase merge artifacts from OSS / UnifiedPush builds.

import 'dart:io';

Future<void> main(List<String> args) async {
  final ProcessResult result = await Process.run(Platform.executable, <String>[
    'tool/configure_build.dart',
    '--profile=oss',
  ], runInShell: true);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
  if (result.exitCode != 0) {
    exit(result.exitCode);
  }
}
