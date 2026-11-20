import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_composer_access_provider.g.dart';

const Duration _kComposerAccessExpirySlack = Duration(milliseconds: 250);

@riverpod
AsyncValue<GuildComposerAccess> guildComposerAccess(Ref ref, String channelId) {
  if (channelId.isEmpty) {
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
  if (ref.watch(
    userSettingsViewModelProvider.select(
      (UserSettingsViewState state) => state.accountLimited,
    ),
  )) {
    return const AsyncData<GuildComposerAccess>(
      GuildComposerAccess(
        canAccess: false,
        reason: GuildComposerBlockReason.accountLimited,
      ),
    );
  }
  final bool isDmChannel = ref.watch(
    dmViewModelProvider.select(
      (state) => findDmById(state.conversations, channelId) != null,
    ),
  );
  if (isDmChannel) {
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
  final Guild? guild = ref.watch(
    guildListViewModelProvider.select((GuildListViewState state) {
      for (final Guild g in state.guilds) {
        if (g.id == guildId) {
          return g;
        }
      }
      return null;
    }),
  );
  final ({
    bool isProfileLoaded,
    bool isClaimed,
    bool isVerified,
    DateTime memberSince,
  })
  userSettings = ref.watch(
    userSettingsViewModelProvider.select(
      (UserSettingsViewState state) => (
        isProfileLoaded: state.isProfileLoaded,
        isClaimed: state.isClaimed,
        isVerified: state.isVerified,
        memberSince: state.resolvedMemberSince,
      ),
    ),
  );
  if (guild == null) {
    return GuildComposerAccess.allowed;
  }
  final db.Member? memberRow = await ref.watch(
    memberRowByGuildProvider((currentUserId, guildId)).future,
  );
  if (!userSettings.isProfileLoaded) {
    return GuildComposerAccess.allowed;
  }
  final CurrentUserMemberIdentity? memberIdentity = await ref.watch(
    currentUserMemberIdentityProvider(guildId).future,
  );
  final GuildComposerAccess access = evaluateGuildComposerAccess(
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
      accountCreatedAt: userSettings.memberSince,
      now: DateTime.now(),
    ),
  );
  final Duration? remaining = access.timeRemaining;
  if (remaining != null && remaining > Duration.zero) {
    final Timer expiry = Timer(
      remaining + _kComposerAccessExpirySlack,
      ref.invalidateSelf,
    );
    ref.onDispose(expiry.cancel);
  }
  return access;
}
