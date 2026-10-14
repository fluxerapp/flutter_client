import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';

class ChannelSearchMobileChipState {
  const ChannelSearchMobileChipState({
    this.authorIds = const <String>{},
    this.authorNames = const <String, String>{},
    this.usersByTag = const <String, String>{},
    this.channelIds = const <String>{},
    this.channelNames = const <String, String>{},
    this.mentionIds = const <String>{},
    this.mentionNames = const <String, String>{},
    this.pinned,
    this.authorTypes = const <String>{},
    this.linkHostname,
    this.fileName,
    this.fileExtension,
    this.dateFilterKey,
    this.dateValue,
  });

  final Set<String> authorIds;
  final Map<String, String> authorNames;
  final Map<String, String> usersByTag;
  final Set<String> channelIds;
  final Map<String, String> channelNames;
  final Set<String> mentionIds;
  final Map<String, String> mentionNames;
  final bool? pinned;
  final Set<String> authorTypes;
  final String? linkHostname;
  final String? fileName;
  final String? fileExtension;
  final String? dateFilterKey;
  final String? dateValue;

  bool get hasChipFilters => !toChipFilters().isEmpty;

  bool get hasMoreFilters =>
      pinned != null ||
      authorTypes.isNotEmpty ||
      (linkHostname?.trim().isNotEmpty ?? false) ||
      (fileName?.trim().isNotEmpty ?? false) ||
      (fileExtension?.trim().isNotEmpty ?? false) ||
      (dateFilterKey != null && (dateValue?.trim().isNotEmpty ?? false));

  ChannelSearchChipFilters toChipFilters() {
    return ChannelSearchChipFilters(
      authorIds: authorIds.toList(),
      mentionIds: mentionIds.toList(),
      channelIds: channelIds.toList(),
      pinned: pinned,
      authorTypes: authorTypes.toList(),
      linkHostname: linkHostname,
      fileName: fileName,
      fileExtension: fileExtension,
      dateFilterKey: dateFilterKey,
      dateValue: dateValue,
    );
  }

  ChannelSearchMobileChipState copyWith({
    Set<String>? authorIds,
    Map<String, String>? authorNames,
    Map<String, String>? usersByTag,
    Set<String>? channelIds,
    Map<String, String>? channelNames,
    Set<String>? mentionIds,
    Map<String, String>? mentionNames,
    Object? pinned = _unset,
    Set<String>? authorTypes,
    Object? linkHostname = _unset,
    Object? fileName = _unset,
    Object? fileExtension = _unset,
    Object? dateFilterKey = _unset,
    Object? dateValue = _unset,
  }) {
    return ChannelSearchMobileChipState(
      authorIds: authorIds ?? this.authorIds,
      authorNames: authorNames ?? this.authorNames,
      usersByTag: usersByTag ?? this.usersByTag,
      channelIds: channelIds ?? this.channelIds,
      channelNames: channelNames ?? this.channelNames,
      mentionIds: mentionIds ?? this.mentionIds,
      mentionNames: mentionNames ?? this.mentionNames,
      pinned: pinned == _unset ? this.pinned : pinned as bool?,
      authorTypes: authorTypes ?? this.authorTypes,
      linkHostname: linkHostname == _unset
          ? this.linkHostname
          : linkHostname as String?,
      fileName: fileName == _unset ? this.fileName : fileName as String?,
      fileExtension: fileExtension == _unset
          ? this.fileExtension
          : fileExtension as String?,
      dateFilterKey: dateFilterKey == _unset
          ? this.dateFilterKey
          : dateFilterKey as String?,
      dateValue: dateValue == _unset ? this.dateValue : dateValue as String?,
    );
  }

