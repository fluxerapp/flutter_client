import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

const String searchIndexNotReadyCode = 'SEARCH_INDEX_NOT_READY';
const String featureTemporarilyDisabledCode = 'FEATURE_TEMPORARILY_DISABLED';

sealed class ForumSearchOutcome {
  const ForumSearchOutcome();
}

class ForumSearchPage extends ForumSearchOutcome {
  const ForumSearchPage({
    required this.postIds,
    required this.hasMore,
    required this.firstMessages,
  });

  final List<String> postIds;
  final bool hasMore;
  final Map<String, Message> firstMessages;
}

class ForumSearchNotReady extends ForumSearchOutcome {
  const ForumSearchNotReady({this.retryAfterSeconds});

  final num? retryAfterSeconds;
}

class ForumSearchUnavailable extends ForumSearchOutcome {
  const ForumSearchUnavailable();
}

class ForumSearchQuery {
  const ForumSearchQuery({
    this.name,
    this.tagIds = const <String>[],
    this.tagMatch = ForumTagMatch.some,
    this.archived,
    this.sortOrder = ForumSortOrder.latestActivity,
    this.offset = 0,
  });

  final String? name;
  final List<String> tagIds;
  final ForumTagMatch tagMatch;
  final bool? archived;
  final ForumSortOrder sortOrder;
  final int offset;

  ThreadSearchSortBySchema get sortBy {
    if (name != null && name!.isNotEmpty) {
      return ThreadSearchSortBySchema.relevance;
    }
    return sortOrder == ForumSortOrder.creationTime
        ? ThreadSearchSortBySchema.creationTime
        : ThreadSearchSortBySchema.lastMessageTime;
  }
}

class ForumPostDraft {
  const ForumPostDraft({
    required this.name,
    required this.content,
    this.appliedTags = const <String>[],
    this.files = const <ComposerUploadFile>[],
    this.autoArchiveDuration,
  });

  final String name;
  final String content;
  final List<String> appliedTags;
  final List<ComposerUploadFile> files;
  final int? autoArchiveDuration;
}

class ForumTagDraft {
  const ForumTagDraft({
    required this.name,
    this.moderated = false,
    this.emojiId,
    this.emojiName,
  });

  final String name;
  final bool moderated;
  final String? emojiId;
  final String? emojiName;

  ForumTagRequest toRequest() => ForumTagRequest(
    name: name,
    moderated: moderated,
    emojiId: JsonNullable<SnowflakeType>.of(emojiId),
    emojiName: JsonNullable<String>.of(emojiId == null ? emojiName : null),
  );
}

bool isSearchUnavailableError(Object error) =>
    error is DioException &&
    error.response?.statusCode == 403 &&
    apiErrorCodeFromDioException(error) == featureTemporarilyDisabledCode;

class ForumRepository {
  const ForumRepository(
    this._client,
    this._dio,
    this._db,
    this._gate, {
    this._currentUserId,
  });

  final FluxerClient _client;
  final Dio _dio;
  final db.FluxerDatabase _db;
  final ThreadsGate _gate;
  final String? _currentUserId;

  Future<T> _guard<T>(String guildId, Future<T> Function() call) {
    if (!_gate.isActive(guildId)) {
      return Future<T>.error(ThreadsInactiveException(guildId));
    }
    return call();
  }

  Future<void> _storeChannel(String guildId, ChannelResponse channel) async {
    if (!_gate.isActive(guildId)) {
      throw ThreadsInactiveException(guildId);
    }
    await _db.channelDao.upsertChannel(channelFromSdk(channel, guildId));
  }

  Future<List<String>> _storePosts({
    required String guildId,
    required List<Object?> threads,
    required List<Object?> members,
  }) async {
    final List<String> ids = <String>[];
    final List<db.ChannelsCompanion> rows = <db.ChannelsCompanion>[];
    for (final Object? raw in threads) {
      if (raw is! Map) {
        continue;
      }
      final ChannelResponse thread = ChannelResponse.fromJson(
        raw.cast<String, Object?>(),
      );
      rows.add(channelFromSdk(thread, guildId));
      ids.add(thread.id);
    }
    if (!_gate.isActive(guildId)) {
      throw ThreadsInactiveException(guildId);
    }
    await _db.transaction(() async {
      if (rows.isNotEmpty) {
        await _db.channelDao.upsertChannelsMerged(rows);
      }
      for (final Object? raw in members) {
        if (raw is! Map) {
          continue;
        }
        final ThreadMemberResponse member = ThreadMemberResponse.fromJson(
          raw.cast<String, Object?>(),
        );
        final String? threadId = member.id;
        if (threadId == null || !ids.contains(threadId)) {
          continue;
        }
        await _db.threadDao.upsertMember(
          threadMemberFromSdk(member, threadId: threadId, guildId: guildId),
        );
      }
    });
    return ids;
  }

