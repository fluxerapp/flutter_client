import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/invite_code.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_membership_cta_visibility_provider.g.dart';

const String kFluxerHqInviteCode = 'fluxer-hq';

@Riverpod(keepAlive: true)
Future<bool> guildMembershipCtaVisible(Ref ref) async {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  final bool isSelfHosted = wellKnown.maybeWhen(
    data: (WellKnownFluxerResponse response) => response.features.selfHosted,
    orElse: () => false,
  );
  if (isSelfHosted) {
    return false;
  }
  try {
    final FluxerClient client = ref.read(fluxerClientProvider);
    final InviteResponseSchema schema = await client.invites.getInvite(
      inviteCode: kFluxerHqInviteCode,
    );
    if (!inviteResponseIsGuild(schema)) {
      return false;
    }
    final String guildId = schema.toGuildInviteResponse().guild.id;
    // One-off snapshot; read does not retain the autoDispose family.
    // ignore: riverpod_lint/only_use_keep_alive_inside_keep_alive
    return (await ref.read(guildByIdProvider(guildId).future)) == null;
  } on Object {
    return false;
  }
}
