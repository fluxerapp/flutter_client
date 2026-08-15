import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

const String _channelId = 'mobile-chat-channel';
const String _currentUserId = '111111111111111111';
const String _authorUserId = '222222222222222222';

void main() {
  group('mobile message surface', () {
    testWidgets('shows loading skeleton with semantics in panel layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadingState(channelId: _channelId),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsOneWidget);
      expect(
        tester.getSemantics(find.byType(MessageListSkeleton)),
        matchesSemantics(label: 'Loading messages'),
      );
      expect(
        tester.getSize(find.byType(MessageListSkeleton)).height,
        greaterThan(400),
      );
      await _disposeWidgetTree(tester);
    });

    testWidgets('renders loaded messages in panel layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final Message message = _message(
        id: '333333333333333333',
        content: 'Hello Hampus',
      );
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadedState(channelId: _channelId, messages: <Message>[message]),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsNothing);
      expect(find.byType(MessageItem), findsOneWidget);
      await _disposeWidgetTree(tester);
    });

    testWidgets(
      'renders messages when read state is still loading but messages arrived',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final db.FluxerDatabase database = await _openDatabase();
        addTearDown(database.close);
        final Message message = _message(
          id: '444444444444444444',
          content: 'Visible before read state',
        );
        final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
          _loadedState(channelId: _channelId, messages: <Message>[message]),
        );

        await tester.pumpWidget(
          _surfaceApp(
            database: database,
            chatViewModel: chatViewModel,
            readStateStream: readStateController.stream,
            child: _panelMessageSurface(
              const MessageList(expectedChannelId: _channelId),
            ),
          ),
        );
        await tester.pump();
        await tester.pump();

        expect(find.byType(MessageListSkeleton), findsNothing);
        expect(find.byType(MessageItem), findsOneWidget);
        await _disposeWidgetTree(tester);
      },
    );

    testWidgets('shows skeleton until view model channel id matches panel', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final Message message = _message(
        id: '555555555555555555',
        content: 'After sync',
      );
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadedState(channelId: '', messages: <Message>[message]),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsOneWidget);
      expect(find.text('After sync'), findsNothing);

      chatViewModel.replaceState(
        _loadedState(channelId: _channelId, messages: <Message>[message]),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsNothing);
      expect(find.byType(MessageItem), findsOneWidget);
      await _disposeWidgetTree(tester);
    });

    testWidgets(
      'keeps messages visible under drawer-style transform wrapping',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final db.FluxerDatabase database = await _openDatabase();
        addTearDown(database.close);
        final Message message = _message(
          id: '666666666666666666',
          content: 'Still visible under transform',
        );
        final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
          _loadedState(channelId: _channelId, messages: <Message>[message]),
        );

        await tester.pumpWidget(
          _surfaceApp(
            database: database,
            chatViewModel: chatViewModel,
            child: Transform.translate(
              offset: const Offset(-72, 0),
              child: RepaintBoundary(
                child: _panelMessageSurface(
                  const MessageList(expectedChannelId: _channelId),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        await tester.pump();

        expect(find.byType(MessageItem), findsOneWidget);
        await _disposeWidgetTree(tester);
      },
    );

    testWidgets('shows empty state instead of perpetual skeleton after load', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final StreamController<db.ReadState?> readStateController =
          StreamController<db.ReadState?>.broadcast();
      addTearDown(readStateController.close);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadedState(channelId: _channelId),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          readStateStream: readStateController.stream,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsNothing);
      expect(find.byType(Scrollable), findsNothing);
      expect(find.text('No messages yet'), findsOneWidget);
      await _disposeWidgetTree(tester);
    });
  });

  group('ChannelChatContent mobile sync', () {
    testWidgets(
      'retries switchChannel when view model channel stays mismatched',
      (WidgetTester tester) async {
        final _RetryingChatViewModel recorder = _RetryingChatViewModel();
        final ProviderContainer container = ProviderContainer(
          overrides: _contentOverrides(recorder: recorder),
        );
        addTearDown(container.dispose);

        await tester.pumpWidget(
          _contentApp(
            container: container,
            child: const ChannelChatContent(
              channelId: _channelId,
              showTopBar: false,
            ),
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        expect(
          recorder.switchChannelCalls
              .where((String id) => id == _channelId)
              .length,
          greaterThanOrEqualTo(2),
        );
        await _disposeWidgetTree(tester);
      },
    );

    // WIRING test for defect C1, observed at the switchChannel level. Bypassing
    // the request builder previously passed the entire suite; this is the test
    // that fails when it is bypassed. Mirrors jump-sequence.txt block 6.
    testWidgets('a consumed route target is never synced a second time', (
      WidgetTester tester,
    ) async {
      const String target = '999999999999999999';
      final _JumpTargetRecorder recorder = _JumpTargetRecorder();
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: target,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallCount,
        1,
        reason: 'the first jump must sync WITH the target',
      );

      // Step 2, the discriminating condition: jump to latest, so the target is
      // ABSENT from the window. Without this the old predicate dedupes
      // naturally and the test would pass against the very bug it exists for.
      recorder.emitJumpedToLatest();
      await tester.pump();
      expect(
        recorder.windowContains(target),
        isFalse,
        reason: 'the target must have left the window before we assert',
      );

      // Step 3: the unrelated realtime rebuild, which on device also nulls the
      // widget's dedupe. The ledger alone must hold here.
      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallCount,
        1,
        reason:
            'with the target ABSENT from the window, a second targeted sync is '
            'exactly the stale around=<old id> refetch the user could not read '
            'new messages through',
      );
      await _disposeWidgetTree(tester);
    });

    // PRODUCTION ENTRY repeat-tap: goes through navigateToChannelJumpLink, the
    // funnel every real caller uses, rather than poking the ledger directly.
    testWidgets('a repeat tap through the jump funnel is honoured again', (
      WidgetTester tester,
    ) async {
      const String target = '999999999999999999';
      final _JumpTargetRecorder recorder = _JumpTargetRecorder();
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: target,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();
      expect(recorder.targetedCallCount, 1, reason: 'first jump consumed');

      // Same absence step: the user has jumped away before re-tapping.
      recorder.emitJumpedToLatest();
      await tester.pump();

      // The user taps the same search result again. This is the real entry
      // point, so it must re-open the intent it just consumed.
      await navigateToChannelJumpLink(
        container: container,
        link: const MessageJumpLink(
          scope: '@me',
          channelId: _channelId,
          messageId: target,
        ),
      );
      await tester.pump();

      // Force the widget to sync again, as any rebuild would.
      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      final int afterRetap = recorder.targetedCallCount;
      expect(
        afterRetap,
        greaterThanOrEqualTo(2),
        reason:
            'a deliberate repeat tap must be honoured; suppressing it turns a '
            'fixed bug back into a broken one',
      );

      // Discriminating half: the re-tap must also be RE-CONSUMED. A scheme that
      // acknowledges by signal level or numeric version never closes the second
      // intent, because the fetch resets the signal and the version restarts,
      // so C1 would reopen for exactly this target.
      recorder.emitJumpedToLatest();
      await tester.pump();
      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallCount,
        afterRetap,
        reason:
            'after the re-tap is acknowledged, an unrelated event must not '
            'refetch around the target again',
      );
      await _disposeWidgetTree(tester);
    });

    // Mutation (g) guard. The UNSETTLED case: route target A is pending and was
    // never acknowledged, because its fetch was superseded or is still in
    // flight. There is no consumed record to protect it, the route still ends
    // /A, and fail-open would honour it on the next rebuild, yanking the user
    // off B, the jump they actually just asked for. Interruption is transient
    // and must stay retryable; supersession is a newer command and must not.
    testWidgets('a pending unacked target is dropped once a newer jump wins', (
      WidgetTester tester,
    ) async {
      const String targetA = '999999999999999999';
      const String targetB = '888888888888888881';
      // commandSignalOnSync false: A's sync NEVER acknowledges.
      final _JumpTargetRecorder recorder = _JumpTargetRecorder(
        commandSignalOnSync: false,
      );
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: targetA,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(recorder.targetedCallsFor(targetA), 1, reason: 'A was attempted');
      // Anti-vacuous guard: if A had acknowledged, the consumed record alone
      // would suppress it and this test would prove nothing about supersession.
      expect(
        recorder.commandedSignals,
        isNot(contains(targetA)),
        reason: 'A must remain UNACKNOWLEDGED for this to test supersession',
      );

      // The user taps B while A is still pending, through the real funnel.
      await navigateToChannelJumpLink(
        container: container,
        link: const MessageJumpLink(
          scope: '@me',
          channelId: _channelId,
          messageId: targetB,
        ),
      );
      await tester.pump();
      recorder.emitScrollCommand(targetB);
      await tester.pump();

      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallsFor(targetA),
        1,
        reason:
            'A was superseded by B: refetching around A drags the user off the '
            'message they just asked for',
      );
      await _disposeWidgetTree(tester);
    });

    // Mutation (e) guard at WIRING level. goToRepliedMessage highlights WITHOUT
    // the reset that switchChannel's fetch path performs, so on a same-target
    // in-place re-tap the listener fires with previous.signal == next.signal,
    // old and MATCHING. Level-match consumes on that highlight, before the jump
    // is commanded; the transition guard refuses. Consuming early here recreates
    // mutation (b)'s damage on the in-place path: superseded between highlight
    // and scroll, the tap is swallowed and the retry destroyed.
    testWidgets('a highlight update with a retained signal does not consume', (
      WidgetTester tester,
    ) async {
      const String target = '999999999999999999';
      final _JumpTargetRecorder recorder = _JumpTargetRecorder(
        initialMessages: <Message>[_message(id: target, content: 'target')],
        commandSignalOnSync: false,
        initialSignal: (target, 1),
      );
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: target,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();
      expect(recorder.targetedCallCount, 1, reason: 'first sync is targeted');

      // The in-place re-tap highlights first, retaining the stale signal.
      recorder.emitHighlightOnly(target);
      await tester.pump();
      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallCount,
        2,
        reason:
            'the highlight is not the jump: consuming on it swallows the tap if '
            'the jump is superseded before scrollToMessage runs',
      );

      // Now the jump is actually commanded: a real transition.
      recorder.emitScrollCommand(target);
      await tester.pump();
      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallCount,
        2,
        reason: 'once the jump is commanded the intent is consumed',
      );
      await _disposeWidgetTree(tester);
    });

    // Mutation (f) guard. Jumping to a SECOND message in the same channel is an
    // ordinary follow-up search, and it resolves IN PLACE because
    // activeChannelId == channelId, so the route still ends /A. A single-slot
    // ledger erased A's consumption on request(B), and since B's ack names B,
    // A could never be re-consumed: the stale refetch around A came back.
    testWidgets('jumping to a second message keeps the first consumed', (
      WidgetTester tester,
    ) async {
      const String targetA = '999999999999999999';
      const String targetB = '888888888888888881';
      final _JumpTargetRecorder recorder = _JumpTargetRecorder();
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: targetA,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();
      expect(recorder.targetedCallsFor(targetA), 1, reason: 'A jumped once');

      // Second search result, through the real funnel: resolves in place, so
      // the route is untouched and still ends /A.
      await navigateToChannelJumpLink(
        container: container,
        link: const MessageJumpLink(
          scope: '@me',
          channelId: _channelId,
          messageId: targetB,
        ),
      );
      await tester.pump();
      recorder.emitScrollCommand(targetB);
      await tester.pump();

      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallsFor(targetA),
        1,
        reason:
            'A stays consumed: a second targeted sync around A is the stale '
            'refetch this commit exists to stop',
      );
      expect(
        recorder.targetedCallsFor(targetB),
        0,
        reason: 'B is not a route target, so it is never synced as one',
      );
      await _disposeWidgetTree(tester);
    });

    // Mutation (b) guard: the retry invariant. Consuming at ISSUE time rather
    // than on arrival would suppress this retry, and an interrupted first jump
    // would leave the user nowhere with no way to recover.
    testWidgets('an interrupted targeted sync is retried, not consumed', (
      WidgetTester tester,
    ) async {
      const String target = '999999999999999999';
      final _JumpTargetRecorder recorder = _JumpTargetRecorder(
        deliverTarget: false,
      );
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: target,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.windowContains(target),
        isFalse,
        reason: 'precondition: the target never arrived',
      );

      // Any rebuild must try again, because the jump was never applied.
      recorder.emitStrandedEmptyWindow();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.targetedCallCount,
        greaterThanOrEqualTo(2),
        reason:
            'an interrupted jump must stay retryable: consuming at issue time '
            'strands the user with no way to reach the message',
      );
      await _disposeWidgetTree(tester);
    });

    // Mutation (d) guard. Searching a message ALREADY in the loaded window is the
    // most common search, and build() runs before the post-frame sync, so
    // consuming on presence alone marked it consumed and the first sync went out
    // TARGETLESS: no highlight, no scroll, and a re-tap could not recover it.
    // Asserted on the switchChannel request, NOT on the parked-scroll path.
    testWidgets('a target already in the window still syncs as targeted', (
      WidgetTester tester,
    ) async {
      const String target = '999999999999999999';
      final _JumpTargetRecorder recorder = _JumpTargetRecorder(
        initialMessages: <Message>[
          _message(id: target, content: 'already loaded'),
        ],
      );
      final ProviderContainer container = ProviderContainer(
        overrides: _jumpContentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            targetMessageId: target,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(
        recorder.calls.where((c) => c.targetMessageId == target).length,
        greaterThanOrEqualTo(1),
        reason:
            'the first sync must reach switchChannel AS TARGETED; a targetless '
            'first request swallows the jump unrecoverably',
      );
      await _disposeWidgetTree(tester);
    });

    testWidgets('shows messages after content sync completes', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _RetryingChatViewModel recorder = _RetryingChatViewModel();
      final ProviderContainer container = ProviderContainer(
        overrides: _contentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageItem), findsOneWidget);
      await _disposeWidgetTree(tester);
    });
  });
}

