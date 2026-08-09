import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/message_content_stripper.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts.dart';
import 'package:fluxer_app/features/voice/tts/tts_should_speak.dart';
import 'package:fluxer_app/features/voice/tts/tts_text_formatter.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';

const int kTtsRecentMessageIdCapacity = 10;

class TtsRecentMessageDeduper {
  TtsRecentMessageDeduper({this.capacity = kTtsRecentMessageIdCapacity});

  final int capacity;
  final List<String> _order = <String>[];
  final Set<String> _ids = <String>{};

  bool contains(String messageId) => _ids.contains(messageId);

  void mark(String messageId) {
    if (_ids.contains(messageId)) {
      return;
    }
    _ids.add(messageId);
    _order.add(messageId);
    while (_order.length > capacity) {
      final String removed = _order.removeAt(0);
      _ids.remove(removed);
    }
  }
}

class TtsIncomingMessageContext {
  const TtsIncomingMessageContext({
    required this.message,
    required this.currentUserId,
    required this.blockedUserIds,
    required this.activeChannelId,
    required this.enableTtsCommand,
    required this.ttsRate,
    required this.ttsNotificationMode,
    required this.locale,
    required this.l10n,
    required this.deduper,
  });

  final Message message;
  final String currentUserId;
  final Set<String> blockedUserIds;
  final String? activeChannelId;
  final bool enableTtsCommand;
  final double ttsRate;
  final TtsNotificationMode ttsNotificationMode;
  final String? locale;
  final FluxerLocalizations l10n;
  final TtsRecentMessageDeduper deduper;
}

bool passesIncomingTtsCheapGate(TtsIncomingMessageContext context) {
  final Message message = context.message;
  if (!shouldSpeakIncomingMessage(
    mode: context.ttsNotificationMode,
    enableTtsCommand: context.enableTtsCommand,
    isExplicitTts: message.tts,
    isSelf: message.authorId == context.currentUserId,
    isSystemMessage: message.isSystemMessage,
    messageChannelId: message.channelId,
    activeChannelId: context.activeChannelId,
  )) {
    return false;
  }
  if (context.deduper.contains(message.id)) {
    return false;
  }
  if (context.blockedUserIds.contains(message.authorId)) {
    return false;
  }
  return true;
}

Future<bool> isIncomingTtsMuted({
  required db.FluxerDatabase database,
  required String channelId,
}) async {
  final DateTime now = DateTime.now();
  final db.Channel? guildChannel = await database.channelDao.getChannelById(
    channelId,
  );
  if (guildChannel != null) {
    final UserGuildSettingsResponse? guildSettings = await _loadGuildSettings(
      database: database,
      guildStorageId: guildChannel.guildId,
    );
    return isGuildOrCategoryOrChannelMuted(
      channel: guildChannel,
      guildSettings: guildSettings,
      now: now,
    );
  }
  final db.DmChannel? dmChannel = await database.dmChannelDao.getDmChannelById(
    channelId,
  );
  if (dmChannel == null) {
    return true;
  }
  final UserGuildSettingsResponse? guildSettings = await _loadGuildSettings(
    database: database,
    guildStorageId: '@me',
  );
  return isChannelOverrideMuted(
    guildSettings?.channelOverrides?[channelId],
    now: now,
  );
}

Future<String?> buildIncomingTtsText({
  required TtsIncomingMessageContext context,
  required db.FluxerDatabase database,
}) async {
  final Message message = context.message;
  final FluxerLocalizations l10n = context.l10n;
  final db.Channel? channel = await database.channelDao.getChannelById(
    message.channelId,
  );
  final String? guildId = channel?.guildId;

  if (!message.isUserMessage) {
    final String authorName = await _resolveUserDisplayName(
      database: database,
      userId: message.authorId,
      guildId: guildId,
      fallbackDisplayName: message.authorName,
    );
    return stringifySystemMessage(
      l10n: l10n,
      message: message,
      authorName: authorName,
      currentUserId: context.currentUserId,
    );
  }

  final String authorName = await _resolveUserDisplayName(
    database: database,
    userId: message.authorId,
    guildId: guildId,
    fallbackDisplayName: message.authorName,
  );
  final String content = message.speakableContent;
  if (content.trim().isEmpty) {
    final String? description = _describeNonTextContent(message, l10n);
    if (description == null) {
      return null;
    }
    return l10n.ttsAuthorDescription(authorName, description);
  }

  String? replyAuthorName;
  if (message.replyToId != null) {
    final db.Message? replyRow = await database.messageDao.getMessage(
      message.replyToId!,
    );
    if (replyRow != null) {
      replyAuthorName = await _resolveUserDisplayName(
        database: database,
        userId: replyRow.authorId,
        guildId: guildId,
        fallbackDisplayName: replyRow.authorName,
      );
    }
  }

  final Map<String, String> userNames = await _resolveUserMentions(
    database: database,
    guildId: guildId,
    content: content,
  );
  final Map<String, String> channelNames = await _resolveChannelMentions(
    database: database,
    content: content,
  );
  final Map<String, String> roleNames = await _resolveRoleMentions(
    database: database,
    guildId: guildId,
    content: content,
  );

  return formatMessageForTts(
    content: content,
    authorName: authorName,
    l10n: l10n,
    replyAuthorName: replyAuthorName,
    resolveUser: (String userId) => userNames[userId],
    resolveRole: (String roleId) => roleNames[roleId],
    resolveChannel: (String channelId) => channelNames[channelId],
  );
}

