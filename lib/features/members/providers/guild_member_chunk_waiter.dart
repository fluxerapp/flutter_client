import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const Duration kGuildMemberChunkWaitTimeout = Duration(milliseconds: 1500);

class _PendingChunkRequest {
  final Completer<List<String>> completer = Completer<List<String>>();
  final List<String> userIds = <String>[];
  int receivedChunks = 0;
}

class GuildMemberChunkWaiter {
  final Map<String, _PendingChunkRequest> _pending =
      <String, _PendingChunkRequest>{};
  int _lastRequestId = 0;

  Future<List<String>?> request({
    required void Function(String nonce) send,
    Duration timeout = kGuildMemberChunkWaitTimeout,
  }) async {
    _lastRequestId += 1;
    final String nonce = '$_lastRequestId';
    final _PendingChunkRequest pending = _PendingChunkRequest();
    _pending[nonce] = pending;
    try {
      send(nonce);
      return await pending.completer.future.timeout(timeout);
    } on TimeoutException {
      return null;
    } finally {
      _pending.remove(nonce);
    }
  }

  void notifyChunk({
    required String? nonce,
    required int chunkCount,
    required List<String> userIds,
  }) {
    final _PendingChunkRequest? pending = _pending[nonce];
    if (pending == null || pending.completer.isCompleted) {
      return;
    }
    pending.userIds.addAll(userIds);
    pending.receivedChunks += 1;
    if (pending.receivedChunks >= chunkCount) {
      pending.completer.complete(List<String>.unmodifiable(pending.userIds));
    }
  }
}

final Provider<GuildMemberChunkWaiter> guildMemberChunkWaiterProvider =
    Provider<GuildMemberChunkWaiter>((Ref ref) {
      ref.keepAlive();
      return GuildMemberChunkWaiter();
    });