Widget _panelMessageSurface(Widget messageList) {
  return ColoredBox(
    color: const Color(0xFF111214),
    child: Column(
      children: <Widget>[
        const SizedBox(height: 56),
        Expanded(
          child: Stack(children: <Widget>[Positioned.fill(child: messageList)]),
        ),
        const SizedBox(height: 72),
      ],
    ),
  );
}

Future<void> _disposeWidgetTree(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 1));
}

Future<db.FluxerDatabase> _openDatabase() async {
  final db.FluxerDatabase database = openTestDatabase();
  await database.channelDao.upsertChannel(
    db.ChannelsCompanion.insert(
      id: _channelId,
      guildId: '',
      name: 'dm-hampus',
      type: const Value<int>(0),
    ),
  );
  return database;
}

List<Override> _surfaceOverrides({
  required db.FluxerDatabase database,
  required _HarnessChatViewModel chatViewModel,
  Stream<db.ReadState?>? readStateStream,
  List<Override> extraOverrides = const <Override>[],
}) {
  return <Override>[
    fluxerDatabaseProvider.overrideWithValue(database),
    chatViewModelProvider.overrideWith(() => chatViewModel),
    currentUserIdProvider.overrideWithValue(_currentUserId),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    activeGuildIdProvider.overrideWithValue(null),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: _channelId,
      ),
    ),
    dmViewModelProvider.overrideWithValue(
      const DmViewState(
        conversations: <DmConversation>[],
        friendsList: <Friend>[],
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    channelMessagePermissionsProvider(
      _channelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    messageListReadStateProvider(_channelId).overrideWith(
      (ref) => readStateStream ?? Stream<db.ReadState?>.value(null),
    ),
    maxMessageLengthProvider.overrideWithValue(2000),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: _currentUserId,
        username: 'tester',
        displayName: 'Tester',
        discriminator: '0',
        avatar: null,
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: <String>[],
        renderEmbeds: false,
        renderReactions: false,
        inlineAttachmentMedia: false,
      ),
    ),
    chatPreferencesProvider.overrideWithValue(const ChatPreferencesState()),
    appearancePreferencesProvider.overrideWithValue(
      const AppearancePreferencesState(),
    ),
    ...extraOverrides,
  ];
}

