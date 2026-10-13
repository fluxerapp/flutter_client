import 'dart:typed_data';

import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/emoji_picker_display_categories.dart';
import 'package:fluxer_app/features/chat/utils/composer/emoji_picker_rendering_policy.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

class EmojiPickerGridMetrics {
  const EmojiPickerGridMetrics({
    required this.rowHeight,
    required this.headerHeight,
    required this.sectionGap,
    required this.topPadding,
  });

  static const EmojiPickerGridMetrics standard = EmojiPickerGridMetrics(
    rowHeight: kEmojiPickerCellSize,
    headerHeight: kEmojiPickerHeaderHeight,
    sectionGap: kEmojiPickerSectionGap,
    topPadding: kEmojiPickerTopPadding,
  );

  static const EmojiPickerGridMetrics mobile = EmojiPickerGridMetrics(
    rowHeight: kEmojiPickerMobileRowHeight,
    headerHeight: kEmojiPickerMobileHeaderHeight,
    sectionGap: 0,
    topPadding: 0,
  );

  final double rowHeight;
  final double headerHeight;
  final double sectionGap;
  final double topPadding;
}

sealed class EmojiPickerLayoutEntry {
  const EmojiPickerLayoutEntry();

  double get height;
}

final class EmojiPickerTopPaddingEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerTopPaddingEntry({this.height = kEmojiPickerTopPadding});

  @override
  final double height;
}

final class EmojiPickerUpsellEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerUpsellEntry({
    this.height = kEmojiPickerUpsellEstimatedHeight,
  });

  @override
  final double height;
}

final class EmojiPickerSectionGapEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerSectionGapEntry({this.height = kEmojiPickerSectionGap});

  @override
  final double height;
}

final class EmojiPickerSectionHeaderEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerSectionHeaderEntry({
    required this.categoryKey,
    this.height = kEmojiPickerHeaderHeight,
  });

  final String categoryKey;

  @override
  final double height;
}

final class EmojiPickerCustomEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerCustomEmojiRowEntry({
    required this.emojis,
    this.height = kEmojiPickerCellSize,
  });

  final List<GuildEmojiEntry> emojis;

  @override
  final double height;
}

final class EmojiPickerUnicodeEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerUnicodeEmojiRowEntry({
    required this.emojis,
    this.height = kEmojiPickerCellSize,
  });

  final List<EmojiEntry> emojis;

  @override
  final double height;
}

final class EmojiPickerFavoriteEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerFavoriteEmojiRowEntry({
    required this.items,
    this.height = kEmojiPickerCellSize,
  });

  final List<EmojiPickerFavoriteRowItem> items;

  @override
  final double height;
}

final class EmojiPickerFrecentEmojiRowEntry extends EmojiPickerLayoutEntry {
  const EmojiPickerFrecentEmojiRowEntry({
    required this.items,
    this.height = kEmojiPickerCellSize,
  });

  final List<FrecentEmojiItem> items;

  @override
  final double height;
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

  final Float64List _tops;
  final List<double> _headerTops = <double>[];
  final List<String> _headerKeys = <String>[];

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

  double? headerTop(String categoryKey) {
    final int i = _headerKeys.indexOf(categoryKey);
    return i < 0 ? null : _headerTops[i];
  }