  Map<String, Message> _firstMessages(Object? raw) {
    if (raw is! List) {
      return const <String, Message>{};
    }
    final Map<String, Message> messages = <String, Message>{};
    for (final Object? entry in raw) {
      if (entry is! Map) {
        continue;
      }
      final Message message = Message.fromSdk(
        MessageResponseSchema.fromJson(entry.cast<String, Object?>()),
        currentUserId: _currentUserId,
      );
      messages[message.channelId] = message;
    }
    return messages;
  }

  Future<ForumSearchOutcome> searchPosts({
    required String guildId,
    required String forumId,
    required ForumSearchQuery query,
  }) => _guard(guildId, () async {
    final ThreadSearchResult result;
    try {
      result = await _client.channels.searchThreads(
        channelId: forumId,
        name: query.name,
        tag: query.tagIds.isEmpty ? null : query.tagIds,
        tagSetting: query.tagIds.length > 1
            ? ForumTagSettingSchema.fromJson(query.tagMatch.wireValue)
            : null,
        archived: query.archived?.toString(),
        sortBy: query.sortBy,
        offset: '${query.offset}',
      );
    } on DioException catch (error) {
      if (isSearchUnavailableError(error)) {
        return const ForumSearchUnavailable();
      }
      rethrow;
    }
    final Map<String, dynamic> json = result.toJson();
    if (json['code'] == searchIndexNotReadyCode) {
      return ForumSearchNotReady(
        retryAfterSeconds: json['retry_after'] as num?,
      );
    }
    final List<String> ids = await _storePosts(
      guildId: guildId,
      threads: json['threads'] as List<Object?>? ?? const <Object?>[],
      members: json['members'] as List<Object?>? ?? const <Object?>[],
    );
    return ForumSearchPage(
      postIds: ids,
      hasMore: json['has_more'] == true,
      firstMessages: _firstMessages(json['first_messages']),
    );
  });

  Future<ForumSearchPage> listArchivedPosts({
    required String guildId,
    required String forumId,
    String? before,
  }) => _guard(guildId, () async {
    final Response<Map<String, dynamic>> response = await _dio
        .get<Map<String, dynamic>>(
          '/channels/$forumId/threads/archived/public',
          queryParameters: <String, String>{
            'limit': '$forumSearchPageSize',
            'before': ?before,
          },
        );
    final Map<String, dynamic> json = response.data ?? <String, dynamic>{};
    final List<String> ids = await _storePosts(
      guildId: guildId,
      threads: json['threads'] as List<Object?>? ?? const <Object?>[],
      members: json['members'] as List<Object?>? ?? const <Object?>[],
    );
    return ForumSearchPage(
      postIds: ids,
      hasMore: json['has_more'] == true,
      firstMessages: const <String, Message>{},
    );
  });

  Future<Map<String, Message?>> fetchPostData({
    required String guildId,
    required String forumId,
    required List<String> postIds,
  }) => _guard(guildId, () async {
    final ThreadPostDataResponse response = await _client.channels
        .getChannelPostData(
          channelId: forumId,
          body: ThreadPostDataRequest(threadIds: postIds),
        );
    return <String, Message?>{
      for (final String id in postIds)
        id: switch (response.threads[id]?.firstMessage) {
          final MessageResponseSchema message => Message.fromSdk(
            message,
            currentUserId: _currentUserId,
          ),
          null => null,
        },
    };
  });