Widget _surfaceApp({
  required db.FluxerDatabase database,
  required _HarnessChatViewModel chatViewModel,
  required Widget child,
  Stream<db.ReadState?>? readStateStream,
  List<Override> extraOverrides = const <Override>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _surfaceOverrides(
      database: database,
      chatViewModel: chatViewModel,
      readStateStream: readStateStream,
      extraOverrides: extraOverrides,
    ),
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Scaffold(body: SizedBox(height: 700, child: child)),
      ),
    ),
  );
}

List<Override> _jumpContentOverrides({required ChatViewModel recorder}) {
  final db.FluxerDatabase database = openTestDatabase();
  return <Override>[
    activeChannelIdProvider.overrideWithValue(_channelId),
    shellHasPopupOverlayProvider.overrideWithValue(false),
    currentRevealSideProvider.overrideWithValue(RevealSide.main),
    chatViewModelProvider.overrideWith(() => recorder),
    fluxerDatabaseProvider.overrideWithValue(database),
    wellKnownProvider.overrideWith(_FakeWellKnown.new),
    maxMessageLengthProvider.overrideWithValue(2000),
    currentUserIdProvider.overrideWithValue(_currentUserId),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    channelMessagePermissionsProvider(
      _channelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    messageListReadStateProvider(
      _channelId,
    ).overrideWith((ref) => Stream<db.ReadState?>.value(null)),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
  ];
}

List<Override> _contentOverrides({required _RetryingChatViewModel recorder}) {
  final db.FluxerDatabase database = openTestDatabase();
  return <Override>[
    activeChannelIdProvider.overrideWithValue(_channelId),
    shellHasPopupOverlayProvider.overrideWithValue(false),
    currentRevealSideProvider.overrideWithValue(RevealSide.main),
    chatViewModelProvider.overrideWith(() => recorder),
    fluxerDatabaseProvider.overrideWithValue(database),
    wellKnownProvider.overrideWith(_FakeWellKnown.new),
    maxMessageLengthProvider.overrideWithValue(2000),
    currentUserIdProvider.overrideWithValue(_currentUserId),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    channelMessagePermissionsProvider(
      _channelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    messageListReadStateProvider(
      _channelId,
    ).overrideWith((ref) => Stream<db.ReadState?>.value(null)),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: _currentUserId,
        username: 'tester',
        displayName: 'Tester',
        discriminator: '0',
        avatar: null,
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: <String>[],
      ),
    ),
    chatPreferencesProvider.overrideWithValue(const ChatPreferencesState()),
    appearancePreferencesProvider.overrideWithValue(
      const AppearancePreferencesState(),
    ),
    dmViewModelProvider.overrideWithValue(
      const DmViewState(
        conversations: <DmConversation>[],
        friendsList: <Friend>[],
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: _channelId,
      ),
    ),
  ];
}

