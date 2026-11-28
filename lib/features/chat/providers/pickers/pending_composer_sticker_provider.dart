import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';

final NotifierProvider<
  PendingComposerStickerNotifier,
  Map<String, StickerEntry>
>
pendingComposerStickerProvider =
    NotifierProvider<PendingComposerStickerNotifier, Map<String, StickerEntry>>(
      PendingComposerStickerNotifier.new,
    );

class PendingComposerStickerNotifier
    extends Notifier<Map<String, StickerEntry>> {
  @override
  Map<String, StickerEntry> build() => const <String, StickerEntry>{};

  void stage(String channelId, StickerEntry sticker) {
    if (state[channelId]?.id == sticker.id) {
      return;
    }
    state = <String, StickerEntry>{...state, channelId: sticker};
  }

  StickerEntry? take(String channelId) {
    final StickerEntry? sticker = state[channelId];
    if (sticker != null) {
      clear(channelId);
    }
    return sticker;
  }

  void clear(String channelId) {
    if (!state.containsKey(channelId)) {
      return;
    }
    state = <String, StickerEntry>{
      for (final MapEntry<String, StickerEntry> entry in state.entries)
        if (entry.key != channelId) entry.key: entry.value,
    };
  }
}
