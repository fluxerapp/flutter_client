// Benchmark script; prints are its output.
// ignore_for_file: avoid_print
import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';

void main() {
  for (final blocks in [12, 400]) {
    final message = StringBuffer();
    for (var i = 0; i < blocks; i++) {
      message
        ..writeln('# heading $i')
        ..writeln('**bold** *em* __under__ ~~strike~~ `code` ||spoiler||')
        ..writeln('> quote with <@1234> and <t:1234567890:R>')
        ..writeln('- item one')
        ..writeln('- item two [link](https://example.com/a/$i)');
    }
    final input = message.toString();
    const runs = 100;

    // Warmup for JIT fairness.
    for (var i = 0; i < 10; i++) {
      parseFluxerMarkdown(input);
      parseFluxerMarkdownBinary(input);
    }

    var json = 0;
    var binary = 0;
    final sw = Stopwatch();
    for (var i = 0; i < runs; i++) {
      sw
        ..reset()
        ..start();
      parseFluxerMarkdown(input);
      json += (sw..stop()).elapsedMicroseconds;
      sw
        ..reset()
        ..start();
      parseFluxerMarkdownBinary(input);
      binary += (sw..stop()).elapsedMicroseconds;
    }
    final jsonPayload = parseFluxerMarkdownToJson(input).length;
    print(
      '${input.length} chars: json ${json ~/ runs} us '
      '(payload $jsonPayload), binary ${binary ~/ runs} us, '
      'speedup ${(json / binary).toStringAsFixed(2)}x',
    );
  }
}