Widget _contentApp({
  required ProviderContainer container,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Scaffold(body: child),
      ),
    ),
  );
}

ChatViewState _loadingState({required String channelId}) {
  return ChatViewState(
    channelId: channelId,
    messages: const <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: true,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: true,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );
}

ChatViewState _loadedState({
  required String channelId,
  List<Message> messages = const <Message>[],
}) {
  return ChatViewState(
    channelId: channelId,
    messages: messages,
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );
}

Message _message({required String id, required String content}) {
  return Message(
    id: id,
    channelId: _channelId,
    authorId: _authorUserId,
    authorName: 'Hampus',
    content: content,
    timestamp: DateTime.utc(2026, 7, 25, 12),
  );
}

class _HarnessChatViewModel extends ChatViewModel {
  _HarnessChatViewModel(this._initialState);

  final ChatViewState _initialState;

  void replaceState(ChatViewState nextState) {
    state = nextState;
  }

  @override
  ChatViewState build() {
    ref
        .read(chatReadViewportProvider.notifier)
        .setActiveChannel(_initialState.channelId);
    return _initialState;
  }

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

class _RetryingChatViewModel extends ChatViewModel {
  final List<String> switchChannelCalls = <String>[];
  int _callCount = 0;

  @override
  ChatViewState build() {
    ref.read(chatReadViewportProvider.notifier).setActiveChannel('');
    return const ChatViewState(
      channelId: '',
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
      hasMoreMessages: false,
      hasMoreNewerMessages: false,
      errorMessage: null,
    );
  }

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    switchChannelCalls.add(channelId);
    _callCount += 1;
    if (_callCount == 1) {
      return;
    }
    state = _loadedState(
      channelId: channelId,
      messages: <Message>[
        _message(id: '777777777777777777', content: 'Synced hello'),
      ],
    );
  }

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

/// Records the full sync request, not just the channel, and simulates the
/// target ARRIVING so consumption can happen the way production does.
class _JumpTargetRecorder extends ChatViewModel {
  _JumpTargetRecorder({
    this.initialMessages = const <Message>[],
    this.deliverTarget = true,
    this.commandSignalOnSync = true,
    this.initialSignal,
  });

