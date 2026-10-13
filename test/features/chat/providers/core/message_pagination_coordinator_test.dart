import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';

const String _channelId = 'channel-1';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MessagePaginationCoordinator', () {
    test('(a) demand activation arms exactly one pump; repeated active events '
        'with new revisions while pumping issue nothing extra', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      final Completer<PageLoadResult> held = Completer<PageLoadResult>();
      h.vm.scriptOlderHeld(held);

      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1, reason: 'false→true arms one pump');
      expect(h.olderPhase, 'pumping');

      h
        ..demand(active: true, revision: 2)
        ..demand(active: true, revision: 3);
      await _flushAsync();
      expect(
        h.vm.loadMoreCalls,
        1,
        reason: 'demand while pumping is cached, never a concurrent request',
      );

      held.complete(_applied(requestCursor: '100', installedBoundary: '50'));
      await _flushAsync();
      expect(
        h.vm.loadMoreCalls,
        1,
        reason:
            'an applied page must wait for post-layout geometry, not '
            'chain off the pre-page cached level',
      );
      expect(h.olderPhase, 'awaitingGeometry');
    });

    test('(j) one page fills the horizon: post-layout inactive revision goes '
        'idle with exactly one request total', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      h.vm.scriptOlder(_applied(requestCursor: '100', installedBoundary: '50'));
      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'awaitingGeometry');

      h.demand(active: false, revision: 2);
      await _flushAsync();
      expect(h.olderPhase, 'idle');
      expect(
        h.vm.loadMoreCalls,
        1,
        reason: 'the pump must not issue request 2 on the pre-page level',
      );
    });

    test('(b) four advancing pages exhaust the budget into yielded; revisions '
        'before the cooldown do not resume; a revision after the cooldown '
        'resumes with a fresh budget and no EdgeRetry', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      for (int i = 0; i < 4; i += 1) {
        h.vm.scriptOlder(
          _applied(requestCursor: '${100 - i}', installedBoundary: '${50 - i}'),
        );
      }

      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'awaitingGeometry');

      h.demand(active: true, revision: 2);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 2);
      expect(h.olderPhase, 'awaitingGeometry');

      h.demand(active: true, revision: 3);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 3);
      expect(h.olderPhase, 'awaitingGeometry');

      h.demand(active: true, revision: 4);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, PumpBudget.maxRequestsPerPump);
      expect(h.olderPhase, 'yielded', reason: 'budget exhausted');

      h.demand(active: true, revision: 5);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, PumpBudget.maxRequestsPerPump);
      expect(h.olderPhase, 'yielded');

      h.now = h.now.add(PumpBudget.yieldCooldown);
      h.vm.scriptOlder(_applied(requestCursor: '96', installedBoundary: '46'));
      h.demand(active: true, revision: 6);
      await _flushAsync();
      expect(
        h.vm.loadMoreCalls,
        5,
        reason: 'cooldown + revision progress resumes with a fresh budget',
      );
      expect(h.olderPhase, 'awaitingGeometry');
    });

    test('(c) non-advancing applied page parks; active demand with new '
        'revisions never re-arms; a NEW gestureId buys exactly one attempt; '
        'an empty retry re-parks; the SAME gestureId collapses', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      h.vm.scriptOlder(
        _applied(requestCursor: '100', installedBoundary: '100'),
      );
      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'parked');

      h
        ..demand(active: true, revision: 2)
        ..demand(active: true, revision: 3);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'parked');

      h.vm.scriptOlder(_empty(requestCursor: '100'));
      h.retry(gestureId: 7);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 2);
      expect(h.olderPhase, 'parked', reason: 'the empty retry re-parks');

      h.retry(gestureId: 7);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 2);
      expect(h.olderPhase, 'parked');
    });

    test('(d) mid-pump context-token change: the held result carrying the old '
        'windowEpoch is discarded, nothing chains, phase is idle', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      final Completer<PageLoadResult> held = Completer<PageLoadResult>();
      h.vm.scriptOlderHeld(held);

      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'pumping');

      h.vm.setWindowEpoch(1);

      held.complete(_applied(requestCursor: '100', installedBoundary: '50'));
      await _flushAsync();

      expect(
        h.vm.loadMoreCalls,
        1,
        reason: 'the stale result is discarded, no chained request',
      );
      expect(h.olderPhase, 'idle');
    });

    test('(e) duplicate overscroll retries with the same gestureId collapse to '
        'one attempt on a parked edge', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      h.vm.scriptOlder(_empty(requestCursor: '100'));
      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'parked');

      final Completer<PageLoadResult> held = Completer<PageLoadResult>();
      h.vm.scriptOlderHeld(held);

      h
        ..retry(gestureId: 5)
        ..retry(gestureId: 5);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 2);

      held.complete(_empty(requestCursor: '100'));
      await _flushAsync();
      expect(h.olderPhase, 'parked');

      h.retry(gestureId: 5);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 2);
      expect(h.olderPhase, 'parked');
    });

    test(
      'an empty newer page parks its cursor; only a new gesture buys a retry',
      () async {
        final _Harness h = _Harness();
        addTearDown(h.dispose);

        h.vm.scriptNewer(_empty(requestCursor: '200'));
        h.demand(edge: PaginationEdge.newer, active: true, revision: 1);
        await _flushAsync();
        expect(h.vm.loadNewerCalls, 1);
        expect(h.newerPhase, 'parked');

        h
          ..demand(edge: PaginationEdge.newer, active: true, revision: 2)
          ..demand(edge: PaginationEdge.newer, active: true, revision: 3)
          ..demand(edge: PaginationEdge.newer, active: true, revision: 4);
        await _flushAsync();
        expect(h.vm.loadNewerCalls, 1);
        expect(h.newerPhase, 'parked');

        h.vm.scriptNewer(_empty(requestCursor: '200'));
        h.retry(edge: PaginationEdge.newer, gestureId: 1);
        await _flushAsync();
        expect(h.vm.loadNewerCalls, 2);
        expect(h.newerPhase, 'parked');

        h.retry(edge: PaginationEdge.newer, gestureId: 1);
        await _flushAsync();
        expect(h.vm.loadNewerCalls, 2, reason: 'same gesture is collapsed');

        h.vm.scriptNewer(_empty(requestCursor: '200'));
        h.retry(edge: PaginationEdge.newer, gestureId: 2);
        await _flushAsync();
        expect(h.vm.loadNewerCalls, 3, reason: 'a new gesture buys one retry');
        expect(h.newerPhase, 'parked');
      },
    );

    test('window progress re-arms a parked edge without any gesture', () async {
      final _Harness h = _Harness();
      addTearDown(h.dispose);

      h.vm.scriptOlder(_empty(requestCursor: '100'));
      h.demand(active: true, revision: 1);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'parked');

      h.demand(active: false, revision: 2);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 1);
      expect(h.olderPhase, 'parked');

      h.vm.scriptOlder(_applied(requestCursor: '100', installedBoundary: '40'));
      h.demand(active: true, revision: 3);
      await _flushAsync();
      expect(h.vm.loadMoreCalls, 2, reason: 'the level cycle re-arms a pump');
      expect(h.olderPhase, 'awaitingGeometry');
    });

    test('awaitingGeometry backstop, cached active: fires once after 1000ms '
        'for one more request; no second backstop-fired request without '
        'geometry', () {
      fakeAsync((FakeAsync async) {
        final _Harness h = _Harness();
        addTearDown(h.dispose);

        h.vm.scriptOlder(
          _applied(requestCursor: '100', installedBoundary: '50'),
        );
        h.demand(active: true, revision: 1);
        async.flushMicrotasks();
        expect(h.vm.loadMoreCalls, 1);
        expect(h.olderPhase, 'awaitingGeometry');

        async.elapse(const Duration(milliseconds: 999));
        expect(h.vm.loadMoreCalls, 1);
        expect(h.olderPhase, 'awaitingGeometry');

        h.vm.scriptOlder(
          _applied(
            requestCursor: '50',
            installedBoundary: '10',
            hasMoreAtEdge: false,
          ),
        );
        async.elapse(const Duration(milliseconds: 1));
        expect(
          h.vm.loadMoreCalls,
          2,
          reason: 'backstop re-evaluates the cached level exactly once',
        );
        async.flushMicrotasks();
        expect(h.olderPhase, 'parked', reason: 'edge exhausted');

        async.elapse(const Duration(seconds: 10));
        expect(h.vm.loadMoreCalls, 2);
        expect(h.olderPhase, 'parked');
      });
    });

    test('awaitingGeometry backstop, cached inactive: goes idle after 1000ms '
        'with no further request', () {
      fakeAsync((FakeAsync async) {
        final _Harness h = _Harness();
        addTearDown(h.dispose);

        h.vm.scriptOlder(
          _applied(requestCursor: '100', installedBoundary: '50'),
        );
        h.demand(active: true, revision: 1);
        async.flushMicrotasks();
        expect(h.vm.loadMoreCalls, 1);
        expect(h.olderPhase, 'awaitingGeometry');

        h.demand(active: false, revision: 1);
        expect(h.olderPhase, 'awaitingGeometry');

        async.elapse(const Duration(milliseconds: 1000));
        expect(h.olderPhase, 'idle');
        expect(h.vm.loadMoreCalls, 1);

        async.elapse(const Duration(seconds: 10));
        expect(h.vm.loadMoreCalls, 1);
        expect(h.olderPhase, 'idle');
      });
    });

    test(
      'production provider: a windowEpoch change resets the pump through the '
      'listener BEFORE the held result drains, and cached new-context demand '
      're-arms once it does',
      () async {
        final _ScriptedChatViewModel vm = _ScriptedChatViewModel(
          _initialState(),
        );
        final ProviderContainer container = ProviderContainer(
          overrides: [chatViewModelProvider.overrideWith(() => vm)],
        );
        addTearDown(container.dispose);
        container.read(chatViewModelProvider);
        final MessagePaginationCoordinator coordinator = container.read(
          messagePaginationCoordinatorProvider,
        );

        final Completer<PageLoadResult> held = Completer<PageLoadResult>();
        vm.scriptOlderHeld(held);
        const ContextToken epoch0 = ContextToken(
          channelId: _channelId,
          windowEpoch: 0,
        );
        coordinator.onDemandChanged(
          const DemandChanged(
            edge: PaginationEdge.older,
            active: true,
            revision: 1,
            context: epoch0,
          ),
        );
        await _flushAsync();
        expect(vm.loadMoreCalls, 1);
        expect(coordinator.debugPhase(PaginationEdge.older), 'pumping');

        vm.setWindowEpoch(1);
        await _flushAsync();
        expect(
          coordinator.debugPhase(PaginationEdge.older),
          'idle',
          reason:
              'the live-token listener must abandon per-edge interest the '
              'moment the window identity moves - not when the stale result '
              'eventually returns',
        );

        const ContextToken epoch1 = ContextToken(
          channelId: _channelId,
          windowEpoch: 1,
        );
        coordinator.onDemandChanged(
          const DemandChanged(
            edge: PaginationEdge.older,
            active: true,
            revision: 1,
            context: epoch1,
          ),
        );
        expect(vm.loadMoreCalls, 1);

        vm.scriptOlder(_empty(requestCursor: 'cursor-epoch1', windowEpoch: 1));
        held.complete(
          _applied(requestCursor: 'cursor-epoch0', installedBoundary: 'b-1'),
        );
        await _flushAsync();

        expect(
          vm.loadMoreCalls,
          2,
          reason:
              'the discarded stale result frees the edge and re-arms the '
              'cached new-context demand',
        );
        expect(coordinator.debugPhase(PaginationEdge.older), 'parked');
        coordinator.dispose();
      },
    );
  });
}

