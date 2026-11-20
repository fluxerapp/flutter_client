import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';
import 'package:test/test.dart';

List<(String, bool, int)> _describe(String source) {
  return <(String, bool, int)>[
    for (final MdSourceSpan span in computeMarkdownSourceSpans(source))
      (source.substring(span.start, span.end), span.isMarker, span.format),
  ];
}

void _expectCovers(String source) {
  final spans = computeMarkdownSourceSpans(source);
  var cursor = 0;
  for (final span in spans) {
    expect(span.start, cursor, reason: 'gap before $span in "$source"');
    expect(span.end, greaterThan(span.start));
    cursor = span.end;
  }
  expect(cursor, source.length);
}

void main() {
  group('computeMarkdownSourceSpans', () {
    test('plain text is one unformatted content span', () {
      expect(_describe('hello world'), <(String, bool, int)>[
        ('hello world', false, MdSpanFormat.none),
      ]);
    });

    test('bold keeps markers visible and bolds content', () {
      expect(_describe('a **b** c'), <(String, bool, int)>[
        ('a ', false, MdSpanFormat.none),
        ('**', true, MdSpanFormat.bold),
        ('b', false, MdSpanFormat.bold),
        ('**', true, MdSpanFormat.bold),
        (' c', false, MdSpanFormat.none),
      ]);
    });

    test('italic, underline, strike and spoiler', () {
      expect(_describe('*i*'), <(String, bool, int)>[
        ('*', true, MdSpanFormat.italic),
        ('i', false, MdSpanFormat.italic),
        ('*', true, MdSpanFormat.italic),
      ]);
      expect(_describe('__u__'), <(String, bool, int)>[
        ('__', true, MdSpanFormat.underline),
        ('u', false, MdSpanFormat.underline),
        ('__', true, MdSpanFormat.underline),
      ]);
      expect(_describe('~~s~~'), <(String, bool, int)>[
        ('~~', true, MdSpanFormat.strike),
        ('s', false, MdSpanFormat.strike),
        ('~~', true, MdSpanFormat.strike),
      ]);
      expect(_describe('||x||'), <(String, bool, int)>[
        ('||', true, MdSpanFormat.spoiler),
        ('x', false, MdSpanFormat.spoiler),
        ('||', true, MdSpanFormat.spoiler),
      ]);
    });

    test('nested formatting combines bits', () {
      expect(_describe('**a _b_**'), <(String, bool, int)>[
        ('**', true, MdSpanFormat.bold),
        ('a ', false, MdSpanFormat.bold),
        ('_', true, MdSpanFormat.bold | MdSpanFormat.italic),
        ('b', false, MdSpanFormat.bold | MdSpanFormat.italic),
        ('_', true, MdSpanFormat.bold | MdSpanFormat.italic),
        ('**', true, MdSpanFormat.bold),
      ]);
    });

    test('inline code', () {
      expect(_describe('x `**y**` z'), <(String, bool, int)>[
        ('x ', false, MdSpanFormat.none),
        ('`', true, MdSpanFormat.code),
        ('**y**', false, MdSpanFormat.code),
        ('`', true, MdSpanFormat.code),
        (' z', false, MdSpanFormat.none),
      ]);
    });

    test('fenced code block', () {
      const code = MdSpanFormat.code | MdSpanFormat.codeBlock;
      expect(_describe('```dart\nvoid f() {}\n```'), <(String, bool, int)>[
        ('```dart\n', true, code),
        ('void f() {}\n', false, code),
        ('```', true, code),
      ]);
    });

    test('heading prefix stays undimmed content', () {
      expect(_describe('# Title'), <(String, bool, int)>[
        ('# ', false, MdSpanFormat.none),
        ('Title', false, MdSpanFormat.heading),
      ]);
    });

    test('subtext prefix is a marker', () {
      expect(_describe('-# small'), <(String, bool, int)>[
        ('-# ', true, MdSpanFormat.subtext),
        ('small', false, MdSpanFormat.subtext),
      ]);
    });

    test('masked link', () {
      expect(_describe('[t](https://x.y)'), <(String, bool, int)>[
        ('[', true, MdSpanFormat.none),
        ('t', false, MdSpanFormat.link),
        ('](https://x.y)', true, MdSpanFormat.none),
      ]);
    });

    test('autolink', () {
      expect(_describe('see https://fluxer.app/x ok'), <(String, bool, int)>[
        ('see ', false, MdSpanFormat.none),
        ('https://fluxer.app/x', false, MdSpanFormat.link),
        (' ok', false, MdSpanFormat.none),
      ]);
    });

    test('blockquote marker', () {
      expect(_describe('> quoted'), <(String, bool, int)>[
        ('> ', true, MdSpanFormat.blockquote | MdSpanFormat.blockquoteMarker),
        ('quoted', false, MdSpanFormat.blockquote),
      ]);
    });

    test('escaped markers dim the backslash only', () {
      expect(_describe(r'\*not italic\*'), <(String, bool, int)>[
        (r'\', true, MdSpanFormat.none),
        ('*not italic', false, MdSpanFormat.none),
        (r'\', true, MdSpanFormat.none),
        ('*', false, MdSpanFormat.none),
      ]);
    });

    test('unbalanced input stays plain', () {
      expect(_describe('**foo'), <(String, bool, int)>[
        ('**foo', false, MdSpanFormat.none),
      ]);
    });

    test('mentions and lists align as content', () {
      expect(_describe('hi <@123>'), <(String, bool, int)>[
        ('hi <@123>', false, MdSpanFormat.none),
      ]);
      _expectCovers('- one\n- **two**\n  - nested');
    });

    test('spans always cover the whole source', () {
      <String>[
        'a\n\nb',
        '**a\nb**',
        '> one\n> two\nthree',
        '>>> all\nof this',
        '| a | b |\n| - | - |\n| 1 | 2 |',
        '> [!NOTE]\n> body',
        '```\nunterminated',
        'trailing   \n',
        '😀 **x** ™',
      ].forEach(_expectCovers);
    });
  });
}
