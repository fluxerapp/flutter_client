/// Event-driven pagination: presentation pushes demand/retry events into this
/// application-owned port; the coordinator owns pumps. Geometry never crosses
/// upward as data or dependency - the demand source reduces it to
/// active/inactive levels, revisions, and retry gestures before it gets here.
library;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';

/// The window identity a demand event or page request belongs to. A channel
/// switch or wholesale window replacement mints a new token; everything keyed
/// to the old one is dropped.
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

/// A change in one edge's demand level, carrying the source's monotonic
/// geometry revision for that edge.
final class DemandChanged {
  const DemandChanged({
    required this.edge,
    required this.active,
    required this.revision,
    required this.context,
  });

  final PaginationEdge edge;
  final bool active;

  /// Monotonic per (edge, context); bumped by presentation on consumption
  /// progress (geometry change, level transition, forced post-install push).
  final int revision;
  final ContextToken context;
}

/// A deliberate user gesture pressing into a loaded edge (overscroll).
/// Repeated overscrolls in one drag carry the same [gestureId] and collapse.
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

/// The application-owned port presentation pushes demand into.
abstract interface class PaginationDemandPort {
  void onDemandChanged(DemandChanged event);
  void onEdgeRetry(EdgeRetry event);
}

enum _PumpPhase { idle, pumping, awaitingGeometry, yielded, parked }

final class _EdgePump {
  _PumpPhase phase = _PumpPhase.idle;

  /// Cached demand level from the latest accepted event.
  bool demandActive = false;

  /// Highest revision seen from the source for this edge/context.
  int lastRevision = -1;

  /// Revision at the moment the in-flight request was issued; a page has not
  /// laid out until an event carries a HIGHER revision than this.
  int revisionAtRequest = -1;

  int revisionAtYield = -1;
  DateTime? yieldedAt;
  int requestsInPump = 0;

  /// Coordinator-side serialization: one request in flight per edge, in
  /// addition to the VM's isLoadingMore/isLoadingNewer.
  bool requestInFlight = false;

  String? cursorAtPark;
  int? gestureIdAtPark;

  /// The last retry gesture this pump consumed; a park binds to it so the
  /// same gesture cannot buy a second attempt.
  int? consumedRetryGestureId;

  Timer? geometryBackstop;

  void cancelBackstop() {
    geometryBackstop?.cancel();
    geometryBackstop = null;
  }
}

/// Owns the per-edge pump state machines. Transitions ONLY from
/// [PageLoadResult]s and port events - never by diffing VM state across an
/// await, and never by chaining a second request off a pre-page cached level:
/// every applied page passes through `awaitingGeometry` and waits for a
/// post-layout demand revision.
class MessagePaginationCoordinator implements PaginationDemandPort {
  MessagePaginationCoordinator(this._ref, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final Ref _ref;
  final DateTime Function() _now;

  final _EdgePump _older = _EdgePump();
  final _EdgePump _newer = _EdgePump();
  ContextToken? _token;
  bool _disposed = false;

  /// Liveness backstop for `awaitingGeometry`: an installed page changes
  /// extents and fires a metrics notification, so a qualifying revision
  /// should always arrive. If none does within this window the coordinator
  /// re-evaluates the cached level ONCE - a wedged source degrades to one
  /// bounded request instead of a stall or a loop.
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

  /// Adopts [live] as the current token, abandoning all per-edge interest
  /// keyed to the previous one.
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
      ..cursorAtPark = null
      ..gestureIdAtPark = null
      ..consumedRetryGestureId = null;
    // requestInFlight is deliberately NOT cleared: the future still resolves,
    // and its stale-token result is discarded on arrival.
  }

  @visibleForTesting
  String debugPhase(PaginationEdge edge) => _pumpFor(edge).phase.name;

