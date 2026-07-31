import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_demand_source.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';

class _RecordingPort implements PaginationDemandPort {
  final List<DemandChanged> demands = <DemandChanged>[];
  final List<EdgeRetry> retries = <EdgeRetry>[];

  @override
  void onDemandChanged(DemandChanged event) => demands.add(event);

  @override
  void onEdgeRetry(EdgeRetry event) => retries.add(event);

  List<DemandChanged> edgeDemands(PaginationEdge edge) =>
      demands.where((DemandChanged e) => e.edge == edge).toList();

  DemandChanged? lastFor(PaginationEdge edge) {
    final List<DemandChanged> events = edgeDemands(edge);
    return events.isEmpty ? null : events.last;
  }
}

void main() {
  const double viewportHeight = 800;
  const ContextToken context = ContextToken(
    channelId: 'channel-1',
    windowEpoch: 0,
  );

  late _RecordingPort port;
  late MessageListDemandSource source;
  Duration fakeElapsed = Duration.zero;

  setUp(() {
    port = _RecordingPort();
    fakeElapsed = Duration.zero;
    source = MessageListDemandSource(port: port, elapsed: () => fakeElapsed);
  });

  void sample({
    required double older,
    required double newer,
    bool hasMoreOlder = true,
    bool hasMoreNewer = true,
    ContextToken token = context,
  }) {
    source.updateGeometry(
      distanceToOlderEdge: older,
      distanceToNewerEdge: newer,
      viewportHeight: viewportHeight,
      hasMoreOlder: hasMoreOlder,
      hasMoreNewer: hasMoreNewer,
      context: token,
    );
  }

  /// Builds a strong toward-older approach velocity: 48 px per 16 ms
  /// (3000 px/s) sustained long enough for the EMA to converge.
  void flingTowardOlder({int samples = 10}) {
    for (int i = 0; i < samples; i += 1) {
      fakeElapsed += const Duration(milliseconds: 16);
      source.onScrollDelta(48);
    }
  }

  group('demand levels', () {
    test('enter margin formula keeps the clamp bounds', () {
      expect(messageListLoadEnterMargin(200), 480);
      expect(messageListLoadEnterMargin(800), 720);
      expect(messageListLoadEnterMargin(2000), 900);
    });

    test('activates at the enter margin and not beyond it', () {
      final double enter = messageListLoadEnterMargin(viewportHeight);
      sample(older: enter + 1, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);

      sample(older: enter, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isTrue);
    });

    test('deactivates only past the exit margin (hysteresis)', () {
      final double enter = messageListLoadEnterMargin(viewportHeight);
      final double exit = messageListLoadExitMargin(viewportHeight);
      sample(older: enter, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isTrue);

      // Between enter and exit: stays active.
      sample(older: exit, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isTrue);

      sample(older: exit + 1, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);

      // And re-entering requires the ENTER margin again, not the exit one.
      sample(older: enter + 50, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);
    });

    test('hasMore false forces the level inactive inside the margin', () {
      sample(older: 100, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isTrue);

      sample(older: 100, newer: 5000, hasMoreOlder: false);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);
    });
  });

  group('approach velocity horizon', () {
    test('sustained toward-older motion activates ONLY older demand', () {
      sample(older: 2000, newer: 2000);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);
      expect(port.lastFor(PaginationEdge.newer)!.active, isFalse);

      flingTowardOlder();
      // Nudge geometry so the sample re-evaluates levels.
      sample(older: 1999, newer: 2001);
      expect(
        port.lastFor(PaginationEdge.older)!.active,
        isTrue,
        reason: 'older lookahead widens with toward-older velocity',
      );
      expect(
        port.lastFor(PaginationEdge.newer)!.active,
        isFalse,
        reason: 'a fling toward older must not widen the newer zone',
      );
    });

    test('a page-height distance jump WITHOUT scroll deltas produces zero '
        'approach velocity', () {
      sample(older: 5000, newer: 5000);
      // A landing teleports the distance by a page height; no onScrollDelta
      // samples accompany a layout-time correction.
      sample(older: 5000 - 900, newer: 5000 + 900);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);
      expect(port.lastFor(PaginationEdge.newer)!.active, isFalse);
    });

    test('a metrics notification resets a built-up EMA', () {
      sample(older: 2000, newer: 5000);
      flingTowardOlder();
      source.resetApproachVelocity();
      sample(older: 1999, newer: 5000);
      expect(
        port.lastFor(PaginationEdge.older)!.active,
        isFalse,
        reason: "stale velocity must not widen a fresh layout's horizon",
      );
    });
  });

  group('revision semantics', () {
    test('a static viewport pushes nothing on its own', () {
      sample(older: 2000, newer: 3000);
      final int eventCount = port.demands.length;
      sample(older: 2000, newer: 3000);
      sample(older: 2000.3, newer: 3000.2);
      expect(port.demands.length, eventCount);
    });

    test('a geometry change bumps the revision exactly once per edge', () {
      sample(older: 2000, newer: 3000);
      final int olderRevision = port.lastFor(PaginationEdge.older)!.revision;
      sample(older: 2010, newer: 3000 - 10);
      expect(port.lastFor(PaginationEdge.older)!.revision, olderRevision + 1);
      expect(
        port.edgeDemands(PaginationEdge.older).length,
        2,
        reason: 'one push per changed sample, not per notification source',
      );
    });

    test('forceGeometryRevision bumps ONLY its edge with byte-identical '
        'geometry', () {
      sample(older: 2000, newer: 3000);
      final int olderRevision = port.lastFor(PaginationEdge.older)!.revision;
      final int newerEvents = port.edgeDemands(PaginationEdge.newer).length;

      // Same geometry re-sampled: below the change threshold, no pushes.
      sample(older: 2000, newer: 3000);
      source.forceGeometryRevision(PaginationEdge.older);

      expect(port.lastFor(PaginationEdge.older)!.revision, olderRevision + 1);
      expect(
        port.edgeDemands(PaginationEdge.newer).length,
        newerEvents,
        reason: "an older install must not advance a newer pump's revision",
      );
    });

    test('forceGeometryRevision before any geometry sample is a no-op', () {
      source.forceGeometryRevision(PaginationEdge.older);
      expect(port.demands, isEmpty);
    });
  });

  group('retry gestures', () {
    test('overscroll before any geometry sample pushes nothing', () {
      source.onOverscrollTowardEdge(PaginationEdge.newer);
      expect(port.retries, isEmpty);
    });

    test('repeated overscrolls in one gesture carry the same id; a new drag '
        'mints the next', () {
      sample(older: 2000, newer: 100);
      source
        ..onDragStart()
        ..onOverscrollTowardEdge(PaginationEdge.newer)
        ..onOverscrollTowardEdge(PaginationEdge.newer)
        ..onOverscrollTowardEdge(PaginationEdge.newer);
      expect(port.retries, hasLength(3));
      expect(
        port.retries.map((EdgeRetry e) => e.gestureId).toSet(),
        hasLength(1),
      );

      source
        ..onDragStart()
        ..onOverscrollTowardEdge(PaginationEdge.newer);
      expect(port.retries.last.gestureId, port.retries.first.gestureId + 1);
    });
  });

  group('context changes', () {
    test('a context change restarts revisions and levels', () {
      sample(older: 100, newer: 5000);
      expect(port.lastFor(PaginationEdge.older)!.active, isTrue);
      final int revisionInA = port.lastFor(PaginationEdge.older)!.revision;
      expect(revisionInA, greaterThan(0));

      const ContextToken swapped = ContextToken(
        channelId: 'channel-1',
        windowEpoch: 1,
      );
      sample(older: 5000, newer: 5000, token: swapped);
      final DemandChanged olderInB = port.lastFor(PaginationEdge.older)!;
      expect(olderInB.context, swapped);
      expect(olderInB.active, isFalse);
      expect(olderInB.revision, 1);
    });

    test('a context change resets the EMA', () {
      sample(older: 2000, newer: 5000);
      flingTowardOlder();
      const ContextToken swapped = ContextToken(
        channelId: 'channel-2',
        windowEpoch: 0,
      );
      sample(older: 2000, newer: 5000, token: swapped);
      expect(port.lastFor(PaginationEdge.older)!.active, isFalse);
    });
  });
}
