import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';

double messageListLoadEnterMargin(double viewportHeight) =>
    (viewportHeight * 0.9).clamp(480.0, 900.0);

double messageListLoadExitMargin(double viewportHeight) =>
    messageListLoadEnterMargin(viewportHeight) + viewportHeight * 0.5;

const double _kVelocityEmaAlpha = 0.3;

const double _kLookaheadSeconds = 0.5;

const double _kLookaheadMaxViewports = 4;

const double _kGeometryEpsilon = 0.5;

class _EdgeDemand {
  bool active = false;
  int revision = 0;
  double? lastDistance;

  void reset() {
    active = false;
    revision = 0;
    lastDistance = null;
  }
}

class MessageListDemandSource {
  MessageListDemandSource({
    required PaginationDemandPort port,
    Duration Function()? elapsed,
    // ignore: prefer_initializing_formals -- private fields, named params.
  }) : _port = port,
       _elapsed = elapsed ?? _monotonicClock();

  static Duration Function() _monotonicClock() {
    final Stopwatch stopwatch = Stopwatch()..start();
    return () => stopwatch.elapsed;
  }

  final PaginationDemandPort _port;

  final Duration Function() _elapsed;

  final _EdgeDemand _older = _EdgeDemand();
  final _EdgeDemand _newer = _EdgeDemand();
  ContextToken? _context;
  double? _lastExtentProxy;

  double _vSigned = 0;
  Duration? _lastDeltaAt;

  int _gestureId = 0;

  _EdgeDemand _edgeFor(PaginationEdge edge) =>
      edge == PaginationEdge.older ? _older : _newer;

  double _approachVelocity(PaginationEdge edge) => edge == PaginationEdge.older
      ? (_vSigned > 0 ? _vSigned : 0)
      : (_vSigned < 0 ? -_vSigned : 0);

  void updateGeometry({
    required double distanceToOlderEdge,
    required double distanceToNewerEdge,
    required double viewportHeight,
    required bool hasMoreOlder,
    required bool hasMoreNewer,
    required ContextToken context,
    bool olderInstallPending = false,
  }) {
    if (context != _context) {
      _context = context;
      _older.reset();
      _newer.reset();
      _lastExtentProxy = null;
      resetApproachVelocity();
    }
    final double extentProxy = distanceToOlderEdge + distanceToNewerEdge;
    final double? lastExtentProxy = _lastExtentProxy;
    final bool extentChanged =
        lastExtentProxy == null ||
        (extentProxy - lastExtentProxy).abs() > _kGeometryEpsilon;
    _lastExtentProxy = extentProxy;
    _sampleEdge(
      PaginationEdge.older,
      _older,
      distance: distanceToOlderEdge,
      viewportHeight: viewportHeight,
      hasMore: hasMoreOlder,
      suppressed: olderInstallPending,
      extentChanged: extentChanged,
    );
    _sampleEdge(
      PaginationEdge.newer,
      _newer,
      distance: distanceToNewerEdge,
      viewportHeight: viewportHeight,
      hasMore: hasMoreNewer,
      suppressed: false,
      extentChanged: extentChanged,
    );
  }

  void _sampleEdge(
    PaginationEdge edge,
    _EdgeDemand state, {
    required double distance,
    required double viewportHeight,
    required bool hasMore,
    required bool suppressed,
    required bool extentChanged,
  }) {
    final double lookahead = (_approachVelocity(edge) * _kLookaheadSeconds)
        .clamp(0.0, viewportHeight * _kLookaheadMaxViewports);
    final bool nextActive;
    if (!hasMore || suppressed) {
      nextActive = false;
    } else if (state.active) {
      nextActive =
          distance <= messageListLoadExitMargin(viewportHeight) + lookahead;
    } else {
      nextActive =
          distance <= messageListLoadEnterMargin(viewportHeight) + lookahead;
    }
    final double? lastDistance = state.lastDistance;
    final bool distanceChanged =
        lastDistance == null ||
        (distance - lastDistance).abs() > _kGeometryEpsilon;
    final bool levelChanged = nextActive != state.active;
    if (!distanceChanged && !extentChanged && !levelChanged) {
      return;
    }
    state
      ..active = nextActive
      ..lastDistance = distance
      ..revision += 1;
    _push(edge, state);
  }

  void forceGeometryRevision(PaginationEdge edge) {
    if (_context == null) {
      return;
    }
    _push(edge, _edgeFor(edge)..revision += 1);
  }

  void _push(PaginationEdge edge, _EdgeDemand state) {
    final ContextToken? context = _context;
    if (context == null) {
      return;
    }
    _port.onDemandChanged(
      DemandChanged(
        edge: edge,
        active: state.active,
        revision: state.revision,
        context: context,
      ),
    );
  }

  void onScrollDelta(double towardOlderDelta) {
    final Duration sampledAt = _elapsed();
    final Duration? previousAt = _lastDeltaAt;
    _lastDeltaAt = sampledAt;
    if (previousAt == null) {
      return;
    }
    final double dtSeconds = (sampledAt - previousAt).inMicroseconds / 1e6;
    if (dtSeconds <= 0) {
      return;
    }
    final double vInstant = towardOlderDelta / dtSeconds;
    _vSigned =
        _kVelocityEmaAlpha * vInstant + (1 - _kVelocityEmaAlpha) * _vSigned;
  }

  void resetApproachVelocity() {
    _vSigned = 0;
    _lastDeltaAt = null;
  }

  void onDragStart() {
    _gestureId += 1;
  }

  void onOverscrollTowardEdge(PaginationEdge edge) {
    final ContextToken? context = _context;
    if (context == null) {
      return;
    }
    _port.onEdgeRetry(
      EdgeRetry(edge: edge, context: context, gestureId: _gestureId),
    );
  }

  void onWindowTrimmed() {
    final ContextToken? context = _context;
    if (context == null) {
      return;
    }
    _gestureId += 1;
    for (final PaginationEdge edge in PaginationEdge.values) {
      if (_edgeFor(edge).active) {
        _port.onEdgeRetry(
          EdgeRetry(edge: edge, context: context, gestureId: _gestureId),
        );
      }
    }
  }
}
