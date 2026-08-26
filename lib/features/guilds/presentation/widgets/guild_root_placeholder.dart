import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_unavailable_screen.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildRootPlaceholder extends ConsumerWidget {
  const GuildRootPlaceholder({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<String> trackedUnavailableGuildIds = ref.watch(
      guildAvailabilityProvider,
    );
    final AsyncValue<Guild?> guildAsync = ref.watch(guildByIdProvider(guildId));
    final Guild? guild = guildAsync.value;
    final bool guildOutageUnavailable = isGuildOutageUnavailable(
      guildId: guildId,
      trackedUnavailableGuildIds: trackedUnavailableGuildIds,
      guild: guild,
    );
    final bool guildNotFound = isGuildConfirmedMissingForRoute(
      guildAsync: guildAsync,
      guildId: guildId,
      trackedUnavailableGuildIds: trackedUnavailableGuildIds,
    );
    if (guildAsync.isLoading) {
      return Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: const GuildRouteLoadingShell(),
      );
    }
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: guildOutageUnavailable
          ? const GuildOutageUnavailableScreen()
          : guildNotFound
          ? const GuildNotFoundScreen()
          : const GuildRouteLoadingShell(),
    );
  }
}