  final List<Message> initialMessages;

  /// When false the sync does not command a scroll, so the test drives the
  /// acknowledgement signal itself.
  final bool commandSignalOnSync;

  /// A stale signal already sitting in state, as if a previous jump to the same
  /// message had commanded one.
  final (String, int)? initialSignal;

  /// When false the targeted sync never lands its target, modelling an
  /// interrupted first jump that must therefore stay retryable.
  final bool deliverTarget;
  final List<({String channelId, String? targetMessageId})> calls =
      <({String channelId, String? targetMessageId})>[];
  final List<String> repliedJumps = <String>[];

  int get targetedCallCount =>
      calls.where((c) => c.targetMessageId != null).length;

  int targetedCallsFor(String messageId) =>
      calls.where((c) => c.targetMessageId == messageId).length;

  /// Every jump the view model has COMMANDED, so a test can prove a target was
  /// never acknowledged instead of assuming it.
  final List<String> commandedSignals = <String>[];

  @override
  ChatViewState build() {
    ref.read(chatReadViewportProvider.notifier).setActiveChannel(_channelId);
    final ChatViewState base = _loadedState(
      channelId: _channelId,
      messages: initialMessages,
    );
    return initialSignal == null
        ? base
        : base.copyWith(scrollToMessageSignal: initialSignal);
  }

