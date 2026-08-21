import 'dart:typed_data';

import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_display_categories.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_rendering_policy.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

sealed class EmojiPickerLayoutEntry {
  const EmojiPickerLayoutEntry();

  double get height;

  void collectVisibleCustomEmojiIds(Set<String> ids);
}

final class EmojiPickerTopPaddingEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerTopPaddingEntry();

  @override
  double get height => kEmojiPickerTopPadding;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {}
}

final class EmojiPickerUpsellEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerUpsellEntry();

  @override
  double get height => kEmojiPickerUpsellEstimatedHeight;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {}
}

final class EmojiPickerSectionGapEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerSectionGapEntry();

  @override
  double get height => kEmojiPickerSectionGap;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {}
}

final class EmojiPickerSectionHeaderEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerSectionHeaderEntry({required this.categoryKey});

  final String categoryKey;

  @override
  double get height => kEmojiPickerHeaderHeight;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {}
}

final class EmojiPickerCustomEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerCustomEmojiRowEntry({required this.emojis});

  final List<GuildEmojiEntry> emojis;

  @override
  double get height => kEmojiPickerCellSize;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {
    for (final GuildEmojiEntry emoji in emojis) {
      ids.add(emoji.id);
    }
  }
}

final class EmojiPickerUnicodeEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerUnicodeEmojiRowEntry({required this.emojis});

  final List<EmojiEntry> emojis;

  @override
  double get height => kEmojiPickerCellSize;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {}
}

final class EmojiPickerFavoriteEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerFavoriteEmojiRowEntry({required this.items});

  final List<EmojiPickerFavoriteRowItem> items;

  @override
  double get height => kEmojiPickerCellSize;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {
    for (final EmojiPickerFavoriteRowItem item in items) {
      if (item is EmojiPickerFavoriteCustomRowItem) {
        ids.add(item.emoji.id);
      }
    }
  }
}

final class EmojiPickerFrecentEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerFrecentEmojiRowEntry({required this.items});

  final List<FrecentEmojiItem> items;

  @override
  double get height => kEmojiPickerCellSize;

  @override
  void collectVisibleCustomEmojiIds(Set<String> ids) {
    for (final FrecentEmojiItem item in items) {
      if (item is FrecentCustomEmoji) {
        ids.add(item.emoji.id);
      }
    }
  }
}

sealed class EmojiPickerFavoriteRowItem {
  const EmojiPickerFavoriteRowItem();
}

final class EmojiPickerFavoriteUnicodeRowItem
    extends EmojiPickerFavoriteRowItem {
  const EmojiPickerFavoriteUnicodeRowItem(this.emoji);

  final EmojiEntry emoji;
}

final class EmojiPickerFavoriteCustomRowItem
    extends EmojiPickerFavoriteRowItem {
  const EmojiPickerFavoriteCustomRowItem(this.emoji);

  final GuildEmojiEntry emoji;
}

class EmojiPickerLayoutIndex {
  EmojiPickerLayoutIndex(this.entries)
    : _tops = Float64List(entries.length + 1) {
    var offset = 0.0;
    for (var i = 0; i < entries.length; i++) {
      _tops[i] = offset;
      final EmojiPickerLayoutEntry entry = entries[i];
      if (entry is EmojiPickerSectionHeaderEntry) {
        _headerTops.add(offset);
        _headerKeys.add(entry.categoryKey);
      }
      offset += entry.height;
    }
    _tops[entries.length] = offset;
  }

  final List<EmojiPickerLayoutEntry> entries;

  /// Top offset of entry `i`; the last element is the total height.
  final Float64List _tops;
  final List<double> _headerTops = <double>[];
  final List<String> _headerKeys = <String>[];

