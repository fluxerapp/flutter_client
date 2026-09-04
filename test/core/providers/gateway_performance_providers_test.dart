import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/chat/data/message_write_batcher.dart';
import 'package:fluxer_app/features/chat/data/reaction_write_batcher.dart';
import 'package:fluxer_app/features/notifications/data/mention_feed_write_batcher.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('flush-all can run from a provider onDispose', () {
    final db = openTestDatabase();
    final container = ProviderContainer(
      overrides: [
        readStateWriteBatcherProvider.overrideWithValue(
          ReadStateWriteBatcher(database: db),
        ),
        messageWriteBatcherProvider.overrideWithValue(
          MessageWriteBatcher(
            database: db,
            channelLastMessageIndex: ChannelLastMessageIndex(),
          ),
        ),
        mentionFeedWriteBatcherProvider.overrideWithValue(
          MentionFeedWriteBatcher(database: db),
        ),
        reactionWriteBatcherProvider.overrideWithValue(
          ReactionWriteBatcher(database: db),
        ),
      ],
    );
    final flush = container.read(gatewayWriteBatcherFlushAllProvider);
    final trigger = Provider<Object?>((Ref ref) {
      ref.onDispose(() {
        unawaited(flush());
      });
      return null;
    });
    container.read(trigger);
    expect(container.dispose, returnsNormally);
  });
}
