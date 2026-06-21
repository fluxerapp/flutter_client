import 'package:fluxer_app/core/premium/user_entitlements.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_entitlements_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserEntitlements extends _$CurrentUserEntitlements {
  @override
  UserEntitlements build() => const UserEntitlements.empty();

  void applyUserProfile(UserPrivateResponse profile) {
    state = state.applyUserProfile(profile);
  }

  void applyPremiumState(PremiumStateResponse premiumState) {
    state = state.applyPremiumState(premiumState);
  }

  void reset() {
    state = const UserEntitlements.empty();
  }
}

@Riverpod(keepAlive: true)
bool isEffectivelyPremium(Ref ref) {
  return ref.watch(currentUserEntitlementsProvider).isEffectivelyPremium;
}
