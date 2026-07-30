import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_permissions.dart';

void main() {
  const GuildExpressionUploader ownerUploader = GuildExpressionUploader(
    id: 'user-1',
    username: 'owner',
  );
  const GuildExpressionUploader otherUploader = GuildExpressionUploader(
    id: 'user-2',
    username: 'other',
  );
  const GuildEmojiSettingsEntry emoji = GuildEmojiSettingsEntry(
    id: '1',
    name: 'wave',
    animated: false,
    uploader: ownerUploader,
  );
  const GuildStickerSettingsEntry sticker = GuildStickerSettingsEntry(
    id: '1',
    name: 'wave',
    description: 'waves',
    tags: <String>['wave'],
    animated: false,
    uploader: ownerUploader,
  );

  test('manage expressions can modify any emoji or sticker', () {
    final int permissions = Permission.manageExpressions.value;
    expect(
      canModifyGuildEmoji(
        emoji: emoji,
        permissions: permissions,
        currentUserId: 'user-2',
      ),
      isTrue,
    );
    expect(
      canModifyGuildSticker(
        sticker: sticker,
        permissions: permissions,
        currentUserId: 'user-2',
      ),
      isTrue,
    );
  });

  test('create expressions can modify own expressions only', () {
    final int permissions = Permission.createExpressions.value;
    expect(
      canModifyGuildEmoji(
        emoji: emoji,
        permissions: permissions,
        currentUserId: 'user-1',
      ),
      isTrue,
    );
    expect(
      canModifyGuildEmoji(
        emoji: emoji,
        permissions: permissions,
        currentUserId: 'user-2',
      ),
      isFalse,
    );
    expect(
      canModifyGuildSticker(
        sticker: sticker,
        permissions: permissions,
        currentUserId: 'user-1',
      ),
      isTrue,
    );
    expect(
      canModifyGuildSticker(
        sticker: sticker,
        permissions: permissions,
        currentUserId: null,
      ),
      isFalse,
    );
  });

  test('clone settings require manage guild permission', () {
    expect(canManageGuildCloneSettings(Permission.manageGuild.value), isTrue);
    expect(
      canManageGuildCloneSettings(Permission.createExpressions.value),
      isFalse,
    );
  });

  test('purge requires expression purge guild feature', () {
    expect(
      canPurgeGuildExpressions(const <String>[
        GuildFeatures.expressionPurgeAllowed,
      ]),
      isTrue,
    );
    expect(canPurgeGuildExpressions(const <String>[]), isFalse);
  });
}
