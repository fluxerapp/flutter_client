import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/service/composer_slash_session.dart';

void main() {
  test('start inserts required slots and serializes wire text', () {
    const ComposerActionSlashCommand command = ComposerActionSlashCommand(
      name: '/kick',
      description: 'd',
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'user',
          description: 'u',
          type: ComposerCommandOptionType.user,
          required: true,
        ),
        ComposerCommandOption(
          name: 'reason',
          description: 'r',
          type: ComposerCommandOptionType.string,
          required: false,
        ),
      ],
    );
    final ComposerSlashSession session = ComposerSlashSession();
    addTearDown(session.dispose);
    session.start(command);
    expect(session.slots.length, 1);
    expect(session.absentOptional.length, 1);
    session.applySlotPayload(index: 0, display: 'Alice', wire: '<@1>');
    expect(session.toWireText(), '/kick <@1>');
    expect(session.isSubmitValid, isTrue);
    session.addOptionalOption('reason');
    session.setSlotText(1, 'spam');
    expect(session.toWireText(), '/kick <@1> spam');
  });

  test('backspace on empty first slot clears the session', () {
    const ComposerActionSlashCommand command = ComposerActionSlashCommand(
      name: '/me',
      description: 'd',
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'message',
          description: 'm',
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    );
    final ComposerSlashSession session = ComposerSlashSession();
    addTearDown(session.dispose);
    session.start(command);
    expect(session.backspaceOnEmptyFirstSlot(), isTrue);
    expect(session.isActive, isFalse);
  });

  test('marks empty required slots invalid', () {
    const ComposerActionSlashCommand command = ComposerActionSlashCommand(
      name: '/kick',
      description: 'd',
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'user',
          description: 'u',
          type: ComposerCommandOptionType.user,
          required: true,
        ),
        ComposerCommandOption(
          name: 'reason',
          description: 'r',
          type: ComposerCommandOptionType.string,
          required: false,
        ),
      ],
    );
    final ComposerSlashSession session = ComposerSlashSession();
    addTearDown(session.dispose);
    session.start(command);
    expect(session.slots.first.invalid, isFalse);
    session.markRequiredError();
    expect(session.slots.first.invalid, isTrue);
    expect(session.showRequiredError, isTrue);

    session.start(command);
    session.addOptionalOption('reason');
    session.focusSlot(1);
    expect(session.slots.first.invalid, isTrue);
  });
}
