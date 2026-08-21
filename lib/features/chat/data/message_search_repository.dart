import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

const int kMessageSearchPageSize = 25;

enum MessageSearchScopeFilter {
  current,
  openDms,
  allDms,
  allGuilds,
  all,
  openDmsAndAllGuilds,
}

enum MessageSearchSortFilter { newest, oldest, relevance }

enum MessageSearchContentFilter {
  image,
  video,
  audio,
  file,
  link,
  embed,
  sticker,
  poll,
  forward,
}

class MessageSearchQuery {
  const MessageSearchQuery({
    required this.channelId,
    this.guildId,
    this.rawQuery = '',
    this.uiScope = MessageSearchScopeFilter.current,
    this.uiSort = MessageSearchSortFilter.newest,
    this.parsed = const ParsedChannelSearchParams(),
    this.page = 1,
  });

  final String channelId;
  final String? guildId;
  final String rawQuery;
  final MessageSearchScopeFilter uiScope;
  final MessageSearchSortFilter uiSort;
  final ParsedChannelSearchParams parsed;
  final int page;

  factory MessageSearchQuery.build({
    required String channelId,
    required String rawQuery,
    String? guildId,
    MessageSearchScopeFilter uiScope = MessageSearchScopeFilter.current,
    MessageSearchSortFilter uiSort = MessageSearchSortFilter.newest,
    ChannelSearchParseHints hints = const ChannelSearchParseHints(),
    ChannelSearchParseContext context = const ChannelSearchParseContext(),
    String? chipAuthorId,
    Set<MessageSearchContentFilter>? chipContentTypes,
    ChannelSearchChipFilters chipFilters = const ChannelSearchChipFilters(),
    int page = 1,
  }) {
    final ParsedChannelSearchParams parsed =
        parseChannelSearchQuery(
          rawQuery,
          hints: hints,
          context: context,
        ).mergeChipFilters(
          authorId: chipAuthorId,
          contentTypes: chipContentTypes,
          chips: chipFilters,
        );
    return MessageSearchQuery(
      channelId: channelId,
      guildId: guildId,
      rawQuery: rawQuery,
      uiScope: uiScope,
      uiSort: uiSort,
      parsed: parsed,
      page: page,
    );
  }

  String get text => parsed.content ?? '';

  String get authorId => parsed.authorIds.join(',');

  Set<MessageSearchContentFilter> get contentTypes => parsed.hasContentFilters;

  MessageSearchScopeFilter get scope => parsed.scope ?? uiScope;

  MessageSearchSortFilter get sort => _resolvedSort(uiSort, parsed);

  MessageSearchQuery copyWith({
    String? channelId,
    Object? guildId = _unset,
    String? rawQuery,
    MessageSearchScopeFilter? uiScope,
    MessageSearchSortFilter? uiSort,
    ParsedChannelSearchParams? parsed,
    int? page,
  }) {
    return MessageSearchQuery(
      channelId: channelId ?? this.channelId,
      guildId: guildId == _unset ? this.guildId : guildId as String?,
      rawQuery: rawQuery ?? this.rawQuery,
      uiScope: uiScope ?? this.uiScope,
      uiSort: uiSort ?? this.uiSort,
      parsed: parsed ?? this.parsed,
      page: page ?? this.page,
    );
  }

  bool get hasSearchTerms => parsed.hasSearchTerms;
}

MessageSearchSortFilter _resolvedSort(
  MessageSearchSortFilter uiSort,
  ParsedChannelSearchParams parsed,
) {
  if (parsed.sortBy == 'relevance') {
    return MessageSearchSortFilter.relevance;
  }
  if (parsed.sortBy == 'timestamp') {
    if (parsed.sortOrder == 'asc') {
      return MessageSearchSortFilter.oldest;
    }
    return MessageSearchSortFilter.newest;
  }
  return uiSort;
}

class MessageSearchResultEntry {
  const MessageSearchResultEntry({
    required this.message,
    this.guildId,
    this.channelName,
  });

  final Message message;
  final String? guildId;
  final String? channelName;
}

class MessageSearchPage {
  const MessageSearchPage({
    required this.results,
    required this.total,
    required this.page,
    required this.hitsPerPage,
    required this.indexing,
  });

  const MessageSearchPage.indexing()
    : results = const <MessageSearchResultEntry>[],
      total = 0,
      page = 1,
      hitsPerPage = kMessageSearchPageSize,
      indexing = true;

  final List<MessageSearchResultEntry> results;
  final int total;
  final int page;
  final int hitsPerPage;
  final bool indexing;

  bool get hasMore {
    if (indexing) {
      return false;
    }
    return page * hitsPerPage < total;
  }
}

