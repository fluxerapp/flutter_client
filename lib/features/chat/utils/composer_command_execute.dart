import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/composer_command.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';

enum ComposerCommandDispatch { sendChannel, executed, blocked }

ComposerCommandDispatch composerCommandDispatchKind(ComposerCommand command) {
  return switch (command) {
    ComposerMeCommand() ||
    ComposerSpoilerCommand() ||
    ComposerTtsCommand() ||
    ComposerContentSend() ||
    ComposerReplaceCommand() => ComposerCommandDispatch.sendChannel,
    ComposerMediaSearchCommand() => ComposerCommandDispatch.blocked,
    ComposerNickCommand() ||
    ComposerKickCommand() ||
    ComposerBanCommand() ||
    ComposerMsgCommand() => ComposerCommandDispatch.executed,
  };
}

Future<void> executeComposerSideEffect({
  required WidgetRef ref,
  required ComposerCommand command,
  required String channelId,
  required String? guildId,
  required FluxerLocalizations l10n,
}) async {
  switch (command) {
    case ComposerNickCommand(:final String nickname):
      if (guildId == null || guildId.isEmpty) {
        return;
      }
      await _executeNick(
        ref: ref,
        guildId: guildId,
        channelId: channelId,
        nickname: nickname,
        l10n: l10n,
      );
    case ComposerKickCommand(:final String userId):
      if (guildId == null || guildId.isEmpty) {
        return;
      }
      await ref
          .read(fluxerClientProvider)
          .guilds
          .removeGuildMember(guildId: guildId, userId: userId);
    case ComposerBanCommand(
      :final String userId,
      :final int deleteMessageDays,
      :final String? reason,
    ):
      if (guildId == null || guildId.isEmpty) {
        return;
      }
      await ref
          .read(fluxerClientProvider)
          .guilds
          .banGuildMember(
            guildId: guildId,
            userId: userId,
            body: GuildBanCreateRequest(
              deleteMessageDays: deleteMessageDays,
              reason: reason,
              banDurationSeconds: 0,
            ),
          );
    case ComposerMsgCommand(:final String userId, :final String message):
      await _executeMsg(
        ref: ref,
        channelId: channelId,
        userId: userId,
        message: message,
        l10n: l10n,
      );
    default:
      break;
  }
}

Future<void> _executeNick({
  required WidgetRef ref,
  required String guildId,
  required String channelId,
  required String nickname,
  required FluxerLocalizations l10n,
}) async {
  final String? currentUserId = ref.read(currentUserIdProvider);
  String previous = l10n.composerCommandUnknownUser;
  String fallback = previous;
  if (currentUserId != null) {
    final GuildUserDisplay? display = ref
        .read(guildUserDisplayFromDbProvider((currentUserId, guildId)))
        .value;
    if (display != null) {
      fallback = display.accountDisplayName;
      previous = display.displayName;
    }
  }
  await ref
      .read(fluxerClientProvider)
      .guilds
      .updateCurrentGuildMember(
        guildId: guildId,
        body: MyGuildMemberUpdateRequest(
          nick: nickname.isEmpty ? null : nickname,
        ),
      );
  final String nextName = nickname.isEmpty ? fallback : nickname;
  ref
      .read(chatViewModelProvider.notifier)
      .insertClientSystemMessage(
        l10n.composerCommandNicknameChanged(previous, nextName),
      );
}

Future<void> _executeMsg({
  required WidgetRef ref,
  required String channelId,
  required String userId,
  required String message,
  required FluxerLocalizations l10n,
}) async {
  try {
    final String dmChannelId = await ref
        .read(dmRepositoryProvider)
        .ensureDmChannel(userId);
    await ref
        .read(messageRepositoryProvider)
        .sendMessage(channelId: dmChannelId, content: message);
    navigateToContentVia(ref, RoutePaths.dmChannel(dmChannelId));
  } on Object catch (error, st) {
    talker.error('[ComposerCommand] /msg failed', error, st);
    String username = userId;
    for (final guild in ref.read(guildListViewModelProvider).guilds) {
      final GuildUserDisplay? display = ref
          .read(guildUserDisplayFromDbProvider((userId, guild.id)))
          .value;
      if (display != null) {
        username = display.displayName;
        break;
      }
    }
    ref
        .read(chatViewModelProvider.notifier)
        .insertClientSystemMessage(l10n.composerCommandMsgFailed(username));
  }
}
