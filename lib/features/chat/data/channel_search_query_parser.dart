import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

class ChannelSearchParseHints {
  const ChannelSearchParseHints({
    this.usersByTag = const <String, String>{},
    this.channelsByName = const <String, String>{},
  });

  final Map<String, String> usersByTag;
  final Map<String, String> channelsByName;

  ChannelSearchParseHints merge(ChannelSearchParseHints other) {
    return ChannelSearchParseHints(
      usersByTag: <String, String>{...usersByTag, ...other.usersByTag},
      channelsByName: <String, String>{
        ...channelsByName,
        ...other.channelsByName,
      },
    );
  }
}

typedef ChannelIdResolver = String? Function(String channelName);
typedef UserIdResolver = String? Function(String tag);

final RegExp _snowflakeIdPattern = RegExp(r'^\d{17,20}$');

class ChannelSearchParseContext {
  const ChannelSearchParseContext({
    this.guildId,
    this.currentUserId,
    this.resolveChannelByName,
    this.resolveUserByTag,
  });

  final String? guildId;
  final String? currentUserId;
  final ChannelIdResolver? resolveChannelByName;
  final UserIdResolver? resolveUserByTag;
}

class ParsedChannelSearchParams {
  const ParsedChannelSearchParams({
    this.content,
    this.contents = const <String>[],
    this.exactPhrases = const <String>[],
    this.minId,
    this.maxId,
    this.channelIds = const <String>[],
    this.excludeChannelIds = const <String>[],
    this.authorIds = const <String>[],
    this.excludeAuthorIds = const <String>[],
    this.mentions = const <String>[],
    this.excludeMentions = const <String>[],
    this.mentionEveryone,
    this.pinned,
    this.has = const <String>[],
    this.excludeHas = const <String>[],
    this.authorTypes = const <String>[],
    this.excludeAuthorTypes = const <String>[],
    this.embedTypes = const <String>[],
    this.excludeEmbedTypes = const <String>[],
    this.embedProviders = const <String>[],
    this.excludeEmbedProviders = const <String>[],
    this.linkHostnames = const <String>[],
    this.excludeLinkHostnames = const <String>[],
    this.attachmentFilenames = const <String>[],
    this.excludeAttachmentFilenames = const <String>[],
    this.attachmentExtensions = const <String>[],
    this.excludeAttachmentExtensions = const <String>[],
    this.sortBy,
    this.sortOrder,
    this.scope,
    this.includeNsfw,
  });

  final String? content;
  final List<String> contents;
  final List<String> exactPhrases;
  final String? minId;
  final String? maxId;
  final List<String> channelIds;
  final List<String> excludeChannelIds;
  final List<String> authorIds;
  final List<String> excludeAuthorIds;
  final List<String> mentions;
  final List<String> excludeMentions;
  final bool? mentionEveryone;
  final bool? pinned;
  final List<String> has;
  final List<String> excludeHas;
  final List<String> authorTypes;
  final List<String> excludeAuthorTypes;
  final List<String> embedTypes;
  final List<String> excludeEmbedTypes;
  final List<String> embedProviders;
  final List<String> excludeEmbedProviders;
  final List<String> linkHostnames;
  final List<String> excludeLinkHostnames;
  final List<String> attachmentFilenames;
  final List<String> excludeAttachmentFilenames;
  final List<String> attachmentExtensions;
  final List<String> excludeAttachmentExtensions;
  final String? sortBy;
  final String? sortOrder;
  final MessageSearchScopeFilter? scope;
  final bool? includeNsfw;

  bool get hasSearchTerms =>
      (content?.trim().isNotEmpty ?? false) ||
      contents.isNotEmpty ||
      exactPhrases.isNotEmpty ||
      minId != null ||
      maxId != null ||
      channelIds.isNotEmpty ||
      excludeChannelIds.isNotEmpty ||
      authorIds.isNotEmpty ||
      excludeAuthorIds.isNotEmpty ||
      mentions.isNotEmpty ||
      excludeMentions.isNotEmpty ||
      (mentionEveryone ?? false) ||
      pinned != null ||
      has.isNotEmpty ||
      excludeHas.isNotEmpty ||
      authorTypes.isNotEmpty ||
      excludeAuthorTypes.isNotEmpty ||
      embedTypes.isNotEmpty ||
      excludeEmbedTypes.isNotEmpty ||
      embedProviders.isNotEmpty ||
      excludeEmbedProviders.isNotEmpty ||
      linkHostnames.isNotEmpty ||
      excludeLinkHostnames.isNotEmpty ||
      attachmentFilenames.isNotEmpty ||
      excludeAttachmentFilenames.isNotEmpty ||
      attachmentExtensions.isNotEmpty ||
      excludeAttachmentExtensions.isNotEmpty ||
      includeNsfw != null;

