import 'package:flutter/foundation.dart';

@immutable
class FluxerSelectedEmoji {
  const FluxerSelectedEmoji({
    required this.name,
    required this.surrogates,
    this.emojiId,
    this.animated = false,
  });

  factory FluxerSelectedEmoji.fromSelection(String name, String surrogates) {
    final customEmojiMatch = RegExp(
      r'^<(a?):([^:>]+):(\d+)>$',
    ).firstMatch(surrogates);

    if (customEmojiMatch != null) {
      return FluxerSelectedEmoji(
        name: name,
        surrogates: surrogates,
        emojiId: customEmojiMatch.group(3),
        animated: customEmojiMatch.group(1) == 'a',
      );
    }

    return FluxerSelectedEmoji(name: name, surrogates: surrogates);
  }

  final String name;
  final String surrogates;
  final String? emojiId;
  final bool animated;

  bool get isCustom => emojiId != null;
}