class _Harness {
  _Harness() : vm = _ScriptedChatViewModel(_initialState()) {
    _coordinatorProvider = Provider<MessagePaginationCoordinator>(
      (Ref ref) => MessagePaginationCoordinator(ref, now: () => now),
    );
    container = ProviderContainer(
      overrides: [chatViewModelProvider.overrideWith(() => vm)],
    );
    container.read(chatViewModelProvider);
    coordinator = container.read(_coordinatorProvider);
  }

  final _ScriptedChatViewModel vm;
  late final Provider<MessagePaginationCoordinator> _coordinatorProvider;
  late final ProviderContainer container;
  late final MessagePaginationCoordinator coordinator;

  DateTime now = DateTime.utc(2026, 1, 1, 12);

  String get olderPhase => coordinator.debugPhase(PaginationEdge.older);
  String get newerPhase => coordinator.debugPhase(PaginationEdge.newer);

  ContextToken get liveToken {
    final ChatViewState state = container.read(chatViewModelProvider);
    return ContextToken(
      channelId: state.channelId,
      windowEpoch: state.windowEpoch,
    );
  }

  void demand({
    required bool active,
    required int revision,
    PaginationEdge edge = PaginationEdge.older,
    ContextToken? context,
  }) {
    coordinator.onDemandChanged(
      DemandChanged(
        edge: edge,
        active: active,
        revision: revision,
        context: context ?? liveToken,
      ),
    );
  }