  Set<MessageSearchContentFilter> get hasContentFilters {
    final Set<MessageSearchContentFilter> values =
        <MessageSearchContentFilter>{};
    for (final String value in has) {
      final MessageSearchContentFilter? mapped = _contentFilterForHasValue(
        value,
      );
      if (mapped != null) {
        values.add(mapped);
      }
    }
    return values;
  }

  ParsedChannelSearchParams copyWith({
    String? content,
    List<String>? contents,
    List<String>? exactPhrases,
    String? minId,
    String? maxId,
    List<String>? channelIds,
    List<String>? excludeChannelIds,
    List<String>? authorIds,
    List<String>? excludeAuthorIds,
    List<String>? mentions,
    List<String>? excludeMentions,
    bool? mentionEveryone,
    bool? pinned,
    List<String>? has,
    List<String>? excludeHas,
    List<String>? authorTypes,
    List<String>? excludeAuthorTypes,
    List<String>? embedTypes,
    List<String>? excludeEmbedTypes,
    List<String>? embedProviders,
    List<String>? excludeEmbedProviders,
    List<String>? linkHostnames,
    List<String>? excludeLinkHostnames,
    List<String>? attachmentFilenames,
    List<String>? excludeAttachmentFilenames,
    List<String>? attachmentExtensions,
    List<String>? excludeAttachmentExtensions,
    String? sortBy,
    String? sortOrder,
    MessageSearchScopeFilter? scope,
    bool? includeNsfw,
  }) {
    return ParsedChannelSearchParams(
      content: content ?? this.content,
      contents: contents ?? this.contents,
      exactPhrases: exactPhrases ?? this.exactPhrases,
      minId: minId ?? this.minId,
      maxId: maxId ?? this.maxId,
      channelIds: channelIds ?? this.channelIds,
      excludeChannelIds: excludeChannelIds ?? this.excludeChannelIds,
      authorIds: authorIds ?? this.authorIds,
      excludeAuthorIds: excludeAuthorIds ?? this.excludeAuthorIds,
      mentions: mentions ?? this.mentions,
      excludeMentions: excludeMentions ?? this.excludeMentions,
      mentionEveryone: mentionEveryone ?? this.mentionEveryone,
      pinned: pinned ?? this.pinned,
      has: has ?? this.has,
      excludeHas: excludeHas ?? this.excludeHas,
      authorTypes: authorTypes ?? this.authorTypes,
      excludeAuthorTypes: excludeAuthorTypes ?? this.excludeAuthorTypes,
      embedTypes: embedTypes ?? this.embedTypes,
      excludeEmbedTypes: excludeEmbedTypes ?? this.excludeEmbedTypes,
      embedProviders: embedProviders ?? this.embedProviders,
      excludeEmbedProviders:
          excludeEmbedProviders ?? this.excludeEmbedProviders,
      linkHostnames: linkHostnames ?? this.linkHostnames,
      excludeLinkHostnames: excludeLinkHostnames ?? this.excludeLinkHostnames,
      attachmentFilenames: attachmentFilenames ?? this.attachmentFilenames,
      excludeAttachmentFilenames:
          excludeAttachmentFilenames ?? this.excludeAttachmentFilenames,
      attachmentExtensions: attachmentExtensions ?? this.attachmentExtensions,
      excludeAttachmentExtensions:
          excludeAttachmentExtensions ?? this.excludeAttachmentExtensions,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
      scope: scope ?? this.scope,
      includeNsfw: includeNsfw ?? this.includeNsfw,
    );
  }
}

