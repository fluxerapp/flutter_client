import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_composer_access_provider.g.dart';

@riverpod
Future<GuildComposerAccess> guildComposerAccess(
  Ref ref,
  String channelId,
) async {
  if (channelId.isEmpty) {
    return GuildComposerAccess.allowed;
  }
  final bool isDmChannel = ref.watch(
    dmViewModelProvider.select(
      (state) => findDmById(state.conversations, channelId) != null,
    ),
  );
  if (isDmChannel) {
    return GuildComposerAccess.allowed;
  }
  final String? currentUserId = ref.watch(currentUserIdProvider);
  if (currentUserId == null || currentUserId.isEmpty) {
    return GuildComposerAccess.allowed;
  }
  if (isPersonalNotesChannelRoute(
    channelId: channelId,
    currentUserId: currentUserId,
  )) {
    return GuildComposerAccess.allowed;
  }
  final dmRow = await ref
      .read(fluxerDatabaseProvider)
      .dmChannelDao
      .getDmChannelById(channelId);
  if (dmRow != null && isDmPersonalNotesType(dmRow.type)) {
    return GuildComposerAccess.allowed;
  }
  final channelRow = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (channelRow == null) {
    return GuildComposerAccess.allowed;
  }
  final Channel channel = Channel.fromRow(channelRow);
  if (channel.guildId.isEmpty) {
    return GuildComposerAccess.allowed;
  }
  final String guildId = channel.guildId;
  ref
    ..watch(guildListViewModelProvider)
    ..watch(userSettingsViewModelProvider)
    ..watch(currentUserMemberIdentityProvider(guildId));
  Guild? guild;
  for (final Guild g in ref.watch(guildListViewModelProvider).guilds) {
    if (g.id == guildId) {
      guild = g;
      break;
    }
  }
  if (guild == null) {
    return GuildComposerAccess.allowed;
  }
  final db = ref.read(fluxerDatabaseProvider);
  final memberRow = await db.memberDao.getMemberByUserId(
    currentUserId,
    guildId,
  );
  final UserSettingsViewState userSettings = ref.read(
    userSettingsViewModelProvider,
  );
  if (!userSettings.isProfileLoaded) {
    return GuildComposerAccess.allowed;
  }
  final CurrentUserMemberIdentity? memberIdentity = await ref.watch(
    currentUserMemberIdentityProvider(guildId).future,
  );
  return evaluateGuildComposerAccess(
    GuildVerificationInput(
      currentUserId: currentUserId,
      guildOwnerId: guild.ownerId,
      isSendDisabled: guild.isSendDisabled,
      verificationLevel: guild.verificationLevel,
      isDiscoverable: guild.isDiscoverable,
      communicationDisabledUntil: memberRow?.communicationDisabledUntil,
      memberRoleIdsJson: memberIdentity?.roleIdsJson,
      memberJoinedAt: memberRow?.joinedAt,
      hasVerifiedEmail: userSettings.hasVerifiedEmail,
      isEmailVerified: userSettings.verified,
      accountCreatedAt: userSettings.resolvedMemberSince,
      hasVerifiedPhone: userSettings.hasVerifiedPhone,
      now: DateTime.now(),
    ),
  );
}
