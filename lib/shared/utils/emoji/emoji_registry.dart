import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_search.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_utils.dart'
    show kSkinToneSurrogates;

class EmojiEntry {
  EmojiEntry({
    required this.names,
    required this.surrogates,
    required this.spriteIndex,
    List<String> keywords = const <String>[],
    this.diversityIndex,
    this.hasDiversity = false,
    this.skinSurrogates = const <String>[],
  }) : namesLower = names.map((n) => n.toLowerCase()).toList(growable: false),
       keywordsLower = keywords
           .map((k) => k.toLowerCase())
           .toList(growable: false);

  final List<String> names;
  final List<String> namesLower;
  final List<String> keywordsLower;
  final String surrogates;
  final int spriteIndex;
  final int? diversityIndex;
  final bool hasDiversity;
  final List<String> skinSurrogates;

  String get primaryName => names.first;
}

const List<String> kEmojiCategoryOrder = [
  'people',
  'nature',
  'food',
  'activity',
  'travel',
  'objects',
  'symbols',
  'flags',
];

class EmojiRegistry {
  EmojiRegistry._();

  static const _kAssetPath = 'assets/emojis.json';

  static Map<String, String>? _nameToSurrogate;
  static Map<String, EmojiEntry>? _nameToEntry;
  static Map<String, EmojiEntry>? _surrogateToEntry;
  static Map<String, List<EmojiEntry>>? _categories;
  static List<EmojiEntry>? _allEmojis;
  static UnicodeEmojiMatcher? _unicodeEmojiMatcher;
  static int _maxUnicodeEmojiLength = 0;
  static String? _lastSearchQuery;
  static List<EmojiEntry>? _lastSearchResults;

  static String? resolveSync(String name) => _nameToSurrogate?[name];
  static UnicodeEmojiMatcher? get unicodeEmojiMatcherSync =>
      _unicodeEmojiMatcher;

  static int get maxUnicodeEmojiLength => _maxUnicodeEmojiLength;

  static Map<String, List<EmojiEntry>> get categories =>
      _categories ?? const {};

  static List<EmojiEntry> get allEmojis => _allEmojis ?? const [];

  static EmojiEntry? entryByName(String name) => _nameToEntry?[name];

  static EmojiEntry? entryBySurrogates(String surrogates) =>
      _surrogateToEntry?[surrogates];

  static String resolveSkinToneSurrogates(EmojiEntry emoji, String skinTone) {
    if (skinTone.isEmpty || !emoji.hasDiversity) {
      return emoji.surrogates;
    }
    final toneIndex = kSkinToneSurrogates.indexOf(skinTone);
    if (toneIndex >= 0 &&
        toneIndex < emoji.skinSurrogates.length &&
        emoji.skinSurrogates[toneIndex].isNotEmpty) {
      return emoji.skinSurrogates[toneIndex];
    }
    return emoji.surrogates;
  }

  static Future<void> ensureLoaded() => preload();

  static Future<void>? _pendingPreload;

  static Future<void> preload() {
    if (_categories != null && _unicodeEmojiMatcher != null) {
      return Future<void>.value();
    }
    return _pendingPreload ??= _doPreload().whenComplete(
      () => _pendingPreload = null,
    );
  }

  static Future<void> _doPreload() async {
    final ByteData asset = await rootBundle.load(_kAssetPath);
    final _EmojiCatalog catalog = await compute(_parseEmojiCatalog, asset);
    _nameToSurrogate = catalog.nameToSurrogate;
    _nameToEntry = catalog.nameToEntry;
    _surrogateToEntry = catalog.surrogateToEntry;
    _categories = catalog.categories;
    _allEmojis = catalog.allEmojis;
    _unicodeEmojiMatcher = catalog.unicodeEmojiMatcher;
    _maxUnicodeEmojiLength = catalog.maxUnicodeEmojiLength;
    _lastSearchQuery = null;
    _lastSearchResults = null;
  }

  static List<EmojiEntry> search(String query) {
    final q = normalizeEmojiSearchQuery(query);
    if (q.isEmpty) {
      return const <EmojiEntry>[];
    }
    if (q == _lastSearchQuery) {
      return _lastSearchResults!;
    }
    final entries = allEmojis;
    final ranked = <({EmojiEntry entry, int tier, int order})>[];
    for (var i = 0; i < entries.length; i++) {
      final e = entries[i];
      final tier = emojiMatchTier(
        names: e.names,
        namesLower: e.namesLower,
        keywordsLower: e.keywordsLower,
        query: q,
      );
      if (tier == null) {
        continue;
      }
      ranked.add((entry: e, tier: tier, order: i));
    }
    ranked.sort((a, b) {
      if (a.tier != b.tier) {
        return a.tier - b.tier;
      }
      final int byName = a.entry.primaryName.compareTo(b.entry.primaryName);
      return byName != 0 ? byName : a.order - b.order;
    });
    final results = ranked.map((r) => r.entry).toList(growable: false);
    _lastSearchQuery = q;
    _lastSearchResults = results;
    return results;
  }
}

class _EmojiCatalog {
  const _EmojiCatalog({
    required this.nameToSurrogate,
    required this.nameToEntry,
    required this.surrogateToEntry,
    required this.categories,
    required this.allEmojis,
    required this.unicodeEmojiMatcher,
    required this.maxUnicodeEmojiLength,
  });

  final Map<String, String> nameToSurrogate;
  final Map<String, EmojiEntry> nameToEntry;
  final Map<String, EmojiEntry> surrogateToEntry;
  final Map<String, List<EmojiEntry>> categories;
  final List<EmojiEntry> allEmojis;
  final UnicodeEmojiMatcher? unicodeEmojiMatcher;
  final int maxUnicodeEmojiLength;
}