  void retry({
    required int gestureId,
    PaginationEdge edge = PaginationEdge.older,
    ContextToken? context,
  }) {
    coordinator.onEdgeRetry(
      EdgeRetry(
        edge: edge,
        context: context ?? liveToken,
        gestureId: gestureId,
      ),
    );
  }

  void dispose() {
    expect(
      vm.unscriptedCalls,
      0,
      reason: 'every request the coordinator issued must have been scripted',
    );
    coordinator.dispose();
    container.dispose();
  }
}

ChatViewState _initialState() => const ChatViewState(
  channelId: _channelId,
  messages: <Message>[],
  replyingTo: null,
  replyMentioning: false,
  editingMessage: null,
  messageText: '',
  scrollToBottomSignal: 0,
  isLoading: false,
  isSyncingMessages: false,
  isLoadingMore: false,
  isLoadingNewer: false,
  hasMoreMessages: true,
  hasMoreNewerMessages: true,
  errorMessage: null,
);

class _ScriptedChatViewModel extends ChatViewModel {
  _ScriptedChatViewModel(this._initialState);

  final ChatViewState _initialState;
  final List<Future<PageLoadResult>> _olderResults = <Future<PageLoadResult>>[];
  final List<Future<PageLoadResult>> _newerResults = <Future<PageLoadResult>>[];

