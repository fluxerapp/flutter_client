import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class NagbarDismissalsSyncedField
    extends SyncedFieldAdapter<NagbarDismissalsState> {
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
  NagbarDismissalsState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasNagbars()) {
      return null;
    }
    return _fromProto(message.nagbars);
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return wire.hasNagbars() ? wire.nagbars : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(NagbarDismissalsState local) {
    return toProtoForPush(local: local);
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    NagbarDismissalsState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as pb.NagbarDismissals?,
    );
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

  @override
  NagbarDismissalsState mergeForMigration({
    required NagbarDismissalsState local,
    required NagbarDismissalsState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(NagbarDismissalsState candidate) {
    final pb.NagbarDismissals proto = toProtoForPush(local: candidate);
    final NagbarDismissalsState roundtripped = _fromProto(proto);
    return statesEqual(candidate, roundtripped);
  }

  static pb.NagbarDismissals toProtoForPush({
    required NagbarDismissalsState local,
    pb.NagbarDismissals? wireBase,
  }) {
    final pb.NagbarDismissals settings =
        (wireBase != null
              ? (pb.NagbarDismissals()..mergeFromMessage(wireBase))
              : pb.NagbarDismissals())
          ..pushNotification = local.pushNotificationDismissed
          ..premiumGracePeriod = local.premiumGracePeriodDismissed
          ..premiumExpired = local.premiumExpiredDismissed
          ..premiumOnboarding = local.premiumOnboardingDismissed
          ..giftInventory = local.giftInventoryDismissed
          ..guildMembershipCta = local.guildMembershipCtaDismissed
          ..visionaryMfa = local.visionaryMfaDismissed;
    return settings;
  }

  static NagbarDismissalsState _fromProto(pb.NagbarDismissals proto) {
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
}
