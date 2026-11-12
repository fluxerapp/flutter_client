import 'dart:convert';
import 'dart:io';

const Set<String> _incubatingLocales = <String>{
  'art',
  'be',
  'bn',
  'ca',
  'fil',
  'lv',
  'sk',
  'sl',
  'sq',
};

String _localeOf(File file) {
  final String name = file.uri.pathSegments.last;
  return name.substring('fluxer_'.length, name.length - '.arb'.length);
}

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
  int released = 0;
  for (final File locale in locales) {
    final List<String> missing =
        expected.difference(_messageKeys(locale)).toList()..sort();
    final bool incubating = _incubatingLocales.contains(_localeOf(locale));
    if (incubating) {
      stdout.writeln(
        missing.isEmpty
            ? '${locale.path}: complete, remove it from _incubatingLocales'
            : '${locale.path}: incubating, ${missing.length} missing',
      );
      continue;
    }
    released++;
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
  stdout.writeln('All $released released locales have every key.');
}
