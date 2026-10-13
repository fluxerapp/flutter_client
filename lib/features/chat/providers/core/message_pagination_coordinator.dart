import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';

@immutable
final class ContextToken {
  const ContextToken({required this.channelId, required this.windowEpoch});

  final String channelId;
  final int windowEpoch;

  @override
  bool operator ==(Object other) =>
      other is ContextToken &&
      other.channelId == channelId &&
      other.windowEpoch == windowEpoch;

  @override
  int get hashCode => Object.hash(channelId, windowEpoch);

  @override
  String toString() => '($channelId, $windowEpoch)';
}

final class DemandChanged {
  const DemandChanged({
    required this.edge,
    required this.active,
    required this.revision,
    required this.context,
  });

  final PaginationEdge edge;
  final bool active;

  final int revision;
  final ContextToken context;
}

final class EdgeRetry {
  const EdgeRetry({
    required this.edge,
    required this.context,
    required this.gestureId,
  });

  final PaginationEdge edge;
  final ContextToken context;
  final int gestureId;
}

abstract interface class PaginationDemandPort {
  void onDemandChanged(DemandChanged event);
  void onEdgeRetry(EdgeRetry event);
}

enum _PumpPhase { idle, pumping, awaitingGeometry, yielded, parked }

final class _EdgePump {
  _PumpPhase phase = _PumpPhase.idle;

  bool demandActive = false;

  int lastRevision = -1;

  int revisionAtRequest = -1;

  int revisionAtYield = -1;
  DateTime? yieldedAt;
  int requestsInPump = 0;

  bool requestInFlight = false;

  int? gestureIdAtPark;

  int? consumedRetryGestureId;

  Timer? geometryBackstop;

  void cancelBackstop() {
    geometryBackstop?.cancel();
    geometryBackstop = null;
  }
}