  /// First index in [sorted] holding a value greater than [value].
  static int _upperBound(List<double> sorted, double value) {
    var lo = 0;
    var hi = sorted.length;
    while (lo < hi) {
      final int mid = (lo + hi) >> 1;
      if (sorted[mid] > value) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return lo;
  }

  int _firstIntersecting(double top) {
    final int i = _upperBound(_tops, top) - 1;
    return i < 0 ? 0 : i;
  }

  String? activeCategoryKey(double scrollOffset) {
    final int i = _upperBound(_headerTops, scrollOffset + 1) - 1;
    return i < 0 ? null : _headerKeys[i];
  }

  Set<String> visibleCustomEmojiIds({
    required double scrollOffset,
    required double viewportHeight,
  }) {
    final double visibleBottom = scrollOffset + viewportHeight;
    final Set<String> ids = <String>{};
    for (
      var i = _firstIntersecting(scrollOffset);
      i < entries.length && _tops[i] < visibleBottom;
      i++
    ) {
      entries[i].collectVisibleCustomEmojiIds(ids);
    }
    return ids;
  }

  Set<String> animatedCustomEmojiIds({
    required double scrollOffset,
    required double viewportHeight,
    required int maxAnimated,
    required bool scrollSettled,
  }) {
    if (!scrollSettled || maxAnimated <= 0) {
      return const <String>{};
    }
    final double visibleBottom = scrollOffset + viewportHeight;
    final double viewportCenter = scrollOffset + viewportHeight / 2;
    final List<({String id, double distance})> candidates =
        <({String id, double distance})>[];
    for (
      var i = _firstIntersecting(scrollOffset);
      i < entries.length && _tops[i] < visibleBottom;
      i++
    ) {
      final double entryCenter = (_tops[i] + _tops[i + 1]) / 2;
      _collectAnimatedCandidates(
        entry: entries[i],
        distance: (entryCenter - viewportCenter).abs(),
        candidates: candidates,
      );
    }
    candidates.sort(
      (({String id, double distance}) a, ({String id, double distance}) b) =>
          a.distance.compareTo(b.distance),
    );
    return candidates.take(maxAnimated).map((item) => item.id).toSet();
  }

  List<GuildEmojiEntry> customEmojisAhead({
    required double scrollOffset,
    required double viewportHeight,
    required int count,
  }) {
    if (count <= 0) {
      return const <GuildEmojiEntry>[];
    }
    final double aheadTop = scrollOffset + viewportHeight;
    final List<GuildEmojiEntry> emojis = <GuildEmojiEntry>[];
    // First entry fully at or past the viewport bottom.
    var i = _upperBound(_tops, aheadTop) - 1;
    if (i < 0 || _tops[i] < aheadTop) {
      i++;
    }
    for (; i < entries.length; i++) {
      _appendCustomEmojis(entries[i], emojis);
      if (emojis.length >= count) {
        return emojis.sublist(0, count);
      }
    }
    return emojis;
  }
}

void _appendCustomEmojis(
  EmojiPickerLayoutEntry entry,
  List<GuildEmojiEntry> target,
) {
  switch (entry) {
    case EmojiPickerCustomEmojiRowEntry(:final List<GuildEmojiEntry> emojis):
      target.addAll(emojis);
    case EmojiPickerFavoriteEmojiRowEntry(
      :final List<EmojiPickerFavoriteRowItem> items,
    ):
      for (final EmojiPickerFavoriteRowItem item in items) {
        if (item case EmojiPickerFavoriteCustomRowItem(
          :final GuildEmojiEntry emoji,
        )) {
          target.add(emoji);
        }
      }
    case EmojiPickerFrecentEmojiRowEntry(:final List<FrecentEmojiItem> items):
      for (final FrecentEmojiItem item in items) {
        if (item case FrecentCustomEmoji(:final GuildEmojiEntry emoji)) {
          target.add(emoji);
        }
      }
    default:
      break;
  }
}

void _collectAnimatedCandidates({
  required EmojiPickerLayoutEntry entry,
  required double distance,
  required List<({String id, double distance})> candidates,
}) {
  switch (entry) {
    case EmojiPickerCustomEmojiRowEntry(:final List<GuildEmojiEntry> emojis):
      for (final GuildEmojiEntry emoji in emojis) {
        if (emoji.animated) {
          candidates.add((id: emoji.id, distance: distance));
        }
      }
    case EmojiPickerFavoriteEmojiRowEntry(
      :final List<EmojiPickerFavoriteRowItem> items,
    ):
      for (final EmojiPickerFavoriteRowItem item in items) {
        if (item case EmojiPickerFavoriteCustomRowItem(
          :final GuildEmojiEntry emoji,
        )) {
          if (emoji.animated) {
            candidates.add((id: emoji.id, distance: distance));
          }
        }
      }
    case EmojiPickerFrecentEmojiRowEntry(:final List<FrecentEmojiItem> items):
      for (final FrecentEmojiItem item in items) {
        if (item case FrecentCustomEmoji(:final GuildEmojiEntry emoji)) {
          if (emoji.animated) {
            candidates.add((id: emoji.id, distance: distance));
          }
        }
      }
    default:
      break;
  }
}

List<EmojiPickerLayoutEntry> _chunkCustomRows(
  List<GuildEmojiEntry> emojis,
  int columns,
) {
  if (emojis.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < emojis.length; index += columns) {
    final int end = (index + columns).clamp(0, emojis.length);
    rows.add(
      EmojiPickerCustomEmojiRowEntry(emojis: emojis.sublist(index, end)),
    );
  }
  return rows;
}

List<EmojiPickerLayoutEntry> _chunkUnicodeRows(
  List<EmojiEntry> emojis,
  int columns,
) {
  if (emojis.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < emojis.length; index += columns) {
    final int end = (index + columns).clamp(0, emojis.length);
    rows.add(
      EmojiPickerUnicodeEmojiRowEntry(emojis: emojis.sublist(index, end)),
    );
  }
  return rows;
}

List<EmojiPickerLayoutEntry> _chunkFavoriteRows(
  List<EmojiPickerFavoriteRowItem> items,
  int columns,
) {
  if (items.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < items.length; index += columns) {
    final int end = (index + columns).clamp(0, items.length);
    rows.add(
      EmojiPickerFavoriteEmojiRowEntry(items: items.sublist(index, end)),
    );
  }
  return rows;
}

List<EmojiPickerLayoutEntry> _chunkFrecentRows(
  List<FrecentEmojiItem> items,
  int columns,
) {
  if (items.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < items.length; index += columns) {
    final int end = (index + columns).clamp(0, items.length);
    rows.add(EmojiPickerFrecentEmojiRowEntry(items: items.sublist(index, end)));
  }
  return rows;
}

EmojiPickerLayoutIndex buildEmojiPickerLayoutIndex({
  required Map<String, List<EmojiEntry>> unicodeCategories,
  required List<EmojiPickerFavoriteRowItem> favoriteItems,
  required List<FrecentEmojiItem> frecentItems,
  required List<MapEntry<String, List<GuildEmojiEntry>>> guildSections,
  required List<String> collapsedCategories,
  required int columns,
  required bool includeUpsell,
}) {
  final Map<String, List<EmojiEntry>> displayCategories =
      emojiPickerDisplayCategories(unicodeCategories);
  final List<EmojiPickerLayoutEntry> entries = <EmojiPickerLayoutEntry>[
    const EmojiPickerTopPaddingEntry(),
  ];
  if (includeUpsell) {
    entries.add(const EmojiPickerUpsellEntry());
  }
  if (favoriteItems.isNotEmpty) {
    entries.add(const EmojiPickerSectionHeaderEntry(categoryKey: 'favorites'));
    if (!collapsedCategories.contains('favorites')) {
      entries.addAll(_chunkFavoriteRows(favoriteItems, columns));
    }
  }
  if (frecentItems.isNotEmpty) {
    if (favoriteItems.isNotEmpty) {
      entries.add(const EmojiPickerSectionGapEntry());
    }
    entries.add(
      const EmojiPickerSectionHeaderEntry(categoryKey: 'frequently-used'),
    );
    if (!collapsedCategories.contains('frequently-used')) {
      entries.addAll(_chunkFrecentRows(frecentItems, columns));
    }
  }
  for (final MapEntry<String, List<GuildEmojiEntry>> section in guildSections) {
    entries
      ..add(const EmojiPickerSectionGapEntry())
      ..add(EmojiPickerSectionHeaderEntry(categoryKey: section.key));
    if (!collapsedCategories.contains(section.key)) {
      entries.addAll(_chunkCustomRows(section.value, columns));
    }
  }
  for (final String category in kEmojiCategoryOrder) {
    final List<EmojiEntry>? emojis = displayCategories[category];
    if (emojis == null || emojis.isEmpty) {
      continue;
    }
    entries
      ..add(const EmojiPickerSectionGapEntry())
      ..add(EmojiPickerSectionHeaderEntry(categoryKey: category));
    if (!collapsedCategories.contains(category)) {
      entries.addAll(_chunkUnicodeRows(emojis, columns));
    }
  }
  entries.add(const EmojiPickerTopPaddingEntry());
  return EmojiPickerLayoutIndex(entries);
}

Set<String> animatedCustomEmojiIdsForSearchGrid({
  required List<GuildEmojiEntry> customResults,
  required int columns,
  required double scrollOffset,
  required double viewportHeight,
  required int maxAnimated,
  required bool scrollSettled,
  double verticalPadding = 4,
}) {
  if (!scrollSettled || maxAnimated <= 0 || customResults.isEmpty) {
    return const <String>{};
  }
  final double viewportCenter = scrollOffset + viewportHeight / 2;
  final List<({String id, double distance})> candidates =
      <({String id, double distance})>[];
  for (var index = 0; index < customResults.length; index++) {
    final GuildEmojiEntry emoji = customResults[index];
    if (!emoji.animated) {
      continue;
    }
    final int row = index ~/ columns;
    final double rowCenter =
        verticalPadding + row * kEmojiPickerCellSize + kEmojiPickerCellSize / 2;
    candidates.add((
      id: emoji.id,
      distance: (rowCenter - viewportCenter).abs(),
    ));
  }
  candidates.sort(
    (({String id, double distance}) a, ({String id, double distance}) b) =>
        a.distance.compareTo(b.distance),
  );
  return candidates.take(maxAnimated).map((item) => item.id).toSet();
}

Set<String> visibleCustomEmojiIdsForSearchGrid({
  required List<GuildEmojiEntry> customResults,
  required int columns,
  required double scrollOffset,
  required double viewportHeight,
  double verticalPadding = 4,
}) {
  if (customResults.isEmpty || viewportHeight <= 0) {
    return const <String>{};
  }
  final double visibleTop = scrollOffset;
  final double visibleBottom = scrollOffset + viewportHeight;
  final Set<String> ids = <String>{};
  for (var index = 0; index < customResults.length; index++) {
    final int row = index ~/ columns;
    final double rowTop = verticalPadding + row * kEmojiPickerCellSize;
    final double rowBottom = rowTop + kEmojiPickerCellSize;
    if (rowBottom > visibleTop && rowTop < visibleBottom) {
      ids.add(customResults[index].id);
    }
  }
  return ids;
}
