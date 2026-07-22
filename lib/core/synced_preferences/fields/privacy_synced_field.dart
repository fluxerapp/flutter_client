import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class PrivacyLocalState {
  const PrivacyLocalState({required this.showActiveNow});

  final bool showActiveNow;
}

class PrivacySyncedField extends SyncedFieldAdapter<PrivacyLocalState> {
  PrivacySyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.privacy;

  @override
  PrivacyLocalState readLocal() {
    final appearance = _ref.read(appearancePreferencesProvider);
    return PrivacyLocalState(showActiveNow: appearance.showActiveNow);
  }

  @override
  Future<void> applyRemote(PrivacyLocalState value) async {
    await _ref
        .read(appearancePreferencesProvider.notifier)
        .applySyncedPrivacy(value);
  }

  @override
  PrivacyLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasPrivacy()) {
      return null;
    }
    if (!message.privacy.hasShowActiveNow()) {
      return null;
    }
    return PrivacyLocalState(showActiveNow: message.privacy.showActiveNow);
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return wire.hasPrivacy() ? wire.privacy : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(PrivacyLocalState local) {
    return toProtoForPush(local: local);
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    PrivacyLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as pb.PrivacyPreferences?,
    );
  }

  @override
  bool statesEqual(PrivacyLocalState a, PrivacyLocalState b) {
    return a.showActiveNow == b.showActiveNow;
  }

  @override
  PrivacyLocalState mergeForMigration({
    required PrivacyLocalState local,
    required PrivacyLocalState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(PrivacyLocalState candidate) {
    final proto = toProtoMessage(candidate) as pb.PrivacyPreferences;
    final roundtripped = readFromProto(pb.SyncedPreferences(privacy: proto));
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  static pb.PrivacyPreferences toProtoForPush({
    required PrivacyLocalState local,
    pb.PrivacyPreferences? wireBase,
  }) {
    return (wireBase != null
          ? (pb.PrivacyPreferences()..mergeFromMessage(wireBase))
          : pb.PrivacyPreferences())
      ..showActiveNow = local.showActiveNow;
  }
}
