import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/data/guild_settings_converters.dart';
import 'package:fluxer_app/features/settings/data/guild_settings_repository.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_settings_tab_providers.g.dart';

@riverpod
Future<List<Channel>> guildSettingsChannels(Ref ref, String guildId) async {
  final ChannelRepository repository = ref.read(channelRepositoryProvider);
  final List<ChannelCategory> categories = await repository.getChannels(
    guildId,
  );
  final List<Channel> channels = <Channel>[];
  for (final ChannelCategory category in categories) {
    if (!category.isUncategorized) {
      channels.add(
        Channel(
          id: category.id,
          guildId: guildId,
          name: category.name,
          type: ChannelType.guildCategory,
        ),
      );
    }
    channels.addAll(category.channels);
  }
  return channels;
}

@riverpod
Future<GuildSettingsDetails> guildSettingsOverview(
  Ref ref,
  String guildId,
) async {
  final GuildSettingsRepository repository = ref.read(
    guildSettingsRepositoryProvider,
  );
  final Guild guild = await ref
      .read(guildRepositoryProvider)
      .getServer(guildId);
  final GuildResponse response = await repository.getGuildDetails(guildId);
  return guildSettingsDetailsFromSdk(response, guild);
}

@riverpod
class GuildSettingsOverviewActions extends _$GuildSettingsOverviewActions {
  @override
  FutureOr<void> build(String guildId) {}

  Future<void> updateGuild(GuildUpdateRequest body) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async {
      await ref
          .read(guildSettingsRepositoryProvider)
          .updateGuild(guildId: guildId, body: body);
      ref.invalidate(guildSettingsOverviewProvider(guildId));
    });
  }
}

@riverpod
Future<GuildSettingsDetails> guildSettingsModeration(
  Ref ref,
  String guildId,
) async {
  return ref.watch(guildSettingsOverviewProvider(guildId).future);
}

@riverpod
class GuildSettingsModerationActions extends _$GuildSettingsModerationActions {
  @override
  FutureOr<void> build(String guildId) {}

  Future<void> updateModeration(GuildUpdateRequest body) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async {
      await ref
          .read(guildSettingsRepositoryProvider)
          .updateGuild(guildId: guildId, body: body);
      ref.invalidate(guildSettingsModerationProvider(guildId));
      ref.invalidate(guildSettingsOverviewProvider(guildId));
    });
  }
}

@riverpod
int guildSettingsPermissions(Ref ref, String guildId) {
  return ref.watch(guildPermissionsProvider)[guildId] ?? 0;
}