MessageSearchContentFilter? _contentFilterForHasValue(String value) {
  return switch (value.toLowerCase()) {
    'image' => MessageSearchContentFilter.image,
    'video' => MessageSearchContentFilter.video,
    'sound' || 'audio' => MessageSearchContentFilter.audio,
    'file' => MessageSearchContentFilter.file,
    'link' => MessageSearchContentFilter.link,
    'embed' => MessageSearchContentFilter.embed,
    'sticker' => MessageSearchContentFilter.sticker,
    'poll' => MessageSearchContentFilter.poll,
    'snapshot' || 'forward' => MessageSearchContentFilter.forward,
    _ => null,
  };
}

ParsedChannelSearchParams applyChannelSearchDateChip(
  ParsedChannelSearchParams params, {
  required String filterKey,
  required String value,
}) {
  return _applyDateFilter(params, rawKey: filterKey, value: value);
}

List<String> channelSearchUserFilterValues(String query) {
  final ({List<_ParsedToken> tokens, String content, List<String> exactPhrases})
  tokenized = _tokenizeSearchQuery(query);
  final List<String> values = <String>[];
  for (final _ParsedToken token in tokenized.tokens) {
    final String key = token.key.startsWith('-')
        ? token.key.substring(1)
        : token.key;
    if (key != 'from' && key != 'mentions') {
      continue;
    }
    values.addAll(_splitCsv(token.value));
  }
  return values;
}

class _ParsedToken {
  const _ParsedToken({
    required this.key,
    required this.value,
    required this.exclude,
    required this.start,
    required this.end,
  });

  final String key;
  final String value;
  final bool exclude;
  final int start;
  final int end;
}

const Set<String> _knownSearchKeys = <String>{
  'from',
  '-from',
  'mentions',
  '-mentions',
  'in',
  '-in',
  'before',
  'during',
  'on',
  'after',
  'has',
  '-has',
  'pinned',
  'author-type',
  'sort',
  'order',
  'nsfw',
  'embed-type',
  '-embed-type',
  'embed-provider',
  '-embed-provider',
  'link',
  '-link',
  'link-from',
  '-link-from',
  'filename',
  '-filename',
  'file-name',
  '-file-name',
  'ext',
  '-ext',
  'file-type',
  '-file-type',
  'last',
  'beforeid',
  'afterid',
  'any',
  'scope',
};

const Map<String, String> _filterKeyAliases = <String, String>{
  'file-name': 'filename',
  'file-type': 'ext',
  'link-from': 'link',
};

const Set<String> _hasFilters = <String>{
  'image',
  'sound',
  'video',
  'file',
  'sticker',
  'embed',
  'link',
  'poll',
  'snapshot',
  'forward',
};

const Set<String> _authorFilters = <String>{'user', 'bot', 'webhook'};
const Set<String> _embedTypeFilters = <String>{
  'image',
  'video',
  'sound',
  'article',
};
const Set<String> _sortFields = <String>{'timestamp', 'relevance'};
const Set<String> _sortOrders = <String>{'asc', 'desc'};

ChannelSearchParseHints buildChannelSearchHintsFromSegments(
  List<ChannelSearchSegment> segments, {
  Map<String, String> usersByTag = const <String, String>{},
  Map<String, String> channelsByName = const <String, String>{},
}) {
  final Map<String, String> mergedUsers = Map<String, String>.from(usersByTag);
  final Map<String, String> mergedChannels = Map<String, String>.from(
    channelsByName,
  );
  for (final ChannelSearchSegment segment in segments) {
    if (segment.id == null || segment.display.isEmpty) {
      continue;
    }
    if (segment.type == ChannelSearchSegmentType.user) {
      mergedUsers[segment.display] = segment.id!;
    } else if (segment.type == ChannelSearchSegmentType.channel) {
      mergedChannels[segment.display] = segment.id!;
    }
  }
  return ChannelSearchParseHints(
    usersByTag: mergedUsers,
    channelsByName: mergedChannels,
  );
}