  factory ChannelSearchMobileChipState.fromHistoryEntry(
    ChannelSearchHistoryEntry entry,
  ) {
    final List<ChannelSearchToken> tokens = entry.query.tokens;
    Iterable<ChannelSearchToken> ofKind(ChannelSearchTokenKind kind) =>
        tokens.where((ChannelSearchToken token) => token.kind == kind);
    Map<String, String> labels(ChannelSearchTokenKind kind) => <String, String>{
      for (final ChannelSearchToken token in ofKind(kind))
        if (token.label != null) token.value: token.label!,
    };
    final ChannelSearchToken? pinnedToken = ofKind(
      ChannelSearchTokenKind.pinned,
    ).firstOrNull;
    final ChannelSearchToken? dateToken = tokens
        .where((ChannelSearchToken token) => token.kind.isDate)
        .firstOrNull;
    return ChannelSearchMobileChipState(
      authorIds: ofKind(
        ChannelSearchTokenKind.from,
      ).map((ChannelSearchToken token) => token.value).toSet(),
      authorNames: labels(ChannelSearchTokenKind.from),
      channelIds: ofKind(
        ChannelSearchTokenKind.channel,
      ).map((ChannelSearchToken token) => token.value).toSet(),
      channelNames: labels(ChannelSearchTokenKind.channel),
      mentionIds: ofKind(
        ChannelSearchTokenKind.mentions,
      ).map((ChannelSearchToken token) => token.value).toSet(),
      mentionNames: labels(ChannelSearchTokenKind.mentions),
      pinned: pinnedToken == null ? null : pinnedToken.value == 'true',
      authorTypes: ofKind(
        ChannelSearchTokenKind.authorType,
      ).map((ChannelSearchToken token) => token.value).toSet(),
      linkHostname: entry.isStructured ? null : entry.linkHostname,
      fileName: entry.isStructured ? null : entry.fileName,
      fileExtension: entry.isStructured ? null : entry.fileExtension,
      usersByTag: entry.usersByTag,
      dateFilterKey: dateToken?.kind.key,
      dateValue: dateToken?.value,
    );
  }

  List<ChannelSearchToken> toTokens({
    required Set<MessageSearchContentFilter> contentTypes,
  }) {
    final String? date = dateValue?.trim();
    final ChannelSearchTokenKind? dateKind = dateFilterKey == null
        ? null
        : ChannelSearchTokenKind.fromKey(dateFilterKey!);
    return <ChannelSearchToken>[
      for (final String id in authorIds)
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.from,
          value: id,
          label: authorNames[id],
        ),
      for (final String id in mentionIds)
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.mentions,
          value: id,
          label: mentionNames[id],
        ),
      for (final String id in channelIds)
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.channel,
          value: id,
          label: channelNames[id],
        ),
      for (final MessageSearchContentFilter filter in contentTypes)
        channelSearchHasToken(filter),
      if (pinned != null)
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.pinned,
          value: pinned.toString(),
        ),
      for (final String type in authorTypes)
        ChannelSearchToken(
          kind: ChannelSearchTokenKind.authorType,
          value: type,
        ),
      if (dateKind != null &&
          dateKind.isDate &&
          date != null &&
          date.isNotEmpty)
        ChannelSearchToken(kind: dateKind, value: date),
    ];
  }

  String historyText(String rawText) {
    return <String>[
      rawText.trim(),
      if (linkHostname?.trim().isNotEmpty ?? false)
        'link-from:${linkHostname!.trim()}',
      if (fileName?.trim().isNotEmpty ?? false) 'file-name:${fileName!.trim()}',
      if (fileExtension?.trim().isNotEmpty ?? false)
        'file-type:${fileExtension!.trim()}',
    ].where((String part) => part.isNotEmpty).join(' ');
  }

  ChannelSearchHistoryEntry toHistoryEntry({
    required String contextKey,
    required String displayText,
    required int scopeIndex,
    required int sortIndex,
    required Set<MessageSearchContentFilter> contentTypes,
  }) {
    return ChannelSearchHistoryEntry.fromQuery(
      contextKey: contextKey,
      text: historyText(displayText),
      tokens: toTokens(contentTypes: contentTypes),
      scopeIndex: scopeIndex,
      sortIndex: sortIndex,
      timestampMs: DateTime.now().millisecondsSinceEpoch,
    );
  }
}

const Object _unset = Object();

String? channelSearchMobileChipSummary({
  required int count,
  required String? singleLabel,
  required String multipleLabel,
}) {
  if (count == 0) {
    return null;
  }
  if (count == 1) {
    return singleLabel;
  }
  return multipleLabel;
}

bool channelSearchMobileCanSearch({
  required String rawQuery,
  required bool hasChipFilters,
  required Set<MessageSearchContentFilter> contentTypes,
}) {
  return rawQuery.trim().isNotEmpty ||
      hasChipFilters ||
      contentTypes.isNotEmpty;
}
