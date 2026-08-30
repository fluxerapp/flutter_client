import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';

class NativeMarkdownTester extends StatefulWidget {
  const NativeMarkdownTester({super.key});

  @override
  State<NativeMarkdownTester> createState() => _NativeMarkdownTesterState();
}

class _NativeMarkdownTesterState extends State<NativeMarkdownTester> {
  static const String _sample =
      '# Native parser\n'
      '**bold** *em* __under__ ~~strike~~ `code`\n'
      '> quote with <@1234> and <t:1234567890:R>\n'
      '||spoiler|| [masked](https://example.com/a)';

  late final TextEditingController _controller;
  String? _resultJson;
  String? _resultSummary;
  String? _error;
  String? _timing;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _sample);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const int _benchRuns = 20;

  void _parse() {
    final String input = _controller.text;
    try {
      final List<MdNode> nodes = parseFluxerMarkdownBinary(input);
      final String json = parseFluxerMarkdownToJson(input);
      final Stopwatch stopwatch = Stopwatch()..start();
      for (var i = 0; i < _benchRuns; i++) {
        parseFluxerMarkdownBinary(input);
      }
      final int binaryMicros = (stopwatch..stop()).elapsedMicroseconds;
      stopwatch
        ..reset()
        ..start();
      for (var i = 0; i < _benchRuns; i++) {
        parseFluxerMarkdown(input);
      }
      final int jsonMicros = (stopwatch..stop()).elapsedMicroseconds;
      setState(() {
        _error = null;
        _timing =
            'binary ${binaryMicros ~/ _benchRuns} µs/run, '
            'json ${jsonMicros ~/ _benchRuns} µs/run '
            '(${(jsonMicros / binaryMicros).toStringAsFixed(2)}x), '
            '$_benchRuns runs each';
        _resultJson = json;
        _resultSummary = nodes.map(_describe).join('\n');
      });
    } on Object catch (error) {
      setState(() {
        _error = '$error';
        _timing = null;
        _resultJson = null;
        _resultSummary = null;
      });
    }
  }

  String _describe(MdNode node, [int depth = 0]) {
    final String indent = '  ' * depth;
    final String label = switch (node) {
      MdText(:final content) => 'Text(${_preview(content)})',
      MdInlineCode(:final content) => 'InlineCode(${_preview(content)})',
      MdCodeBlock(:final language) => 'CodeBlock(lang: $language)',
      MdHeading(:final level) => 'Heading(h$level)',
      MdList(:final ordered, :final items) =>
        'List(${ordered ? 'ordered' : 'unordered'}, ${items.length} items)',
      MdLink(:final url) => 'Link($url)',
      MdMention(:final kind) => 'Mention(${kind.runtimeType})',
      MdTimestamp(:final style) => 'Timestamp($style)',
      MdEmoji(:final kind) => 'Emoji(${kind.runtimeType})',
      MdAlert(:final alertType) => 'Alert($alertType)',
      _ => '${node.runtimeType}'.replaceFirst('Md', ''),
    };
    final List<MdNode> children = switch (node) {
      MdBlockquote(:final children) => children,
      MdStrong(:final children) => children,
      MdEmphasis(:final children) => children,
      MdUnderline(:final children) => children,
      MdStrikethrough(:final children) => children,
      MdSpoiler(:final children) => children,
      MdHeading(:final children) => children,
      MdSubtext(:final children) => children,
      MdSequence(:final children) => children,
      MdTableCell(:final children) => children,
      MdAlert(:final children) => children,
      _ => const [],
    };
    return [
      '$indent$label',
      for (final MdNode child in children) _describe(child, depth + 1),
    ].join('\n');
  }

  String _preview(String content) {
    final String flat = content.replaceAll('\n', r'\n');
    return flat.length <= 24 ? '"$flat"' : '"${flat.substring(0, 24)}…"';
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final TextStyle monospace = context.textStyles.bodySmall.copyWith(
      fontFamily: 'monospace',
      color: context.colors.textSecondary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: layout.s2,
      children: [
        FluxerInput.multiline(
          controller: _controller,
          label: 'Markdown input',
          hint: 'Type markdown to parse natively',
          minLines: 4,
          maxLines: 12,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          autocorrect: false,
          enableSuggestions: false,
        ),
        Wrap(
          spacing: layout.s2,
          runSpacing: layout.s2,
          children: [
            FluxerButton.primary(
              onPressed: _parse,
              label: 'Parse',
              fitContent: true,
            ),
            if (_resultJson != null)
              FluxerButton.secondary(
                onPressed: () =>
                    Clipboard.setData(ClipboardData(text: _resultJson!)),
                label: 'Copy AST JSON',
                fitContent: true,
              ),
          ],
        ),
        if (_error != null)
          Text(
            _error!,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textDanger,
            ),
          ),
        if (_timing != null)
          Text(
            _timing!,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        if (_resultSummary != null)
          SelectableText(_resultSummary!, style: monospace),
        if (_resultJson != null) SelectableText(_resultJson!, style: monospace),
      ],
    );
  }
}