ParsedChannelSearchParams parseChannelSearchQuery(
  String query, {
  ChannelSearchParseHints hints = const ChannelSearchParseHints(),
  ChannelSearchParseContext context = const ChannelSearchParseContext(),
}) {
  final ({List<_ParsedToken> tokens, String content, List<String> exactPhrases})
  tokenized = _tokenizeSearchQuery(query);

  ParsedChannelSearchParams params = const ParsedChannelSearchParams();
  if (tokenized.content.isNotEmpty) {
    params = params.copyWith(content: tokenized.content);
  }
  if (tokenized.exactPhrases.isNotEmpty) {
    params = params.copyWith(exactPhrases: tokenized.exactPhrases);
  }

  for (final _ParsedToken token in tokenized.tokens) {
    final String rawKey = token.key == 'on' ? 'during' : token.key;
    final String normalizedKey = _filterKeyAliases[rawKey] ?? rawKey;
    final bool isExcludeKey = token.exclude;

    switch (normalizedKey) {
      case 'from':
        params = _applyUserIds(
          params,
          token.value,
          isExclude: isExcludeKey,
          hints: hints,
          context: context,
          excludeField: (ParsedChannelSearchParams p, List<String> ids) =>
              p.copyWith(excludeAuthorIds: _append(p.excludeAuthorIds, ids)),
          includeField: (ParsedChannelSearchParams p, List<String> ids) =>
              p.copyWith(authorIds: _append(p.authorIds, ids)),
        );
      case 'mentions':
        params = _applyMentions(
          params,
          token.value,
          isExclude: isExcludeKey,
          hints: hints,
          context: context,
        );
      case 'in':
        params = _applyChannelIds(
          params,
          token.value,
          isExclude: isExcludeKey,
          hints: hints,
          context: context,
        );
      case 'has':
        params = _applyHas(params, token.value, isExclude: isExcludeKey);
      case 'pinned':
        params = _applyPinned(params, token.value);
      case 'author-type':
        params = _applyAuthorTypes(params, token.value);
      case 'sort':
        final String value = token.value.trim().toLowerCase();
        if (_sortFields.contains(value)) {
          params = params.copyWith(sortBy: value);
        }
      case 'order':
        final String value = token.value.trim().toLowerCase();
        if (_sortOrders.contains(value)) {
          params = params.copyWith(sortOrder: value);
        }
      case 'nsfw':
        final String value = token.value.trim().toLowerCase();
        if (value == 'true' || value == 'false') {
          params = params.copyWith(includeNsfw: value == 'true');
        }
      case 'embed-type':
        params = _applyEmbedTypes(params, token.value, isExclude: isExcludeKey);
      case 'embed-provider':
        params = _applyStringList(
          params,
          token.value,
          isExclude: isExcludeKey,
          excludeField: (ParsedChannelSearchParams p, List<String> values) =>
              p.copyWith(
                excludeEmbedProviders: _append(p.excludeEmbedProviders, values),
              ),
          includeField: (ParsedChannelSearchParams p, List<String> values) =>
              p.copyWith(embedProviders: _append(p.embedProviders, values)),
        );
      case 'link':
        params = _applyLinkHostnames(
          params,
          token.value,
          isExclude: isExcludeKey,
        );
      case 'filename':
        params = _applyStringList(
          params,
          token.value,
          isExclude: isExcludeKey,
          excludeField: (ParsedChannelSearchParams p, List<String> values) =>
              p.copyWith(
                excludeAttachmentFilenames: _append(
                  p.excludeAttachmentFilenames,
                  values,
                ),
              ),
          includeField: (ParsedChannelSearchParams p, List<String> values) =>
              p.copyWith(
                attachmentFilenames: _append(p.attachmentFilenames, values),
              ),
        );
      case 'ext':
        params = _applyExtensions(params, token.value, isExclude: isExcludeKey);
      case 'scope':
        params = _applyScope(params, token.value);
      case 'last':
        params = _applyLast(params, token.value);
      case 'beforeid':
        final String id = token.value.trim();
        if (id.isNotEmpty) {
          params = params.copyWith(maxId: id);
        }
      case 'afterid':
        final String id = token.value.trim();
        if (id.isNotEmpty) {
          params = params.copyWith(minId: id);
        }
      case 'any':
        params = params.copyWith(
          contents: _append(params.contents, _splitCsv(token.value)),
        );
      case 'before':
      case 'after':
      case 'during':
        params = _applyDateFilter(params, rawKey: rawKey, value: token.value);
    }
  }

  return params;
}

List<String> _append(List<String> current, List<String> values) {
  if (values.isEmpty) {
    return current;
  }
  return <String>{...current, ...values}.toList();
}

