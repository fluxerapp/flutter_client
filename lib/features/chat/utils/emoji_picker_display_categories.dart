import 'package:fluxer_app/shared/utils/emoji_registry.dart';

/// Hearts shown at the start of Symbols instead of People, where the synced
/// `emojis.json` puts them. Display-only; sprite indices stay on the original
/// entries. `cupid` belongs to the cluster despite its shortcode.
const List<String> kEmojiPickerSymbolHeartNames = [
  'heart',
  'pink_heart',
  'orange_heart',
  'yellow_heart',
  'green_heart',
  'blue_heart',
  'light_blue_heart',
  'purple_heart',
  'brown_heart',
  'black_heart',
  'grey_heart',
  'white_heart',
  'broken_heart',
  'heart_on_fire',
  'mending_heart',
  'heart_exclamation',
  'two_hearts',
  'revolving_hearts',
  'heartbeat',
  'heartpulse',
  'sparkling_heart',
  'cupid',
  'gift_heart',
  'heart_decoration',
];

final Set<String> _kSymbolHeartNames = kEmojiPickerSymbolHeartNames.toSet();

// One-entry memo; the registry map is identity-stable after preload.
Map<String, List<EmojiEntry>>? _memoInput;
late Map<String, List<EmojiEntry>> _memoOutput;

String? _pickerSymbolHeartName(EmojiEntry emoji) {
  for (final String name in emoji.names) {
    if (_kSymbolHeartNames.contains(name)) {
      return name;
    }
  }
  return null;
}

/// Returns picker categories with the heart cluster moved to Symbols.
///
/// Does not mutate [categories] or the [EmojiEntry] objects inside it.
Map<String, List<EmojiEntry>> emojiPickerDisplayCategories(
  Map<String, List<EmojiEntry>> categories,
) {
  if (identical(categories, _memoInput)) {
    return _memoOutput;
  }
  final Map<String, List<EmojiEntry>> result = _remap(categories);
  _memoInput = categories;
  _memoOutput = result;
  return result;
}

Map<String, List<EmojiEntry>> _remap(Map<String, List<EmojiEntry>> categories) {
  final Map<String, EmojiEntry> hearts = <String, EmojiEntry>{};
  final Map<String, List<EmojiEntry>> remapped = <String, List<EmojiEntry>>{};

  for (final MapEntry<String, List<EmojiEntry>> entry in categories.entries) {
    final List<EmojiEntry> kept = <EmojiEntry>[];
    var removed = false;
    for (final EmojiEntry emoji in entry.value) {
      final String? heartName = _pickerSymbolHeartName(emoji);
      if (heartName != null) {
        hearts[heartName] = emoji;
        removed = true;
        continue;
      }
      kept.add(emoji);
    }
    remapped[entry.key] = removed ? kept : entry.value;
  }

  if (hearts.isEmpty) {
    return categories;
  }

  final List<EmojiEntry> orderedHearts = <EmojiEntry>[
    for (final String name in kEmojiPickerSymbolHeartNames)
      if (hearts[name] case final EmojiEntry emoji) emoji,
  ];
  remapped['symbols'] = <EmojiEntry>[...orderedHearts, ...?remapped['symbols']];
  return remapped;
}
