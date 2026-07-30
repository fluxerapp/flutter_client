import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';

bool canCreateGuildExpressions(int permissions) {
  return hasPermission(permissions, Permission.createExpressions);
}

bool canManageGuildExpressions(int permissions) {
  return hasPermission(permissions, Permission.manageExpressions);
}

bool canModifyGuildEmoji({
  required GuildEmojiSettingsEntry emoji,
  required int permissions,
  required String? currentUserId,
}) {
  if (canManageGuildExpressions(permissions)) {
    return true;
  }
  if (!canCreateGuildExpressions(permissions)) {
    return false;
  }
  return currentUserId != null && emoji.uploader.id == currentUserId;
}

bool canModifyGuildSticker({
  required GuildStickerSettingsEntry sticker,
  required int permissions,
  required String? currentUserId,
}) {
  if (canManageGuildExpressions(permissions)) {
    return true;
  }
  if (!canCreateGuildExpressions(permissions)) {
    return false;
  }
  return currentUserId != null && sticker.uploader.id == currentUserId;
}

bool canManageGuildCloneSettings(int permissions) {
  return hasPermission(permissions, Permission.manageGuild);
}

bool canPurgeGuildExpressions(List<String> features) {
  return hasGuildFeature(features, GuildFeatures.expressionPurgeAllowed);
}
