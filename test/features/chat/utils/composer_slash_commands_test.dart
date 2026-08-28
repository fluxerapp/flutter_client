import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/service/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/chat/utils/composer_command_insertion.dart';
import 'package:fluxer_app/features/chat/utils/composer_slash_commands.dart';
import 'package:fluxer_app/features/chat/utils/slash_slot_validation.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

void main() {
  group('ComposerAutocompleteTrigger command kinds', () {
    test('matches / command query at line start', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('/me');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.command);
      expect(trigger?.matchedText, 'me');
    });

    test('prefers gif search over command when args are present', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('/gif cats');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.gif);
      expect(trigger?.matchedText, 'cats');
    });

    test('matches kick user mention argument', () {
      final ComposerAutocompleteTrigger? trigger =
          ComposerAutocompleteTrigger.detect('/kick @al');
      expect(trigger?.kind, ComposerAutocompleteTriggerKind.commandArgMention);
      expect(trigger?.matchedText, 'al');
      expect(trigger?.commandName, 'kick');
    });

    test('does not match command inside an open code fence', () {
      expect(
        ComposerAutocompleteTrigger.detectIfAllowed(
          fullText: '```\n/me',
          caretIndex: 6,
        ),
        isNull,
      );
    });
  });

  group('filterCommandsByQuery', () {
    const List<ComposerSlashCommand> commands = <ComposerSlashCommand>[
      ComposerSimpleSlashCommand(
        name: '/shrug',
        description: 'd',
        content: 'x',
      ),
      ComposerActionSlashCommand(name: '/me', description: 'd'),
      ComposerActionSlashCommand(name: '/msg', description: 'd'),
    ];

    test('empty query returns all', () {
      expect(filterCommandsByQuery(commands, '').length, 3);
    });

    test('substring matches command name', () {
      expect(filterCommandsByQuery(commands, 'm').map((c) => c.name), <String>[
        '/me',
        '/msg',
      ]);
    });
  });

  group('canUseComposerCommand', () {
    test('simple commands are always allowed', () {
      expect(
        canUseComposerCommand(
          command: const ComposerSimpleSlashCommand(
            name: '/shrug',
            description: 'd',
            content: 'x',
          ),
          hasChannel: false,
          isGuild: false,
          channelPermissionBits: 0,
        ),
        isTrue,
      );
    });

    test('guild commands are hidden in DMs', () {
      expect(
        canUseComposerCommand(
          command: const ComposerActionSlashCommand(
            name: '/nick',
            description: 'd',
            requiresGuild: true,
            permission: Permission.changeNickname,
          ),
          hasChannel: true,
          isGuild: false,
          channelPermissionBits: Permission.changeNickname.value,
        ),
        isFalse,
      );
    });
  });

  group('createComposerCommandReplacement', () {
    test('/me replaces remainder of the display', () {
      const ComposerActionSlashCommand command = ComposerActionSlashCommand(
        name: '/me',
        description: 'd',
      );
      final replacement = createComposerCommandReplacement(
        display: '/me leftover',
        textUpToCursor: '/me',
        matchStart: 0,
        caret: 3,
        command: command,
      );
      expect(replacement.end, '/me leftover'.length);
      expect(replacement.text, '/me ');
    });

    test('simple command inserts content with a trailing space', () {
      const ComposerSimpleSlashCommand command = ComposerSimpleSlashCommand(
        name: '/shrug',
        description: 'd',
        content: r'¯\_(ツ)_/¯',
      );
      final replacement = createComposerCommandReplacement(
        display: '/shrug',
        textUpToCursor: '/shrug',
        matchStart: 0,
        caret: 6,
        command: command,
      );
      expect(replacement.text, r'¯\_(ツ)_/¯ ');
    });
  });

  group('validateSlashSlot', () {
    test('required empty slot is invalid', () {
      final SlashSlotValidationResult result = validateSlashSlot(
        optionType: 'string',
        rawText: '',
        required: true,
      );
      expect(result.valid, isFalse);
      expect(result.error, SlashSlotValidationError.requiredValue);
    });

    test('user mention wire resolves', () {
      final SlashSlotValidationResult result = validateSlashSlot(
        optionType: 'user',
        rawText: '<@42>',
        required: true,
      );
      expect(result.valid, isTrue);
      expect(result.resolvedWire, '<@42>');
    });
  });

  group('canManageUserForCommand', () {
    const MemberRole highRole = MemberRole(
      id: '1',
      name: 'admin',
      color: 0,
      position: 10,
    );
    const MemberRole lowRole = MemberRole(
      id: '2',
      name: 'member',
      color: 0,
      position: 1,
    );

    test('rejects self', () {
      expect(
        canManageUserForCommand(
          currentUserId: 'me',
          otherUserId: 'me',
          permission: Permission.kickMembers,
          viewerPermissions: Permission.kickMembers.value,
          ownerId: 'owner',
          targetIsOwner: false,
          viewerHighest: highRole,
          targetHighest: lowRole,
        ),
        isFalse,
      );
    });

    test('rejects a higher-ranked member', () {
      expect(
        canManageUserForCommand(
          currentUserId: 'me',
          otherUserId: 'them',
          permission: Permission.kickMembers,
          viewerPermissions: Permission.kickMembers.value,
          ownerId: 'owner',
          targetIsOwner: false,
          viewerHighest: lowRole,
          targetHighest: highRole,
        ),
        isFalse,
      );
    });

    test('allows a lower-ranked member when the viewer has the permission', () {
      expect(
        canManageUserForCommand(
          currentUserId: 'me',
          otherUserId: 'them',
          permission: Permission.kickMembers,
          viewerPermissions: Permission.kickMembers.value,
          ownerId: 'owner',
          targetIsOwner: false,
          viewerHighest: highRole,
          targetHighest: lowRole,
        ),
        isTrue,
      );
    });
  });
}