class MessageSearchRepository {
  const MessageSearchRepository(
    this._client,
    this._database,
    this._currentUserId,
  );

  final FluxerClient _client;
  final db.FluxerDatabase _database;
  final String? _currentUserId;

  Future<MessageSearchPage> searchMessages(MessageSearchQuery query) async {
    final response = await _client.search.searchMessages(
      body: buildGlobalSearchMessagesRequest(query),
    );
    final raw = response.toJson();
    if (raw['indexing'] == true) {
      return const MessageSearchPage.indexing();
    }

    final results = response.toMessageSearchResultsResponse();
    final channelById = <String, ChannelResponse>{
      for (final channel in results.channels) channel.id: channel,
    };

    await _upsertChannels(results.channels);
    await _database.userDao.upsertUsers(
      results.messages
          .where((message) => message.webhookId == null)
          .map((message) => userFromPartialSdk(message.author))
          .toList(),
    );

    final mentionContexts = <String, MessageMentionContext>{};
    for (final channelId
        in results.messages.map((message) => message.channelId).toSet()) {
      mentionContexts[channelId] = await buildMessageMentionContext(
        _database,
        currentUserId: _currentUserId,
        channelId: channelId,
      );
    }
    final entries = <MessageSearchResultEntry>[
      for (final result in results.messages)
        MessageSearchResultEntry(
          message:
              Message.fromSearchResult(
                result,
                currentUserId: _currentUserId,
              ).copyWith(
                isMentioned: messageMentionsUser(
                  mentionContexts[result.channelId]!,
                  authorId: result.author.id,
                  mentionedUserIds: result.mentions.map((u) => u.id).toList(),
                  mentionEveryone: result.mentionEveryone,
                  mentionRoleIds: result.mentionRoles,
                ),
              ),
          guildId: channelById[result.channelId]?.guildId,
          channelName: channelById[result.channelId]?.name,
        ),
    ];

    await _database.messageDao.upsertMessages(
      entries.map((entry) => entry.message.toCompanion()).toList(),
    );

    final mentionedChannels = entries
        .where((e) => e.message.isMentioned)
        .map((e) => e.message.channelId)
        .toSet();
    if (mentionedChannels.isNotEmpty) {
      final readStateRepo = ReadStateRepository(_client, _database);
      for (final channelId in mentionedChannels) {
        await readStateRepo.recomputeMentionsAfterBackfill(
          channelId: channelId,
          currentUserId: _currentUserId,
        );
      }
    }

    return MessageSearchPage(
      results: entries,
      total: results.total,
      page: results.page,
      hitsPerPage: results.hitsPerPage,
      indexing: false,
    );
  }

  Future<void> _upsertChannels(List<ChannelResponse> channels) async {
    final companions = <db.ChannelsCompanion>[];
    for (final channel in channels) {
      final guildId = channel.guildId;
      if (guildId == null || guildId.isEmpty) {
        continue;
      }
      companions.add(channelFromSdk(channel, guildId));
    }
    if (companions.isEmpty) {
      return;
    }
    await _database.channelDao.upsertChannels(companions);
  }
}

