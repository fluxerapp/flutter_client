import 'dart:async';
import 'dart:math';

import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';

const Duration kAckBatchDelay = Duration(seconds: 3);
const Duration kAckForegroundBatchDelay = Duration(milliseconds: 750);
const int kAckBatchSize = 100;
const Duration kAckRetryBaseDelay = Duration(seconds: 5);
const Duration kAckRetryMaxDelay = Duration(seconds: 60);

typedef _SentAck = ({String channelId, String messageId});

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
    Random? random,
  }) : _random = random ?? Random() {
    _queueBatchDelay = batchDelay;
  }

  final FluxerClient _client;

  final Future<void> Function(ReadStateAckResponse response)? onResponse;
  final Duration batchDelay;
  final int batchSize;
  final Duration retryBaseDelay;
  final Duration retryMaxDelay;
  final Random _random;

  final Map<String, _PendingAck> _pending = {};
  final Map<String, String> _inFlight = {};
  Timer? _flushTimer;
  Future<void>? _inflightFlush;
  bool _disposed = false;
  late Duration _queueBatchDelay;

  void setForegroundBatching({required bool foreground}) {
    _queueBatchDelay = foreground ? kAckForegroundBatchDelay : batchDelay;
    if (_disposed || _pending.isEmpty) {
      return;
    }
    final DateTime now = clock.now();
    final DateTime cap = now.add(_queueBatchDelay);
    for (final _PendingAck entry in _pending.values) {
      if (entry.deadline.isAfter(cap)) {
        entry.deadline = cap;
      }
    }
    _rescheduleTimer();
  }

  void queue({
    required String channelId,
    required String messageId,
    required bool immediate,
    required bool hadMentions,
  }) {
    if (_disposed) {
      return;
    }
    final now = clock.now();
    final deadline = (immediate || hadMentions)
        ? now
        : now.add(_queueBatchDelay);
    final existing = _pending[channelId];
    if (existing == null && _inFlight[channelId] == messageId) {
      return;
    }
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

  void clear() {
    _pending.clear();
    _inFlight.clear();
    _flushTimer?.cancel();
    _flushTimer = null;
  }

  void cancel(String channelId) {
    _pending.remove(channelId);
    _inFlight.remove(channelId);
    if (_pending.isEmpty) {
      _flushTimer?.cancel();
      _flushTimer = null;
    }
  }

  Future<void> flushPending({bool force = false}) async {
    while (_inflightFlush != null) {
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
        _logFailure('dispose flush failed', e, s);
      }
    }
  }

  void _rescheduleTimer() {
    _flushTimer?.cancel();
    if (_pending.isEmpty || _disposed) {
      _flushTimer = null;
      return;
    }
    final now = clock.now();
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
    final now = clock.now();
    final hasDue =
        force || _pending.values.any((e) => !e.deadline.isAfter(now));
    if (!hasDue) {
      _rescheduleTimer();
      return;
    }
    final List<_SentAck> due = <_SentAck>[
      for (final MapEntry<String, _PendingAck> entry in _pending.entries)
        (channelId: entry.key, messageId: entry.value.messageId),
    ];

    final chunks = <List<_SentAck>>[];
    for (var i = 0; i < due.length; i += batchSize) {
      final end = (i + batchSize).clamp(0, due.length);
      chunks.add(due.sublist(i, end));
    }

    for (final chunk in chunks) {
      final body = ReadStateAckRequest(
        readStates: chunk
            .map(
              (_SentAck e) => ReadStateAckRequestReadStates(
                channelId: e.channelId,
                messageId: e.messageId,
              ),
            )
            .toList(),
      );
      for (final _SentAck entry in chunk) {
        _inFlight[entry.channelId] = entry.messageId;
      }
      try {
        final response = await _client.readStates.ackReadStates(body: body);
        _clearInFlight(chunk);
        _removeSent(chunk);
        final onResponse = this.onResponse;
        if (onResponse != null) {
          await onResponse(response);
        }
      } on Object catch (e, s) {
        _clearInFlight(chunk);
        _logFailure('bulk ack chunk failed', e, s);
        if (_isRejected(e)) {
          _removeSent(chunk);
          continue;
        }
        final int retryAfterMs = e is DioException
            ? retryAfterMsFromDioException(e) ?? 0
            : 0;
        for (final _SentAck entry in chunk) {
          final current = _pending[entry.channelId];
          if (current == null || current.messageId != entry.messageId) {
            continue;
          }
          current.attempt += 1;
          final Duration backoff = _retryDelay(current.attempt);
          current.deadline = clock.now().add(
            Duration(milliseconds: max(backoff.inMilliseconds, retryAfterMs)),
          );
        }
      }
    }
    _rescheduleTimer();
  }

  void _removeSent(List<_SentAck> chunk) {
    for (final _SentAck entry in chunk) {
      final current = _pending[entry.channelId];
      if (current != null && current.messageId == entry.messageId) {
        _pending.remove(entry.channelId);
      }
    }
  }

  void _clearInFlight(List<_SentAck> chunk) {
    for (final _SentAck entry in chunk) {
      if (_inFlight[entry.channelId] == entry.messageId) {
        _inFlight.remove(entry.channelId);
      }
    }
  }

  bool _isRejected(Object error) {
    if (error is! DioException) {
      return false;
    }
    final int? status = error.response?.statusCode;
    return status != null && status >= 400 && status < 500 && status != 429;
  }

  Duration _retryDelay(int attempt) => jitteredBackoff(
    attempt: attempt,
    base: retryBaseDelay,
    cap: retryMaxDelay,
    random: _random,
  );

  void _logFailure(String message, Object error, StackTrace stackTrace) {
    if (isTransientNetworkError(error)) {
      talker.warning('[AckBatcher] $message, will retry: $error');
      return;
    }
    talker.error('[AckBatcher] $message', error, stackTrace);
  }
}
