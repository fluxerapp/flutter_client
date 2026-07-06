import 'dart:async';

import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/gateway/message_mention_context_cache.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/chat/data/message_write_batcher.dart';
import 'package:fluxer_app/features/chat/data/reaction_write_batcher.dart';
import 'package:fluxer_app/features/notifications/data/mention_feed_write_batcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_performance_providers.g.dart';

@Riverpod(keepAlive: true)
ChannelLastMessageIndex channelLastMessageIndex(Ref ref) {
  final ChannelLastMessageIndex index = ChannelLastMessageIndex();
  ref.onDispose(index.clear);
  ref.onDispose(() {
    unawaited(index.dispose());
  });
  return index;
}

@Riverpod(keepAlive: true)
MessageMentionContextCache messageMentionContextCache(Ref ref) {
  final cache = MessageMentionContextCache(
    database: ref.watch(fluxerDatabaseProvider),
  );
  ref.onDispose(cache.clearAll);
  return cache;
}

@Riverpod(keepAlive: true)
MessageWriteBatcher messageWriteBatcher(Ref ref) {
  final batcher = MessageWriteBatcher(
    database: ref.watch(fluxerDatabaseProvider),
    channelLastMessageIndex: ref.watch(channelLastMessageIndexProvider),
  );
  _wireWriteBatcherLifecycle(ref, batcher.flushAll);
  ref.onDispose(() {
    unawaited(batcher.dispose());
  });
  return batcher;
}

@Riverpod(keepAlive: true)
MentionFeedWriteBatcher mentionFeedWriteBatcher(Ref ref) {
  final batcher = MentionFeedWriteBatcher(
    database: ref.watch(fluxerDatabaseProvider),
  );
  _wireWriteBatcherLifecycle(ref, batcher.flushAll);
  ref.onDispose(() {
    unawaited(batcher.dispose());
  });
  return batcher;
}

@Riverpod(keepAlive: true)
ReactionWriteBatcher reactionWriteBatcher(Ref ref) {
  final batcher = ReactionWriteBatcher(
    database: ref.watch(fluxerDatabaseProvider),
  );
  _wireWriteBatcherLifecycle(ref, batcher.flushAll);
  ref.onDispose(() {
    unawaited(batcher.dispose());
  });
  return batcher;
}

@Riverpod(keepAlive: true)
Future<void> Function() gatewayWriteBatcherFlushAll(Ref ref) {
  return () async {
    await Future.wait(<Future<void>>[
      ref.read(readStateWriteBatcherProvider).flushAll(),
      ref.read(messageWriteBatcherProvider).flushAll(),
      ref.read(mentionFeedWriteBatcherProvider).flushAll(),
      ref.read(reactionWriteBatcherProvider).flushAll(),
    ]);
  };
}

void _wireWriteBatcherLifecycle(Ref ref, Future<void> Function() flush) {
  ref
    ..listen<bool>(appUiForegroundProvider, (bool? prev, bool next) {
      if ((prev ?? false) && !next) {
        unawaited(flush());
      }
    })
    ..listen<bool>(gatewayReadyProvider, (bool? prev, bool next) {
      if ((prev ?? false) && !next) {
        unawaited(flush());
      }
    });
}