GlobalSearchMessagesRequest buildGlobalSearchMessagesRequest(
  MessageSearchQuery query,
) {
  final ParsedChannelSearchParams parsed = query.parsed;
  final MessageSearchScopeFilter scope = query.scope;
  final MessageSearchSortFilter sort = query.sort;
  final (
    GlobalSearchMessagesRequestSortBySortBy,
    GlobalSearchMessagesRequestSortOrderSortOrder,
  )
  sortValues = _messageSort(sort);

  return GlobalSearchMessagesRequest(
    hitsPerPage: kMessageSearchPageSize,
    page: query.page,
    maxId: _blankToNull(parsed.maxId),
    minId: _blankToNull(parsed.minId),
    content: _blankToNull(parsed.content),
    contents: _nonEmptyList(parsed.contents),
    exactPhrases: _nonEmptyList(parsed.exactPhrases),
    channelIds: _nonEmptyList(parsed.channelIds),
    excludeChannelId: _nonEmptyList(parsed.excludeChannelIds),
    authorId: _nonEmptyList(parsed.authorIds),
    excludeAuthorId: _nonEmptyList(parsed.excludeAuthorIds),
    mentions: _nonEmptyList(parsed.mentions),
    excludeMentions: _nonEmptyList(parsed.excludeMentions),
    mentionEveryone: parsed.mentionEveryone,
    pinned: parsed.pinned,
    has: _mapHasFilters(parsed.has),
    excludeHas: _mapExcludeHasFilters(parsed.excludeHas),
    authorType: _mapAuthorTypes(parsed.authorTypes),
    embedType: _mapEmbedTypes(parsed.embedTypes),
    excludeEmbedType: _mapExcludeEmbedTypes(parsed.excludeEmbedTypes),
    embedProvider: _nonEmptyList(parsed.embedProviders),
    excludeEmbedProvider: _nonEmptyList(parsed.excludeEmbedProviders),
    linkHostname: _nonEmptyList(parsed.linkHostnames),
    excludeLinkHostname: _nonEmptyList(parsed.excludeLinkHostnames),
    attachmentFilename: _nonEmptyList(parsed.attachmentFilenames),
    excludeAttachmentFilename: _nonEmptyList(parsed.excludeAttachmentFilenames),
    attachmentExtension: _nonEmptyList(parsed.attachmentExtensions),
    excludeAttachmentExtension: _nonEmptyList(
      parsed.excludeAttachmentExtensions,
    ),
    sortBy: parsed.sortBy == null
        ? sortValues.$1
        : _parsedSortBy(parsed.sortBy!),
    sortOrder: parsed.sortOrder == null
        ? sortValues.$2
        : _parsedSortOrder(parsed.sortOrder!),
    includeNsfw: parsed.includeNsfw,
    scope: _messageSearchScope(scope),
    contextChannelId: scope == MessageSearchScopeFilter.current
        ? query.channelId
        : null,
    contextGuildId: scope == MessageSearchScopeFilter.current
        ? _blankToNull(query.guildId)
        : null,
  );
}

String? _blankToNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}

List<T>? _nonEmptyList<T>(List<T> values) {
  if (values.isEmpty) {
    return null;
  }
  return values;
}

GlobalSearchMessagesRequestScopeScope _messageSearchScope(
  MessageSearchScopeFilter scope,
) => switch (scope) {
  MessageSearchScopeFilter.current =>
    GlobalSearchMessagesRequestScopeScope.current,
  MessageSearchScopeFilter.openDms =>
    GlobalSearchMessagesRequestScopeScope.openDms,
  MessageSearchScopeFilter.allDms =>
    GlobalSearchMessagesRequestScopeScope.allDms,
  MessageSearchScopeFilter.allGuilds =>
    GlobalSearchMessagesRequestScopeScope.allGuilds,
  MessageSearchScopeFilter.all => GlobalSearchMessagesRequestScopeScope.all,
  MessageSearchScopeFilter.openDmsAndAllGuilds =>
    GlobalSearchMessagesRequestScopeScope.openDmsAndAllGuilds,
};

(
  GlobalSearchMessagesRequestSortBySortBy,
  GlobalSearchMessagesRequestSortOrderSortOrder,
)
_messageSort(MessageSearchSortFilter sort) => switch (sort) {
  MessageSearchSortFilter.newest => (
    GlobalSearchMessagesRequestSortBySortBy.timestamp,
    GlobalSearchMessagesRequestSortOrderSortOrder.desc,
  ),
  MessageSearchSortFilter.oldest => (
    GlobalSearchMessagesRequestSortBySortBy.timestamp,
    GlobalSearchMessagesRequestSortOrderSortOrder.asc,
  ),
  MessageSearchSortFilter.relevance => (
    GlobalSearchMessagesRequestSortBySortBy.relevance,
    GlobalSearchMessagesRequestSortOrderSortOrder.desc,
  ),
};

GlobalSearchMessagesRequestSortBySortBy _parsedSortBy(String value) =>
    switch (value) {
      'relevance' => GlobalSearchMessagesRequestSortBySortBy.relevance,
      _ => GlobalSearchMessagesRequestSortBySortBy.timestamp,
    };

GlobalSearchMessagesRequestSortOrderSortOrder _parsedSortOrder(String value) =>
    switch (value) {
      'asc' => GlobalSearchMessagesRequestSortOrderSortOrder.asc,
      _ => GlobalSearchMessagesRequestSortOrderSortOrder.desc,
    };

List<GlobalSearchMessagesRequestHasHas>? _mapHasFilters(List<String> values) {
  final List<GlobalSearchMessagesRequestHasHas> mapped =
      <GlobalSearchMessagesRequestHasHas>[];
  for (final String value in values) {
    final GlobalSearchMessagesRequestHasHas? item = _hasFilter(value);
    if (item != null) {
      mapped.add(item);
    }
  }
  return mapped.isEmpty ? null : mapped;
}