ParsedChannelSearchParams _applyUserIds(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
  required ChannelSearchParseHints hints,
  required ChannelSearchParseContext context,
  required ParsedChannelSearchParams Function(
    ParsedChannelSearchParams params,
    List<String> ids,
  )
  includeField,
  required ParsedChannelSearchParams Function(
    ParsedChannelSearchParams params,
    List<String> ids,
  )
  excludeField,
}) {
  final List<String> resolved = <String>[];
  for (final String tag in _splitCsv(rawValue)) {
    final String? id = _resolveUserId(tag, hints: hints, context: context);
    if (id != null) {
      resolved.add(id);
    }
  }
  if (resolved.isEmpty) {
    return params;
  }
  return isExclude
      ? excludeField(params, resolved)
      : includeField(params, resolved);
}

ParsedChannelSearchParams _applyMentions(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
  required ChannelSearchParseHints hints,
  required ChannelSearchParseContext context,
}) {
  for (final String value in _splitCsv(rawValue)) {
    final String lower = value.toLowerCase();
    if (lower == 'everyone' || lower == 'here') {
      params = params.copyWith(mentionEveryone: true);
      continue;
    }
    final String? id = _resolveUserId(value, hints: hints, context: context);
    if (id == null) {
      continue;
    }
    params = isExclude
        ? params.copyWith(
            excludeMentions: _append(params.excludeMentions, <String>[id]),
          )
        : params.copyWith(mentions: _append(params.mentions, <String>[id]));
  }
  return params;
}

ParsedChannelSearchParams _applyChannelIds(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
  required ChannelSearchParseHints hints,
  required ChannelSearchParseContext context,
}) {
  final List<String> resolved = <String>[];
  for (final String name in _splitCsv(rawValue)) {
    final String? id = _resolveChannelId(name, hints: hints, context: context);
    if (id != null) {
      resolved.add(id);
    }
  }
  if (resolved.isEmpty) {
    return params;
  }
  return isExclude
      ? params.copyWith(
          excludeChannelIds: _append(params.excludeChannelIds, resolved),
        )
      : params.copyWith(channelIds: _append(params.channelIds, resolved));
}

ParsedChannelSearchParams _applyHas(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
}) {
  final List<String> values = rawValue
      .split(',')
      .map((String value) => value.trim().toLowerCase())
      .where((String value) => value.isNotEmpty)
      .map((String value) => value == 'forward' ? 'snapshot' : value)
      .where(_hasFilters.contains)
      .toList();
  if (values.isEmpty) {
    return params;
  }
  return isExclude
      ? params.copyWith(excludeHas: _append(params.excludeHas, values))
      : params.copyWith(has: _append(params.has, values));
}

ParsedChannelSearchParams _applyPinned(
  ParsedChannelSearchParams params,
  String rawValue,
) {
  final String value = rawValue.trim().toLowerCase();
  if (!<String>{'true', 'false', 'yes', 'no', '1', '0'}.contains(value)) {
    return params;
  }
  return params.copyWith(
    pinned: value == 'true' || value == 'yes' || value == '1',
  );
}

ParsedChannelSearchParams _applyAuthorTypes(
  ParsedChannelSearchParams params,
  String rawValue,
) {
  final List<String> values = rawValue
      .split(',')
      .map((String value) => value.trim().toLowerCase())
      .where((String value) => value.isNotEmpty)
      .where(_authorFilters.contains)
      .toList();
  if (values.isEmpty) {
    return params;
  }
  return params.copyWith(authorTypes: _append(params.authorTypes, values));
}

ParsedChannelSearchParams _applyEmbedTypes(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
}) {
  final List<String> values = _splitCsv(rawValue)
      .map((String value) => value.toLowerCase())
      .where(_embedTypeFilters.contains)
      .toList();
  if (values.isEmpty) {
    return params;
  }
  return isExclude
      ? params.copyWith(
          excludeEmbedTypes: _append(params.excludeEmbedTypes, values),
        )
      : params.copyWith(embedTypes: _append(params.embedTypes, values));
}

ParsedChannelSearchParams _applyLinkHostnames(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
}) {
  final List<String> hostnames = <String>[];
  for (final String value in _splitCsv(rawValue)) {
    final String? hostname = _normalizeHostnameFilterValue(value);
    if (hostname != null) {
      hostnames.add(hostname);
    }
  }
  if (hostnames.isEmpty) {
    return params;
  }
  return isExclude
      ? params.copyWith(
          excludeLinkHostnames: _append(params.excludeLinkHostnames, hostnames),
        )
      : params.copyWith(
          linkHostnames: _append(params.linkHostnames, hostnames),
        );
}

