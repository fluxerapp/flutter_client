/// Presentation-side demand source: reduces raw scroll geometry to per-edge
/// demand levels, monotonic geometry revisions, and retry gestures, and pushes
/// them into the application-owned [PaginationDemandPort]. Geometry never
/// crosses upward as data or dependency - the coordinator sees levels and
/// revisions, never pixels.
library;

import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';

/// Distance from a loaded edge at which edge demand activates, in pixels.
double messageListLoadEnterMargin(double viewportHeight) =>
    (viewportHeight * 0.9).clamp(480.0, 900.0);

/// Demand deactivates past this distance - hysteresis above the enter margin
/// so a level cannot flap across one boundary.
double messageListLoadExitMargin(double viewportHeight) =>
    messageListLoadEnterMargin(viewportHeight) + viewportHeight * 0.5;

/// EMA blend factor for the newest velocity sample.
const double _kVelocityEmaAlpha = 0.3;

/// Seconds of travel at the current approach velocity the demand horizon
/// looks ahead.
const double _kLookaheadSeconds = 0.5;

/// Lookahead cap, in viewport heights.
const double _kLookaheadMaxViewports = 4;

/// Geometry deltas at or below this are considered noise, not progress.
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

  /// Monotonic elapsed-time source for velocity dt; injectable for
  /// deterministic tests.
  final Duration Function() _elapsed;

  final _EdgeDemand _older = _EdgeDemand();
  final _EdgeDemand _newer = _EdgeDemand();
  ContextToken? _context;
  double? _lastExtentProxy;

  /// Signed approach velocity in px/s, positive = toward the OLDER edge.
  /// Fed exclusively by real scroll motion ([onScrollDelta]); layout-time
  /// position corrections dispatch no update notifications, so page landings,
  /// trims, and reflows contribute ZERO velocity at any size.
  double _vSigned = 0;
  Duration? _lastDeltaAt;

  int _gestureId = 0;

  _EdgeDemand _edgeFor(PaginationEdge edge) =>
      edge == PaginationEdge.older ? _older : _newer;

  double _approachVelocity(PaginationEdge edge) => edge == PaginationEdge.older
      ? (_vSigned > 0 ? _vSigned : 0)
      : (_vSigned < 0 ? -_vSigned : 0);

  /// Samples current geometry for both edges, mapped by the caller's layout
  /// adapter. Pushes a [DemandChanged] per edge whose distance/extent moved
  /// by more than [_kGeometryEpsilon] or whose level transitioned; a static
  /// viewport pushes nothing on its own.
  void updateGeometry({
    required double distanceToOlderEdge,
    required double distanceToNewerEdge,
    required double viewportHeight,
    required bool hasMoreOlder,
    required bool hasMoreNewer,
    required ContextToken context,
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
      extentChanged: extentChanged,
    );
    _sampleEdge(
      PaginationEdge.newer,
      _newer,
      distance: distanceToNewerEdge,
      viewportHeight: viewportHeight,
      hasMore: hasMoreNewer,
      extentChanged: extentChanged,
    );
  }

  void _sampleEdge(
    PaginationEdge edge,
    _EdgeDemand state, {
    required double distance,
    required double viewportHeight,
    required bool hasMore,
    required bool extentChanged,
  }) {
    // Each edge gets ONLY its own lookahead: a fling toward older must not
    // widen the newer zone.
    final double lookahead = (_approachVelocity(edge) * _kLookaheadSeconds)
        .clamp(0.0, viewportHeight * _kLookaheadMaxViewports);
    final bool nextActive;
    if (!hasMore) {
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

  /// Bumps one edge's revision past the geometry-change threshold and pushes
  /// it. Called post-frame after an install at that edge, after re-sampling
  /// via [updateGeometry]: an underfilled list keeps min == max == 0 across
  /// installs, so no metrics or scroll event fires and `awaitingGeometry`
  /// would deadlock. Edge-specific so an older install cannot release a
  /// concurrent newer pump against pre-layout geometry (and vice versa).
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

  /// Signed scroll motion, already mapped by the caller's geometry adapter:
  /// positive = toward the OLDER edge. Layout corrections never call this.
  void onScrollDelta(double towardOlderDelta) {
    final Duration sampledAt = _elapsed();
    final Duration? previousAt = _lastDeltaAt;
    _lastDeltaAt = sampledAt;
    if (previousAt == null) {
      // First sample after a reset carries no dt; it only anchors the clock.
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

  /// Zeroes the approach-velocity EMA. Called on dimension changes
  /// (ScrollMetricsNotification), re-anchors, and context changes so a stale
  /// velocity cannot widen a fresh layout's demand horizon.
  void resetApproachVelocity() {
    _vSigned = 0;
    _lastDeltaAt = null;
  }

  /// Mints the next gesture id. A drag start is a deliberate act; parked
  /// pumps buy exactly one retry per gesture.
  void onDragStart() {
    _gestureId += 1;
  }

  /// A gesture pressing into a hard edge moves zero pixels, so no scroll
  /// fires - the overscroll itself is the "give me more" signal. Repeated
  /// overscrolls in one gesture carry the same id and collapse upstream.
  void onOverscrollTowardEdge(PaginationEdge edge) {
    final ContextToken? context = _context;
    if (context == null) {
      return;
    }
    _port.onEdgeRetry(
      EdgeRetry(edge: edge, context: context, gestureId: _gestureId),
    );
  }

  /// A scroll-end trim shrank a capped window. Parked pumps ignore demand
  /// levels by design, so the trim re-arms them explicitly: mint a fresh
  /// gesture (the same one-retry-per-parked-cursor budget a drag start
  /// buys) and push a retry for each edge whose demand is active on the
  /// freshly sampled post-trim geometry. Idle pumps need nothing - the
  /// geometry republication's revision bump re-arms them.
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
