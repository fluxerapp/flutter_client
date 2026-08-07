import 'package:fluxer_app/features/chat/utils/message_content_stripper.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const int kTtsMaxSpeakLength = 5000;

typedef TtsUserMentionResolver = String? Function(String userId);
typedef TtsRoleMentionResolver = String? Function(String roleId);
typedef TtsChannelMentionResolver = String? Function(String channelId);

String truncateTtsText(String text) {
  if (text.length <= kTtsMaxSpeakLength) {
    return text;
  }
  return '${text.substring(0, kTtsMaxSpeakLength - 3)}...';
}

String formatMessageContentForTts({
  required String content,
  required FluxerLocalizations l10n,
  TtsUserMentionResolver? resolveUser,
  TtsRoleMentionResolver? resolveRole,
  TtsChannelMentionResolver? resolveChannel,
}) {
  var formatted = content;
  formatted = formatted.replaceAll(
    MessageContentPatterns.fencedCodeBlockWhole,
    ' ${l10n.ttsSubstitutionCodeBlock} ',
  );
  formatted = formatted.replaceAll(
    MessageContentPatterns.spoiler,
    l10n.ttsSubstitutionSpoiler,
  );
  formatted = formatted.replaceAllMapped(MessageContentPatterns.userMention, (
    match,
  ) {
    final String userId = match.group(1)!;
    return resolveUser?.call(userId) ?? l10n.ttsSubstitutionUnknownUser;
  });
  formatted = formatted.replaceAllMapped(MessageContentPatterns.roleMention, (
    match,
  ) {
    final String roleId = match.group(1)!;
    return resolveRole?.call(roleId) ?? l10n.ttsSubstitutionUnknownRole;
  });
  formatted = formatted.replaceAllMapped(
    MessageContentPatterns.channelMention,
    (match) {
      final String channelId = match.group(1)!;
      return resolveChannel?.call(channelId) ??
          l10n.ttsSubstitutionUnknownChannel;
    },
  );
  formatted = formatted.replaceAllMapped(MessageContentPatterns.customEmoji, (
    match,
  ) {
    final String emojiName = match.group(1)!;
    return l10n.ttsSubstitutionEmoji(emojiName);
  });
  formatted = formatted.replaceAllMapped(MessageContentPatterns.slashCommand, (
    match,
  ) {
    final String commandName = match.group(1)!;
    return l10n.ttsSubstitutionSlashCommand(commandName);
  });
  formatted = formatted.replaceAllMapped(MessageContentPatterns.timestamp, (
    match,
  ) {
    final int seconds = int.tryParse(match.group(1)!) ?? 0;
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      seconds * 1000,
      isUtc: true,
    ).toLocal();
    return _formatTimestampForTts(dateTime);
  });
  formatted = stripMessageInlineCode(formatted);
  formatted = stripMessageMarkdownLinks(formatted);
  return stripMessageStructuralMarkdown(formatted);
}

String formatMessageForTts({
  required String content,
  required String authorName,
  required FluxerLocalizations l10n,
  String? replyAuthorName,
  TtsUserMentionResolver? resolveUser,
  TtsRoleMentionResolver? resolveRole,
  TtsChannelMentionResolver? resolveChannel,
}) {
  final String formatted = formatMessageContentForTts(
    content: content,
    l10n: l10n,
    resolveUser: resolveUser,
    resolveRole: resolveRole,
    resolveChannel: resolveChannel,
  );
  if (replyAuthorName != null && replyAuthorName.isNotEmpty) {
    return l10n.ttsReplyingToSaid(replyAuthorName, authorName, formatted);
  }
  return l10n.ttsAuthorSaid(authorName, formatted);
}

String _formatTimestampForTts(DateTime dateTime) {
  String two(int value) => value.toString().padLeft(2, '0');
  return '${dateTime.year}-${two(dateTime.month)}-${two(dateTime.day)} '
      '${two(dateTime.hour)}:${two(dateTime.minute)}';
}
