import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/message_realtime_test_helpers.dart';

MessageCreateEvent _createEvent(String id) {
  return MessageCreateEvent(
    message: MessageResponseSchema.fromJson(<String, dynamic>{
      'id': id,
      'channel_id': 'c1',
      'author': <String, dynamic>{
        'id': 'other',
        'username': 'user',
        'discriminator': '0001',
        'flags': 0,
      },
      'content': 'hello',
      'timestamp': '2020-01-01T00:00:00.000Z',
      'type': 0,
      'flags': 0,
      'pinned': false,
      'mention_everyone': false,
      'tts': false,
      'mentions': <dynamic>[],
      'mention_roles': <dynamic>[],
    }),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'message sfx binding survives a database cancellation mid-event',
    () async {
      // Drift's isolate protocol completes pending requests with
      // [CancellationException] when the connection closes mid-event.
      final FluxerDatabase db = FluxerDatabase.forTesting(
        LazyDatabase(() => throw const CancellationException()),
      );
      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);
      container.read(currentUserIdProvider.notifier).set('me');
      container.read(fluxerMessageSfxBindingProvider);

      container
          .read(messageRealtimeBusProvider)
          .emit(testMessageCreated(_createEvent('1')));

      // Without the guard this fails as an unhandled asynchronous error.
      await pumpEventQueue();
    },
  );
}
