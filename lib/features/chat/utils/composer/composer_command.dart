import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';

const int kMentionConfirmThreshold = 50;

sealed class ComposerCommand {
  const ComposerCommand();
}

class ComposerContentSend extends ComposerCommand {
  const ComposerContentSend(this.content);

  final String content;
}

class ComposerMeCommand extends ComposerCommand {
  const ComposerMeCommand(this.content);

  final String content;
}

class ComposerSpoilerCommand extends ComposerCommand {
  const ComposerSpoilerCommand(this.content);

  final String content;
}

class ComposerTtsCommand extends ComposerCommand {
  const ComposerTtsCommand(this.content);

  final String content;
}

class ComposerNickCommand extends ComposerCommand {
  const ComposerNickCommand(this.nickname);

  final String nickname;
}

class ComposerKickCommand extends ComposerCommand {
  const ComposerKickCommand({required this.userId, this.reason});

  final String userId;
  final String? reason;
}

class ComposerBanCommand extends ComposerCommand {
  const ComposerBanCommand({
    required this.userId,
    required this.deleteMessageDays,
    this.reason,
  });

  final String userId;
  final int deleteMessageDays;
  final String? reason;
}

class ComposerMsgCommand extends ComposerCommand {
  const ComposerMsgCommand({required this.userId, required this.message});

  final String userId;
  final String message;
}

class ComposerMediaSearchCommand extends ComposerCommand {
  const ComposerMediaSearchCommand();
}

class ComposerReplaceCommand extends ComposerCommand {
  const ComposerReplaceCommand({
    required this.source,
    required this.replacement,
    required this.global,
  });

  final String source;
  final String replacement;
  final bool global;
}

class ComposerReactionShorthand extends ComposerCommand {
  const ComposerReactionShorthand(this.token);

  final String token;
}

class ReactionShorthandEmoji {
  const ReactionShorthandEmoji({
    required this.emoji,
    this.emojiId,
    this.animated = false,
  });

  final String emoji;
  final String? emojiId;
  final bool animated;
}

final RegExp _reactionShorthandRegex = RegExp(r'^\+(\S+)$');
final RegExp _reactionShortcodeRegex = RegExp(
  r'^:([^\s:]+(?:::skin-tone-[1-5])?):$',
);
final RegExp _customEmojiMarkdownRegex = RegExp(
  r'^<(a)?:([A-Za-z0-9_+-]{2,}):(\d+)>$',
);

ReactionShorthandEmoji? resolveReactionShorthand(
  String token, {
  required String? Function(String name) unicodeByName,
  required String? Function(String surrogates) unicodeBySurrogates,
  required String? Function(String nameLower) customEmojiMarkdown,
}) {
  final RegExpMatch? shortcode = _reactionShortcodeRegex.firstMatch(token);
  if (shortcode != null) {
    final String name = shortcode.group(1)!;
    final String? surrogates = unicodeByName(name);
    if (surrogates != null) {
      return ReactionShorthandEmoji(emoji: surrogates);
    }
    final String? markdown = customEmojiMarkdown(
      name.replaceFirst(RegExp(r'~\d+$'), '').toLowerCase(),
    );
    return markdown == null ? null : _customFromMarkdown(markdown);
  }
  final ReactionShorthandEmoji? custom = _customFromMarkdown(token);
  if (custom != null) {
    return custom;
  }
  final String? surrogates = unicodeBySurrogates(token);
  return surrogates == null ? null : ReactionShorthandEmoji(emoji: surrogates);
}

ReactionShorthandEmoji? _customFromMarkdown(String markdown) {
  final RegExpMatch? match = _customEmojiMarkdownRegex.firstMatch(markdown);
  if (match == null) {
    return null;
  }
  return ReactionShorthandEmoji(
    emoji: match.group(2)!,
    emojiId: match.group(3),
    animated: match.group(1) != null,
  );
}

final RegExp _replaceCommandRegex = RegExp(r'^s/(.+?)/(.*?)(?:/(g)?)?$');
final RegExp _userMentionWire = RegExp(r'<@!?(\d+)>');

