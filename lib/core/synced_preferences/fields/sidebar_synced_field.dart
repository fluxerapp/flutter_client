import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class SidebarLocalState {
  const SidebarLocalState({required this.inlineDmsCollapsed});

  final bool inlineDmsCollapsed;
}

class SidebarSyncedField extends SyncedFieldAdapter<SidebarLocalState> {
  SidebarSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.sidebar;

  @override
  SidebarLocalState readLocal() {
    final appearance = _ref.read(appearancePreferencesProvider);
    return SidebarLocalState(inlineDmsCollapsed: appearance.collapseDMs);
  }

  @override
  Future<void> applyRemote(SidebarLocalState value) async {
    await _ref
        .read(appearancePreferencesProvider.notifier)
        .applySyncedSidebar(value);
  }

  @override
  SidebarLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasSidebar()) {
      return null;
    }
    return SidebarLocalState(
      inlineDmsCollapsed: message.sidebar.inlineDmsCollapsed,
    );
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return wire.hasSidebar() ? wire.sidebar : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(SidebarLocalState local) {
    return toProtoForPush(local: local);
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    SidebarLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as pb.SidebarPreferences?,
    );
  }

  @override
  bool statesEqual(SidebarLocalState a, SidebarLocalState b) {
    return a.inlineDmsCollapsed == b.inlineDmsCollapsed;
  }

  @override
  SidebarLocalState mergeForMigration({
    required SidebarLocalState local,
    required SidebarLocalState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(SidebarLocalState candidate) {
    final roundtripped = readFromProto(
      pb.SyncedPreferences(
        sidebar: toProtoMessage(candidate) as pb.SidebarPreferences,
      ),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  static pb.SidebarPreferences toProtoForPush({
    required SidebarLocalState local,
    pb.SidebarPreferences? wireBase,
  }) {
    return (wireBase != null
          ? (pb.SidebarPreferences()..mergeFromMessage(wireBase))
          : pb.SidebarPreferences())
      ..inlineDmsCollapsed = local.inlineDmsCollapsed;
  }
}
