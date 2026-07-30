import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int _kMaxHistoryEntries = 20;
const String _kHistoryPrefsKey = 'channel_search_history_v1';

class ChannelSearchHistoryEntry {
  const ChannelSearchHistoryEntry({
    required this.contextKey,
    required this.displayText,
    required this.authorId,
    required this.scopeIndex,
    required this.sortIndex,
    required this.contentTypeIndices,
    required this.timestampMs,
  });

  final String contextKey;
  final String displayText;
  final String authorId;
  final int scopeIndex;
  final int sortIndex;
  final List<int> contentTypeIndices;
  final int timestampMs;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'contextKey': contextKey,
    'displayText': displayText,
    'authorId': authorId,
    'scopeIndex': scopeIndex,
    'sortIndex': sortIndex,
    'contentTypeIndices': contentTypeIndices,
    'timestampMs': timestampMs,
  };

  factory ChannelSearchHistoryEntry.fromJson(Map<String, dynamic> json) {
    return ChannelSearchHistoryEntry(
      contextKey: json['contextKey'] as String? ?? '',
      displayText: json['displayText'] as String? ?? '',
      authorId: json['authorId'] as String? ?? '',
      scopeIndex: json['scopeIndex'] as int? ?? 0,
      sortIndex: json['sortIndex'] as int? ?? 0,
      contentTypeIndices:
          (json['contentTypeIndices'] as List<dynamic>?)
              ?.map((dynamic e) => e as int)
              .toList() ??
          const <int>[],
      timestampMs: json['timestampMs'] as int? ?? 0,
    );
  }
}

class ChannelSearchHistoryRepository {
  ChannelSearchHistoryRepository(this._prefs);

  final SharedPreferences _prefs;

  List<ChannelSearchHistoryEntry> readForContext(String contextKey) {
    final String? raw = _prefs.getString(_kHistoryPrefsKey);
    if (raw == null || raw.isEmpty) {
      return const <ChannelSearchHistoryEntry>[];
    }
    try {
      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map(
            (dynamic e) =>
                ChannelSearchHistoryEntry.fromJson(e as Map<String, dynamic>),
          )
          .where((ChannelSearchHistoryEntry e) => e.contextKey == contextKey)
          .toList();
    } on Object {
      return const <ChannelSearchHistoryEntry>[];
    }
  }

  Future<void> addEntry(ChannelSearchHistoryEntry entry) async {
    final List<ChannelSearchHistoryEntry> all = _readAll()
      ..removeWhere(
        (ChannelSearchHistoryEntry e) =>
            e.contextKey == entry.contextKey &&
            e.displayText == entry.displayText,
      );
    all.insert(0, entry);
    final List<ChannelSearchHistoryEntry> trimmed = all
        .take(_kMaxHistoryEntries)
        .toList();
    await _prefs.setString(
      _kHistoryPrefsKey,
      jsonEncode(
        trimmed.map((ChannelSearchHistoryEntry e) => e.toJson()).toList(),
      ),
    );
  }

  Future<void> clearForContext(String contextKey) async {
    final List<ChannelSearchHistoryEntry> all = _readAll()
      ..removeWhere(
        (ChannelSearchHistoryEntry e) => e.contextKey == contextKey,
      );
    await _prefs.setString(
      _kHistoryPrefsKey,
      jsonEncode(all.map((ChannelSearchHistoryEntry e) => e.toJson()).toList()),
    );
  }

  List<ChannelSearchHistoryEntry> _readAll() {
    final String? raw = _prefs.getString(_kHistoryPrefsKey);
    if (raw == null || raw.isEmpty) {
      return <ChannelSearchHistoryEntry>[];
    }
    try {
      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map(
            (dynamic e) =>
                ChannelSearchHistoryEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } on Object {
      return <ChannelSearchHistoryEntry>[];
    }
  }
}

final channelSearchHistoryRepositoryProvider =
    FutureProvider<ChannelSearchHistoryRepository>((Ref ref) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return ChannelSearchHistoryRepository(prefs);
    });

String channelSearchContextKey({required String channelId, String? guildId}) {
  if (guildId != null && guildId.isNotEmpty) {
    return 'guild:$guildId:channel:$channelId';
  }
  return 'dm:$channelId';
}
