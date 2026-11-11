import 'package:flutter/widgets.dart' show Characters, StringCharacters;
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_content_stripper.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_name_resolvers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

const int kDesktopNotificationBodyMaxLength = 300;

class DesktopMessageNotificationContent {
  const DesktopMessageNotificationContent({
    required this.title,
    required this.body,
    required this.guildId,
    this.subtitle,
    this.avatarUrl,
  });

  final String title;
  final String? subtitle;
  final String body;
  final String? guildId;
  final String? avatarUrl;
}

class DesktopNotificationChannelContext {
  const DesktopNotificationChannelContext({
    this.guildId,
    this.guildName,
    this.channelName,
    this.parentName,
    this.isThread = false,
    this.isVoice = false,
    this.isGroupDm = false,
    this.groupDmName,
  });

  final String? guildId;
  final String? guildName;
  final String? channelName;
  final String? parentName;
  final bool isThread;
  final bool isVoice;
  final bool isGroupDm;
  final String? groupDmName;

  bool get isGuild => guildId != null;
}

class DesktopNotificationTitle {
  const DesktopNotificationTitle({required this.title, this.subtitle});

  final String title;
  final String? subtitle;
}

DesktopNotificationTitle buildDesktopNotificationTitle({
  required String authorName,
  required DesktopNotificationChannelContext channel,
  required bool useSubtitle,
  String? groupDmFallbackName,
}) {
  if (channel.isGroupDm) {
    final String group = (channel.groupDmName?.isNotEmpty ?? false)
        ? channel.groupDmName!
        : groupDmFallbackName ?? '';
    if (group.isEmpty) {
      return DesktopNotificationTitle(title: authorName);
    }
    return useSubtitle
        ? DesktopNotificationTitle(title: authorName, subtitle: group)
        : DesktopNotificationTitle(title: '$authorName ($group)');
  }
  if (!channel.isGuild) {
    return DesktopNotificationTitle(title: authorName);
  }
  final List<String> parts = <String>[];
  final String? channelName = channel.channelName;
  if (channelName != null && channelName.isNotEmpty) {
    parts.add(channel.isVoice ? channelName : '#$channelName');
  }
  if (channel.isThread) {
    final String? parent = channel.parentName;
    if (parent != null && parent.isNotEmpty) {
      parts.add('#$parent');
    }
  }
  final String? guildName = channel.guildName;
  if (useSubtitle) {
    final String subtitle = <String>[
      if (guildName != null && guildName.isNotEmpty) guildName,
      ...parts,
    ].join(channel.isThread ? ', ' : ' ');
    return DesktopNotificationTitle(
      title: authorName,
      subtitle: subtitle.isEmpty ? null : subtitle,
    );
  }
  if (channel.isThread && guildName != null && guildName.isNotEmpty) {
    parts.add(guildName);
  }
  if (parts.isEmpty) {
    return DesktopNotificationTitle(title: authorName);
  }
  return DesktopNotificationTitle(title: '$authorName (${parts.join(', ')})');
}

String buildDesktopNotificationBody({
  required Message message,
  required FluxerLocalizations l10n,
  Map<String, String> userNames = const <String, String>{},
  Map<String, String> roleNames = const <String, String>{},
  Map<String, String> channelNames = const <String, String>{},
}) {
  final String content = message.content.trim();
  if (content.isNotEmpty) {
    final String rendered = renderDesktopNotificationText(
      content,
      userNames: userNames,
      roleNames: roleNames,
      channelNames: channelNames,
    );
    return _truncate(rendered);
  }
  if (message.stickers.isNotEmpty) {
    return l10n.notificationStickerPreview(
      message.stickers.map((MessageSticker s) => s.name).join(', '),
    );
  }
  if (message.attachments.isNotEmpty) {
    return l10n.notificationAttachmentPreview(
      message.attachments.first.filename,
    );
  }
  for (final Embed embed in message.embeds) {
    final String title = embed.title?.trim() ?? '';
    final String description = embed.description?.trim() ?? '';
    if (title.isNotEmpty && description.isNotEmpty) {
      return _truncate('$title: $description');
    }
    if (description.isNotEmpty) {
      return _truncate(description);
    }
    if (title.isNotEmpty) {
      return _truncate(title);
    }
  }
  return l10n.notificationNewMessageFallback;
}

