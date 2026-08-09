import 'dart:async';

import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slowmode_sync_provider.g.dart';

final Map<String, Future<void>> _inFlightSlowmodeFetches =
    <String, Future<void>>{};

@Riverpod(keepAlive: true)
class SlowmodeSync extends _$SlowmodeSync {
  @override
  void build() {
    ref.listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
      if (previous == false && next) {
        final String channelId = ref.read(chatViewModelProvider).channelId;
        if (channelId.isNotEmpty) {
          unawaited(fetchIfNeeded(channelId));
        }
      }
    });
  }

  Future<void> fetchIfNeeded(String channelId) {
    if (channelId.isEmpty) {
      return Future<void>.value();
    }
    final existing = _inFlightSlowmodeFetches[channelId];
    if (existing != null) {
      return existing;
    }
    final future = _fetch(channelId);
    _inFlightSlowmodeFetches[channelId] = future;
    return future.whenComplete(() {
      if (identical(_inFlightSlowmodeFetches[channelId], future)) {
        _inFlightSlowmodeFetches.remove(channelId);
      }
    });
  }

  Future<void> _fetch(String channelId) async {
    final row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(channelId);
    if (row == null) {
      return;
    }
    final Channel channel = Channel.fromRow(row);
    if (channel.guildId.isEmpty || channel.rateLimitPerUser <= 0) {
      return;
    }
    try {
      final response = await ref
          .read(channelRepositoryProvider)
          .getSlowmodeState(channelId);
      ref
          .read(slowmodeTrackerProvider.notifier)
          .syncFromResponse(channelId, response);
    } on Object catch (error, stackTrace) {
      talker.error(
        '[SlowmodeSync] Failed to fetch slowmode state for channel $channelId',
        error,
        stackTrace,
      );
    }
  }
}
