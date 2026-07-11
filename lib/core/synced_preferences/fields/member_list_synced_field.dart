import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class MemberListLocalState {
  const MemberListLocalState({required this.membersOpen});

  final bool membersOpen;
}

class MemberListSyncedField extends SyncedFieldAdapter<MemberListLocalState> {
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
  MemberListLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasMemberList() || !message.memberList.hasMembersOpen()) {
      return null;
    }
    return MemberListLocalState(membersOpen: message.memberList.membersOpen);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(MemberListLocalState local) {
    return pb.MemberListState(membersOpen: local.membersOpen);
  }

  @override
  bool statesEqual(MemberListLocalState a, MemberListLocalState b) {
    return a.membersOpen == b.membersOpen;
  }

  @override
  MemberListLocalState mergeForMigration({
    required MemberListLocalState local,
    required MemberListLocalState remote,
  }) {
    return remote;
  }

  @override
  bool hasLocalData(MemberListLocalState local) => false;

  @override
  bool verifyRoundtrip(MemberListLocalState candidate) {
    final proto = toProtoMessage(candidate) as pb.MemberListState;
    final roundtripped = readFromProto(pb.SyncedPreferences(memberList: proto));
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }
}
