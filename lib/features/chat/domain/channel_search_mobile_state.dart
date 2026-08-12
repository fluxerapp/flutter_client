import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';

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

  ChannelSearchMobileChipState cleared() =>
      const ChannelSearchMobileChipState();

  factory ChannelSearchMobileChipState.fromHistoryEntry(
    ChannelSearchHistoryEntry entry,
  ) {
    final List<String> authorIds = entry.authorId
        .split(',')
        .map((String id) => id.trim())
        .where((String id) => id.isNotEmpty)
        .toList();
    return ChannelSearchMobileChipState(
      authorIds: authorIds.toSet(),
      usersByTag: entry.usersByTag,
      channelIds: entry.channelIds.toSet(),
      mentionIds: entry.mentionIds.toSet(),
      pinned: entry.pinned,
      authorTypes: entry.authorTypes.toSet(),
      linkHostname: entry.linkHostname,
      fileName: entry.fileName,
      fileExtension: entry.fileExtension,
      dateFilterKey: entry.dateFilterKey,
      dateValue: entry.dateValue,
    );
  }

  ChannelSearchHistoryEntry toHistoryEntry({
    required String contextKey,
    required String displayText,
    required int scopeIndex,
    required int sortIndex,
    required List<int> contentTypeIndices,
  }) {
    return ChannelSearchHistoryEntry(
      contextKey: contextKey,
      displayText: displayText,
      authorId: authorIds.join(','),
      scopeIndex: scopeIndex,
      sortIndex: sortIndex,
      contentTypeIndices: contentTypeIndices,
      timestampMs: DateTime.now().millisecondsSinceEpoch,
      channelIds: channelIds.toList(),
      mentionIds: mentionIds.toList(),
      pinned: pinned,
      authorTypes: authorTypes.toList(),
      linkHostname: linkHostname,
      fileName: fileName,
      fileExtension: fileExtension,
      dateFilterKey: dateFilterKey,
      dateValue: dateValue,
      usersByTag: usersByTag,
      channelsByName: channelNames,
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
