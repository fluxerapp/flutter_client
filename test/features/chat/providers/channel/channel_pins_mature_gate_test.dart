import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';

const String _channelId = 'locked-channel';

class _CountingPinsRepository implements ChannelPinsRepository {
  int calls = 0;

  @override
  Future<PinnedMessagesPage> listPinnedMessages({
    required String channelId,
    DateTime? before,
  }) async {
    calls++;
    return const PinnedMessagesPage(
      items: <PinnedMessageEntry>[],
      hasMore: true,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<(ChannelPinsState, int)> _loadPins({required bool gateShown}) async {
  final _CountingPinsRepository repository = _CountingPinsRepository();
  final ProviderContainer container = ProviderContainer(
    overrides: [
      channelPinsRepositoryProvider.overrideWithValue(repository),
      shouldShowMatureContentGateProvider(
        _channelId,
      ).overrideWith((ref) => Future<bool>.value(gateShown)),
    ],
  );
  addTearDown(container.dispose);
  final ChannelPinsState state = await container.read(
    channelPinsProvider(_channelId).future,
  );
  return (state, repository.calls);
}

void main() {
  test('pins of a channel behind the 18+ gate are never fetched', () async {
    final (ChannelPinsState state, int calls) = await _loadPins(
      gateShown: true,
    );
    expect(calls, 0);
    expect(state.items, isEmpty);
    expect(state.hasMore, isFalse);
  });

  test('pins load once the 18+ gate no longer shows', () async {
    final (ChannelPinsState state, int calls) = await _loadPins(
      gateShown: false,
    );
    expect(calls, 1);
    expect(state.hasMore, isTrue);
  });
}
