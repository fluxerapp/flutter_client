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
    this.channelIds = const <String>[],
    this.mentionIds = const <String>[],
    this.pinned,
    this.authorTypes = const <String>[],
    this.linkHostname,
    this.fileName,
    this.fileExtension,
    this.dateFilterKey,
    this.dateValue,
    this.usersByTag = const <String, String>{},
    this.channelsByName = const <String, String>{},
  });

  final String contextKey;
  final String displayText;
  final String authorId;
  final int scopeIndex;
  final int sortIndex;
  final List<int> contentTypeIndices;
  final int timestampMs;
  final List<String> channelIds;
  final List<String> mentionIds;
  final bool? pinned;
  final List<String> authorTypes;
  final String? linkHostname;
  final String? fileName;
  final String? fileExtension;
  final String? dateFilterKey;
  final String? dateValue;
  final Map<String, String> usersByTag;
  final Map<String, String> channelsByName;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'contextKey': contextKey,
    'displayText': displayText,
    'authorId': authorId,
    'scopeIndex': scopeIndex,
    'sortIndex': sortIndex,
    'contentTypeIndices': contentTypeIndices,
    'timestampMs': timestampMs,
    'channelIds': channelIds,
    'mentionIds': mentionIds,
    if (pinned != null) 'pinned': pinned,
    'authorTypes': authorTypes,
    if (linkHostname != null) 'linkHostname': linkHostname,
    if (fileName != null) 'fileName': fileName,
    if (fileExtension != null) 'fileExtension': fileExtension,
    if (dateFilterKey != null) 'dateFilterKey': dateFilterKey,
    if (dateValue != null) 'dateValue': dateValue,
    'usersByTag': usersByTag,
    'channelsByName': channelsByName,
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
      channelIds:
          (json['channelIds'] as List<dynamic>?)
              ?.map((dynamic e) => e as String)
              .toList() ??
          const <String>[],
      mentionIds:
          (json['mentionIds'] as List<dynamic>?)
              ?.map((dynamic e) => e as String)
              .toList() ??
          const <String>[],
      pinned: json['pinned'] as bool?,
      authorTypes:
          (json['authorTypes'] as List<dynamic>?)
              ?.map((dynamic e) => e as String)
              .toList() ??
          const <String>[],
      linkHostname: json['linkHostname'] as String?,
      fileName: json['fileName'] as String?,
      fileExtension: json['fileExtension'] as String?,
      dateFilterKey: json['dateFilterKey'] as String?,
      dateValue: json['dateValue'] as String?,
      usersByTag: _readStringMap(json['usersByTag']),
      channelsByName: _readStringMap(json['channelsByName']),
    );
  }
}

Map<String, String> _readStringMap(Object? value) {
  if (value is! Map) {
    return const <String, String>{};
  }
  return value.map(
    (dynamic key, dynamic entry) =>
        MapEntry<String, String>(key.toString(), entry.toString()),
  );
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
