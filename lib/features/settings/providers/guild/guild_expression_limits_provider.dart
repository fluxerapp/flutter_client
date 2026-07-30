import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_limits.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_expression_limits_provider.g.dart';

@riverpod
Future<GuildExpressionLimits?> guildExpressionLimits(
  Ref ref,
  String guildId,
) async {
  final Guild? guild = await ref.watch(guildByIdProvider(guildId).future);
  if (guild == null) {
    return null;
  }
  final limits = await ref.watch(wellKnownProvider.future);
  return resolveGuildExpressionLimits(guild: guild, limits: limits.limits);
}