  /// highlightJumpMessage: bumps the highlight sequence and RETAINS the scroll
  /// signal, so the listener sees previous.signal == next.signal.
  void emitHighlightOnly(String messageId) {
    state = state.copyWith(
      highlightedMessageId: messageId,
      jumpHighlightSequence: state.jumpHighlightSequence + 1,
    );
  }

  /// scrollToMessage: the actual jump command, a signal TRANSITION.
  void emitScrollCommand(String messageId) {
    commandedSignals.add(messageId);
    state = state.copyWith(
      scrollToMessageSignal: (
        messageId,
        (state.scrollToMessageSignal?.$2 ?? 0) + 1,
      ),
    );
  }

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    calls.add((channelId: channelId, targetMessageId: targetMessageId));
    if (targetMessageId != null && !deliverTarget) {
      // Interrupted: the around-window never arrives.
      state = _loadedState(channelId: channelId);
      return;
    }
    if (targetMessageId != null) {
      // Mirrors the production fetch path: _switchedChannelState resets the
      // signal, then scrollToMessage COMMANDS the jump. That transition is the
      // acknowledgement the ledger consumes on.
      final (String, int)? retained = state.scrollToMessageSignal;
      final ChatViewState loaded = _loadedState(
        channelId: channelId,
        messages: <Message>[_message(id: targetMessageId, content: 'target')],
      );
      // ONE assignment: a two-step restore would itself look like a signal
      // transition and fabricate an acknowledgement.
      if (commandSignalOnSync) {
        commandedSignals.add(targetMessageId);
      }
      state = commandSignalOnSync
          ? loaded.copyWith(
              scrollToMessageSignal: (targetMessageId, (retained?.$2 ?? 0) + 1),
            )
          : loaded.copyWith(scrollToMessageSignal: retained);
      return;
    }
    state = _loadedState(
      channelId: channelId,
      messages: <Message>[_message(id: '888888888888888888', content: 'newer')],
    );
  }

