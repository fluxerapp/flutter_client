import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

@immutable
class PrivacyLocalState {
  const PrivacyLocalState({
    required this.showActiveNow,
    required this.advanced,
  });

  final bool showActiveNow;
  final AdvancedPrivacyLocalState advanced;

  @override
  bool operator ==(Object other) {
    return other is PrivacyLocalState &&
        other.showActiveNow == showActiveNow &&
        other.advanced == advanced;
  }

  @override
  int get hashCode => Object.hash(showActiveNow, advanced);
}

class PrivacySyncedField
    extends ProtoSyncedFieldAdapter<PrivacyLocalState, pb.PrivacyPreferences> {
  PrivacySyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.privacy;

  @override
  PrivacyLocalState readLocal() {
    final appearance = _ref.read(appearancePreferencesProvider);
    final advanced = _ref.read(advancedPreferencesProvider);
    return PrivacyLocalState(
      showActiveNow: appearance.showActiveNow,
      advanced: AdvancedPrivacyLocalState(
        preuploadMessageAttachments: advanced.preuploadMessageAttachments,
        disableStreamPreviews: advanced.disableStreamPreviews,
      ),
    );
  }

  @override
  Future<void> applyRemote(PrivacyLocalState value) async {
    await _ref
        .read(appearancePreferencesProvider.notifier)
        .applySyncedPrivacy(value);
    await _ref
        .read(advancedPreferencesProvider.notifier)
        .applySyncedPrivacy(value.advanced);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasPrivacy();

  @override
  pb.PrivacyPreferences readSubMessage(pb.SyncedPreferences message) {
    return message.privacy;
  }

  @override
  PrivacyLocalState fromProto(pb.PrivacyPreferences proto) {
    return PrivacyLocalState(
      showActiveNow: !proto.hasShowActiveNow() || proto.showActiveNow,
      advanced: AdvancedPrivacyLocalState(
        preuploadMessageAttachments:
            !proto.hasPreuploadMessageAttachments() ||
            proto.preuploadMessageAttachments,
        disableStreamPreviews:
            proto.hasDisableStreamPreviews() && proto.disableStreamPreviews,
      ),
    );
  }

  @override
  void writeProto(pb.PrivacyPreferences proto, PrivacyLocalState local) {
    proto
      ..showActiveNow = local.showActiveNow
      ..preuploadMessageAttachments = local.advanced.preuploadMessageAttachments
      ..disableStreamPreviews = local.advanced.disableStreamPreviews;
  }

  @override
  pb.PrivacyPreferences createEmptyProto() => pb.PrivacyPreferences();

  @override
  pb.SyncedPreferences wrapProto(pb.PrivacyPreferences proto) {
    return pb.SyncedPreferences(privacy: proto);
  }

  @override
  bool statesEqual(PrivacyLocalState a, PrivacyLocalState b) => a == b;

  static pb.PrivacyPreferences toProtoForPush({
    required PrivacyLocalState local,
    pb.PrivacyPreferences? wireBase,
  }) {
    final proto = mergeOrCreate(wireBase, pb.PrivacyPreferences.new);
    proto
      ..showActiveNow = local.showActiveNow
      ..preuploadMessageAttachments = local.advanced.preuploadMessageAttachments
      ..disableStreamPreviews = local.advanced.disableStreamPreviews;
    return proto;
  }
}
