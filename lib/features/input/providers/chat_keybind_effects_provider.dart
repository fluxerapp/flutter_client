import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ChatKeybindEffect {
  scrollPageUp,
  scrollPageDown,
  togglePins,
  triggerUpload,
  addReaction,
}

typedef ChatKeybindEffectPredicate = bool Function(ChatKeybindEffect effect);

class ChatKeybindEffectsNotifier extends Notifier<int> {
  ChatKeybindEffect? _pending;

  @override
  int build() => 0;

  ChatKeybindEffect? consume() {
    final ChatKeybindEffect? effect = _pending;
    _pending = null;
    return effect;
  }

  void emit(ChatKeybindEffect effect) {
    _pending = effect;
    state = state + 1;
  }
}

final NotifierProvider<ChatKeybindEffectsNotifier, int>
chatKeybindEffectsProvider = NotifierProvider<ChatKeybindEffectsNotifier, int>(
  ChatKeybindEffectsNotifier.new,
);

ProviderSubscription<int> listenChatKeybindEffects(
  WidgetRef ref,
  void Function(ChatKeybindEffect effect) onEffect, {
  ChatKeybindEffectPredicate? where,
}) {
  return ref.listenManual<int>(chatKeybindEffectsProvider, (int? _, int _) {
    final ChatKeybindEffect? effect = ref
        .read(chatKeybindEffectsProvider.notifier)
        .consume();
    if (effect == null || (where != null && !where(effect))) {
      return;
    }
    onEffect(effect);
  });
}