ParsedChannelSearchParams _applyExtensions(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
}) {
  final List<String> extensions = <String>[];
  for (final String value in _splitCsv(rawValue)) {
    final String? extension = _normalizeAttachmentExtensionFilterValue(value);
    if (extension != null) {
      extensions.add(extension);
    }
  }
  if (extensions.isEmpty) {
    return params;
  }
  return isExclude
      ? params.copyWith(
          excludeAttachmentExtensions: _append(
            params.excludeAttachmentExtensions,
            extensions,
          ),
        )
      : params.copyWith(
          attachmentExtensions: _append(
            params.attachmentExtensions,
            extensions,
          ),
        );
}

ParsedChannelSearchParams _applyScope(
  ParsedChannelSearchParams params,
  String rawValue,
) {
  for (final String value in _splitCsv(rawValue)) {
    final MessageSearchScopeFilter? scope = _scopeForToken(value);
    if (scope != null) {
      return params.copyWith(scope: scope);
    }
  }
  return params;
}

ParsedChannelSearchParams _applyLast(
  ParsedChannelSearchParams params,
  String rawValue,
) {
  final Duration? duration = _parseDuration(rawValue);
  if (duration == null) {
    return params;
  }
  final DateTime dateTime = DateTime.now().subtract(duration);
  return params.copyWith(minId: snowflakeFromDateTime(dateTime));
}

ParsedChannelSearchParams _applyDateFilter(
  ParsedChannelSearchParams params, {
  required String rawKey,
  required String value,
}) {
  if (value.contains('..')) {
    final List<String> parts = value.split('..');
    if (parts.length >= 2) {
      final DateTime? start = _parseCompactDateTime(parts[0]);
      final DateTime? end = _parseCompactDateTime(parts[1]);
      ParsedChannelSearchParams next = params;
      if (start != null) {
        next = next.copyWith(
          minId: snowflakeFromDateTime(
            DateTime(start.year, start.month, start.day),
          ),
        );
      }
      if (end != null) {
        final DateTime endOfDay = DateTime(
          end.year,
          end.month,
          end.day,
          23,
          59,
          59,
          999,
        );
        next = next.copyWith(maxId: snowflakeFromDateTime(endOfDay));
      }
      return next;
    }
  }

  final DateTime? dateTime = _parseCompactDateTime(value);
  if (dateTime == null) {
    return params;
  }
  if (rawKey == 'before') {
    return params.copyWith(maxId: snowflakeFromDateTime(dateTime));
  }
  if (rawKey == 'after') {
    return params.copyWith(minId: snowflakeFromDateTime(dateTime));
  }
  final DateTime start = DateTime(dateTime.year, dateTime.month, dateTime.day);
  final DateTime end = DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    23,
    59,
    59,
    999,
  );
  return params.copyWith(
    minId: snowflakeFromDateTime(start),
    maxId: snowflakeFromDateTime(end),
  );
}

ParsedChannelSearchParams _applyStringList(
  ParsedChannelSearchParams params,
  String rawValue, {
  required bool isExclude,
  required ParsedChannelSearchParams Function(
    ParsedChannelSearchParams params,
    List<String> values,
  )
  includeField,
  required ParsedChannelSearchParams Function(
    ParsedChannelSearchParams params,
    List<String> values,
  )
  excludeField,
}) {
  final List<String> values = _splitCsv(rawValue);
  if (values.isEmpty) {
    return params;
  }
  return isExclude
      ? excludeField(params, values)
      : includeField(params, values);
}

String? _resolveUserId(
  String tag, {
  required ChannelSearchParseHints hints,
  required ChannelSearchParseContext context,
}) {
  final String trimmed = tag.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  if (trimmed.toLowerCase() == '@me') {
    return context.currentUserId;
  }
  final String? hinted = hints.usersByTag[trimmed];
  if (hinted != null && hinted.isNotEmpty) {
    return hinted;
  }
  if (_snowflakeIdPattern.hasMatch(trimmed)) {
    return trimmed;
  }
  return context.resolveUserByTag?.call(trimmed);
}

