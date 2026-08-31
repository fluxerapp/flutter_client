import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_membership_cta_visibility_provider.g.dart';

const String kFluxerHqInviteCode = 'fluxer-hq';

@riverpod
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
    return switch (schema) {
      InviteResponseSchema0(:final guild) =>
        (await ref.read(guildByIdProvider(guild.id).future)) == null,
      _ => false,
    };
  } on Object {
    return false;
  }
}
