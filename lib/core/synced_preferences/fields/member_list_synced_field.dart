import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';

@immutable
class MemberListLocalState {
  const MemberListLocalState({required this.membersOpen});

  final bool membersOpen;

  @override
  bool operator ==(Object other) {
    return other is MemberListLocalState && other.membersOpen == membersOpen;
  }

  @override
  int get hashCode => membersOpen.hashCode;
}

class MemberListSyncedField
    extends ProtoSyncedFieldAdapter<MemberListLocalState, pb.MemberListState> {
  MemberListSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.memberList;

  @override
  MemberListLocalState readLocal() {
    final isOpen = _ref.read(
      channelListViewModelProvider.select((state) => state.isMemberListVisible),
    );
    return MemberListLocalState(membersOpen: isOpen);
  }

  @override
  Future<void> applyRemote(MemberListLocalState value) async {
    final current = _ref.read(channelListViewModelProvider);
    if (current.isMemberListVisible == value.membersOpen) {
      return;
    }
    _ref
        .read(channelListViewModelProvider.notifier)
        .setMemberListVisible(isVisible: value.membersOpen);
  }

  @override
  bool hasField(pb.SyncedPreferences message) {
    return message.hasMemberList() && message.memberList.hasMembersOpen();
  }

  @override
  pb.MemberListState readSubMessage(pb.SyncedPreferences message) {
    return message.memberList;
  }

  @override
  MemberListLocalState fromProto(pb.MemberListState proto) {
    return MemberListLocalState(membersOpen: proto.membersOpen);
  }

  @override
  void writeProto(pb.MemberListState proto, MemberListLocalState local) {
    proto.membersOpen = local.membersOpen;
  }

  @override
  pb.MemberListState createEmptyProto() => pb.MemberListState();

  @override
  pb.SyncedPreferences wrapProto(pb.MemberListState proto) {
    return pb.SyncedPreferences(memberList: proto);
  }

  @override
  bool statesEqual(MemberListLocalState a, MemberListLocalState b) => a == b;

  @override
  bool hasLocalData(MemberListLocalState local) => false;
}
