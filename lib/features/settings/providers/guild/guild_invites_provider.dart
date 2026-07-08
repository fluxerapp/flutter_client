import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invites_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_invites_provider.g.dart';

@riverpod
class GuildInvites extends _$GuildInvites {
  @override
  Future<GuildInvitesState> build(String guildId) {
    return _loadState();
  }

  Future<void> reload() async {
    state = const AsyncLoading<GuildInvitesState>();
    state = AsyncData<GuildInvitesState>(await _loadState());
  }

  Future<void> revokeInvite(String code) async {
    final GuildInvitesState? current = state.value;
    if (current == null || current.revokingCode != null) {
      return;
    }
    state = AsyncData<GuildInvitesState>(current.copyWith(revokingCode: code));
    try {
      await ref.read(guildSettingsRepositoryProvider).deleteInvite(code);
      final List<GuildInviteEntry> updatedInvites = current.invites
          .where((GuildInviteEntry entry) => entry.code != code)
          .toList();
      state = AsyncData<GuildInvitesState>(
        current.copyWith(invites: updatedInvites, clearRevokingCode: true),
      );
    } on Object {
      state = AsyncData<GuildInvitesState>(
        current.copyWith(clearRevokingCode: true),
      );
      rethrow;
    }
  }

  Future<void> toggleInvitesDisabled({
    required List<String> currentFeatures,
    required bool disableInvites,
  }) async {
    final List<String> updatedFeatures = setGuildFeatureEnabled(
      features: currentFeatures,
      feature: GuildFeatures.invitesDisabled,
      enabled: disableInvites,
    );
    final List<String>? featuresUpdate = buildGuildFeaturesUpdate(
      original: currentFeatures,
      updated: updatedFeatures,
    );
    if (featuresUpdate == null) {
      return;
    }
    await ref
        .read(guildSettingsRepositoryProvider)
        .updateGuild(
          guildId: guildId,
          body: GuildUpdateRequest(features: featuresUpdate),
        );
    await ref.read(guildRepositoryProvider).getServer(guildId);
    ref.invalidate(guildByIdProvider(guildId));
  }

  Future<GuildInvitesState> _loadState() async {
    try {
      final List<InviteMetadataResponseSchema> response = await ref
          .read(guildSettingsRepositoryProvider)
          .listGuildInvites(guildId);
      final List<GuildInviteEntry> invites = response
          .map(GuildInviteEntry.fromResponse)
          .toList();
      return GuildInvitesState(
        loadStatus: GuildInvitesLoadStatus.success,
        invites: invites,
      );
    } on Object {
      return const GuildInvitesState(
        loadStatus: GuildInvitesLoadStatus.error,
        invites: <GuildInviteEntry>[],
      );
    }
  }
}