  /// Stops all coordinator activity: cancels backstop timers and marks the
  /// instance dead so an in-flight request's continuation cannot read
  /// through a disposed [Ref].
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
      // Idempotent duplicate: already-seen revision, unchanged level.
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
            // A stale-context request is still draining; the cached level
            // re-arms when its result is discarded.
            return;
          }
          _startPump(event.edge, pump);
        }
      case _PumpPhase.pumping:
        // Cached; the in-flight result consults the level on arrival.
        break;
      case _PumpPhase.awaitingGeometry:
        if (event.revision > pump.revisionAtRequest) {
          pump.cancelBackstop();
          if (event.active) {
            _issueRequest(event.edge, pump);
          } else {
            // The page filled the horizon.
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
          // The level cycled: something real changed since the park.
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
          // Same gesture that parked (or already retried) this cursor:
          // collapsed, one attempt per deliberate gesture.
          return;
        }
        pump
          ..consumedRetryGestureId = event.gestureId
          // Pre-bind so an empty retry re-parks against THIS gesture.
          ..gestureIdAtPark = event.gestureId
          ..requestsInPump = 0;
        _issueRequest(event.edge, pump);
      case _PumpPhase.yielded:
        if (event.gestureId == pump.consumedRetryGestureId) {
          return;
        }
        // A deliberate gesture is at least as strong a resume signal as
        // cooldown + revision; also covers the theoretical underfilled yield
        // where no geometry progress is possible.
        pump
          ..consumedRetryGestureId = event.gestureId
          ..requestsInPump = 0;
        _issueRequest(event.edge, pump);
      case _PumpPhase.idle:
      case _PumpPhase.pumping:
      case _PumpPhase.awaitingGeometry:
        // Overscroll carries no extra meaning while a pump is live or the
        // level machinery already owns arming.
        break;
    }
  }

  void _startPump(PaginationEdge edge, _EdgePump pump) {
    pump.requestsInPump = 0;
    _issueRequest(edge, pump);
  }

  void _issueRequest(PaginationEdge edge, _EdgePump pump) {
    if (pump.requestInFlight) {
      // Never two in-flight requests on one edge.
      return;
    }
    pump
      ..cancelBackstop()
      ..phase = _PumpPhase.pumping
      ..requestsInPump += 1
      ..revisionAtRequest = pump.lastRevision
      ..requestInFlight = true;
    // Deferred one microtask so a demand push arriving inside a layout-phase
    // ScrollMetricsNotification cannot synchronously reach the VM's
    // `state = copyWith(isLoading*: true)` write mid-build. The token is
    // captured NOW: if a switch or wholesale swap adopts a new token before
    // the microtask runs, this request must not fire against the new window
    // - abort, free the edge, and arm the new context's cached demand
    // exactly like a stale result discard does.
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
      // loadMore/loadNewer catch Exceptions internally and return `failed`;
      // reaching this handler is a bug. Park defensively so the pump cannot
      // loop on it.
      talker.handle(error, stack, '[ChatPagination] pump request threw');
      pump.requestInFlight = false;
      if (!_disposed && pump.phase == _PumpPhase.pumping) {
        _park(pump, cursor: null);
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
      // Stale result - the pump was already reset when the token moved. The
      // new context's demand may have arrived while this request drained;
      // arm it now that the edge is free.
      if (pump.phase == _PumpPhase.idle && pump.demandActive) {
        _startPump(edge, pump);
      }
      return;
    }
    if (pump.phase != _PumpPhase.pumping) {
      // Defensive: with a live token the pump cannot have left `pumping`
      // while its request was in flight.
      return;
    }
    if (!pump.demandActive) {
      // Demand fell while the request was in flight: satisfied.
      _toIdle(pump);
      return;
    }
    switch (result.status) {
      case PageLoadStatus.superseded:
        // Token unchanged (checked above): boundary supersession without a
        // wholesale replacement. The next evaluation carries a fresh cursor.
        _park(pump, cursor: result.requestCursor);
      case PageLoadStatus.skipped:
        // Defensive: should not occur while this coordinator holds the only
        // in-flight request. Treated as non-advance.
        _park(pump, cursor: result.requestCursor);
      case PageLoadStatus.empty:
      case PageLoadStatus.failed:
        _park(pump, cursor: result.requestCursor);
      case PageLoadStatus.applied:
        final bool advanced = cursorAdvanced(
          requestCursor: result.requestCursor,
          newBoundary: result.installedBoundary,
        );
        if (!advanced || !result.hasMoreAtEdge) {
          _park(pump, cursor: result.requestCursor);
          return;
        }
        if (pump.requestsInPump >= PumpBudget.maxRequestsPerPump) {
          pump
            ..phase = _PumpPhase.yielded
            ..revisionAtYield = pump.lastRevision
            ..yieldedAt = _now();
          return;
        }
        // NEVER issue the next request on the cached level: the installed
        // page has not laid out yet, so cached `active=true` is pre-page
        // geometry. Wait for a post-layout revision.
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
      // Single-shot cached-level re-evaluation.
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

  void _park(_EdgePump pump, {required String? cursor}) {
    pump
      ..cancelBackstop()
      ..phase = _PumpPhase.parked
      ..cursorAtPark = cursor
      ..gestureIdAtPark = pump.consumedRetryGestureId;
  }
}

final messagePaginationCoordinatorProvider =
    Provider<MessagePaginationCoordinator>((ref) {
      final MessagePaginationCoordinator coordinator =
          MessagePaginationCoordinator(ref);
      // Reset per-edge interest the moment the live window identity moves -
      // in-flight results carrying the old token are discarded on arrival.
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
