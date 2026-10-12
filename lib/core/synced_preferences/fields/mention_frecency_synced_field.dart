import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/mention_frecency.dart';
import 'package:fluxer_app/features/chat/providers/composer/mention_frecency_provider.dart';

class MentionFrecencySyncedField
    extends
        ProtoSyncedFieldAdapter<
          MentionFrecencyScopes,
          pb.MentionFrecencyState
        > {
  MentionFrecencySyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.mentionFrecency;

  @override
  MentionFrecencyScopes readLocal() => _ref.read(mentionFrecencyProvider);

  @override
  Future<void> applyRemote(MentionFrecencyScopes value) =>
      _ref.read(mentionFrecencyProvider.notifier).applySynced(value);

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasMentionFrecency();

  @override
  pb.MentionFrecencyState readSubMessage(pb.SyncedPreferences message) =>
      message.mentionFrecency;

  @override
  MentionFrecencyScopes fromProto(pb.MentionFrecencyState proto) {
    final scopes = <String, Map<String, MentionFrecencyEntry>>{};
    for (final scope in proto.scopes) {
      final entries = scopes.putIfAbsent(
        scope.guildId,
        () => <String, MentionFrecencyEntry>{},
      );
      for (final entry in scope.entries) {
        entries[entry.userId] = MentionFrecencyEntry(
          count: entry.count,
          lastAtMs: entry.lastAtMs.toInt(),
        );
      }
    }
    return scopes;
  }

  @override
  void writeProto(pb.MentionFrecencyState proto, MentionFrecencyScopes local) {
    proto.scopes
      ..clear()
      ..addAll([
        for (final MapEntry(key: guildId, value: entries) in local.entries)
          if (entries.isNotEmpty)
            pb.MentionFrecencyState_Scope(
              guildId: guildId,
              entries: [
                for (final MapEntry(key: userId, value: entry)
                    in entries.entries)
                  pb.MentionFrecencyState_Entry(
                    userId: userId,
                    count: entry.count,
                    lastAtMs: Int64(entry.lastAtMs),
                  ),
              ],
            ),
      ]);
  }

  @override
  pb.MentionFrecencyState createEmptyProto() => pb.MentionFrecencyState();

  @override
  pb.SyncedPreferences wrapProto(pb.MentionFrecencyState proto) =>
      pb.SyncedPreferences(mentionFrecency: proto);

  @override
  bool statesEqual(MentionFrecencyScopes a, MentionFrecencyScopes b) =>
      mentionFrecencyScopesEqual(a, b);

  @override
  bool hasLocalData(MentionFrecencyScopes local) =>
      local.values.any((entries) => entries.isNotEmpty);
}
