import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fluxer_app/shared/utils/emoji_search.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart'
    show kSkinToneSurrogates;

class EmojiEntry {
  EmojiEntry({
    required this.names,
    required this.surrogates,
    required this.category,
    required this.spriteIndex,
    this.keywords = const <String>[],
    this.diversityIndex,
    this.hasDiversity = false,
    this.skinSurrogates = const <String>[],
  }) : namesLower = names.map((n) => n.toLowerCase()).toList(growable: false),
       keywordsLower = keywords
           .map((k) => k.toLowerCase())
           .toList(growable: false);

  final List<String> names;
  final List<String> namesLower;
  final List<String> keywords;
  final List<String> keywordsLower;
  final String surrogates;
  final String category;
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
  static RegExp? _unicodeEmojiRegex;

  static Future<String?> resolve(String name) async {
    _nameToSurrogate ??= await _loadNameMap();
    return _nameToSurrogate![name];
  }

  static String? resolveSync(String name) => _nameToSurrogate?[name];
  static RegExp? get unicodeEmojiRegexSync => _unicodeEmojiRegex;

  static Map<String, List<EmojiEntry>> get categories => _categories ?? {};

  static List<EmojiEntry> get allEmojis => _allEmojis ?? [];

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

  static Future<void> preload() async {
    if (_categories != null && _unicodeEmojiRegex != null) {
      return;
    }
    final raw = await rootBundle.loadString(_kAssetPath);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    _parseAll(json);
  }

  static void _parseAll(Map<String, dynamic> json) {
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
                        (skin as Map<String, dynamic>)['surrogates']
                            as String? ??
                        '',
                  )
                  .toList(growable: false);
        final hasDiversity = skinSurrogates.isNotEmpty;
        final emoji = EmojiEntry(
          names: names,
          surrogates: surrogates,
          keywords: keywords,
          category: category,
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

    _nameToSurrogate = nameMap;
    _nameToEntry = entryMap;
    _surrogateToEntry = surrogateMap;
    _categories = cats;
    _allEmojis = all;
    _unicodeEmojiRegex = _buildUnicodeEmojiRegex(unicodeSurrogates);
  }

  static Future<Map<String, String>> _loadNameMap() async {
    await preload();
    return _nameToSurrogate!;
  }

  static RegExp? _buildUnicodeEmojiRegex(Set<String> surrogates) {
    if (surrogates.isEmpty) {
      return null;
    }

    final patterns = <String, String>{};
    for (final surrogate in surrogates) {
      if (surrogate.endsWith('\uFE0F')) {
        final base = surrogate.substring(0, surrogate.length - 1);
        patterns[surrogate] = '${RegExp.escape(base)}(?:\\uFE0F)?';
      } else {
        patterns[surrogate] = RegExp.escape(surrogate);
      }
    }

    final ordered = surrogates.toList()
      ..sort((a, b) => b.length.compareTo(a.length));
    final pattern = ordered.map((s) => patterns[s]!).join('|');
    if (pattern.isEmpty) {
      return null;
    }
    return RegExp(pattern);
  }

  static List<EmojiEntry> search(String query) {
    final q = normalizeEmojiSearchQuery(query);
    if (q.isEmpty) {
      return <EmojiEntry>[];
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
    return ranked.map((r) => r.entry).toList(growable: false);
  }
}