  @visibleForTesting
  int loadMoreCalls = 0;
  @visibleForTesting
  int loadNewerCalls = 0;

  @visibleForTesting
  int unscriptedCalls = 0;

  @override
  ChatViewState build() => _initialState;

  void scriptOlder(PageLoadResult result) =>
      _olderResults.add(Future<PageLoadResult>.value(result));

  void scriptOlderHeld(Completer<PageLoadResult> completer) =>
      _olderResults.add(completer.future);

  void scriptNewer(PageLoadResult result) =>
      _newerResults.add(Future<PageLoadResult>.value(result));

  void setWindowEpoch(int windowEpoch) {
    state = state.copyWith(windowEpoch: windowEpoch);
  }

  @override
  Future<PageLoadResult> loadMore() {
    loadMoreCalls += 1;
    if (_olderResults.isEmpty) {
      unscriptedCalls += 1;
      return Completer<PageLoadResult>().future;
    }
    return _olderResults.removeAt(0);
  }

  @override
  Future<PageLoadResult> loadNewer() {
    loadNewerCalls += 1;
    if (_newerResults.isEmpty) {
      unscriptedCalls += 1;
      return Completer<PageLoadResult>().future;
    }
    return _newerResults.removeAt(0);
  }
}

PageLoadResult _applied({
  required String requestCursor,
  required String installedBoundary,
  bool hasMoreAtEdge = true,
  String channelId = _channelId,
  int windowEpoch = 0,
}) => PageLoadResult(
  channelId: channelId,
  windowEpoch: windowEpoch,
  requestCursor: requestCursor,
  installedBoundary: installedBoundary,
  status: PageLoadStatus.applied,
  hasMoreAtEdge: hasMoreAtEdge,
);

PageLoadResult _empty({
  required String requestCursor,
  String channelId = _channelId,
  int windowEpoch = 0,
}) => PageLoadResult(
  channelId: channelId,
  windowEpoch: windowEpoch,
  requestCursor: requestCursor,
  installedBoundary: null,
  status: PageLoadStatus.empty,
  hasMoreAtEdge: true,
);

Future<void> _flushAsync() async {
  for (int i = 0; i < 8; i += 1) {
    await pumpEventQueue();
  }
}
