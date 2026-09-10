import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  VoiceCallLayoutState state() => container.read(voiceCallLayoutProvider);
  VoiceCallLayout notifier() =>
      container.read(voiceCallLayoutProvider.notifier);

  test('pin sets focus mode', () {
    notifier().pin('tile-1');
    expect(state().mode, VoiceCallLayoutMode.focus);
    expect(state().pinnedTileId, 'tile-1');
  });

  test('pin is a no-op when that tile is already focused', () {
    notifier().pin('tile-1');
    final VoiceCallLayoutState first = state();
    notifier().pin('tile-1');
    expect(identical(state(), first), isTrue);
  });

  test('setMode grid clears pin and keeps expanded users', () {
    notifier().toggleExpandedUser('user-1');
    notifier().setFilmstripCollapsed(value: true);
    notifier().pin('tile-1');
    notifier().setMode(VoiceCallLayoutMode.grid);
    expect(state().mode, VoiceCallLayoutMode.grid);
    expect(state().pinnedTileId, isNull);
    expect(state().expandedUserIds, <String>{'user-1'});
    expect(state().isFilmstripCollapsed, isTrue);
  });

  test('unpin from focus leaves focus without wiping expanded users', () {
    notifier().toggleExpandedUser('user-1');
    notifier().pin('tile-1');
    notifier().unpin();
    expect(state().mode, VoiceCallLayoutMode.grid);
    expect(state().pinnedTileId, isNull);
    expect(state().expandedUserIds, <String>{'user-1'});
  });

  test('clearStalePin drops the pin without flipping mode', () {
    notifier().pin('tile-1');
    notifier().clearStalePin();
    expect(state().mode, VoiceCallLayoutMode.focus);
    expect(state().pinnedTileId, isNull);
  });

  test('setMode focus does not invent a pin', () {
    notifier().setMode(VoiceCallLayoutMode.focus);
    expect(state().mode, VoiceCallLayoutMode.focus);
    expect(state().pinnedTileId, isNull);
  });
}