_EmojiCatalog _parseEmojiCatalog(ByteData asset) {
  final Uint8List bytes = asset.buffer.asUint8List(
    asset.offsetInBytes,
    asset.lengthInBytes,
  );
  final json =
      utf8.decoder.fuse(const JsonDecoder()).convert(bytes)!
          as Map<String, dynamic>;
  final nameMap = <String, String>{};
  final entryMap = <String, EmojiEntry>{};
  final surrogateMap = <String, EmojiEntry>{};
  final cats = <String, List<EmojiEntry>>{};
  final all = <EmojiEntry>[];
  final unicodeSurrogates = <String>{};
  var spriteIndex = 0;
  var diversityIndex = 0;

  for (final category in kEmojiCategoryOrder) {
    final entries = json[category] as List<dynamic>?;
    if (entries == null) {
      continue;
    }

    final list = <EmojiEntry>[];
    for (final entry in entries) {
      final obj = entry as Map<String, dynamic>;
      final surrogates = obj['surrogates'] as String? ?? '';
      if (surrogates.isEmpty) {
        continue;
      }
      unicodeSurrogates.add(surrogates);

      final names = (obj['names'] as List<dynamic>).cast<String>();
      final keywords =
          (obj['keywords'] as List<dynamic>?)?.cast<String>() ??
          const <String>[];
      final skins = obj['skins'] as List<dynamic>?;
      final skinSurrogates = skins == null
          ? const <String>[]
          : skins
                .map(
                  (skin) =>
                      (skin as Map<String, dynamic>)['surrogates'] as String? ??
                      '',
                )
                .toList(growable: false);
      final hasDiversity = skinSurrogates.isNotEmpty;
      final emoji = EmojiEntry(
        names: names,
        surrogates: surrogates,
        keywords: keywords,
        spriteIndex: spriteIndex,
        diversityIndex: hasDiversity ? diversityIndex : null,
        hasDiversity: hasDiversity,
        skinSurrogates: skinSurrogates,
      );
      if (hasDiversity) {
        diversityIndex++;
      }
      spriteIndex++;
      list.add(emoji);
      all.add(emoji);
      surrogateMap[surrogates] = emoji;
      for (final name in names) {
        nameMap[name] = surrogates;
        entryMap[name] = emoji;
      }

      for (var i = 0; i < skinSurrogates.length; i++) {
        final skinSurrogatesValue = skinSurrogates[i];
        if (skinSurrogatesValue.isEmpty) {
          continue;
        }
        unicodeSurrogates.add(skinSurrogatesValue);
        surrogateMap.putIfAbsent(skinSurrogatesValue, () => emoji);
        if (i >= kSkinToneSurrogates.length) {
          continue;
        }
        final skinToneName = 'skin-tone-${i + 1}';
        for (final name in names) {
          final skinName = '$name::$skinToneName';
          nameMap[skinName] = skinSurrogatesValue;
        }
      }
    }
    cats[category] = list;
  }

  final shortcuts = json['shortcuts'] as Map<String, dynamic>?;
  if (shortcuts != null) {
    for (final entry in shortcuts.entries) {
      final targetName = entry.value as String;
      final targetSurrogate = nameMap[targetName];
      if (targetSurrogate != null) {
        nameMap[entry.key] = targetSurrogate;
      }
    }
  }

  for (var i = 0; i < kSkinToneSurrogates.length; i++) {
    nameMap['skin-tone-${i + 1}'] = kSkinToneSurrogates[i];
  }

  return _EmojiCatalog(
    nameToSurrogate: nameMap,
    nameToEntry: entryMap,
    surrogateToEntry: surrogateMap,
    categories: cats,
    allEmojis: all,
    unicodeEmojiMatcher: unicodeSurrogates.isEmpty
        ? null
        : UnicodeEmojiMatcher._(unicodeSurrogates),
    maxUnicodeEmojiLength: unicodeSurrogates.fold<int>(
      0,
      (int longest, String surrogates) =>
          surrogates.length > longest ? surrogates.length : longest,
    ),
  );
}

class UnicodeEmojiMatcher {
  UnicodeEmojiMatcher._(Set<String> surrogates) {
    for (final surrogate in surrogates) {
      _add(surrogate);
      if (surrogate.length > 1 && surrogate.endsWith('\uFE0F')) {
        _add(surrogate.substring(0, surrogate.length - 1));
      }
    }
  }

  final Set<String> _sequences = <String>{};
  final Map<int, int> _maxLengthByFirstUnit = <int, int>{};

  void _add(String sequence) {
    _sequences.add(sequence);
    final int first = sequence.codeUnitAt(0);
    final int longest = _maxLengthByFirstUnit[first] ?? 0;
    if (sequence.length > longest) {
      _maxLengthByFirstUnit[first] = sequence.length;
    }
  }

  List<({int start, int end})> matches(String text) {
    final List<({int start, int end})> found = <({int start, int end})>[];
    int position = 0;
    while (position < text.length) {
      final int? longest = _maxLengthByFirstUnit[text.codeUnitAt(position)];
      int end = position + 1;
      bool matched = false;
      if (longest != null) {
        final int remaining = text.length - position;
        for (
          int length = longest < remaining ? longest : remaining;
          length > 0;
          length--
        ) {
          if (_sequences.contains(
            text.substring(position, position + length),
          )) {
            end = position + length;
            matched = true;
            break;
          }
        }
      }
      if (matched) {
        found.add((start: position, end: end));
      }
      position = end;
    }
    return found;
  }
}