String? _resolveChannelId(
  String name, {
  required ChannelSearchParseHints hints,
  required ChannelSearchParseContext context,
}) {
  final String trimmed = name.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final String? hinted = hints.channelsByName[trimmed];
  if (hinted != null && hinted.isNotEmpty) {
    return hinted;
  }
  return context.resolveChannelByName?.call(trimmed);
}

MessageSearchScopeFilter? _scopeForToken(String value) {
  return switch (value.toLowerCase()) {
    'current' => MessageSearchScopeFilter.current,
    'open_dms' => MessageSearchScopeFilter.openDms,
    'all_dms' => MessageSearchScopeFilter.allDms,
    'all_guilds' => MessageSearchScopeFilter.allGuilds,
    'all' => MessageSearchScopeFilter.all,
    'open_dms_and_all_guilds' => MessageSearchScopeFilter.openDmsAndAllGuilds,
    _ => null,
  };
}

String? _normalizeHostnameFilterValue(String input) {
  final String trimmed = input.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final String candidate =
      RegExp('^[a-z][a-z0-9+.-]*://', caseSensitive: false).hasMatch(trimmed)
      ? trimmed
      : 'https://$trimmed';
  final Uri? uri = Uri.tryParse(candidate);
  final String? hostname = uri?.host.trim().toLowerCase();
  if (hostname != null && hostname.isNotEmpty) {
    return hostname;
  }
  final String fallback = trimmed
      .replaceFirst(RegExp('^[a-z][a-z0-9+.-]*://', caseSensitive: false), '')
      .split(RegExp('[/?#]'))
      .first
      .trim()
      .toLowerCase();
  return fallback.isEmpty ? null : fallback;
}

String? _normalizeAttachmentExtensionFilterValue(String input) {
  final String normalized = input
      .trim()
      .replaceFirst(RegExp(r'^\.+'), '')
      .toLowerCase();
  return normalized.isEmpty ? null : normalized;
}

Duration? _parseDuration(String input) {
  final RegExpMatch? match = RegExp(
    r'^(\d+)(ms|s|m|h|d|w)$',
    caseSensitive: false,
  ).firstMatch(input.trim());
  if (match == null) {
    return null;
  }
  final int amount = int.parse(match.group(1)!);
  return switch (match.group(2)!.toLowerCase()) {
    'ms' => Duration(milliseconds: amount),
    's' => Duration(seconds: amount),
    'm' => Duration(minutes: amount),
    'h' => Duration(hours: amount),
    'd' => Duration(days: amount),
    'w' => Duration(days: amount * 7),
    _ => null,
  };
}

DateTime? _parseCompactDateTime(String input) {
  final String trimmed = input.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final String lower = trimmed.toLowerCase();
  final DateTime now = DateTime.now();
  if (lower == 'now') {
    return now;
  }
  if (lower == 'today') {
    return DateTime(now.year, now.month, now.day);
  }
  if (lower == 'yesterday') {
    final DateTime yesterday = now.subtract(const Duration(days: 1));
    return DateTime(yesterday.year, yesterday.month, yesterday.day);
  }

  final String isoCandidate = trimmed.replaceAll('_', 'T').replaceAll(' ', 'T');
  DateTime? parsed = DateTime.tryParse(isoCandidate);
  if (parsed != null) {
    return parsed;
  }

  final RegExpMatch? compact = RegExp(
    r'^(\d{4})(\d{2})(\d{2})(?:T(\d{2})(\d{2})(\d{2})?)?Z?$',
  ).firstMatch(trimmed);
  if (compact != null) {
    parsed = DateTime(
      int.parse(compact.group(1)!),
      int.parse(compact.group(2)!),
      int.parse(compact.group(3)!),
      compact.group(4) == null ? 0 : int.parse(compact.group(4)!),
      compact.group(5) == null ? 0 : int.parse(compact.group(5)!),
      compact.group(6) == null ? 0 : int.parse(compact.group(6)!),
    );
    return parsed;
  }

  return DateTime.tryParse(trimmed);
}

