import 'dart:convert';

import 'package:flutter/services.dart';

class EmojiEntry {
  const EmojiEntry({
    required this.names,
    required this.surrogates,
    required this.category,
    required this.spriteIndex,
    this.diversityIndex,
    this.hasDiversity = false,
  });

  final List<String> names;
  final String surrogates;
  final String category;
  final int spriteIndex;
  final int? diversityIndex;

  /// True if this emoji supports skin tone modifiers.
  final bool hasDiversity;

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
  static Map<String, List<EmojiEntry>>? _categories;
  static List<EmojiEntry>? _allEmojis;

  static Future<String?> resolve(String name) async {
    _nameToSurrogate ??= await _loadNameMap();
    return _nameToSurrogate![name];
  }

  static String? resolveSync(String name) => _nameToSurrogate?[name];

  static Map<String, List<EmojiEntry>> get categories => _categories ?? {};

  static List<EmojiEntry> get allEmojis => _allEmojis ?? [];

  static Future<void> preload() async {
    if (_categories != null) {
      return;
    }
    final raw = await rootBundle.loadString(_kAssetPath);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    _parseAll(json);
  }

  static void _parseAll(Map<String, dynamic> json) {
    final nameMap = <String, String>{};
    final cats = <String, List<EmojiEntry>>{};
    final all = <EmojiEntry>[];
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

        final names = (obj['names'] as List<dynamic>).cast<String>();
        final hasDiversity = obj.containsKey('skins');
        final emoji = EmojiEntry(
          names: names,
          surrogates: surrogates,
          category: category,
          spriteIndex: spriteIndex,
          diversityIndex: hasDiversity ? diversityIndex : null,
          hasDiversity: hasDiversity,
        );
        if (hasDiversity) {
          diversityIndex++;
        }
        spriteIndex++;
        list.add(emoji);
        all.add(emoji);
        for (final name in names) {
          nameMap[name] = surrogates;
        }
      }
      cats[category] = list;
    }

    _nameToSurrogate = nameMap;
    _categories = cats;
    _allEmojis = all;
  }

  static Future<Map<String, String>> _loadNameMap() async {
    await preload();
    return _nameToSurrogate!;
  }

  static List<EmojiEntry> search(String query) {
    if (query.isEmpty) {
      return [];
    }
    final q = query.toLowerCase();
    return allEmojis.where((e) => e.names.any((n) => n.contains(q))).toList();
  }
}
