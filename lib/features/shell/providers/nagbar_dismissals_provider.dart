import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nagbar_dismissals_provider.g.dart';

@Riverpod(keepAlive: true)
class NagbarDismissals extends _$NagbarDismissals {
  @override
  NagbarDismissalsState build() {
    return const NagbarDismissalsState();
  }

  NagbarDismissalsState get syncedState => state;

  set syncedState(NagbarDismissalsState value) {
    state = value;
  }

  Future<void> dismissPushNotification() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(pushNotificationDismissed: true),
    );
  }

  Future<void> dismissPremiumGracePeriod() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(premiumGracePeriodDismissed: true),
    );
  }

  Future<void> dismissPremiumExpired() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(premiumExpiredDismissed: true),
    );
  }

  Future<void> dismissPremiumOnboarding() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(premiumOnboardingDismissed: true),
    );
  }

  Future<void> dismissGiftInventory() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(giftInventoryDismissed: true),
    );
  }

  Future<void> dismissGuildMembershipCta() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(guildMembershipCtaDismissed: true),
    );
  }

  Future<void> dismissVisionaryMfa() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(visionaryMfaDismissed: true),
    );
  }

  Future<void> _setDismissed(
    NagbarDismissalsState Function(NagbarDismissalsState current) update,
  ) async {
    state = update(state);
    ref.markSyncedDirty(SyncedPreferenceField.nagbars);
  }
}
