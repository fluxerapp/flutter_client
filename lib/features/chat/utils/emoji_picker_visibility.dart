import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

@immutable
class EmojiPickerVisibilityState {
  const EmojiPickerVisibilityState({
    this.animatedCustomEmojiIds = const <String>{},
    this.activeCategoryKey,
  });

  final Set<String> animatedCustomEmojiIds;
  final String? activeCategoryKey;

  @override
  bool operator ==(Object other) {
    return other is EmojiPickerVisibilityState &&
        setEquals(animatedCustomEmojiIds, other.animatedCustomEmojiIds) &&
        activeCategoryKey == other.activeCategoryKey;
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAllUnordered(animatedCustomEmojiIds),
    activeCategoryKey,
  );
}

class EmojiPickerVisibilityScope
    extends InheritedNotifier<ValueNotifier<EmojiPickerVisibilityState>> {
  const EmojiPickerVisibilityScope({
    required ValueNotifier<EmojiPickerVisibilityState> notifier,
    required super.child,
    super.key,
  }) : super(notifier: notifier);

  static ValueNotifier<EmojiPickerVisibilityState>? _notifierOf(
    BuildContext context,
  ) {
    return context
        .dependOnInheritedWidgetOfExactType<EmojiPickerVisibilityScope>()
        ?.notifier;
  }

  static bool shouldAnimate(BuildContext context, String emojiId) {
    final ValueNotifier<EmojiPickerVisibilityState>? notifier = _notifierOf(
      context,
    );
    if (notifier == null) {
      return true;
    }
    return notifier.value.animatedCustomEmojiIds.contains(emojiId);
  }

  static String? activeCategory(BuildContext context) {
    return _notifierOf(context)?.value.activeCategoryKey;
  }
}
