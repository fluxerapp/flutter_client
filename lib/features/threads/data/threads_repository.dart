import 'dart:convert';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'threads_repository.g.dart';

class ThreadsInactiveException implements Exception {
  const ThreadsInactiveException(this.guildId);

  final String guildId;

  @override
  String toString() => 'ThreadsInactiveException($guildId)';
}

class ThreadsRepository {
  const ThreadsRepository(this._client, this._db, this._gate);

  final FluxerClient _client;
  final db.FluxerDatabase _db;
  final ThreadsGate _gate;

  Future<T> _guard<T>(String guildId, Future<T> Function() call) {
    if (!_gate.isActive(guildId)) {
      return Future<T>.error(ThreadsInactiveException(guildId));
    }
    return call();
  }

  Future<void> _write(String guildId, Future<void> Function() write) {
    if (!_gate.isActive(guildId)) {
      return Future<void>.error(ThreadsInactiveException(guildId));
    }
    return _db.transaction(write);
  }

  Future<void> _store(ChannelResponse thread, String guildId) =>
      _write(guildId, () async {
        await _db.channelDao.upsertChannel(channelFromSdk(thread, guildId));
        final ThreadMemberResponse? member = thread.member;
        if (member != null) {
          await _db.threadDao.upsertMember(
            threadMemberFromSdk(member, threadId: thread.id, guildId: guildId),
          );
        }
      });

  Future<ThreadChannelResponse> startFromMessage({
    required String guildId,
    required String channelId,
    required String messageId,
    required StartThreadFromMessageRequest body,
  }) => _guard(
    guildId,
    () => _client.channels.startThreadFromMessage(
      channelId: channelId,
      messageId: messageId,
      body: body,
    ),
  );

  Future<StartForumThreadResponse> start({
    required String guildId,
    required String channelId,
    required StartThreadRequestBody body,
  }) => _guard(
    guildId,
    () => _client.channels.startThread(
      channelId: channelId,
      payloadJson: jsonEncode(body.toJson()),
    ),
  );

  Future<ChannelResponse> fetch({
    required String guildId,
    required String threadId,
  }) => _guard(guildId, () async {
    final ChannelResponse thread = await _client.channels.getChannel(
      channelId: threadId,
    );
    if (thread.guildId == guildId &&
        isThreadChannelType(thread.type.json ?? -1)) {
      await _store(thread, guildId);
    }
    return thread;
  });

  Future<ChannelResponse> update({
    required String guildId,
    required String threadId,
    required Map<String, Object?> body,
  }) => _guard(guildId, () async {
    final ChannelResponse thread = await _client.channels.updateChannel(
      channelId: threadId,
      body: ChannelUpdateRequestBody(body),
    );
    await _write(
      guildId,
      () => _db.channelDao.upsertChannel(channelFromSdk(thread, guildId)),
    );
    return thread;
  });

  Future<void> delete({required String guildId, required String threadId}) =>
      _guard(
        guildId,
        () => _client.channels.deleteChannel(channelId: threadId),
      );

  Future<void> join({required String guildId, required String threadId}) =>
      _guard(guildId, () => _client.channels.joinThread(channelId: threadId));

  Future<void> leave({required String guildId, required String threadId}) =>
      _guard(guildId, () => _client.channels.leaveThread(channelId: threadId));

  Future<void> addMember({
    required String guildId,
    required String threadId,
    required String userId,
  }) => _guard(
    guildId,
    () => _client.channels.addThreadMember(channelId: threadId, userId: userId),
  );

  Future<void> removeMember({
    required String guildId,
    required String threadId,
    required String userId,
  }) => _guard(
    guildId,
    () => _client.channels.removeThreadMember(
      channelId: threadId,
      userId: userId,
    ),
  );

  Future<ThreadMemberResponse?> updateSettings({
    required String guildId,
    required String threadId,
    required ThreadMemberSettingsRequest body,
  }) => _guard(guildId, () async {
    final ThreadMemberResponse? member = await _client.channels
        .updateThreadMemberSettings(channelId: threadId, body: body);
    if (member == null) {
      return null;
    }
    await _write(
      guildId,
      () => _db.threadDao.upsertMember(
        threadMemberFromSdk(member, threadId: threadId, guildId: guildId),
      ),
    );
    return member;
  });

  Future<ArchivedThreadsResponse> listArchived({
    required String guildId,
    required String parentId,
    required ArchivedThreadScope scope,
    String? before,
    int limit = 50,
  }) {
    final String limitParam = limit.toString();
    return _guard(
      guildId,
      () => switch (scope) {
        ArchivedThreadScope.public =>
          _client.channels.listPublicArchivedThreads(
            channelId: parentId,
            limit: limitParam,
            before: before,
          ),
        ArchivedThreadScope.private =>
          _client.channels.listPrivateArchivedThreads(
            channelId: parentId,
            limit: limitParam,
            before: before,
          ),
        ArchivedThreadScope.joinedPrivate =>
          _client.channels.listJoinedPrivateArchivedThreads(
            channelId: parentId,
            limit: limitParam,
            before: before,
          ),
      },
    );
  }
}

enum ArchivedThreadScope { public, private, joinedPrivate }

@riverpod
ThreadsRepository threadsRepository(Ref ref) => ThreadsRepository(
  ref.watch(fluxerClientProvider),
  ref.watch(fluxerDatabaseProvider),
  ref.watch(threadsGateProvider),
);