class MessagePaginationCoordinator implements PaginationDemandPort {
  MessagePaginationCoordinator(this._ref, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final Ref _ref;
  final DateTime Function() _now;

  final _EdgePump _older = _EdgePump();
  final _EdgePump _newer = _EdgePump();
  ContextToken? _token;
  bool _disposed = false;

  static const Duration geometryBackstopTimeout = Duration(milliseconds: 1000);

  _EdgePump _pumpFor(PaginationEdge edge) =>
      edge == PaginationEdge.older ? _older : _newer;

  ContextToken _liveToken() {
    final ChatViewState state = _ref.read(chatViewModelProvider);
    return ContextToken(
      channelId: state.channelId,
      windowEpoch: state.windowEpoch,
    );
  }

  void _adoptToken(ContextToken live) {
    if (_token == live) {
      return;
    }
    _token = live;
    _reset(_older);
    _reset(_newer);
  }

  void _reset(_EdgePump pump) {
    pump
      ..cancelBackstop()
      ..phase = _PumpPhase.idle
      ..demandActive = false
      ..lastRevision = -1
      ..revisionAtRequest = -1
      ..revisionAtYield = -1
      ..yieldedAt = null
      ..requestsInPump = 0
      ..gestureIdAtPark = null
      ..consumedRetryGestureId = null;
  }

  @visibleForTesting
  String debugPhase(PaginationEdge edge) => _pumpFor(edge).phase.name;

  void dispose() {
    _disposed = true;
    _older.cancelBackstop();
    _newer.cancelBackstop();
  }

  @override
  void onDemandChanged(DemandChanged event) {
    if (_disposed) {
      return;
    }
    _adoptToken(_liveToken());
    if (event.context != _token) {
      return;
    }
    final _EdgePump pump = _pumpFor(event.edge);
    final bool wasActive = pump.demandActive;
    final bool newRevision = event.revision > pump.lastRevision;
    if (!newRevision && event.active == wasActive) {
      return;
    }
    if (newRevision) {
      pump.lastRevision = event.revision;
    }
    pump.demandActive = event.active;
    switch (pump.phase) {
      case _PumpPhase.idle:
        if (event.active && !wasActive) {
          if (pump.requestInFlight) {
            return;
          }
          _startPump(event.edge, pump);
        }
      case _PumpPhase.pumping:
        break;
      case _PumpPhase.awaitingGeometry:
        if (event.revision > pump.revisionAtRequest) {
          pump.cancelBackstop();
          if (event.active) {
            _issueRequest(event.edge, pump);
          } else {
            _toIdle(pump);
          }
        }
      case _PumpPhase.yielded:
        if (!event.active) {
          _toIdle(pump);
          return;
        }
        final DateTime? yieldedAt = pump.yieldedAt;
        if (event.revision > pump.revisionAtYield &&
            yieldedAt != null &&
            _now().difference(yieldedAt) >= PumpBudget.yieldCooldown) {
          pump.requestsInPump = 0;
          _issueRequest(event.edge, pump);
        }
      case _PumpPhase.parked:
        if (event.active && !wasActive) {
          pump.requestsInPump = 0;
          _issueRequest(event.edge, pump);
        }
    }
  }

  @override
  void onEdgeRetry(EdgeRetry event) {
    if (_disposed) {
      return;
    }
    _adoptToken(_liveToken());
    if (event.context != _token) {
      return;
    }
    final _EdgePump pump = _pumpFor(event.edge);
    switch (pump.phase) {
      case _PumpPhase.parked:
        if (event.gestureId == pump.gestureIdAtPark) {
          return;
        }
        pump
          ..consumedRetryGestureId = event.gestureId
          ..gestureIdAtPark = event.gestureId
          ..requestsInPump = 0;
        _issueRequest(event.edge, pump);
      case _PumpPhase.yielded:
        if (event.gestureId == pump.consumedRetryGestureId) {
          return;
        }
        pump
          ..consumedRetryGestureId = event.gestureId
          ..requestsInPump = 0;
        _issueRequest(event.edge, pump);
      case _PumpPhase.idle:
      case _PumpPhase.pumping:
      case _PumpPhase.awaitingGeometry:
        break;
    }
  }

  void _startPump(PaginationEdge edge, _EdgePump pump) {
    pump.requestsInPump = 0;
    _issueRequest(edge, pump);
  }

  void _issueRequest(PaginationEdge edge, _EdgePump pump) {
    if (pump.requestInFlight) {
      return;
    }
    pump
      ..cancelBackstop()
      ..phase = _PumpPhase.pumping
      ..requestsInPump += 1
      ..revisionAtRequest = pump.lastRevision
      ..requestInFlight = true;
    final ContextToken? scheduledToken = _token;
    scheduleMicrotask(() {
      if (_disposed) {
        pump.requestInFlight = false;
        return;
      }
      if (scheduledToken != _token || pump.phase != _PumpPhase.pumping) {
        pump.requestInFlight = false;
        if (pump.phase == _PumpPhase.idle && pump.demandActive) {
          _startPump(edge, pump);
        }
        return;
      }
      unawaited(_runRequest(edge, pump));
    });
  }

  Future<void> _runRequest(PaginationEdge edge, _EdgePump pump) async {
    PageLoadResult result;
    try {
      final ChatViewModel viewModel = _ref.read(chatViewModelProvider.notifier);
      result = edge == PaginationEdge.older
          ? await viewModel.loadMore()
          : await viewModel.loadNewer();
    } on Object catch (error, stack) {
      talker.handle(error, stack, '[ChatPagination] pump request threw');
      pump.requestInFlight = false;
      if (!_disposed && pump.phase == _PumpPhase.pumping) {
        _park(pump);
      }
      return;
    }
    pump.requestInFlight = false;
    if (_disposed) {
      return;
    }
    _onResult(edge, pump, result);
  }

  void _onResult(PaginationEdge edge, _EdgePump pump, PageLoadResult result) {
    _adoptToken(_liveToken());
    final ContextToken resultToken = ContextToken(
      channelId: result.channelId,
      windowEpoch: result.windowEpoch,
    );
    if (resultToken != _token) {
      if (pump.phase == _PumpPhase.idle && pump.demandActive) {
        _startPump(edge, pump);
      }
      return;
    }
    if (pump.phase != _PumpPhase.pumping) {
      return;
    }
    if (!pump.demandActive) {
      _toIdle(pump);
      return;
    }
    switch (result.status) {
      case PageLoadStatus.superseded:
        _park(pump);
      case PageLoadStatus.skipped:
        _park(pump);
      case PageLoadStatus.empty:
      case PageLoadStatus.failed:
        _park(pump);
      case PageLoadStatus.applied:
        final bool advanced = cursorAdvanced(
          requestCursor: result.requestCursor,
          newBoundary: result.installedBoundary,
        );
        if (!advanced || !result.hasMoreAtEdge) {
          _park(pump);
          return;
        }
        if (pump.requestsInPump >= PumpBudget.maxRequestsPerPump) {
          pump
            ..phase = _PumpPhase.yielded
            ..revisionAtYield = pump.lastRevision
            ..yieldedAt = _now();
          return;
        }
        pump.phase = _PumpPhase.awaitingGeometry;
        _armBackstop(edge, pump);
    }
  }

  void _armBackstop(PaginationEdge edge, _EdgePump pump) {
    pump.cancelBackstop();
    final ContextToken? armedFor = _token;
    pump.geometryBackstop = Timer(geometryBackstopTimeout, () {
      pump.geometryBackstop = null;
      if (_token != armedFor || pump.phase != _PumpPhase.awaitingGeometry) {
        return;
      }
      if (pump.demandActive) {
        _issueRequest(edge, pump);
      } else {
        _toIdle(pump);
      }
    });
  }

  void _toIdle(_EdgePump pump) {
    pump
      ..cancelBackstop()
      ..phase = _PumpPhase.idle
      ..requestsInPump = 0
      ..demandActive = false;
  }

  void _park(_EdgePump pump) {
    pump
      ..cancelBackstop()
      ..phase = _PumpPhase.parked
      ..gestureIdAtPark = pump.consumedRetryGestureId;
  }
}

final messagePaginationCoordinatorProvider =
    Provider<MessagePaginationCoordinator>((ref) {
      final MessagePaginationCoordinator coordinator =
          MessagePaginationCoordinator(ref);
      ref
        ..listen<ChatViewState>(chatViewModelProvider, (previous, next) {
          coordinator._adoptToken(
            ContextToken(
              channelId: next.channelId,
              windowEpoch: next.windowEpoch,
            ),
          );
        })
        ..onDispose(coordinator.dispose);
      return coordinator;
    });
