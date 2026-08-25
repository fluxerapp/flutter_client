import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';

class NagbarDismissalsSyncedField
    extends
        ProtoSyncedFieldAdapter<NagbarDismissalsState, pb.NagbarDismissals> {
  NagbarDismissalsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.nagbars;

  @override
  NagbarDismissalsState readLocal() {
    return _ref.read(nagbarDismissalsProvider);
  }

  @override
  Future<void> applyRemote(NagbarDismissalsState value) async {
    _ref.read(nagbarDismissalsProvider.notifier).syncedState = value;
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasNagbars();

  @override
  pb.NagbarDismissals readSubMessage(pb.SyncedPreferences message) {
    return message.nagbars;
  }

  @override
  NagbarDismissalsState fromProto(pb.NagbarDismissals proto) {
    return NagbarDismissalsState(
      pushNotificationDismissed: proto.pushNotification,
      premiumGracePeriodDismissed: proto.premiumGracePeriod,
      premiumExpiredDismissed: proto.premiumExpired,
      premiumOnboardingDismissed: proto.premiumOnboarding,
      giftInventoryDismissed: proto.giftInventory,
      guildMembershipCtaDismissed: proto.guildMembershipCta,
      visionaryMfaDismissed: proto.visionaryMfa,
    );
  }

  @override
  void writeProto(pb.NagbarDismissals proto, NagbarDismissalsState local) {
    proto
      ..pushNotification = local.pushNotificationDismissed
      ..premiumGracePeriod = local.premiumGracePeriodDismissed
      ..premiumExpired = local.premiumExpiredDismissed
      ..premiumOnboarding = local.premiumOnboardingDismissed
      ..giftInventory = local.giftInventoryDismissed
      ..guildMembershipCta = local.guildMembershipCtaDismissed
      ..visionaryMfa = local.visionaryMfaDismissed;
  }

  @override
  pb.NagbarDismissals createEmptyProto() => pb.NagbarDismissals();

  @override
  pb.SyncedPreferences wrapProto(pb.NagbarDismissals proto) {
    return pb.SyncedPreferences(nagbars: proto);
  }

  @override
  bool statesEqual(NagbarDismissalsState a, NagbarDismissalsState b) {
    return a.pushNotificationDismissed == b.pushNotificationDismissed &&
        a.premiumGracePeriodDismissed == b.premiumGracePeriodDismissed &&
        a.premiumExpiredDismissed == b.premiumExpiredDismissed &&
        a.premiumOnboardingDismissed == b.premiumOnboardingDismissed &&
        a.giftInventoryDismissed == b.giftInventoryDismissed &&
        a.guildMembershipCtaDismissed == b.guildMembershipCtaDismissed &&
        a.visionaryMfaDismissed == b.visionaryMfaDismissed;
  }

  static pb.NagbarDismissals toProtoForPush({
    required NagbarDismissalsState local,
    pb.NagbarDismissals? wireBase,
  }) {
    final proto = mergeOrCreate(wireBase, pb.NagbarDismissals.new);
    proto
      ..pushNotification = local.pushNotificationDismissed
      ..premiumGracePeriod = local.premiumGracePeriodDismissed
      ..premiumExpired = local.premiumExpiredDismissed
      ..premiumOnboarding = local.premiumOnboardingDismissed
      ..giftInventory = local.giftInventoryDismissed
      ..guildMembershipCta = local.guildMembershipCtaDismissed
      ..visionaryMfa = local.visionaryMfaDismissed;
    return proto;
  }
}
