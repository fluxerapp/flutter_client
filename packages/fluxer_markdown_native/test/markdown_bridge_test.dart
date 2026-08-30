import 'package:fluxer_markdown_native/fluxer_markdown_native.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:test/test.dart';

List<md.Node> bridge(String input) =>
    fluxerNativeAstToMarkdown(parseFluxerMarkdownBinary(input));

md.Element elementAt(List<md.Node> nodes, int index) =>
    nodes[index] as md.Element;

void main() {
  test('inline run groups into a single paragraph', () {
    final nodes = bridge('plain **bold** *em* __under__ ~~strike~~');
    expect(nodes, hasLength(1));
    final p = elementAt(nodes, 0);
    expect(p.tag, 'p');
    final tags = p.children!.whereType<md.Element>().map((e) => e.tag);
    expect(tags, containsAll(<String>['strong', 'em', 'underline', 'del']));
  });

  test('boundary newline before a fence is trimmed', () {
    final nodes = bridge('intro\n```js\ncode\n```');
    expect(nodes, hasLength(2));
    final p = elementAt(nodes, 0);
    expect(p.tag, 'p');
    expect(p.textContent, 'intro');
    final pre = elementAt(nodes, 1);
    expect(pre.tag, 'pre');
    final code = pre.children!.single as md.Element;
    expect(code.tag, 'code');
    expect(code.attributes['class'], 'language-js');
    expect(code.textContent, contains('code'));
  });

  test('heading levels map to h1-h4', () {
    expect(elementAt(bridge('# Hi'), 0).tag, 'h1');
    expect(elementAt(bridge('#### Hi'), 0).tag, 'h4');
  });

  test('subtext maps to subtext element', () {
    final nodes = bridge('-# smaller');
    final subtext = elementAt(nodes, 0);
    expect(subtext.tag, 'subtext');
    expect(subtext.textContent, 'smaller');
  });

  test('blockquote wraps grouped children', () {
    final quote = elementAt(bridge('> quoted line'), 0);
    expect(quote.tag, 'blockquote');
    final p = quote.children!.single as md.Element;
    expect(p.tag, 'p');
    expect(p.textContent, 'quoted line');
  });

  test('inline spoiler stays inline, multiline spoiler becomes block', () {
    final inline = elementAt(bridge('a ||b|| c'), 0);
    expect(inline.tag, 'p');
    expect(
      inline.children!.whereType<md.Element>().single.tag,
      'spoiler',
    );

    final block = elementAt(bridge('||line1\nline2||'), 0);
    expect(block.tag, 'block-spoiler');
  });

  test('ordered list keeps written start ordinal', () {
    final list = elementAt(bridge('5. five\n6. six'), 0);
    expect(list.tag, 'ol');
    expect(list.attributes['start'], '5');
    expect(list.children, hasLength(2));
    expect((list.children!.first as md.Element).tag, 'li');
  });

  test('unordered list has li children and no start', () {
    final list = elementAt(bridge('- a\n- b'), 0);
    expect(list.tag, 'ul');
    expect(list.attributes.containsKey('start'), isFalse);
  });

  test('table maps to thead/tbody with alignment', () {
    final table = elementAt(bridge('| a | b |\n|:--|--:|\n| 1 | 2 |'), 0);
    expect(table.tag, 'table');
    final thead = table.children!.first as md.Element;
    expect(thead.tag, 'thead');
    final headerRow = thead.children!.single as md.Element;
    final th = headerRow.children!.first as md.Element;
    expect(th.tag, 'th');
    expect(th.attributes['align'], 'left');
    final tbody = table.children![1] as md.Element;
    final td =
        (tbody.children!.single as md.Element).children!.last as md.Element;
    expect(td.tag, 'td');
    expect(td.attributes['align'], 'right');
  });

  test('alert maps to alert element with type', () {
    final alert = elementAt(bridge('> [!WARNING]\n> careful'), 0);
    expect(alert.tag, 'alert');
    expect(alert.attributes['type'], 'warning');
    final p = alert.children!.single as md.Element;
    expect(p.textContent, 'careful');
  });

  test('mentions map to mention elements with id text', () {
    final p = elementAt(bridge('<@123> <#456> <@&789> @everyone @here'), 0);
    final mentions = p.children!.whereType<md.Element>().toList();
    expect(mentions[0].tag, 'mention-user');
    expect(mentions[0].textContent, '123');
    expect(mentions[1].tag, 'mention-channel');
    expect(mentions[1].textContent, '456');
    expect(mentions[2].tag, 'mention-role');
    expect(mentions[2].textContent, '789');
    expect(mentions[3].tag, 'mention-everyone');
    expect(mentions[3].textContent, '@everyone');
    expect(mentions[4].tag, 'mention-everyone');
    expect(mentions[4].textContent, '@here');
  });

  test('timestamp maps style to renderer flag letter', () {
    final p = elementAt(bridge('<t:1700000000:R>'), 0);
    final timestamp = p.children!.whereType<md.Element>().single;
    expect(timestamp.tag, 'timestamp');
    expect(timestamp.textContent, '1700000000');
    expect(timestamp.attributes['flag'], 'R');

    final defaulted = elementAt(
      bridge('<t:1700000000>'),
      0,
    ).children!.whereType<md.Element>().single;
    expect(defaulted.attributes['flag'], 'f');
  });

  test('custom emoji maps id and animated', () {
    final p = elementAt(bridge('<a:party:42>'), 0);
    final emoji = p.children!.whereType<md.Element>().single;
    expect(emoji.tag, 'emoji-custom');
    expect(emoji.textContent, 'party');
    expect(emoji.attributes['id'], '42');
    expect(emoji.attributes['animated'], 'true');
  });

  test('masked link keeps label children and href', () {
    final p = elementAt(bridge('[label](https://example.com)'), 0);
    final link = p.children!.whereType<md.Element>().single;
    expect(link.tag, 'a');
    expect(link.attributes['href'], 'https://example.com');
    expect(link.textContent, 'label');
  });

  test('bare autolink uses raw url as display text', () {
    final p = elementAt(bridge('see https://example.com/x now'), 0);
    final link = p.children!.whereType<md.Element>().single;
    expect(link.tag, 'a');
    expect(link.attributes['href'], 'https://example.com/x');
    expect(link.textContent, 'https://example.com/x');
  });

  test('inline code maps to code element with literal content', () {
    final p = elementAt(bridge('run `ls **-la**` now'), 0);
    final code = p.children!.whereType<md.Element>().single;
    expect(code.tag, 'code');
    expect(code.textContent, 'ls **-la**');
  });

  test('empty and whitespace-only input yields no nodes', () {
    expect(bridge(''), isEmpty);
    expect(bridge('\u200b'), hasLength(1));
  });

  test('command mention joins name and subcommand with id attr', () {
    final p = elementAt(bridge('</ban user:99>'), 0);
    final mention = p.children!.whereType<md.Element>().single;
    expect(mention.tag, 'mention-command');
    expect(mention.attributes['id'], '99');
    expect(mention.textContent, 'ban user');
  });
}