  @override
  Future<void> goToRepliedMessage({
    required String channelId,
    required String messageId,
  }) async {
    repliedJumps.add(messageId);
  }

  /// The user's jump-to-latest step: the window is replaced so the target id is
  /// ABSENT. This is the state in which the old predicate un-satisfied and the
  /// stale target was reissued, so the test must reach it before asserting.
  void emitJumpedToLatest() {
    state = _loadedState(
      channelId: _channelId,
      messages: <Message>[_message(id: '888888888888888888', content: 'newer')],
    );
  }

  /// A realtime event landing while the window is empty, which is the device
  /// trigger that nulls the widget's dedupe and reschedules a sync. The target
  /// is still absent here.
  void emitStrandedEmptyWindow() {
    state = _loadedState(
      channelId: _channelId,
    ).copyWith(scrollToMessageSignal: state.scrollToMessageSignal);
  }

  bool windowContains(String id) =>
      state.messages.any((Message m) => m.id == id);

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

class _FakeWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    return const WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: WellKnownFluxerResponseEndpoints(
        api: '',
        apiClient: '',
        apiPublic: '',
        gateway: '',
        media: '',
        staticCdn: '',
        marketing: '',
        admin: '',
        invite: '',
        gift: '',
        webapp: '',
      ),
      captcha: WellKnownFluxerResponseCaptcha(
        provider: 'none',
        hcaptchaSiteKey: null,
        turnstileSiteKey: null,
      ),
      features: WellKnownFluxerResponseFeatures(
        voiceEnabled: false,
        stripeEnabled: false,
        selfHosted: false,
        presignedAttachmentUploads: false,
        emailsEnabled: false,
      ),
      gif: WellKnownFluxerResponseGif(
        provider: '',
        displayName: '',
        attributionRequired: false,
      ),
      sso: WellKnownFluxerResponseSso(
        enabled: false,
        enforced: false,
        displayName: null,
        redirectUri: '',
      ),
      registration: WellKnownFluxerResponseRegistration(
        mode: WellKnownFluxerResponseRegistrationModeMode.open,
        adminRegistrationUrlsEnabled: false,
      ),
      community: WellKnownFluxerResponseCommunity(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
      ),
      services: WellKnownFluxerResponseServices(
        gifEnabled: false,
        youtubeEnabled: false,
        blueskyEnabled: false,
      ),
      limits: WellKnownFluxerResponseLimits(
        version: WellKnownFluxerResponseLimitsVersionVersion.value2,
        traitDefinitions: <String>[],
        rules: <WellKnownFluxerResponseLimitsRules>[],
        defaultsHash: '',
      ),
      push: WellKnownFluxerResponsePush(publicVapidKey: null),
      appPublic: WellKnownFluxerResponseAppPublic(
        branding: WellKnownFluxerResponseAppPublicBranding(
          productName: '',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
        ),
        setup: WellKnownFluxerResponseAppPublicSetup(
          configured: true,
          adminUrl: null,
        ),
        legal: WellKnownFluxerResponseAppPublicLegal(
          termsUrl: null,
          privacyUrl: null,
        ),
        registration: WellKnownFluxerResponseAppPublicRegistration(
          collectDateOfBirth: false,
        ),
      ),
    );
  }
}
