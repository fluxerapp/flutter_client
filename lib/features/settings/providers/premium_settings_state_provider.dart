import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'premium_settings_state_provider.g.dart';

@riverpod
class PremiumSettingsState extends _$PremiumSettingsState {
  @override
  Future<PremiumStateResponse?> build() async {
    final client = ref.watch(fluxerClientProvider);
    try {
      final PremiumStateResponse state = await client.premium.getPremiumState();
      ref
          .read(currentUserEntitlementsProvider.notifier)
          .applyPremiumState(state);
      return state;
    } on Object {
      return null;
    }
  }

  Future<void> refresh({String? countryCode}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final PremiumStateResponse response = await ref
          .read(fluxerClientProvider)
          .premium
          .getPremiumState(countryCode: countryCode);
      ref
          .read(currentUserEntitlementsProvider.notifier)
          .applyPremiumState(response);
      return response;
    });
  }
}