String renderDesktopNotificationText(
  String content, {
  Map<String, String> userNames = const <String, String>{},
  Map<String, String> roleNames = const <String, String>{},
  Map<String, String> channelNames = const <String, String>{},
}) {
  return content
      .replaceAllMapped(MessageContentPatterns.roleMention, (Match match) {
        final String? name = roleNames[match.group(1)];
        return name == null ? '@unknown-role' : '@$name';
      })
      .replaceAllMapped(MessageContentPatterns.userMention, (Match match) {
        final String id = match.group(1)!;
        return '@${userNames[id] ?? id}';
      })
      .replaceAllMapped(MessageContentPatterns.channelMention, (Match match) {
        final String? name = channelNames[match.group(1)];
        return name == null ? '#unknown-channel' : '#$name';
      })
      .replaceAllMapped(
        MessageContentPatterns.customEmoji,
        (Match match) => ':${match.group(1)}:',
      )
      .replaceAllMapped(
        MessageContentPatterns.slashCommand,
        (Match match) => '/${match.group(1)}',
      );
}

String _truncate(String text) {
  if (text.length <= kDesktopNotificationBodyMaxLength) {
    return text;
  }
  final Characters characters = text.characters;
  if (characters.length <= kDesktopNotificationBodyMaxLength) {
    return text;
  }
  return '${characters.take(kDesktopNotificationBodyMaxLength - 1)}…';
}

Future<DesktopNotificationChannelContext?> resolveDesktopNotificationChannel({
  required db.FluxerDatabase database,
  required String channelId,
}) async {
  final db.Channel? channel = await database.channelDao.getChannelById(
    channelId,
  );
  if (channel != null) {
    final db.Server? guild = await database.guildDao.getServerById(
      channel.guildId,
    );
    final bool isThread = isThreadChannelType(channel.type);
    String? parentName;
    final String? parentId = channel.parentId;
    if (isThread && parentId != null) {
      parentName = (await database.channelDao.getChannelById(parentId))?.name;
    }
    return DesktopNotificationChannelContext(
      guildId: channel.guildId,
      guildName: guild?.name,
      channelName: channel.name,
      parentName: parentName,
      isThread: isThread,
      isVoice: channel.type == ChannelType.guildVoice.wireValue,
    );
  }
  final db.DmChannel? dm = await database.dmChannelDao.getDmChannelById(
    channelId,
  );
  if (dm == null) {
    return null;
  }
  return DesktopNotificationChannelContext(
    isGroupDm: dm.type == ChannelType.groupDm.wireValue,
    groupDmName: dm.name?.trim(),
  );
}

Future<DesktopMessageNotificationContent?> buildDesktopMessageNotification({
  required db.FluxerDatabase database,
  required Message message,
  required FluxerLocalizations l10n,
  required bool useSubtitle,
}) async {
  final DesktopNotificationChannelContext? channel =
      await resolveDesktopNotificationChannel(
        database: database,
        channelId: message.channelId,
      );
  if (channel == null) {
    return null;
  }
  final String? guildId = channel.guildId;
  final String authorName = await resolveMessageUserDisplayName(
    database: database,
    userId: message.authorId,
    guildId: guildId,
    fallbackDisplayName: message.authorName,
  );
  final DesktopNotificationTitle title = buildDesktopNotificationTitle(
    authorName: authorName,
    channel: channel,
    useSubtitle: useSubtitle,
    groupDmFallbackName: l10n.notificationGroupDmTitle,
  );
  final String content = message.content;
  final String body = buildDesktopNotificationBody(
    message: message,
    l10n: l10n,
    userNames: await resolveMessageUserMentionNames(
      database: database,
      guildId: guildId,
      content: content,
    ),
    roleNames: await resolveMessageRoleMentionNames(
      database: database,
      guildId: guildId,
      content: content,
    ),
    channelNames: await resolveMessageChannelMentionNames(
      database: database,
      content: content,
    ),
  );
  return DesktopMessageNotificationContent(
    title: title.title,
    subtitle: title.subtitle,
    body: body,
    guildId: guildId,
    avatarUrl: await _resolveAvatarUrl(
      database: database,
      message: message,
      guildId: guildId,
    ),
  );
}

Future<String?> _resolveAvatarUrl({
  required db.FluxerDatabase database,
  required Message message,
  required String? guildId,
}) async {
  if (guildId != null) {
    final db.Member? member = await database.memberDao.getMemberByUserId(
      message.authorId,
      guildId,
    );
    final String? serverAvatar = member?.serverAvatar;
    if (serverAvatar != null && serverAvatar.isNotEmpty) {
      return resolveGuildMemberAvatarUrl(
        guildId: guildId,
        userId: message.authorId,
        memberAvatar: serverAvatar,
        userAvatarHash: message.authorAvatar,
      );
    }
  }
  return FluxerMediaUrl.userAvatar(
        userId: message.authorId,
        hash: message.authorAvatar,
      ) ??
      FluxerMediaUrl.defaultAvatar(userId: message.authorId);
}
