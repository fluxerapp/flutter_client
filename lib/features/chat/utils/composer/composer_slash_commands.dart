import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const List<ComposerCommandChoice> kEmptyComposerCommandChoices =
    <ComposerCommandChoice>[];

List<ComposerSlashCommand> composerSlashCommands(FluxerLocalizations l10n) {
  return <ComposerSlashCommand>[
    ComposerSimpleSlashCommand(
      name: '/shrug',
      content: r'¯\_(ツ)_/¯',
      description: l10n.composerCommandShrugDescription,
    ),
    ComposerSimpleSlashCommand(
      name: '/tableflip',
      content: '(╯°□°)╯︵ ┻━┻',
      description: l10n.composerCommandTableflipDescription,
    ),
    ComposerSimpleSlashCommand(
      name: '/unflip',
      content: '┬─┬ ノ( ゜-゜ノ)',
      description: l10n.composerCommandUnflipDescription,
    ),
    ComposerActionSlashCommand(
      name: '/me',
      description: l10n.composerCommandMeDescription,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'message',
          description: l10n.composerCommandMessageOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/spoiler',
      description: l10n.composerCommandSpoilerDescription,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'message',
          description: l10n.composerCommandMessageOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/tts',
      description: l10n.composerCommandTtsDescription,
      permission: Permission.sendTtsMessages,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'message',
          description: l10n.composerCommandMessageOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/nick',
      description: l10n.composerCommandNickDescription,
      permission: Permission.changeNickname,
      requiresGuild: true,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'nickname',
          description: l10n.composerCommandNicknameOption,
          type: ComposerCommandOptionType.string,
          required: true,
          allowEmpty: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/kick',
      description: l10n.composerCommandKickDescription,
      permission: Permission.kickMembers,
      requiresGuild: true,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'user',
          description: l10n.composerCommandMemberOption,
          type: ComposerCommandOptionType.user,
          required: true,
        ),
        ComposerCommandOption(
          name: 'reason',
          description: l10n.composerCommandReasonOption,
          type: ComposerCommandOptionType.string,
          required: false,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/ban',
      description: l10n.composerCommandBanDescription,
      permission: Permission.banMembers,
      requiresGuild: true,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'user',
          description: l10n.composerCommandMemberOption,
          type: ComposerCommandOptionType.user,
          required: true,
        ),
        ComposerCommandOption(
          name: 'delete_messages',
          description: l10n.composerCommandDeleteMessagesOption,
          type: ComposerCommandOptionType.choice,
          required: true,
          choices: <ComposerCommandChoice>[
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesNone,
              value: '0',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesOneDay,
              value: '1',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesDays(2),
              value: '2',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesDays(3),
              value: '3',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesDays(4),
              value: '4',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesDays(5),
              value: '5',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesDays(6),
              value: '6',
            ),
            ComposerCommandChoice(
              name: l10n.composerCommandDeleteMessagesDays(7),
              value: '7',
            ),
          ],
        ),
        ComposerCommandOption(
          name: 'reason',
          description: l10n.composerCommandReasonOption,
          type: ComposerCommandOptionType.string,
          required: false,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/msg',
      description: l10n.composerCommandMsgDescription,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'user',
          description: l10n.composerCommandMemberOption,
          type: ComposerCommandOptionType.user,
          required: true,
        ),
        ComposerCommandOption(
          name: 'message',
          description: l10n.composerCommandMessageOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/saved',
      description: l10n.composerCommandSavedDescription,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'query',
          description: l10n.composerCommandQueryOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/sticker',
      description: l10n.composerCommandStickerDescription,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'query',
          description: l10n.composerCommandQueryOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
    ComposerActionSlashCommand(
      name: '/gif',
      description: l10n.composerCommandGifDescription,
      options: <ComposerCommandOption>[
        ComposerCommandOption(
          name: 'query',
          description: l10n.composerCommandQueryOption,
          type: ComposerCommandOptionType.string,
          required: true,
        ),
      ],
    ),
  ];
}

List<ComposerSlashCommand> filterCommandsByQuery(
  List<ComposerSlashCommand> commands,
  String query,
) {
  if (query.isEmpty) {
    return commands;
  }
  final String needle = query.toLowerCase();
  return commands
      .where((ComposerSlashCommand c) => c.name.toLowerCase().contains(needle))
      .toList(growable: false);
}

bool canUseComposerCommand({
  required ComposerSlashCommand command,
  required bool hasChannel,
  required bool isGuild,
  required int channelPermissionBits,
}) {
  if (command is ComposerSimpleSlashCommand) {
    return true;
  }
  if (command is! ComposerActionSlashCommand) {
    return false;
  }
  if (!hasChannel) {
    return false;
  }
  if (command.requiresGuild && !isGuild) {
    return false;
  }
  final Permission? permission = command.permission;
  if (permission != null) {
    return hasPermission(channelPermissionBits, permission) ||
        hasPermission(channelPermissionBits, Permission.administrator);
  }
  return true;
}

String normalizeComposerCommandName(String? commandName) {
  if (commandName == null || commandName.isEmpty) {
    return '';
  }
  return commandName.startsWith('/') ? commandName.substring(1) : commandName;
}

bool isCommandRequiringUserMention(String commandName) {
  final String name = normalizeComposerCommandName(commandName);
  return name == 'kick' || name == 'ban' || name == 'msg' || name == 'saved';
}

Permission? managePermissionForCommand(String? commandName) {
  return switch (normalizeComposerCommandName(commandName)) {
    'kick' => Permission.kickMembers,
    'ban' => Permission.banMembers,
    _ => null,
  };
}

bool canManageUserForCommand({
  required String currentUserId,
  required String otherUserId,
  required Permission permission,
  required int viewerPermissions,
  required String? ownerId,
  required bool targetIsOwner,
  required MemberRole? viewerHighest,
  required MemberRole? targetHighest,
}) {
  if (otherUserId == currentUserId) {
    return false;
  }
  if (!hasPermission(viewerPermissions, permission) &&
      !hasPermission(viewerPermissions, Permission.administrator)) {
    return false;
  }
  return canManageTarget(
    currentUserId: currentUserId,
    ownerId: ownerId,
    viewerHighest: viewerHighest,
    targetHighest: targetHighest,
    targetIsOwner: targetIsOwner,
  );
}

String getCommandInsertionText(ComposerSlashCommand command) {
  if (command is ComposerSimpleSlashCommand) {
    return command.content;
  }
  return '${command.name} ';
}

({List<ComposerCommandOption> required, List<ComposerCommandOption> optional})
partitionSlashCommandOptions(List<ComposerCommandOption> options) {
  final List<ComposerCommandOption> required = <ComposerCommandOption>[];
  final List<ComposerCommandOption> optional = <ComposerCommandOption>[];
  for (final ComposerCommandOption option in options) {
    if (option.required) {
      required.add(option);
    } else {
      optional.add(option);
    }
  }
  return (required: required, optional: optional);
}
