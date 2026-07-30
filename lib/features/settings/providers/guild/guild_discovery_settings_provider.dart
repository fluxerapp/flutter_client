import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_application.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_settings_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_discovery_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_discovery_settings_provider.g.dart';

@riverpod
class GuildDiscoverySettings extends _$GuildDiscoverySettings {
  @override
  Future<GuildDiscoverySettingsState> build(String guildId) {
    return _loadState();
  }

  Future<void> reload() async {
    state = const AsyncLoading<GuildDiscoverySettingsState>();
    state = AsyncData<GuildDiscoverySettingsState>(await _loadState());
  }

  Future<GuildDiscoveryApplication?> submit({
    required String description,
    required int categoryType,
    required String primaryLanguage,
    required List<String> customTags,
  }) async {
    final GuildDiscoverySettingsState? current = state.value;
    if (current == null || current.isSubmitting) {
      return null;
    }
    final GuildDiscoveryApplicationRequest request =
        GuildDiscoveryApplicationRequest(
          description: description,
          categoryType: categoryType,
          primaryLanguage: primaryLanguage,
          customTags: customTags,
        );
    state = AsyncData<GuildDiscoverySettingsState>(
      current.copyWith(isSubmitting: true),
    );
    try {
      final GuildDiscoveryApplication application = current.hasActiveApplication
          ? await ref
                .read(guildDiscoveryRepositoryProvider)
                .update(guildId: guildId, request: request)
          : await ref
                .read(guildDiscoveryRepositoryProvider)
                .apply(guildId: guildId, request: request);
      final GuildDiscoverySettingsState updated =
          GuildDiscoverySettingsState.fromStatus(
            GuildDiscoveryStatus(
              eligible: current.eligible,
              minMemberCount: current.minMemberCount,
              application: application,
            ),
          );
      state = AsyncData<GuildDiscoverySettingsState>(
        updated.copyWith(isSubmitting: false),
      );
      await ref.read(guildRepositoryProvider).getServer(guildId);
      ref.invalidate(guildByIdProvider(guildId));
      return application;
    } on Object {
      state = AsyncData<GuildDiscoverySettingsState>(
        current.copyWith(isSubmitting: false),
      );
      rethrow;
    }
  }

  Future<void> withdraw() async {
    final GuildDiscoverySettingsState? current = state.value;
    if (current == null || current.isWithdrawing) {
      return;
    }
    state = AsyncData<GuildDiscoverySettingsState>(
      current.copyWith(isWithdrawing: true),
    );
    try {
      await ref.read(guildDiscoveryRepositoryProvider).withdraw(guildId);
      state = AsyncData<GuildDiscoverySettingsState>(
        GuildDiscoverySettingsState.fromStatus(
          GuildDiscoveryStatus(
            eligible: current.eligible,
            minMemberCount: current.minMemberCount,
          ),
        ),
      );
      await ref.read(guildRepositoryProvider).getServer(guildId);
      ref.invalidate(guildByIdProvider(guildId));
    } on Object {
      state = AsyncData<GuildDiscoverySettingsState>(
        current.copyWith(isWithdrawing: false),
      );
      rethrow;
    }
  }

  Future<GuildDiscoverySettingsState> _loadState() async {
    try {
      final GuildDiscoveryStatus status = await ref
          .read(guildDiscoveryRepositoryProvider)
          .getStatus(guildId);
      return GuildDiscoverySettingsState.fromStatus(status);
    } on Object {
      return GuildDiscoverySettingsState.loading.copyWith(
        loadStatus: GuildDiscoveryLoadStatus.error,
      );
    }
  }
}
