import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'should_show_premium_commerce_provider.g.dart';

@Riverpod(keepAlive: true)
bool shouldShowPremiumCommerce(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => !response.features.selfHosted,
    loading: () => true,
    error: (_, _) => true,
  );
}
