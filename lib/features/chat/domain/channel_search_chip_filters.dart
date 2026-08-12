import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';

class ChannelSearchChipFilters {
  const ChannelSearchChipFilters({
    this.authorIds = const <String>[],
    this.mentionIds = const <String>[],
    this.channelIds = const <String>[],
    this.contentTypes = const <MessageSearchContentFilter>{},
    this.pinned,
    this.authorTypes = const <String>[],
    this.linkHostname,
    this.fileName,
    this.fileExtension,
    this.dateFilterKey,
    this.dateValue,
  });

  final List<String> authorIds;
  final List<String> mentionIds;
  final List<String> channelIds;
  final Set<MessageSearchContentFilter> contentTypes;
  final bool? pinned;
  final List<String> authorTypes;
  final String? linkHostname;
  final String? fileName;
  final String? fileExtension;
  final String? dateFilterKey;
  final String? dateValue;

  bool get isEmpty =>
      authorIds.isEmpty &&
      mentionIds.isEmpty &&
      channelIds.isEmpty &&
      contentTypes.isEmpty &&
      pinned == null &&
      authorTypes.isEmpty &&
      (linkHostname == null || linkHostname!.trim().isEmpty) &&
      (fileName == null || fileName!.trim().isEmpty) &&
      (fileExtension == null || fileExtension!.trim().isEmpty) &&
      (dateFilterKey == null || dateValue == null || dateValue!.trim().isEmpty);

  ChannelSearchChipFilters copyWith({
    List<String>? authorIds,
    List<String>? mentionIds,
    List<String>? channelIds,
    Set<MessageSearchContentFilter>? contentTypes,
    Object? pinned = _unset,
    List<String>? authorTypes,
    Object? linkHostname = _unset,
    Object? fileName = _unset,
    Object? fileExtension = _unset,
    Object? dateFilterKey = _unset,
    Object? dateValue = _unset,
  }) {
    return ChannelSearchChipFilters(
      authorIds: authorIds ?? this.authorIds,
      mentionIds: mentionIds ?? this.mentionIds,
      channelIds: channelIds ?? this.channelIds,
      contentTypes: contentTypes ?? this.contentTypes,
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
}

const Object _unset = Object();

extension ChannelSearchChipFiltersMerge on ParsedChannelSearchParams {
  ParsedChannelSearchParams mergeChipFilters({
    String? authorId,
    Set<MessageSearchContentFilter>? contentTypes,
    ChannelSearchChipFilters chips = const ChannelSearchChipFilters(),
  }) {
    ParsedChannelSearchParams next = this;

    final List<String> mergedAuthors = <String>[
      ...next.authorIds,
      if (authorId != null && authorId.trim().isNotEmpty)
        ...authorId.split(RegExp(r'[\s,]+')).where((String v) => v.isNotEmpty),
      ...chips.authorIds,
    ];
    if (mergedAuthors.isNotEmpty) {
      next = next.copyWith(authorIds: mergedAuthors.toSet().toList());
    }

    final List<String> mergedMentions = <String>[
      ...next.mentions,
      ...chips.mentionIds,
    ];
    if (mergedMentions.isNotEmpty) {
      next = next.copyWith(mentions: mergedMentions.toSet().toList());
    }

    final List<String> mergedChannels = <String>[
      ...next.channelIds,
      ...chips.channelIds,
    ];
    if (mergedChannels.isNotEmpty) {
      next = next.copyWith(channelIds: mergedChannels.toSet().toList());
    }

    final Set<MessageSearchContentFilter> mergedContentTypes =
        <MessageSearchContentFilter>{
          ...next.hasContentFilters,
          if (contentTypes != null) ...contentTypes,
          ...chips.contentTypes,
        };
    if (mergedContentTypes.isNotEmpty) {
      final List<String> mergedHas = <String>[
        ...next.has,
        ...mergedContentTypes.map(channelSearchHasValueForContentFilter),
      ];
      next = next.copyWith(has: mergedHas.toSet().toList());
    }

    if (chips.pinned != null) {
      next = next.copyWith(pinned: chips.pinned);
    }

    if (chips.authorTypes.isNotEmpty) {
      next = next.copyWith(
        authorTypes: <String>[
          ...next.authorTypes,
          ...chips.authorTypes,
        ].toSet().toList(),
      );
    }

    final String? link = chips.linkHostname?.trim();
    if (link != null && link.isNotEmpty) {
      next = next.copyWith(
        linkHostnames: <String>[...next.linkHostnames, link].toSet().toList(),
      );
    }

    final String? filename = chips.fileName?.trim();
    if (filename != null && filename.isNotEmpty) {
      next = next.copyWith(
        attachmentFilenames: <String>[
          ...next.attachmentFilenames,
          filename,
        ].toSet().toList(),
      );
    }

    final String? extension = chips.fileExtension?.trim();
    if (extension != null && extension.isNotEmpty) {
      next = next.copyWith(
        attachmentExtensions: <String>[
          ...next.attachmentExtensions,
          extension,
        ].toSet().toList(),
      );
    }

    if (chips.dateFilterKey != null &&
        chips.dateValue != null &&
        chips.dateValue!.trim().isNotEmpty) {
      next = applyChannelSearchDateChip(
        next,
        filterKey: chips.dateFilterKey!,
        value: chips.dateValue!.trim(),
      );
    }

    return next;
  }
}

String channelSearchHasValueForContentFilter(
  MessageSearchContentFilter filter,
) {
  return switch (filter) {
    MessageSearchContentFilter.image => 'image',
    MessageSearchContentFilter.video => 'video',
    MessageSearchContentFilter.audio => 'sound',
    MessageSearchContentFilter.file => 'file',
    MessageSearchContentFilter.link => 'link',
    MessageSearchContentFilter.embed => 'embed',
    MessageSearchContentFilter.sticker => 'sticker',
    MessageSearchContentFilter.poll => 'poll',
    MessageSearchContentFilter.forward => 'snapshot',
  };
}
