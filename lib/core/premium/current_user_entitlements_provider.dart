import 'package:fluxer_app/core/premium/user_entitlements.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_entitlements_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserEntitlements extends _$CurrentUserEntitlements {
  @override
  UserEntitlements build(String accountUserId) =>
      const UserEntitlements.empty();

  void applyUserProfile(UserPrivateResponse profile) {
    state = state.applyUserProfile(profile);
  }

  void applyPremiumState(PremiumStateResponse premiumState) {
    state = state.applyPremiumState(premiumState);
  }
}

@Riverpod(keepAlive: true)
bool isEffectivelyPremium(Ref ref) {
  final String? userId = accountUserIdOrNull(ref, watch: true);
  if (userId == null) {
    return false;
  }
  return ref
      .watch(currentUserEntitlementsProvider(userId))
      .isEffectivelyPremium;
}