  Future<({String postId, Message? firstMessage})> createPost({
    required String guildId,
    required String forumId,
    required ForumPostDraft draft,
  }) => _guard(guildId, () async {
    final Map<String, dynamic> message = <String, dynamic>{
      if (draft.content.trim().isNotEmpty) 'content': draft.content.trim(),
      if (draft.files.isNotEmpty)
        'attachments': <Map<String, String>>[
          for (int i = 0; i < draft.files.length; i++)
            <String, String>{
              'id': '$i',
              'filename': _uploadName(draft.files[i]),
              'title': _uploadName(draft.files[i]),
            },
        ],
    };
    final Map<String, dynamic> payload = <String, dynamic>{
      'name': draft.name.trim(),
      'auto_archive_duration': ?draft.autoArchiveDuration,
      if (draft.appliedTags.isNotEmpty) 'applied_tags': draft.appliedTags,
      'message': message,
    };
    final Object body;
    final Options options;
    if (draft.files.isEmpty) {
      body = payload;
      options = Options(receiveTimeout: const Duration(minutes: 2));
    } else {
      final FormData form = FormData()
        ..fields.add(
          MapEntry<String, String>('payload_json', jsonEncode(payload)),
        );
      for (int i = 0; i < draft.files.length; i++) {
        final ComposerUploadFile upload = draft.files[i];
        form.files.add(
          MapEntry<String, MultipartFile>(
            'files[$i]',
            await MultipartFile.fromFile(
              upload.file.path,
              filename: _uploadName(upload),
            ),
          ),
        );
      }
      body = form;
      options = Options(
        contentType: 'multipart/form-data',
        sendTimeout: const Duration(minutes: 30),
        receiveTimeout: const Duration(minutes: 5),
      );
    }
    final Response<Map<String, dynamic>> response = await _dio
        .post<Map<String, dynamic>>(
          '/channels/$forumId/threads',
          data: body,
          options: options,
        );
    final Map<String, dynamic> json = response.data ?? <String, dynamic>{};
    final Object? rawMessage = json.remove('message');
    final Object? rawMember = json['member'];
    await _storePosts(
      guildId: guildId,
      threads: <Object?>[json],
      members: <Object?>[
        if (rawMember is Map)
          <String, Object?>{
            ...rawMember.cast<String, Object?>(),
            'id': json['id'],
          },
      ],
    );
    return (
      postId: json['id'] as String,
      firstMessage: rawMessage is Map
          ? Message.fromSdk(
              MessageResponseSchema.fromJson(
                rawMessage.cast<String, Object?>(),
              ),
              currentUserId: _currentUserId,
            )
          : null,
    );
  });

  Future<void> updateForum({
    required String guildId,
    required String forumId,
    required Map<String, Object?> patch,
  }) => _guard(guildId, () async {
    final ChannelResponse channel = await _client.channels.updateChannel(
      channelId: forumId,
      body: ChannelUpdateRequestBody(patch),
    );
    await _storeChannel(guildId, channel);
  });

  Future<void> createTag({
    required String guildId,
    required String forumId,
    required ForumTagDraft tag,
  }) => _guard(guildId, () async {
    final ChannelResponse channel = await _client.channels.createForumTag(
      channelId: forumId,
      body: tag.toRequest(),
    );
    await _storeChannel(guildId, channel);
  });

  Future<void> updateTag({
    required String guildId,
    required String forumId,
    required String tagId,
    required ForumTagDraft tag,
  }) => _guard(guildId, () async {
    final ChannelResponse channel = await _client.channels.updateForumTag(
      channelId: forumId,
      tagId: tagId,
      body: tag.toRequest(),
    );
    await _storeChannel(guildId, channel);
  });

  Future<void> deleteTag({
    required String guildId,
    required String forumId,
    required String tagId,
  }) => _guard(guildId, () async {
    final ChannelResponse channel = await _client.channels.deleteForumTag(
      channelId: forumId,
      tagId: tagId,
    );
    await _storeChannel(guildId, channel);
  });

  Future<void> updatePost({
    required String guildId,
    required String postId,
    required Map<String, Object?> patch,
  }) => _guard(guildId, () async {
    final ChannelResponse channel = await _client.channels.updateChannel(
      channelId: postId,
      body: ChannelUpdateRequestBody(patch),
    );
    await _storeChannel(guildId, channel);
  });

  Future<void> reactToPost({
    required String guildId,
    required String postId,
    required String emoji,
    required bool add,
  }) => _guard(
    guildId,
    () => add
        ? _client.channels.addReaction(
            channelId: postId,
            messageId: postId,
            emoji: emoji,
          )
        : _client.channels.removeOwnReaction(
            channelId: postId,
            messageId: postId,
            emoji: emoji,
          ),
  );
}

String _uploadName(ComposerUploadFile upload) =>
    upload.displayFilename ?? upload.file.name;

final Provider<ForumRepository> forumRepositoryProvider =
    Provider<ForumRepository>(
      (Ref ref) => ForumRepository(
        ref.watch(fluxerClientProvider),
        ref.watch(fluxerDioProvider),
        ref.watch(fluxerDatabaseProvider),
        ref.watch(threadsGateProvider),
        currentUserId: ref.watch(currentUserIdProvider),
      ),
    );
