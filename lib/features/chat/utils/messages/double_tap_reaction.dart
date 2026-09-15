import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/settings/providers/double_tap_reaction_preferences_provider.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

bool customEmojiAnimated(List<GuildEmojiEntry> emojis, String? emojiId) {
  if (emojiId == null || emojiId.isEmpty) {
    return false;
  }
  for (final emoji in emojis) {
    if (emoji.id == emojiId) {
      return emoji.animated;
    }
  }
  return false;
}

({String name, String? id}) doubleTapReactionFromSelected(
  FluxerSelectedEmoji emoji,
) {
  if (emoji.isCustom) {
    return (name: emoji.name, id: emoji.emojiId);
  }
  return (name: emoji.surrogates, id: null);
}

void dispatchStoredDoubleTapReaction(
  WidgetRef ref,
  ReactionToggleCallback? onReaction,
) {
  if (onReaction == null) {
    return;
  }
  FluxerHaptics.selection();
  final pref = ref.read(doubleTapReactionPreferencesProvider);
  if (!pref.isCustom) {
    onReaction(pref.name);
    return;
  }
  final emojis =
      ref.read(allGuildEmojisForPickerProvider).value ??
      const <GuildEmojiEntry>[];
  onReaction(
    pref.name,
    emojiId: pref.id,
    animated: customEmojiAnimated(emojis, pref.id),
  );
}

Future<void> saveSelectedDoubleTapReaction(
  WidgetRef ref,
  FluxerSelectedEmoji emoji,
) {
  final mapped = doubleTapReactionFromSelected(emoji);
  return ref
      .read(doubleTapReactionPreferencesProvider.notifier)
      .setReaction(name: mapped.name, id: mapped.id);
}
