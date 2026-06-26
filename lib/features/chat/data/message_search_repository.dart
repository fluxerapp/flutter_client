import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
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
}

class MessageSearchQuery {
  const MessageSearchQuery({
    required this.channelId,
    this.guildId,
    this.text = '',
    this.authorId = '',
    this.scope = MessageSearchScopeFilter.current,
    this.sort = MessageSearchSortFilter.newest,
    this.contentTypes = const <MessageSearchContentFilter>{},
    this.page = 1,
  });

  final String channelId;
  final String? guildId;
  final String text;
  final String authorId;
  final MessageSearchScopeFilter scope;
  final MessageSearchSortFilter sort;
  final Set<MessageSearchContentFilter> contentTypes;
  final int page;

  MessageSearchQuery copyWith({
    String? channelId,
    Object? guildId = _unset,
    String? text,
    String? authorId,
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
    int? page,
  }) {
    return MessageSearchQuery(
      channelId: channelId ?? this.channelId,
      guildId: guildId == _unset ? this.guildId : guildId as String?,
      text: text ?? this.text,
      authorId: authorId ?? this.authorId,
      scope: scope ?? this.scope,
      sort: sort ?? this.sort,
      contentTypes: contentTypes ?? this.contentTypes,
      page: page ?? this.page,
    );
  }

  bool get hasSearchTerms =>
      text.trim().isNotEmpty ||
      authorId.trim().isNotEmpty ||
      contentTypes.isNotEmpty;
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

    final entries = <MessageSearchResultEntry>[
      for (final result in results.messages)
        MessageSearchResultEntry(
          message: Message.fromSearchResult(
            result,
            currentUserId: _currentUserId,
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
  final authorIds = _authorIdsFilter(query.authorId);
  final contentTypes = query.contentTypes
      .map(_messageContentType)
      .toList(growable: false);
  final sort = _messageSort(query.sort);

  return GlobalSearchMessagesRequest(
    hitsPerPage: kMessageSearchPageSize,
    page: query.page,
    content: _blankToNull(query.text),
    authorId: authorIds,
    has: contentTypes.isEmpty ? null : contentTypes,
    sortBy: sort.$1,
    sortOrder: sort.$2,
    scope: _messageSearchScope(query.scope),
    contextChannelId: query.scope == MessageSearchScopeFilter.current
        ? query.channelId
        : null,
    contextGuildId: query.scope == MessageSearchScopeFilter.current
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

List<String>? _authorIdsFilter(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final ids = <String>{};
  for (final part in trimmed.split(RegExp(r'[\s,]+'))) {
    final t = part.trim();
    if (t.isNotEmpty) {
      ids.add(t);
    }
  }
  return ids.isEmpty ? null : ids.toList();
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

GlobalSearchMessagesRequestHasHas _messageContentType(
  MessageSearchContentFilter type,
) => switch (type) {
  MessageSearchContentFilter.image => GlobalSearchMessagesRequestHasHas.image,
  MessageSearchContentFilter.video => GlobalSearchMessagesRequestHasHas.video,
  MessageSearchContentFilter.audio => GlobalSearchMessagesRequestHasHas.sound,
  MessageSearchContentFilter.file => GlobalSearchMessagesRequestHasHas.file,
  MessageSearchContentFilter.link => GlobalSearchMessagesRequestHasHas.link,
  MessageSearchContentFilter.embed => GlobalSearchMessagesRequestHasHas.embed,
  MessageSearchContentFilter.sticker =>
    GlobalSearchMessagesRequestHasHas.sticker,
};

const Object _unset = Object();
