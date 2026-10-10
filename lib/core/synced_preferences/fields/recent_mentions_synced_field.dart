import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';

class RecentMentionsSyncedField
    extends ProtoSyncedFieldAdapter<MentionFilters, pb.RecentMentionsSettings> {
  RecentMentionsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.recentMentions;

  @override
  MentionFilters readLocal() {
    return _ref.read(mentionFiltersPreferencesProvider);
  }

  @override
  Future<void> applyRemote(MentionFilters value) async {
    await _ref
        .read(mentionFiltersPreferencesProvider.notifier)
        .applySynced(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasRecentMentions();

  @override
  pb.RecentMentionsSettings readSubMessage(pb.SyncedPreferences message) {
    return message.recentMentions;
  }

  @override
  MentionFilters fromProto(pb.RecentMentionsSettings proto) {
    return MentionFilters(
      includeEveryone: !proto.hasIncludeEveryone() || proto.includeEveryone,
      includeRoles: !proto.hasIncludeRoles() || proto.includeRoles,
      includeGuilds: !proto.hasIncludeGuilds() || proto.includeGuilds,
    );
  }

  @override
  void writeProto(pb.RecentMentionsSettings proto, MentionFilters local) {
    if (local.includeEveryone) {
      proto.clearIncludeEveryone();
    } else {
      proto.includeEveryone = false;
    }
    if (local.includeRoles) {
      proto.clearIncludeRoles();
    } else {
      proto.includeRoles = false;
    }
    if (local.includeGuilds) {
      proto.clearIncludeGuilds();
    } else {
      proto.includeGuilds = false;
    }
  }

  @override
  pb.RecentMentionsSettings createEmptyProto() => pb.RecentMentionsSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.RecentMentionsSettings proto) {
    return pb.SyncedPreferences(recentMentions: proto);
  }

  @override
  bool statesEqual(MentionFilters a, MentionFilters b) => a == b;

  @override
  bool hasLocalData(MentionFilters local) => local != const MentionFilters();

  @override
  MentionFilters? clearedRemoteValue() => const MentionFilters();
}
