import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';

void main() {
  const String channelId = 'channel-1';
  const String messageId = 'message-1';

  late ProviderContainer container;

  ChannelJumpTargetLedger freshLedger() {
    container = ProviderContainer();
    addTearDown(container.dispose);
    return container.read(channelJumpTargetLedgerProvider.notifier);
  }

  bool honours({required String channelId, required String messageId}) {
    final ChannelJumpTargetConsumption consumption = container.read(
      channelJumpTargetLedgerProvider,
    );
    return !consumption.isConsumed(
          channelId: channelId,
          messageId: messageId,
        ) &&
        !consumption.isSuperseded(channelId: channelId, messageId: messageId);
  }

  test('a fresh target is honoured, since the ledger fails open', () {
    freshLedger();
    expect(
      honours(channelId: channelId, messageId: messageId),
      isTrue,
      reason:
          'an unknown target must be honoured: a spurious jump costs a fetch, '
          'a spurious suppression strands the user on the wrong message',
    );
  });

  // Defect C1: the route keeps the message id, so without durable consumption
  // every unrelated rebuild refetched the window around the stale target.
  test('a consumed target is not honoured again', () {
    freshLedger().markConsumed(channelId: channelId, messageId: messageId);
    expect(
      honours(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'the stale route target must not re-fire once applied',
    );
  });

  // The constraint that makes a naive id latch unacceptable: the user was
  // deliberately re-tapping the same message an hour before this was written.
  test('a deliberate repeat jump to the same message is honoured again', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId);
    expect(
      honours(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'precondition: consumed',
    );

    ledger.request(channelId: channelId, messageId: messageId);
    final bool honouredAfterRequest = honours(
      channelId: channelId,
      messageId: messageId,
    );

    expect(
      honouredAfterRequest,
      isTrue,
      reason:
          'a new navigation intent re-opens consumption, so repeat taps on the '
          'same message keep working',
    );
  });

  // Consumption is per target. A single slot erased the earlier record whenever
  // the user jumped to a second message in the same channel, an ordinary
  // follow-up search, which reopened the stale-refetch loop for the first.
  test('requesting one target does not re-open another', () {
    freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId)
      ..request(channelId: channelId, messageId: 'other-message');
    expect(
      honours(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'an unrelated intent must not resurrect a consumed target',
    );
    expect(
      honours(channelId: channelId, messageId: 'other-message'),
      isTrue,
      reason: 'while the newly requested target is honoured',
    );
  });

  // Supersession: a newer jump in the same channel means the user asked for
  // something else, so an older PENDING target must never fire again.
  test('a newer intent supersedes an older pending target', () {
    freshLedger()
      ..request(channelId: channelId, messageId: messageId)
      ..request(channelId: channelId, messageId: 'newer');
    expect(
      honours(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'the older pending target would drag the user off the newer one',
    );
    expect(honours(channelId: channelId, messageId: 'newer'), isTrue);
  });

  test('supersession is per channel', () {
    freshLedger()
      ..request(channelId: channelId, messageId: messageId)
      ..request(channelId: 'channel-2', messageId: 'elsewhere');
    expect(
      honours(channelId: channelId, messageId: messageId),
      isTrue,
      reason: 'a jump in another channel says nothing about this one',
    );
  });

  // Interruption is transient and must stay retryable, unlike supersession.
  test('a pending target with no newer intent is still honoured', () {
    freshLedger().request(channelId: channelId, messageId: messageId);
    expect(honours(channelId: channelId, messageId: messageId), isTrue);
  });

  test('re-requesting after supersession honours the target again', () {
    freshLedger()
      ..request(channelId: channelId, messageId: messageId)
      ..request(channelId: channelId, messageId: 'newer')
      ..request(channelId: channelId, messageId: messageId);
    expect(honours(channelId: channelId, messageId: messageId), isTrue);
  });

  test('consuming a second target keeps the first consumed', () {
    freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId)
      ..markConsumed(channelId: channelId, messageId: 'second');
    expect(honours(channelId: channelId, messageId: messageId), isFalse);
    expect(honours(channelId: channelId, messageId: 'second'), isFalse);
  });

  test('consumption is per channel, so the same id elsewhere still jumps', () {
    freshLedger().markConsumed(channelId: channelId, messageId: messageId);
    expect(honours(channelId: 'channel-2', messageId: messageId), isTrue);
  });
}
