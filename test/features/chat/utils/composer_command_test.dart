import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/composer_command.dart';

void main() {
  group('parseComposerCommand', () {
    test('/me parses to a me command', () {
      final cmd = parseComposerCommand('/me waves') as ComposerMeCommand;
      expect(cmd.content, 'waves');
    });

    test('/spoiler parses to a spoiler command', () {
      final cmd =
          parseComposerCommand('/spoiler secret') as ComposerSpoilerCommand;
      expect(cmd.content, 'secret');
    });

    test('/tts parses to a tts command', () {
      final cmd = parseComposerCommand('/tts hello') as ComposerTtsCommand;
      expect(cmd.content, 'hello');
    });

    test('s/old/new/ parses to a non-global replace', () {
      final cmd = parseComposerCommand('s/old/new/') as ComposerReplaceCommand;
      expect(cmd.source, 'old');
      expect(cmd.replacement, 'new');
      expect(cmd.global, isFalse);
    });

    test('s/a/b/g parses to a global replace', () {
      final cmd = parseComposerCommand('s/a/b/g') as ComposerReplaceCommand;
      expect(cmd.source, 'a');
      expect(cmd.replacement, 'b');
      expect(cmd.global, isTrue);
    });

    test('an unknown slash command is plain content sent verbatim', () {
      final cmd = parseComposerCommand('/foo bar') as ComposerContentSend;
      expect(cmd.content, '/foo bar');
    });

    test('/nick parses nickname including empty reset', () {
      expect(
        (parseComposerCommand('/nick') as ComposerNickCommand).nickname,
        '',
      );
      expect(
        (parseComposerCommand('/nick Cool') as ComposerNickCommand).nickname,
        'Cool',
      );
    });

    test('/kick parses mention and reason', () {
      final cmd =
          parseComposerCommand('/kick <@123> being rude')
              as ComposerKickCommand;
      expect(cmd.userId, '123');
      expect(cmd.reason, 'being rude');
    });

    test('/ban parses delete days and reason', () {
      final cmd =
          parseComposerCommand('/ban <@9> 3 spam') as ComposerBanCommand;
      expect(cmd.userId, '9');
      expect(cmd.deleteMessageDays, 3);
      expect(cmd.reason, 'spam');
    });

    test('/ban with invalid extra digits is unknown content', () {
      expect(
        parseComposerCommand('/ban <@9> 12 x'),
        isA<ComposerContentSend>(),
      );
    });

    test('/msg requires a message after the mention', () {
      expect(parseComposerCommand('/msg <@1>'), isA<ComposerContentSend>());
      final cmd = parseComposerCommand('/msg <@1> hello') as ComposerMsgCommand;
      expect(cmd.userId, '1');
      expect(cmd.message, 'hello');
    });

    test('/gif without picking a result is a media search command', () {
      final cmd =
          parseComposerCommand('/gif cats') as ComposerMediaSearchCommand;
      expect(cmd.kind, 'gif');
      expect(cmd.query, 'cats');
    });

    test('@everyone text is plain content', () {
      final cmd = parseComposerCommand('@everyone hi') as ComposerContentSend;
      expect(cmd.content, '@everyone hi');
    });

    test('/me without an argument is plain content', () {
      expect(parseComposerCommand('/me'), isA<ComposerContentSend>());
      expect(parseComposerCommand('/me '), isA<ComposerContentSend>());
    });
  });

  group('wrap helpers', () {
    test('wrapMe italicises', () => expect(wrapMe('x'), '_x_'));
    test('wrapSpoiler wraps', () => expect(wrapSpoiler('x'), '||x||'));
  });

  group('executeReplace', () {
    test('global replaces every occurrence', () {
      const cmd = ComposerReplaceCommand(
        source: 'a',
        replacement: 'X',
        global: true,
      );
      expect(executeReplace('a b a', cmd), 'X b X');
    });

    test('non-global replaces only the first occurrence', () {
      const cmd = ComposerReplaceCommand(
        source: 'a',
        replacement: 'X',
        global: false,
      );
      expect(executeReplace('a b a', cmd), 'X b a');
    });

    test('source is matched literally, not as a regex', () {
      const cmd = ComposerReplaceCommand(
        source: 'a.c',
        replacement: 'X',
        global: false,
      );
      expect(executeReplace('a.c abc', cmd), 'X abc');
    });

    test('replacement dollar references are inserted literally', () {
      const cmd = ComposerReplaceCommand(
        source: 'x',
        replacement: r'$1',
        global: false,
      );
      expect(executeReplace('x', cmd), r'$1');
    });
  });

  group('stripSilentPrefix', () {
    test('@silent prefix is removed and sets the suppress flag', () {
      final result = stripSilentPrefix('@silent hi');
      expect(result.content, 'hi');
      expect(result.flags, messageFlagSuppressNotifications);
    });

    test('content without the prefix is unchanged with no flags', () {
      final result = stripSilentPrefix('hi @silent');
      expect(result.content, 'hi @silent');
      expect(result.flags, 0);
    });
  });
}
