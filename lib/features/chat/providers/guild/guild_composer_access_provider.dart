import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
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
AsyncValue<GuildComposerAccess> guildComposerAccess(Ref ref, String channelId) {
  if (channelId.isEmpty) {
    return const AsyncData<GuildComposerAccess>(GuildComposerAccess.allowed);
  }
  final bool isDmChannel = ref.watch(
    dmViewModelProvider.select(
      (state) => findDmById(state.conversations, channelId) != null,
    ),
  );
  if (isDmChannel) {
    return const AsyncData<GuildComposerAccess>(GuildComposerAccess.allowed);
  }
  final String? currentUserId = ref.watch(currentUserIdProvider);
  if (currentUserId == null ||
      currentUserId.isEmpty ||
      isPersonalNotesChannelRoute(
        channelId: channelId,
        currentUserId: currentUserId,
      )) {
    return const AsyncData<GuildComposerAccess>(GuildComposerAccess.allowed);
  }
  final String? listedGuildId = ref.watch(
    channelListViewModelProvider.select(
      (ChannelListState state) => findChannelById(state, channelId)?.guildId,
    ),
  );
  final AsyncValue<String?> guildId = listedGuildId != null
      ? AsyncData<String?>(listedGuildId)
      : ref.watch(channelGuildIdProvider(channelId));
  if (!guildId.hasValue && !guildId.hasError) {
    return const AsyncLoading<GuildComposerAccess>();
  }
  final String? resolvedGuildId = guildId.value;
  if (resolvedGuildId == null || resolvedGuildId.isEmpty) {
    return const AsyncData<GuildComposerAccess>(GuildComposerAccess.allowed);
  }
  return ref.watch(guildMemberComposerAccessProvider(resolvedGuildId));
}

@riverpod
Future<GuildComposerAccess> guildMemberComposerAccess(
  Ref ref,
  String guildId,
) async {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  if (currentUserId == null || currentUserId.isEmpty) {
    return GuildComposerAccess.allowed;
  }
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
      hasVerifiedEmail: userSettings.isClaimed,
      isEmailVerified: userSettings.isVerified,
      accountCreatedAt: userSettings.resolvedMemberSince,
      now: DateTime.now(),
    ),
  );
}
