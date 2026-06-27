import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const Duration kGuildMemberChunkWaitTimeout = Duration(milliseconds: 1500);

class GuildMemberChunkWaiter {
  final Map<String, List<Completer<void>>> _pending =
      <String, List<Completer<void>>>{};
  final Map<String, int> _expectedChunkCount = <String, int>{};
  final Map<String, List<String>> _lastChunkUserIds = <String, List<String>>{};

  List<String> lastChunkUserIds(String guildId) =>
      List<String>.unmodifiable(_lastChunkUserIds[guildId] ?? const <String>[]);

  void notifyChunk(String guildId, {List<String> userIds = const <String>[]}) {
    _lastChunkUserIds[guildId] = List<String>.from(userIds);
    _completeWaiters(guildId);
  }

  void notifyChunkProgress(
    String guildId,
    int chunkIndex,
    int chunkCount, {
    List<String> userIds = const <String>[],
  }) {
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
    _completeWaiters(guildId);
  }

  void _completeWaiters(String guildId) {
    final List<Completer<void>>? waiters = _pending.remove(guildId);
    _expectedChunkCount.remove(guildId);
    if (waiters == null) {
      return;
    }
    for (final Completer<void> completer in waiters) {
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
  }

  Future<void> waitForChunk(
    String guildId, {
    Duration timeout = kGuildMemberChunkWaitTimeout,
  }) async {
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
      }
    }
  }
}

final Provider<GuildMemberChunkWaiter> guildMemberChunkWaiterProvider =
    Provider<GuildMemberChunkWaiter>((Ref ref) {
      ref.keepAlive();
      return GuildMemberChunkWaiter();
    });