  String? activeCategoryKey(double scrollOffset) {
    final int i = _upperBound(_headerTops, scrollOffset + 1) - 1;
    return i < 0 ? null : _headerKeys[i];
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
  double rowHeight,
) {
  if (emojis.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < emojis.length; index += columns) {
    final int end = (index + columns).clamp(0, emojis.length);
    rows.add(
      EmojiPickerCustomEmojiRowEntry(
        emojis: emojis.sublist(index, end),
        height: rowHeight,
      ),
    );
  }
  return rows;
}

List<EmojiPickerLayoutEntry> _chunkUnicodeRows(
  List<EmojiEntry> emojis,
  int columns,
  double rowHeight,
) {
  if (emojis.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < emojis.length; index += columns) {
    final int end = (index + columns).clamp(0, emojis.length);
    rows.add(
      EmojiPickerUnicodeEmojiRowEntry(
        emojis: emojis.sublist(index, end),
        height: rowHeight,
      ),
    );
  }
  return rows;
}

List<EmojiPickerLayoutEntry> _chunkFavoriteRows(
  List<EmojiPickerFavoriteRowItem> items,
  int columns,
  double rowHeight,
) {
  if (items.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < items.length; index += columns) {
    final int end = (index + columns).clamp(0, items.length);
    rows.add(
      EmojiPickerFavoriteEmojiRowEntry(
        items: items.sublist(index, end),
        height: rowHeight,
      ),
    );
  }
  return rows;
}

List<EmojiPickerLayoutEntry> _chunkFrecentRows(
  List<FrecentEmojiItem> items,
  int columns,
  double rowHeight,
) {
  if (items.isEmpty) {
    return const <EmojiPickerLayoutEntry>[];
  }
  final List<EmojiPickerLayoutEntry> rows = <EmojiPickerLayoutEntry>[];
  for (var index = 0; index < items.length; index += columns) {
    final int end = (index + columns).clamp(0, items.length);
    rows.add(
      EmojiPickerFrecentEmojiRowEntry(
        items: items.sublist(index, end),
        height: rowHeight,
      ),
    );
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
  EmojiPickerGridMetrics metrics = EmojiPickerGridMetrics.standard,
}) {
  final Map<String, List<EmojiEntry>> displayCategories =
      emojiPickerDisplayCategories(unicodeCategories);
  final List<EmojiPickerLayoutEntry> entries = <EmojiPickerLayoutEntry>[
    EmojiPickerTopPaddingEntry(height: metrics.topPadding),
  ];
  if (includeUpsell) {
    entries.add(const EmojiPickerUpsellEntry());
  }
  if (favoriteItems.isNotEmpty) {
    entries.add(
      EmojiPickerSectionHeaderEntry(
        categoryKey: 'favorites',
        height: metrics.headerHeight,
      ),
    );
    if (!collapsedCategories.contains('favorites')) {
      entries.addAll(
        _chunkFavoriteRows(favoriteItems, columns, metrics.rowHeight),
      );
    }
  }
  if (frecentItems.isNotEmpty) {
    if (favoriteItems.isNotEmpty) {
      entries.add(EmojiPickerSectionGapEntry(height: metrics.sectionGap));
    }
    entries.add(
      EmojiPickerSectionHeaderEntry(
        categoryKey: 'frequently-used',
        height: metrics.headerHeight,
      ),
    );
    if (!collapsedCategories.contains('frequently-used')) {
      entries.addAll(
        _chunkFrecentRows(frecentItems, columns, metrics.rowHeight),
      );
    }
  }
  for (final MapEntry<String, List<GuildEmojiEntry>> section in guildSections) {
    entries
      ..add(EmojiPickerSectionGapEntry(height: metrics.sectionGap))
      ..add(
        EmojiPickerSectionHeaderEntry(
          categoryKey: section.key,
          height: metrics.headerHeight,
        ),
      );
    if (!collapsedCategories.contains(section.key)) {
      entries.addAll(
        _chunkCustomRows(section.value, columns, metrics.rowHeight),
      );
    }
  }
  for (final String category in kEmojiCategoryOrder) {
    final List<EmojiEntry>? emojis = displayCategories[category];
    if (emojis == null || emojis.isEmpty) {
      continue;
    }
    entries
      ..add(EmojiPickerSectionGapEntry(height: metrics.sectionGap))
      ..add(
        EmojiPickerSectionHeaderEntry(
          categoryKey: category,
          height: metrics.headerHeight,
        ),
      );
    if (!collapsedCategories.contains(category)) {
      entries.addAll(_chunkUnicodeRows(emojis, columns, metrics.rowHeight));
    }
  }
  entries.add(EmojiPickerTopPaddingEntry(height: metrics.topPadding));
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
  double rowHeight = kEmojiPickerCellSize,
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
    final double rowCenter = verticalPadding + row * rowHeight + rowHeight / 2;
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
