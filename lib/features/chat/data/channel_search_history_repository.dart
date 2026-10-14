import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int _kMaxHistoryEntries = 20;
const String _kHistoryPrefsKey = 'channel_search_history_v1';
final RegExp _kSnowflakePattern = RegExp(r'^\d{17,20}$');

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
    this.text,
    this.tokens = const <ChannelSearchToken>[],
  });

  factory ChannelSearchHistoryEntry.fromQuery({
    required String contextKey,
    required String text,
    required List<ChannelSearchToken> tokens,
    required int scopeIndex,
    required int sortIndex,
    required int timestampMs,
  }) {
    final String trimmed = text.trim();
    return ChannelSearchHistoryEntry(
      contextKey: contextKey,
      displayText: serializeChannelSearchQuery(text: trimmed, tokens: tokens),
      authorId: '',
      scopeIndex: scopeIndex,
      sortIndex: sortIndex,
      contentTypeIndices: const <int>[],
      timestampMs: timestampMs,
      usersByTag: <String, String>{
        for (final ChannelSearchToken token in tokens)
          if (token.kind.isUser) token.label ?? token.value: token.value,
      },
      channelsByName: <String, String>{
        for (final ChannelSearchToken token in tokens)
          if (token.kind == ChannelSearchTokenKind.channel)
            token.label ?? token.value: token.value,
      },
      text: trimmed,
      tokens: tokens,
    );
  }

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
  final String? text;
  final List<ChannelSearchToken> tokens;

  bool get isStructured => text != null;

  ({String text, List<ChannelSearchToken> tokens}) get query {
    final String? structuredText = text;
    if (structuredText != null) {
      return (text: structuredText, tokens: tokens);
    }
    return _legacyQuery();
  }

  String get signature {
    final ({String text, List<ChannelSearchToken> tokens}) resolved = query;
    return channelSearchQuerySignature(
      text: resolved.text,
      tokens: resolved.tokens,
    );
  }

  bool refines(ChannelSearchHistoryEntry other) {
    if (contextKey != other.contextKey || signature == other.signature) {
      return false;
    }
    final ({String text, List<ChannelSearchToken> tokens}) mine = query;
    final ({String text, List<ChannelSearchToken> tokens}) theirs = other.query;
    final Set<String> myTokens = <String>{
      for (final ChannelSearchToken token in mine.tokens) token.signature,
    };
    return theirs.tokens.every(
          (ChannelSearchToken token) => myTokens.contains(token.signature),
        ) &&
        mine.text.trim().startsWith(theirs.text.trim());
  }

  bool get isEmpty {
    final ({String text, List<ChannelSearchToken> tokens}) resolved = query;
    return resolved.text.trim().isEmpty && resolved.tokens.isEmpty;
  }

  ({String text, List<ChannelSearchToken> tokens}) _legacyQuery() {
    final Map<String, String> userLabels = <String, String>{
      for (final MapEntry<String, String> entry in usersByTag.entries)
        entry.value: entry.key,
    };
    final Map<String, String> channelLabels = <String, String>{
      for (final MapEntry<String, String> entry in channelsByName.entries)
        entry.value: entry.key,
    };
    final List<ChannelSearchToken> parsedTokens = <ChannelSearchToken>[];
    final List<String> textParts = <String>[];

    for (final ChannelSearchSegment segment in parseChannelSearchDisplayText(
      displayText,
    )) {
      if (segment.type == ChannelSearchSegmentType.text) {
        textParts.add(segment.display.trim());
        continue;
      }
      final String raw = segment.rawValue ?? segment.display;
      final ChannelSearchToken? token = _legacyToken(
        filterKey: segment.filterKey,
        raw: raw,
      );
      if (token == null) {
        final String quoted = raw.contains(' ') ? '"$raw"' : raw;
        textParts.add('${segment.filterKey}:$quoted');
      } else {
        parsedTokens.add(token);
      }
    }

    for (final String id in authorId.split(',')) {
      final String trimmed = id.trim();
      if (trimmed.isNotEmpty) {
        parsedTokens.add(
          ChannelSearchToken(
            kind: ChannelSearchTokenKind.from,
            value: trimmed,
            label: userLabels[trimmed],
          ),
        );
      }
    }
    for (final String id in mentionIds) {
      parsedTokens.add(
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.mentions,
          value: id,
          label: userLabels[id],
        ),
      );
    }
    for (final String id in channelIds) {
      parsedTokens.add(
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.channel,
          value: id,
          label: channelLabels[id],
        ),
      );
    }
    for (final int index in contentTypeIndices) {
      if (index >= 0 && index < MessageSearchContentFilter.values.length) {
        parsedTokens.add(
          channelSearchHasToken(MessageSearchContentFilter.values[index]),
        );
      }
    }
    final bool? pinnedValue = pinned;
    if (pinnedValue != null) {
      parsedTokens.add(
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.pinned,
          value: pinnedValue.toString(),
        ),
      );
    }
    for (final String authorType in authorTypes) {
      parsedTokens.add(
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.authorType,
          value: authorType,
        ),
      );
    }
    final ChannelSearchTokenKind? dateKind = dateFilterKey == null
        ? null
        : ChannelSearchTokenKind.fromKey(dateFilterKey!);
    final String? date = dateValue?.trim();
    if (dateKind != null &&
        dateKind.isDate &&
        date != null &&
        date.isNotEmpty) {
      parsedTokens.add(ChannelSearchToken(kind: dateKind, value: date));
    }
    for (final (String key, String? value) in <(String, String?)>[
      ('link-from', linkHostname),
      ('file-name', fileName),
      ('file-type', fileExtension),
    ]) {
      final String? trimmed = value?.trim();
      if (trimmed != null && trimmed.isNotEmpty) {
        textParts.add('$key:$trimmed');
      }
    }

    return (
      text: textParts.where((String part) => part.isNotEmpty).join(' '),
      tokens: dedupeChannelSearchTokens(parsedTokens),
    );
  }

  ChannelSearchToken? _legacyToken({
    required String filterKey,
    required String raw,
  }) {
    if (filterKey.startsWith('-') || raw.trim().isEmpty) {
      return null;
    }
    final ChannelSearchTokenKind? kind = ChannelSearchTokenKind.fromKey(
      filterKey,
    );
    if (kind == null) {
      return null;
    }
    final String value = raw.trim();
    if (kind.isUser) {
      final String? id =
          usersByTag[value] ??
          (_kSnowflakePattern.hasMatch(value) ? value : null);
      if (id == null) {
        return null;
      }
      return ChannelSearchToken(
        kind: kind,
        value: id,
        label: id == value ? null : value,
      );
    }
    if (kind == ChannelSearchTokenKind.channel) {
      final String? id =
          channelsByName[value] ??
          (_kSnowflakePattern.hasMatch(value) ? value : null);
      if (id == null) {
        return null;
      }
      return ChannelSearchToken(
        kind: kind,
        value: id,
        label: id == value ? null : value,
      );
    }
    if (kind == ChannelSearchTokenKind.has) {
      final MessageSearchContentFilter? filter =
          channelSearchContentFilterForValue(value);
      return filter == null ? null : channelSearchHasToken(filter);
    }
    if (kind == ChannelSearchTokenKind.pinned) {
      final String lower = value.toLowerCase();
      if (lower != 'true' && lower != 'false') {
        return null;
      }
      return ChannelSearchToken(kind: kind, value: lower);
    }
    return ChannelSearchToken(kind: kind, value: value);
  }

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
    if (text != null) 'text': text,
    if (text != null)
      'tokens': tokens.map((ChannelSearchToken t) => t.toJson()).toList(),
  };

  factory ChannelSearchHistoryEntry.fromJson(Map<String, dynamic> json) {
    final Object? rawText = json['text'];
    final Object? rawTokens = json['tokens'];
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
      text: rawText is String ? rawText : null,
      tokens: rawTokens is List
          ? rawTokens
                .map(ChannelSearchToken.fromJson)
                .whereType<ChannelSearchToken>()
                .toList()
          : const <ChannelSearchToken>[],
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
    return _readAll()
        .where(
          (ChannelSearchHistoryEntry e) =>
              e.contextKey == contextKey && !e.isEmpty,
        )
        .toList();
  }

  Future<void> addEntry(
    ChannelSearchHistoryEntry entry, {
    ChannelSearchHistoryEntry? replacing,
  }) async {
    if (entry.isEmpty) {
      return;
    }
    final Set<String> signatures = <String>{
      entry.signature,
      if (replacing != null && entry.refines(replacing)) replacing.signature,
    };
    final List<ChannelSearchHistoryEntry> all = _readAll()
      ..removeWhere(
        (ChannelSearchHistoryEntry e) =>
            e.contextKey == entry.contextKey &&
            signatures.contains(e.signature),
      )
      ..insert(0, entry);
    await _write(all.take(_kMaxHistoryEntries).toList());
  }

  Future<void> removeEntry(ChannelSearchHistoryEntry entry) async {
    final String signature = entry.signature;
    final List<ChannelSearchHistoryEntry> all = _readAll()
      ..removeWhere(
        (ChannelSearchHistoryEntry e) =>
            e.contextKey == entry.contextKey && e.signature == signature,
      );
    await _write(all);
  }

  Future<void> clearForContext(String contextKey) async {
    final List<ChannelSearchHistoryEntry> all = _readAll()
      ..removeWhere(
        (ChannelSearchHistoryEntry e) => e.contextKey == contextKey,
      );
    await _write(all);
  }

  Future<void> _write(List<ChannelSearchHistoryEntry> entries) {
    return _prefs.setString(
      _kHistoryPrefsKey,
      jsonEncode(
        entries.map((ChannelSearchHistoryEntry e) => e.toJson()).toList(),
      ),
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
