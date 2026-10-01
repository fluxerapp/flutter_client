import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'premium_settings_state_provider.g.dart';

@riverpod
class PremiumSettingsState extends _$PremiumSettingsState {
  int _refreshSerial = 0;

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

  Future<void> refresh({String? countryCode, bool silent = false}) async {
    final int serial = ++_refreshSerial;
    if (!silent) {
      state = const AsyncLoading();
    }
    final AsyncValue<PremiumStateResponse?> result = await AsyncValue.guard(
      () => ref
          .read(fluxerClientProvider)
          .premium
          .getPremiumState(countryCode: countryCode),
    );
    if (!ref.mounted || serial != _refreshSerial) {
      return;
    }
    final PremiumStateResponse? response = result.asData?.value;
    if (response != null) {
      ref
          .read(currentUserEntitlementsProvider.notifier)
          .applyPremiumState(response);
    }
    if (silent && result.hasError) {
      if (state.isLoading) {
        state = const AsyncData<PremiumStateResponse?>(null);
      }
      return;
    }
    state = result;
  }
}
