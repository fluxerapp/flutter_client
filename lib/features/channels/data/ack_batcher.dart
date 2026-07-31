import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';

const Duration kAckBatchDelay = Duration(seconds: 3);
const int kAckBatchSize = 100;
const Duration kAckRetryBaseDelay = Duration(seconds: 5);
const Duration kAckRetryMaxDelay = Duration(seconds: 60);

class _PendingAck {
  _PendingAck({required this.messageId, required this.deadline});

  String messageId;
  DateTime deadline;
  int attempt = 0;
}

class AckBatcher {
  AckBatcher({
    required this._client,
    this.onResponse,
    this.batchDelay = kAckBatchDelay,
    this.batchSize = kAckBatchSize,
    this.retryBaseDelay = kAckRetryBaseDelay,
    this.retryMaxDelay = kAckRetryMaxDelay,
  });

  final FluxerClient _client;

  /// Applies the authoritative read states the server returns for a flushed
  /// ack batch (ack id + mention count + version), keeping local state in sync.
  final Future<void> Function(ReadStateAckResponse response)? onResponse;
  final Duration batchDelay;
  final int batchSize;
  final Duration retryBaseDelay;
  final Duration retryMaxDelay;

  final Map<String, _PendingAck> _pending = {};
  Timer? _flushTimer;
  Future<void>? _inflightFlush;
  bool _disposed = false;

  void queue({
    required String channelId,
    required String messageId,
    required bool immediate,
    required bool hadMentions,
  }) {
    if (_disposed) {
      return;
    }
    final now = DateTime.now();
    final deadline = (immediate || hadMentions) ? now : now.add(batchDelay);
    final existing = _pending[channelId];
    if (existing == null) {
      _pending[channelId] = _PendingAck(
        messageId: messageId,
        deadline: deadline,
      );
    } else {
      existing.messageId = messageId;
      if (deadline.isBefore(existing.deadline)) {
        existing.deadline = deadline;
      }
    }
    _rescheduleTimer();
  }

  void cancel(String channelId) {
    _pending.remove(channelId);
    if (_pending.isEmpty) {
      _flushTimer?.cancel();
      _flushTimer = null;
    }
  }

  Future<void> flushPending({bool force = false}) async {
    if (_inflightFlush != null) {
      await _inflightFlush;
    }
    if (_pending.isEmpty) {
      return;
    }
    final completer = Completer<void>();
    _inflightFlush = completer.future;
    try {
      await _drainDueEntries(force: force);
    } finally {
      _inflightFlush = null;
      completer.complete();
    }
  }

  Future<void> dispose() async {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _flushTimer?.cancel();
    _flushTimer = null;
    if (_pending.isNotEmpty) {
      try {
        await flushPending(force: true);
      } on Object catch (e, s) {
        talker.error('[AckBatcher] dispose flush failed', e, s);
      }
    }
  }

  void _rescheduleTimer() {
    _flushTimer?.cancel();
    if (_pending.isEmpty || _disposed) {
      _flushTimer = null;
      return;
    }
    final now = DateTime.now();
    DateTime? nextDeadline;
    for (final entry in _pending.values) {
      if (nextDeadline == null || entry.deadline.isBefore(nextDeadline)) {
        nextDeadline = entry.deadline;
      }
    }
    if (nextDeadline == null) {
      return;
    }
    final delay = nextDeadline.isBefore(now)
        ? Duration.zero
        : nextDeadline.difference(now);
    _flushTimer = Timer(delay, () {
      _flushTimer = null;
      unawaited(flushPending());
    });
  }

  Future<void> _drainDueEntries({required bool force}) async {
    final now = DateTime.now();
    final hasDue =
        force || _pending.values.any((e) => !e.deadline.isAfter(now));
    if (!hasDue) {
      _rescheduleTimer();
      return;
    }
    final due = Map<String, _PendingAck>.from(_pending);

    final chunks = <List<MapEntry<String, _PendingAck>>>[];
    final dueEntries = due.entries.toList();
    for (var i = 0; i < dueEntries.length; i += batchSize) {
      final end = (i + batchSize).clamp(0, dueEntries.length);
      chunks.add(dueEntries.sublist(i, end));
    }

    for (final chunk in chunks) {
      final body = ReadStateAckRequest(
        readStates: chunk
            .map(
              (e) => ReadStateAckRequestReadStates(
                channelId: e.key,
                messageId: e.value.messageId,
              ),
            )
            .toList(),
      );
      try {
        final response = await _client.readStates.ackReadStates(body: body);
        for (final entry in chunk) {
          final current = _pending[entry.key];
          if (current != null && current.messageId == entry.value.messageId) {
            _pending.remove(entry.key);
          }
        }
        final onResponse = this.onResponse;
        if (onResponse != null) {
          await onResponse(response);
        }
      } on Object catch (e, s) {
        talker.error('[AckBatcher] bulk ack chunk failed', e, s);
        for (final entry in chunk) {
          final current = _pending[entry.key];
          if (current == null) {
            continue;
          }
          current
            ..attempt += 1
            ..deadline = DateTime.now().add(_retryDelay(current.attempt));
        }
      }
    }
    _rescheduleTimer();
  }

  Duration _retryDelay(int attempt) {
    var ms = retryBaseDelay.inMilliseconds;
    for (var i = 1; i < attempt; i++) {
      ms *= 2;
      if (ms >= retryMaxDelay.inMilliseconds) {
        return retryMaxDelay;
      }
    }
    return Duration(milliseconds: ms);
  }
}
