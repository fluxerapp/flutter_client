import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/channel_frecency.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_frecency_provider.g.dart';

@Riverpod(keepAlive: true)
class ChannelFrecency extends _$ChannelFrecency {
  String? _lastChannelId;
  String? _lastGuildId;

  @override
  ChannelFrecencyUsage build() {
    ref.watch(currentUserIdProvider);
    _lastChannelId = null;
    _lastGuildId = null;
    return const {};
  }

  Future<void> applySynced(ChannelFrecencyUsage usage) async {
    state = usage;
  }

  void recordSelection({
    required String? guildId,
    required String? channelId,
    bool isThread = false,
  }) {
    final String? selectedGuildId = guildId == '@me' ? null : guildId;
    ChannelFrecencyUsage next = state;
    final int nowMs = DateTime.now().millisecondsSinceEpoch;
    if (channelId != _lastChannelId) {
      _lastChannelId = channelId;
      if (!isThread && isTrackableChannelFrecencyId(channelId)) {
        next = trackChannelFrecencyUse(next, channelId!, nowMs);
      }
    }
    if (selectedGuildId != _lastGuildId) {
      _lastGuildId = selectedGuildId;
      if (isTrackableChannelFrecencyId(selectedGuildId)) {
        next = trackChannelFrecencyUse(next, selectedGuildId!, nowMs);
      }
    }
    if (identical(next, state)) {
      return;
    }
    state = next;
    ref.markSyncedDirty(SyncedPreferenceField.channelFrecency);
  }
}
