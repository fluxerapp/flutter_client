import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/service/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/chat/utils/composer_slash_commands.dart';

int composerAutocompleteReplacementStart({
  required String textUpToCursor,
  required ComposerAutocompleteTrigger trigger,
}) {
  switch (trigger.kind) {
    case ComposerAutocompleteTriggerKind.commandArgMention:
      return (textUpToCursor.length - trigger.matchedText.length - 1).clamp(
        0,
        textUpToCursor.length,
      );
    case ComposerAutocompleteTriggerKind.commandArg:
      return (textUpToCursor.length - trigger.matchedText.length).clamp(
        0,
        textUpToCursor.length,
      );
    case ComposerAutocompleteTriggerKind.emojiReaction:
    case ComposerAutocompleteTriggerKind.mention:
    case ComposerAutocompleteTriggerKind.channel:
    case ComposerAutocompleteTriggerKind.emoji:
    case ComposerAutocompleteTriggerKind.meme:
    case ComposerAutocompleteTriggerKind.gif:
    case ComposerAutocompleteTriggerKind.sticker:
    case ComposerAutocompleteTriggerKind.command:
      return trigger.matchStart;
  }
}

String getComposerCommandInsertionText(ComposerSlashCommand command) {
  if (command is ComposerSimpleSlashCommand) {
    return '${command.content} ';
  }
  return getCommandInsertionText(command);
}

({int start, int end, String text}) createComposerCommandReplacement({
  required String display,
  required String textUpToCursor,
  required int matchStart,
  required int caret,
  required ComposerSlashCommand command,
}) {
  final String beforeMatch = textUpToCursor.substring(0, matchStart);
  final int start = beforeMatch.trim().isEmpty ? 0 : matchStart;
  final bool replacesRemainder =
      command.name == '/me' || command.name == '/spoiler';
  return (
    start: start,
    end: replacesRemainder ? display.length : caret,
    text: getComposerCommandInsertionText(command),
  );
}
