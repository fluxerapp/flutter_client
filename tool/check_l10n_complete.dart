import 'dart:convert';
import 'dart:io';

Set<String> _messageKeys(File file) {
  final Object? decoded = jsonDecode(file.readAsStringSync());
  if (decoded is! Map<String, Object?>) {
    throw FormatException('${file.path} is not a JSON object');
  }
  return decoded.keys.where((String key) => !key.startsWith('@')).toSet();
}

void main() {
  final Directory arbDir = Directory('lib/l10n');
  final File template = File('${arbDir.path}/fluxer_en.arb');
  final Set<String> expected = _messageKeys(template);
  final List<File> locales =
      arbDir
          .listSync()
          .whereType<File>()
          .where(
            (File file) =>
                file.path.endsWith('.arb') && file.path != template.path,
          )
          .toList()
        ..sort((File a, File b) => a.path.compareTo(b.path));
  int missingTotal = 0;
  for (final File locale in locales) {
    final List<String> missing =
        expected.difference(_messageKeys(locale)).toList()..sort();
    if (missing.isEmpty) {
      continue;
    }
    missingTotal += missing.length;
    stdout.writeln('${locale.path}: ${missing.length} missing');
    for (final String key in missing) {
      stdout.writeln('  $key');
    }
  }
  if (missingTotal > 0) {
    stderr.writeln('$missingTotal translations missing.');
    exit(1);
  }
  stdout.writeln('All ${locales.length} locales have every key.');
}
