import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_guild_enabled_provider.g.dart';

@Riverpod(keepAlive: true)
bool addGuildEnabled(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) =>
        !response.community.singleCommunity,
    loading: () => true,
    error: (_, _) => true,
  );
}
