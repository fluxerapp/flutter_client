import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';

void main() {
  const String channelId = 'channel-1';
  const String messageId = 'message-1';

  ChannelJumpTargetLedger freshLedger() {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    return container.read(channelJumpTargetLedgerProvider.notifier);
  }

  test('a fresh target is honoured, since the ledger fails open', () {
    expect(
      freshLedger().shouldHonour(channelId: channelId, messageId: messageId),
      isTrue,
      reason:
          'an unknown target must be honoured: a spurious jump costs a fetch, '
          'a spurious suppression strands the user on the wrong message',
    );
  });

  // Defect C1: the route keeps the message id, so without durable consumption
  // every unrelated rebuild refetched the window around the stale target.
  test('a consumed target is not honoured again', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId);
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
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
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'precondition: consumed',
    );

    final bool honouredAfterRequest =
        (ledger..request(channelId: channelId, messageId: messageId))
            .shouldHonour(channelId: channelId, messageId: messageId);

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
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId)
      ..request(channelId: channelId, messageId: 'other-message');
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'an unrelated intent must not resurrect a consumed target',
    );
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: 'other-message'),
      isTrue,
      reason: 'while the newly requested target is honoured',
    );
  });

  // Supersession: a newer jump in the same channel means the user asked for
  // something else, so an older PENDING target must never fire again.
  test('a newer intent supersedes an older pending target', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..request(channelId: channelId, messageId: messageId)
      ..request(channelId: channelId, messageId: 'newer');
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isFalse,
      reason: 'the older pending target would drag the user off the newer one',
    );
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: 'newer'),
      isTrue,
    );
  });

  test('supersession is per channel', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..request(channelId: channelId, messageId: messageId)
      ..request(channelId: 'channel-2', messageId: 'elsewhere');
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isTrue,
      reason: 'a jump in another channel says nothing about this one',
    );
  });

  // Interruption is transient and must stay retryable, unlike supersession.
  test('a pending target with no newer intent is still honoured', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..request(channelId: channelId, messageId: messageId);
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isTrue,
    );
  });

  test('re-requesting after supersession honours the target again', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..request(channelId: channelId, messageId: messageId)
      ..request(channelId: channelId, messageId: 'newer')
      ..request(channelId: channelId, messageId: messageId);
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isTrue,
    );
  });

  test('consuming a second target keeps the first consumed', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId)
      ..markConsumed(channelId: channelId, messageId: 'second');
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: messageId),
      isFalse,
    );
    expect(
      ledger.shouldHonour(channelId: channelId, messageId: 'second'),
      isFalse,
    );
  });

  test('consumption is per channel, so the same id elsewhere still jumps', () {
    final ChannelJumpTargetLedger ledger = freshLedger()
      ..markConsumed(channelId: channelId, messageId: messageId);
    expect(
      ledger.shouldHonour(channelId: 'channel-2', messageId: messageId),
      isTrue,
    );
  });
}
