import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

@immutable
class SidebarLocalState {
  const SidebarLocalState({required this.inlineDmsCollapsed});

  final bool inlineDmsCollapsed;

  @override
  bool operator ==(Object other) {
    return other is SidebarLocalState &&
        other.inlineDmsCollapsed == inlineDmsCollapsed;
  }

  @override
  int get hashCode => inlineDmsCollapsed.hashCode;
}

class SidebarSyncedField
    extends ProtoSyncedFieldAdapter<SidebarLocalState, pb.SidebarPreferences> {
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
  bool hasField(pb.SyncedPreferences message) => message.hasSidebar();

  @override
  pb.SidebarPreferences readSubMessage(pb.SyncedPreferences message) {
    return message.sidebar;
  }

  @override
  SidebarLocalState fromProto(pb.SidebarPreferences proto) {
    return SidebarLocalState(inlineDmsCollapsed: proto.inlineDmsCollapsed);
  }

  @override
  void writeProto(pb.SidebarPreferences proto, SidebarLocalState local) {
    proto.inlineDmsCollapsed = local.inlineDmsCollapsed;
  }

  @override
  pb.SidebarPreferences createEmptyProto() => pb.SidebarPreferences();

  @override
  pb.SyncedPreferences wrapProto(pb.SidebarPreferences proto) {
    return pb.SyncedPreferences(sidebar: proto);
  }

  @override
  bool statesEqual(SidebarLocalState a, SidebarLocalState b) => a == b;

  static pb.SidebarPreferences toProtoForPush({
    required SidebarLocalState local,
    pb.SidebarPreferences? wireBase,
  }) {
    final proto = mergeOrCreate(wireBase, pb.SidebarPreferences.new);
    proto.inlineDmsCollapsed = local.inlineDmsCollapsed;
    return proto;
  }
}