Future<void> handleIncomingTtsMessage({
  required TtsIncomingMessageContext context,
  required db.FluxerDatabase database,
  required FluxerTts tts,
}) async {
  if (!passesIncomingTtsCheapGate(context)) {
    return;
  }
  if (!await tts.isSupported()) {
    return;
  }
  if (await isIncomingTtsMuted(
    database: database,
    channelId: context.message.channelId,
  )) {
    return;
  }

  final String? text = await buildIncomingTtsText(
    context: context,
    database: database,
  );
  if (text == null || text.trim().isEmpty) {
    return;
  }

  context.deduper.mark(context.message.id);
  await tts.speak(
    text: text,
    rate: context.ttsRate,
    locale: context.locale,
    target: FluxerTtsSpeakingTarget(
      messageId: context.message.id,
      channelId: context.message.channelId,
    ),
  );
}

String? _describeNonTextContent(Message message, FluxerLocalizations l10n) {
  if (message.stickers.isNotEmpty) {
    return l10n.ttsSentSticker;
  }
  if (message.attachments.isNotEmpty) {
    final int count = message.attachments.length;
    return count == 1 ? l10n.ttsSentAttachment : l10n.ttsSentAttachments(count);
  }
  if (message.embeds.isNotEmpty) {
    return l10n.ttsSentEmbed;
  }
  return null;
}

Future<UserGuildSettingsResponse?> _loadGuildSettings({
  required db.FluxerDatabase database,
  required String guildStorageId,
}) async {
  final row = await database.userGuildSettingsDao.getByGuildId(guildStorageId);
  if (row == null) {
    return null;
  }
  return decodeUserGuildSettings(row.data);
}

Future<String> _resolveUserDisplayName({
  required db.FluxerDatabase database,
  required String userId,
  required String? guildId,
  String? fallbackDisplayName,
}) async {
  final db.User? user = await database.userDao.getUserById(userId);
  db.Member? member;
  if (guildId != null && guildId.isNotEmpty) {
    member = await database.memberDao.getMemberByUserId(userId, guildId);
  }
  final String? friendNickname =
      (await database.relationshipDao.getRelationship(userId))?.nickname;
  final String? userUsername = user?.username.trim();
  final String? fallback = fallbackDisplayName?.trim();
  final String username = (userUsername != null && userUsername.isNotEmpty)
      ? userUsername
      : (fallback != null && fallback.isNotEmpty ? fallback : userId);
  return resolveDisplayName(
    username: username,
    guildNickname: member?.nick,
    friendNickname: friendNickname,
    fallbackDisplayName: fallbackDisplayName,
    globalName: user?.globalName,
  );
}

Future<Map<String, String>> _resolveUserMentions({
  required db.FluxerDatabase database,
  required String? guildId,
  required String content,
}) async {
  final Map<String, String> names = <String, String>{};
  for (final RegExpMatch match in MessageContentPatterns.userMention.allMatches(
    content,
  )) {
    final String userId = match.group(1)!;
    if (names.containsKey(userId)) {
      continue;
    }
    names[userId] = await _resolveUserDisplayName(
      database: database,
      userId: userId,
      guildId: guildId,
    );
  }
  return names;
}

Future<Map<String, String>> _resolveChannelMentions({
  required db.FluxerDatabase database,
  required String content,
}) async {
  final Map<String, String> names = <String, String>{};
  for (final RegExpMatch match
      in MessageContentPatterns.channelMention.allMatches(content)) {
    final String channelId = match.group(1)!;
    if (names.containsKey(channelId)) {
      continue;
    }
    final db.Channel? channel = await database.channelDao.getChannelById(
      channelId,
    );
    final String name = channel?.name.trim() ?? '';
    if (name.isNotEmpty) {
      names[channelId] = name;
    }
  }
  return names;
}

Future<Map<String, String>> _resolveRoleMentions({
  required db.FluxerDatabase database,
  required String? guildId,
  required String content,
}) async {
  final Map<String, String> names = <String, String>{};
  if (guildId == null || guildId.isEmpty) {
    return names;
  }
  for (final RegExpMatch match in MessageContentPatterns.roleMention.allMatches(
    content,
  )) {
    final String roleId = match.group(1)!;
    if (names.containsKey(roleId)) {
      continue;
    }
    final db.Role? role = await database.roleDao.getRoleById(roleId);
    final String name = role?.name.trim() ?? '';
    if (name.isNotEmpty) {
      names[roleId] = name;
    }
  }
  return names;
}
