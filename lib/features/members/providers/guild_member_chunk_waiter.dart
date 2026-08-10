import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const Duration kGuildMemberChunkWaitTimeout = Duration(milliseconds: 1500);

class GuildMemberChunkWaiter {
  final Map<String, List<Completer<void>>> _pending =
      <String, List<Completer<void>>>{};
  final Map<String, int> _expectedChunkCount = <String, int>{};
  final Map<String, List<String>> _lastChunkUserIds = <String, List<String>>{};
  final Map<String, int> _activeRequestId = <String, int>{};
  final Map<String, int> _requestGeneration = <String, int>{};

  List<String> lastChunkUserIds(String guildId) =>
      List<String>.unmodifiable(_lastChunkUserIds[guildId] ?? const <String>[]);

  int beginRequest(String guildId) {
    final int next = (_requestGeneration[guildId] ?? 0) + 1;
    _requestGeneration[guildId] = next;
    _activeRequestId[guildId] = next;
    _lastChunkUserIds.remove(guildId);
    _expectedChunkCount.remove(guildId);
    return next;
  }

  static String nonceFor(int requestId) => '$requestId';

  static int? requestIdFromNonce(String? nonce) {
    if (nonce == null || nonce.isEmpty) {
      return null;
    }
    return int.tryParse(nonce);
  }

  int? activeRequestId(String guildId) => _activeRequestId[guildId];

  void notifyChunk(
    String guildId, {
    List<String> userIds = const <String>[],
    int? requestId,
  }) {
    if (!_acceptsRequest(guildId, requestId)) {
      return;
    }
    _lastChunkUserIds[guildId] = List<String>.from(userIds);
    _completeWaiters(guildId, requestId);
  }

  void notifyChunkProgress(
    String guildId,
    int chunkIndex,
    int chunkCount, {
    List<String> userIds = const <String>[],
    int? requestId,
  }) {
    if (!_acceptsRequest(guildId, requestId)) {
      return;
    }
    if (userIds.isNotEmpty) {
      _lastChunkUserIds.putIfAbsent(guildId, () => <String>[]).addAll(userIds);
    }
    if (chunkCount > 0) {
      _expectedChunkCount[guildId] = chunkCount;
    }
    final int expected = _expectedChunkCount[guildId] ?? 0;
    if (expected > 0 && chunkIndex < expected - 1) {
      return;
    }
    _completeWaiters(guildId, requestId);
  }

  bool _acceptsRequest(String guildId, int? requestId) {
    final int? active = _activeRequestId[guildId];
    if (active != null) {
      return requestId == active;
    }
    return requestId == null;
  }

  void _completeWaiters(String guildId, int? requestId) {
    if (!_acceptsRequest(guildId, requestId)) {
      return;
    }
    final List<Completer<void>>? waiters = _pending.remove(guildId);
    _expectedChunkCount.remove(guildId);
    _clearActiveRequest(guildId, requestId);
    if (waiters == null) {
      return;
    }
    for (final Completer<void> completer in waiters) {
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
  }

  void _clearActiveRequest(String guildId, int? requestId) {
    if (requestId == null) {
      return;
    }
    if (_activeRequestId[guildId] == requestId) {
      _activeRequestId.remove(guildId);
    }
  }

  Future<void> waitForChunk(
    String guildId, {
    Duration timeout = kGuildMemberChunkWaitTimeout,
    int? requestId,
  }) async {
    if (requestId != null && _activeRequestId[guildId] != requestId) {
      return;
    }
    final Completer<void> completer = Completer<void>();
    _pending.putIfAbsent(guildId, () => <Completer<void>>[]).add(completer);
    try {
      await completer.future.timeout(timeout);
    } on TimeoutException {
      return;
    } finally {
      final List<Completer<void>>? waiters = _pending[guildId];
      waiters?.remove(completer);
      if (waiters != null && waiters.isEmpty) {
        _pending.remove(guildId);
        _clearActiveRequest(guildId, requestId);
      }
    }
  }
}

final Provider<GuildMemberChunkWaiter> guildMemberChunkWaiterProvider =
    Provider<GuildMemberChunkWaiter>((Ref ref) {
      ref.keepAlive();
      return GuildMemberChunkWaiter();
    });
