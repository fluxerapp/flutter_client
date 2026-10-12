import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/core/synced_preferences/mention_frecency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mention_frecency_provider.g.dart';

@Riverpod(keepAlive: true)
class MentionFrecency extends _$MentionFrecency {
  @override
  MentionFrecencyScopes build() {
    ref.watch(currentUserIdProvider);
    return const {};
  }

  Future<void> applySynced(MentionFrecencyScopes scopes) async {
    state = scopes;
  }

  void record({required String? guildId, required String userId}) {
    state = recordMentionFrecency(
      state,
      guildId: guildId,
      userId: userId,
      nowMs: DateTime.now().millisecondsSinceEpoch,
    );
    ref.markSyncedDirty(SyncedPreferenceField.mentionFrecency);
  }
}
