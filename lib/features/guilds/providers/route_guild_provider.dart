import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_guild_provider.g.dart';

@riverpod
AsyncValue<Guild?> routeGuild(Ref ref, String guildId) {
  final AsyncValue<Guild?> streamed = ref.watch(
    guildStreamByIdProvider(guildId),
  );
  if (streamed.hasValue || streamed.hasError) {
    return streamed;
  }
  final Guild? listed = ref.watch(
    guildListViewModelProvider.select(
      (GuildListViewState state) =>
          state.guilds.where((Guild guild) => guild.id == guildId).firstOrNull,
    ),
  );
  return listed == null ? streamed : AsyncData<Guild?>(listed);
}
