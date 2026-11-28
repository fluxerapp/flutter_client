import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/synced_extras_preferences_provider.dart';

@immutable
class SidebarLocalState {
  const SidebarLocalState({
    required this.inlineDmsCollapsed,
    this.showCollapsedUnreadDmsBadge = true,
    this.showIncomingFriendRequestBadge = true,
  });

  final bool inlineDmsCollapsed;
  final bool showCollapsedUnreadDmsBadge;
  final bool showIncomingFriendRequestBadge;

  @override
  bool operator ==(Object other) {
    return other is SidebarLocalState &&
        other.inlineDmsCollapsed == inlineDmsCollapsed &&
        other.showCollapsedUnreadDmsBadge == showCollapsedUnreadDmsBadge &&
        other.showIncomingFriendRequestBadge == showIncomingFriendRequestBadge;
  }

  @override
  int get hashCode => Object.hash(
    inlineDmsCollapsed,
    showCollapsedUnreadDmsBadge,
    showIncomingFriendRequestBadge,
  );
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
    final SyncedExtrasState extras = _ref.read(syncedExtrasPreferencesProvider);
    return SidebarLocalState(
      inlineDmsCollapsed: appearance.collapseDMs,
      showCollapsedUnreadDmsBadge: extras.showCollapsedUnreadDmsBadge,
      showIncomingFriendRequestBadge: extras.showIncomingFriendRequestBadge,
    );
  }

  @override
  Future<void> applyRemote(SidebarLocalState value) async {
    await _ref
        .read(appearancePreferencesProvider.notifier)
        .applySyncedSidebar(value);
    await _ref
        .read(syncedExtrasPreferencesProvider.notifier)
        .applySidebarBadges(
          collapsedUnreadDms: value.showCollapsedUnreadDmsBadge,
          incomingFriendRequests: value.showIncomingFriendRequestBadge,
        );
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasSidebar();

  @override
  pb.SidebarPreferences readSubMessage(pb.SyncedPreferences message) {
    return message.sidebar;
  }

  @override
  SidebarLocalState fromProto(pb.SidebarPreferences proto) {
    return SidebarLocalState(
      inlineDmsCollapsed: proto.inlineDmsCollapsed,
      showCollapsedUnreadDmsBadge:
          !proto.hasShowCollapsedUnreadDmsBadge() ||
          proto.showCollapsedUnreadDmsBadge,
      showIncomingFriendRequestBadge:
          !proto.hasShowIncomingFriendRequestBadge() ||
          proto.showIncomingFriendRequestBadge,
    );
  }

  @override
  void writeProto(pb.SidebarPreferences proto, SidebarLocalState local) {
    proto
      ..inlineDmsCollapsed = local.inlineDmsCollapsed
      ..showCollapsedUnreadDmsBadge = local.showCollapsedUnreadDmsBadge
      ..showIncomingFriendRequestBadge = local.showIncomingFriendRequestBadge;
  }

  @override
  pb.SidebarPreferences createEmptyProto() => pb.SidebarPreferences();

  @override
  pb.SyncedPreferences wrapProto(pb.SidebarPreferences proto) {
    return pb.SyncedPreferences(sidebar: proto);
  }

  @override
  bool statesEqual(SidebarLocalState a, SidebarLocalState b) => a == b;
}