List<String> _splitCsv(String input) {
  final List<String> items = <String>[];
  int index = 0;
  while (index < input.length) {
    while (index < input.length && RegExp(r'[\s,]').hasMatch(input[index])) {
      index++;
    }
    if (index >= input.length) {
      break;
    }
    final StringBuffer buffer = StringBuffer();
    bool quoted = false;
    if (input[index] == '"') {
      quoted = true;
      index++;
    }
    bool escaped = false;
    for (; index < input.length; index++) {
      final String char = input[index];
      if (escaped) {
        buffer.write(char);
        escaped = false;
        continue;
      }
      if (char == r'\') {
        escaped = true;
        continue;
      }
      if (quoted) {
        if (char == '"') {
          index++;
          break;
        }
        buffer.write(char);
      } else {
        if (char == ',') {
          break;
        }
        buffer.write(char);
      }
    }
    final String value = buffer.toString().trim();
    if (value.isNotEmpty) {
      items.add(value);
    }
    while (index < input.length && input[index] != ',') {
      index++;
    }
    if (index < input.length && input[index] == ',') {
      index++;
    }
  }
  return items;
}

({List<_ParsedToken> tokens, String content, List<String> exactPhrases})
_tokenizeSearchQuery(String query) {
  final List<_ParsedToken> tokens = <_ParsedToken>[];
  final int length = query.length;
  int index = 0;

  while (index < length) {
    if (query[index] == ' ') {
      index++;
      continue;
    }

    final int tokenStart = index;
    final bool isExclude = query[index] == '-';
    final int keyStart = isExclude ? index + 1 : index;
    int keyEnd = keyStart;
    while (keyEnd < length && query[keyEnd] != ':' && query[keyEnd] != ' ') {
      keyEnd++;
    }
    if (keyEnd >= length || query[keyEnd] != ':') {
      index++;
      continue;
    }

    final String key = query.substring(keyStart, keyEnd);
    final String knownKey = isExclude ? '-$key' : key;
    if (!_knownSearchKeys.contains(knownKey)) {
      index++;
      continue;
    }

    final int valueStart = keyEnd + 1;
    if (valueStart >= length) {
      break;
    }

    int valueEnd = valueStart;
    bool inQuotes = false;
    bool escaped = false;
    while (valueEnd < length) {
      final String char = query[valueEnd];
      if (escaped) {
        escaped = false;
        valueEnd++;
        continue;
      }
      if (char == r'\') {
        escaped = true;
        valueEnd++;
        continue;
      }
      if (char == '"') {
        inQuotes = !inQuotes;
        valueEnd++;
        continue;
      }
      if (!inQuotes && char == ' ') {
        break;
      }
      valueEnd++;
    }

    String value = query.substring(valueStart, valueEnd);
    final bool quoted = value.startsWith('"');
    if (quoted && value.endsWith('"') && value.length >= 2) {
      value = value.substring(1, value.length - 1);
    }

    tokens.add(
      _ParsedToken(
        key: key,
        value: value,
        exclude: isExclude,
        start: tokenStart,
        end: valueEnd,
      ),
    );
    index = valueEnd;
  }

  final StringBuffer remaining = StringBuffer();
  int position = 0;
  for (final _ParsedToken token in tokens) {
    if (token.start > position) {
      remaining.write(query.substring(position, token.start));
    }
    position = token.end;
  }
  if (position < length) {
    remaining.write(query.substring(position));
  }

  final List<String> exactPhrases = <String>[];
  final StringBuffer content = StringBuffer();
  final String remainingText = remaining.toString();
  int remainingIndex = 0;
  while (remainingIndex < remainingText.length) {
    if (remainingText[remainingIndex] == '"') {
      remainingIndex++;
      final StringBuffer phrase = StringBuffer();
      bool escaped = false;
      while (remainingIndex < remainingText.length) {
        final String char = remainingText[remainingIndex];
        if (escaped) {
          phrase.write(char);
          escaped = false;
          remainingIndex++;
          continue;
        }
        if (char == r'\') {
          escaped = true;
          remainingIndex++;
          continue;
        }
        if (char == '"') {
          remainingIndex++;
          break;
        }
        phrase.write(char);
        remainingIndex++;
      }
      final String trimmedPhrase = phrase.toString().trim();
      if (trimmedPhrase.isNotEmpty) {
        exactPhrases.add(trimmedPhrase);
      }
    } else {
      content.write(remainingText[remainingIndex]);
      remainingIndex++;
    }
  }

  return (
    tokens: tokens,
    content: content.toString().replaceAll(RegExp(r'\s+'), ' ').trim(),
    exactPhrases: exactPhrases,
  );
}
