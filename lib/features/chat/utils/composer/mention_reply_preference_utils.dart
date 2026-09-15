import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_dart/export.dart';

enum ReplyMentionPreferenceConflict { prefersMention, prefersNoMention }

MentionReplyPreferences resolveMentionReplyPreference({
  required MentionReplyPreferences? memberMentionFlags,
  required MentionReplyPreferences? userMentionFlags,
}) {
  if (memberMentionFlags != null &&
      memberMentionFlags != MentionReplyPreferences.noPreference) {
    return memberMentionFlags;
  }
  return userMentionFlags ?? MentionReplyPreferences.noPreference;
}

ReplyMentionPreferenceConflict? getReplyMentionPreferenceConflict({
  required bool mentioning,
  required MentionReplyPreferences preference,
}) {
  if (!mentioning && preference == MentionReplyPreferences.preferMention) {
    return ReplyMentionPreferenceConflict.prefersMention;
  }
  if (mentioning && preference == MentionReplyPreferences.preferNoMention) {
    return ReplyMentionPreferenceConflict.prefersNoMention;
  }
  return null;
}

bool getDefaultReplyMention({
  required bool isOwnMessage,
  required String? guildId,
  required MentionReplyPreferences preference,
  bool fallbackMention = true,
}) {
  if (isOwnMessage || guildId == null || guildId.isEmpty) {
    return false;
  }
  if (preference == MentionReplyPreferences.preferMention) {
    return true;
  }
  if (preference == MentionReplyPreferences.preferNoMention) {
    return false;
  }
  return fallbackMention;
}

MentionReplyPreferences? mentionFlagsFromDb(int? value) {
  if (value == null) {
    return null;
  }
  return MentionReplyPreferences.fromJson(value);
}

Future<MentionReplyPreferences> resolveMentionReplyPreferenceFromDb({
  required db.FluxerDatabase database,
  required String authorId,
  required String? guildId,
}) async {
  MentionReplyPreferences? memberMentionFlags;
  if (guildId != null && guildId.isNotEmpty) {
    final db.Member? member = await database.memberDao.getMemberByUserId(
      authorId,
      guildId,
    );
    memberMentionFlags = mentionFlagsFromDb(member?.mentionFlags);
  }
  final db.User? user = await database.userDao.getUserById(authorId);
  final MentionReplyPreferences? userMentionFlags = mentionFlagsFromDb(
    user?.mentionFlags,
  );
  return resolveMentionReplyPreference(
    memberMentionFlags: memberMentionFlags,
    userMentionFlags: userMentionFlags,
  );
}