List<GlobalSearchMessagesRequestExcludeHasExcludeHas>? _mapExcludeHasFilters(
  List<String> values,
) {
  final List<GlobalSearchMessagesRequestExcludeHasExcludeHas> mapped =
      <GlobalSearchMessagesRequestExcludeHasExcludeHas>[];
  for (final String value in values) {
    final GlobalSearchMessagesRequestExcludeHasExcludeHas? item =
        _excludeHasFilter(value);
    if (item != null) {
      mapped.add(item);
    }
  }
  return mapped.isEmpty ? null : mapped;
}

GlobalSearchMessagesRequestHasHas? _hasFilter(String value) =>
    switch (value.toLowerCase()) {
      'image' => GlobalSearchMessagesRequestHasHas.image,
      'video' => GlobalSearchMessagesRequestHasHas.video,
      'sound' => GlobalSearchMessagesRequestHasHas.sound,
      'file' => GlobalSearchMessagesRequestHasHas.file,
      'link' => GlobalSearchMessagesRequestHasHas.link,
      'embed' => GlobalSearchMessagesRequestHasHas.embed,
      'sticker' => GlobalSearchMessagesRequestHasHas.sticker,
      'poll' => GlobalSearchMessagesRequestHasHas.poll,
      'snapshot' => GlobalSearchMessagesRequestHasHas.snapshot,
      _ => null,
    };

GlobalSearchMessagesRequestExcludeHasExcludeHas? _excludeHasFilter(
  String value,
) => switch (value.toLowerCase()) {
  'image' => GlobalSearchMessagesRequestExcludeHasExcludeHas.image,
  'video' => GlobalSearchMessagesRequestExcludeHasExcludeHas.video,
  'sound' => GlobalSearchMessagesRequestExcludeHasExcludeHas.sound,
  'file' => GlobalSearchMessagesRequestExcludeHasExcludeHas.file,
  'link' => GlobalSearchMessagesRequestExcludeHasExcludeHas.link,
  'embed' => GlobalSearchMessagesRequestExcludeHasExcludeHas.embed,
  'sticker' => GlobalSearchMessagesRequestExcludeHasExcludeHas.sticker,
  'poll' => GlobalSearchMessagesRequestExcludeHasExcludeHas.poll,
  'snapshot' => GlobalSearchMessagesRequestExcludeHasExcludeHas.snapshot,
  _ => null,
};

List<GlobalSearchMessagesRequestAuthorTypeAuthorType>? _mapAuthorTypes(
  List<String> values,
) {
  final List<GlobalSearchMessagesRequestAuthorTypeAuthorType> mapped =
      <GlobalSearchMessagesRequestAuthorTypeAuthorType>[];
  for (final String value in values) {
    final GlobalSearchMessagesRequestAuthorTypeAuthorType? item = switch (value
        .toLowerCase()) {
      'user' => GlobalSearchMessagesRequestAuthorTypeAuthorType.user,
      'bot' => GlobalSearchMessagesRequestAuthorTypeAuthorType.bot,
      'webhook' => GlobalSearchMessagesRequestAuthorTypeAuthorType.webhook,
      _ => null,
    };
    if (item != null) {
      mapped.add(item);
    }
  }
  return mapped.isEmpty ? null : mapped;
}

List<GlobalSearchMessagesRequestEmbedTypeEmbedType>? _mapEmbedTypes(
  List<String> values,
) {
  final List<GlobalSearchMessagesRequestEmbedTypeEmbedType> mapped =
      <GlobalSearchMessagesRequestEmbedTypeEmbedType>[];
  for (final String value in values) {
    final GlobalSearchMessagesRequestEmbedTypeEmbedType? item = switch (value
        .toLowerCase()) {
      'image' => GlobalSearchMessagesRequestEmbedTypeEmbedType.image,
      'video' => GlobalSearchMessagesRequestEmbedTypeEmbedType.video,
      'sound' => GlobalSearchMessagesRequestEmbedTypeEmbedType.sound,
      'article' => GlobalSearchMessagesRequestEmbedTypeEmbedType.article,
      _ => null,
    };
    if (item != null) {
      mapped.add(item);
    }
  }
  return mapped.isEmpty ? null : mapped;
}

List<GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType>?
_mapExcludeEmbedTypes(List<String> values) {
  final List<GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType>
  mapped = <GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType>[];
  for (final String value in values) {
    final GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType? item =
        switch (value.toLowerCase()) {
          'image' =>
            GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType.image,
          'video' =>
            GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType.video,
          'sound' =>
            GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType.sound,
          'article' =>
            GlobalSearchMessagesRequestExcludeEmbedTypeExcludeEmbedType.article,
          _ => null,
        };
    if (item != null) {
      mapped.add(item);
    }
  }
  return mapped.isEmpty ? null : mapped;
}

const Object _unset = Object();