ComposerCommand parseComposerCommand(String wireText) {
  final String trimmed = wireText.trim();

  final RegExpMatch? reaction = _reactionShorthandRegex.firstMatch(trimmed);
  if (reaction != null) {
    return ComposerReactionShorthand(reaction.group(1)!);
  }

  final RegExpMatch? replace = _replaceCommandRegex.firstMatch(trimmed);
  if (replace != null) {
    final String source = replace.group(1) ?? '';
    if (source.isNotEmpty) {
      return ComposerReplaceCommand(
        source: source,
        replacement: replace.group(2) ?? '',
        global: replace.group(3) != null,
      );
    }
  }

  if (trimmed == '/nick') {
    return const ComposerNickCommand('');
  }
  if (trimmed.startsWith('/nick ')) {
    return ComposerNickCommand(trimmed.substring(6).trim());
  }

  if (trimmed.startsWith('/kick ')) {
    final String rest = trimmed.substring(6).trim();
    final RegExpMatch? userMatch = _userMentionWire.firstMatch(rest);
    if (userMatch == null) {
      return ComposerContentSend(wireText);
    }
    final String userId = userMatch.group(1)!;
    final String after = rest.substring(userMatch.end).trim();
    return ComposerKickCommand(
      userId: userId,
      reason: after.isEmpty ? null : after,
    );
  }

  if (trimmed.startsWith('/ban ')) {
    final String rest = trimmed.substring(5).trim();
    final RegExpMatch? userMatch = _userMentionWire.firstMatch(rest);
    if (userMatch == null) {
      return ComposerContentSend(wireText);
    }
    final String userId = userMatch.group(1)!;
    final String after = rest.substring(userMatch.end).trim();
    final List<String> parts = after.isEmpty
        ? const <String>[]
        : after.split(RegExp(r'\s+'));
    var deleteMessageDays = 1;
    var reasonStart = 0;
    if (parts.isNotEmpty && RegExp(r'^[0-7]$').hasMatch(parts.first)) {
      deleteMessageDays = int.parse(parts.first);
      reasonStart = 1;
    } else if (parts.isNotEmpty && RegExp(r'^\d+$').hasMatch(parts.first)) {
      return ComposerContentSend(wireText);
    }
    final String reasonText = parts.skip(reasonStart).join(' ').trim();
    return ComposerBanCommand(
      userId: userId,
      deleteMessageDays: deleteMessageDays,
      reason: reasonText.isEmpty ? null : reasonText,
    );
  }

  if (trimmed.startsWith('/msg ')) {
    final String rest = trimmed.substring(5).trim();
    final RegExpMatch? userMatch = _userMentionWire.firstMatch(rest);
    if (userMatch == null) {
      return ComposerContentSend(wireText);
    }
    final String userId = userMatch.group(1)!;
    final String message = rest.substring(userMatch.end).trim();
    if (message.isEmpty) {
      return ComposerContentSend(wireText);
    }
    return ComposerMsgCommand(userId: userId, message: message);
  }

  final String? me = _commandArg(trimmed, '/me ');
  if (me != null) {
    return ComposerMeCommand(me);
  }
  final String? spoiler = _commandArg(trimmed, '/spoiler ');
  if (spoiler != null) {
    return ComposerSpoilerCommand(spoiler);
  }
  final String? tts = _commandArg(trimmed, '/tts ');
  if (tts != null) {
    return ComposerTtsCommand(tts);
  }

  for (final String type in const <String>['saved', 'sticker', 'gif']) {
    final String prefix = '/$type';
    if (trimmed == prefix || trimmed.startsWith('$prefix ')) {
      return const ComposerMediaSearchCommand();
    }
  }

  return ComposerContentSend(wireText);
}

String? _commandArg(String trimmed, String prefix) {
  if (!trimmed.startsWith(prefix)) {
    return null;
  }
  final String rest = trimmed.substring(prefix.length).trim();
  return rest.isEmpty ? null : rest;
}

String wrapMe(String content) => '_${content}_';

String wrapSpoiler(String content) => '||$content||';

final RegExp _regexSpecialChars = RegExp(r'[.*+?^${}()|\[\]\\]');

String executeReplace(String text, ComposerReplaceCommand cmd) {
  final String escaped = cmd.source.replaceAllMapped(
    _regexSpecialChars,
    (Match m) => '\\${m[0]}',
  );
  final RegExp pattern = RegExp(escaped);
  return cmd.global
      ? text.replaceAll(pattern, cmd.replacement)
      : text.replaceFirst(pattern, cmd.replacement);
}

({String content, int flags}) stripSilentPrefix(String content) {
  const String prefix = '@silent ';
  if (content.startsWith(prefix)) {
    return (
      content: content.substring(prefix.length),
      flags: messageFlagSuppressNotifications,
    );
  }
  return (content: content, flags: 0);
}

final RegExp kRoleMentionWirePattern = RegExp(r'<@&(\d+)>');

class LargeRoleMentionImpact {
  const LargeRoleMentionImpact({
    required this.roleName,
    required this.memberCount,
  });

  final String roleName;
  final int memberCount;
}

List<String> _roleIdsFromMemberJson(String json) {
  try {
    final Object? decoded = jsonDecode(json);
    if (decoded is List<dynamic>) {
      return decoded.cast<String>();
    }
  } on Object {
    // Fall through to empty list.
  }
  return const <String>[];
}

LargeRoleMentionImpact? largestLargeRoleMentionImpact({
  required List<db.Member> members,
  required Map<String, db.Role> roleById,
  required String guildId,
  required String content,
  required bool canMentionEveryone,
  int threshold = kMentionConfirmThreshold,
}) {
  final Set<String> mentionedRoleIds = <String>{};
  for (final RegExpMatch match in kRoleMentionWirePattern.allMatches(content)) {
    final String? roleId = match.group(1);
    if (roleId != null && roleId != guildId) {
      mentionedRoleIds.add(roleId);
    }
  }
  if (mentionedRoleIds.isEmpty) {
    return null;
  }
  final Map<String, int> countsByRoleId = <String, int>{};
  for (final db.Member member in members) {
    for (final String roleId in _roleIdsFromMemberJson(member.roleIdsJson)) {
      countsByRoleId[roleId] = (countsByRoleId[roleId] ?? 0) + 1;
    }
  }
  LargeRoleMentionImpact? highest;
  for (final String roleId in mentionedRoleIds) {
    final db.Role? role = roleById[roleId];
    if (role == null) {
      continue;
    }
    if (!(canMentionEveryone || role.mentionable)) {
      continue;
    }
    final int memberCount = countsByRoleId[roleId] ?? 0;
    if (memberCount <= threshold) {
      continue;
    }
    if (highest == null || memberCount > highest.memberCount) {
      highest = LargeRoleMentionImpact(
        roleName: role.name,
        memberCount: memberCount,
      );
    }
  }
  return highest;
}
