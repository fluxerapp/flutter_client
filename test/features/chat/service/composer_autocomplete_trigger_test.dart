import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/service/composer_autocomplete_trigger.dart';

void main() {
  group('ComposerAutocompleteTrigger.detect', () {
    test('matches mention queries with spaces for multi-word role names', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('hello @Android Alpha');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.mention);
      expect(trigger?.matchedText, 'Android Alpha');
    });

    test('does not match text after a second @ trigger', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('hi @alice @bob');
      expect(trigger?.matchedText, 'bob');
    });

    test('matches @ immediately after an inline mention chip sentinel', () {
      const String chip = '\uE000';
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('${chip}@bob');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.mention);
      expect(trigger?.matchedText, 'bob');
      expect(trigger?.matchStart, chip.length);
    });

    test('matches @ after chip sentinel and space', () {
      const String chip = '\uE000';
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('$chip @bob');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.mention);
      expect(trigger?.matchedText, 'bob');
    });

    test('trims trailing whitespace from the matched mention query', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('hello @Android Alpha ');
      expect(trigger?.matchedText, 'Android Alpha ');
    });

    test('does not match mention when @ is immediately followed by space', () {
      expect(ComposerAutocompleteTrigger.detect('hello @ '), isNull);
      expect(ComposerAutocompleteTrigger.detect('@ '), isNull);
      expect(ComposerAutocompleteTrigger.detect('hello @ foo'), isNull);
    });

    test('falls through to emoji after @ followed by space', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('hello @ :smile');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.emoji);
      expect(trigger?.matchedText, 'smile');
    });
  });
}
