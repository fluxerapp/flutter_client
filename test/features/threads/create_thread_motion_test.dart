import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:go_router/go_router.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/test_l10n.dart';

const String _guildId = '800';
const String _parentId = '1500';
const String _sourceId = '1600';
const String _actionLabel = 'Create thread action';

final Message _source = Message(
  id: _sourceId,
  channelId: _parentId,
  authorId: '42',
  authorName: 'Fullest',
  content: 'source text',
  timestamp: DateTime.utc(2026, 10, 14, 12, 12),
);

Map<String, Object?> _threadJson() => <String, Object?>{
  'id': _sourceId,
  'type': 11,
  'guild_id': _guildId,
  'parent_id': _parentId,
  'owner_id': '42',
  'name': 'test',
  'message_count': 0,
  'total_message_sent': 0,
  'member_count': 1,
  'thread_metadata': <String, Object?>{
    'archived': false,
    'auto_archive_duration': 4320,
    'archive_timestamp': '2026-10-14T12:23:00.000Z',
    'locked': false,
    'create_timestamp': '2026-10-14T12:23:00.000Z',
  },
};

class _ThreadsRepository extends ThreadsRepository {
  _ThreadsRepository(db.FluxerDatabase database)
    : super(FluxerClient(Dio()), database);

  @override
  Future<ThreadChannelResponse> startFromMessage({
    required String guildId,
    required String channelId,
    required String messageId,
    required StartThreadFromMessageRequest body,
  }) async => ThreadChannelResponse.fromJson(_threadJson());
}

class _Navigation {
  const _Navigation({
    required this.location,
    required this.sheet,
    required this.keyboardVisible,
    required this.thread,
    required this.starter,
  });

  final String location;
  final double? sheet;
  final bool keyboardVisible;
  final Channel? thread;
  final db.Message? starter;
}

class _RecordingRouter extends Fake implements GoRouter {
  _RecordingRouter(this.tester, this.container, this.database);

  final WidgetTester tester;
  final ProviderContainer Function() container;
  final db.FluxerDatabase database;
  final List<_Navigation> navigations = <_Navigation>[];
  final List<Future<void>> pending = <Future<void>>[];

  @override
  void go(String location, {Object? extra}) {
    final double? sheet = _routeValue(
      tester,
      find.text(testL10n.threadName, skipOffstage: false),
    );
    final bool keyboardVisible = tester.testTextInput.isVisible;
    final Channel? thread = container()
        .read(channelByIdProvider(_sourceId))
        .value;
    pending.add(
      database.messageDao.getMessage(_sourceId, _sourceId).then((starter) {
        navigations.add(
          _Navigation(
            location: location,
            sheet: sheet,
            keyboardVisible: keyboardVisible,
            thread: thread,
            starter: starter,
          ),
        );
      }),
    );
  }
}

class _MainRevealSide extends CurrentRevealSide {
  @override
  RevealSide build() => RevealSide.main;
}

class _FakeChatViewModel extends ChatViewModel {
  final List<String> switched = <String>[];

  @override
  ChatViewState build() => const ChatViewState(
    channelId: _parentId,
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

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    switched.add(channelId);
  }
}

double? _routeValue(WidgetTester tester, Finder finder) {
  if (finder.evaluate().isEmpty) {
    return null;
  }
  return ModalRoute.of(tester.element(finder.first))?.animation?.value;
}

class _Frame {
  _Frame({required this.action, required this.create, required this.scrims});

  factory _Frame.of(WidgetTester tester) => _Frame(
    action: _routeValue(tester, find.text(_actionLabel)),
    create: _routeValue(tester, find.text(testL10n.threadName)),
    scrims: tester
        .widgetList<ModalBarrier>(find.byType(ModalBarrier))
        .map((ModalBarrier barrier) => barrier.color?.a ?? 0)
        .where((double alpha) => alpha > 0.01)
        .toList(),
  );

  final double? action;
  final double? create;
  final List<double> scrims;

  double get combinedScrim =>
      1 - scrims.fold<double>(1, (double clear, double a) => clear * (1 - a));

  @override
  String toString() =>
      'action=$action create=$create scrims=$scrims '
      'combined=${combinedScrim.toStringAsFixed(3)}';
}

class _ActionSheetHost extends ConsumerWidget {
  const _ActionSheetHost();

  Future<void> _open(BuildContext context, WidgetRef ref) async {
    final MessageAction? action =
        await FluxerBottomSheet.showScrollable<MessageAction>(
          context,
          initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
          minChildSize: 0.3,
          builder: (sheetContext, scrollController, _) => ListView(
            controller: scrollController,
            children: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(sheetContext).pop(MessageAction.createThread),
                child: const Text(_actionLabel),
              ),
            ],
          ),
        );
    if (action == null || !context.mounted) {
      return;
    }
    await dispatchMessageAction(
      ref: ref,
      context: context,
      message: _source,
      action: action,
      callbacks: const MessageActionCallbacks(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => unawaited(_open(context, ref)),
          child: const Text('Open'),
        ),
      ),
    );
  }
}

class _Harness {
  _Harness(this.database, this.router, this.chat);

  final db.FluxerDatabase database;
  final _RecordingRouter router;
  final _FakeChatViewModel chat;
}

Future<_Harness> _pump(
  WidgetTester tester, {
  bool disableAnimations = false,
}) async {
  tester.view.physicalSize = const Size(1080, 2424);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final db.FluxerDatabase database = openTestDatabase();
  await database.channelDao.upsertChannel(
    db.ChannelsCompanion.insert(
      id: _parentId,
      guildId: _guildId,
      name: 'fwd-test',
    ),
  );
  await database.messageDao.upsertMessage(_source.toCompanion());
  ProviderContainer? container;
  final _RecordingRouter router = _RecordingRouter(
    tester,
    () => container!,
    database,
  );
  final _FakeChatViewModel chat = _FakeChatViewModel();
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        threadsRepositoryProvider.overrideWithValue(
          _ThreadsRepository(database),
        ),
        fluxerRouterProvider.overrideWithValue(router),
        chatViewModelProvider.overrideWith(() => chat),
        currentRevealSideProvider.overrideWith(_MainRevealSide.new),
        shouldShowMatureContentGateProvider(
          _sourceId,
        ).overrideWith((ref) => Future<bool>.value(false)),
        parentThreadActorProvider(_guildId, _parentId).overrideWithValue(
          ThreadActor(
            permissions:
                Permission.viewChannel.value |
                Permission.sendMessages.value |
                Permission.readMessageHistory.value |
                Permission.createPublicThreads.value |
                Permission.sendMessagesInThreads.value,
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        builder: (BuildContext context, Widget? child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(disableAnimations: disableAnimations),
          child: child!,
        ),
        home: Navigator(
          onGenerateRoute: (RouteSettings settings) => MaterialPageRoute<void>(
            builder: (BuildContext context) => Consumer(
              builder: (BuildContext context, WidgetRef ref, _) {
                container = ProviderScope.containerOf(context);
                return const _ActionSheetHost();
              },
            ),
          ),
        ),
      ),
    ),
  );
  return _Harness(database, router, chat);
}

Future<List<_Frame>> _record(
  WidgetTester tester, {
  Duration span = const Duration(milliseconds: 900),
}) async {
  final List<_Frame> frames = <_Frame>[_Frame.of(tester)];
  const Duration step = Duration(milliseconds: 8);
  for (Duration t = Duration.zero; t < span; t += step) {
    await tester.pump(step);
    frames.add(_Frame.of(tester));
  }
  return frames;
}

Future<void> _openActionSheet(WidgetTester tester) async {
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

Future<void> _expectScrimHandoff(WidgetTester tester) async {
  await _pump(tester);
  await _openActionSheet(tester);
  final double fullScrim = _Frame.of(tester).combinedScrim;
  expect(fullScrim, greaterThan(0.5));

  await tester.tap(find.text(_actionLabel));
  final List<_Frame> frames = await _record(tester);

  expect(frames.last.create, isNotNull);
  expect(frames.last.action, isNull);
  final bool backdropDims = defaultTargetPlatform != TargetPlatform.android;
  for (final _Frame frame in frames) {
    expect(frame.scrims.length, lessThanOrEqualTo(1), reason: '$frame');
    expect(
      frame.combinedScrim,
      greaterThanOrEqualTo(
        backdropDims ? kFluxerSheetBackdropDimColor.a - 0.01 : fullScrim - 0.01,
      ),
      reason: '$frame',
    );
    if ((frame.create ?? 0) > 0 && frame.action != null) {
      expect(
        frame.action,
        lessThanOrEqualTo(kFluxerSheetHandoffRemaining + 0.01),
        reason: '$frame',
      );
    }
  }
  expect(
    frames.any((_Frame frame) => frame.action != null && frame.create != null),
    isTrue,
    reason: 'the create sheet must rise before the action sheet is gone',
  );
  await tester.pumpAndSettle();
}

Future<void> _expectClosesIntoThread(
  WidgetTester tester, {
  bool disableAnimations = false,
}) async {
  final _Harness h = await _pump(tester, disableAnimations: disableAnimations);
  await _openActionSheet(tester);
  await tester.tap(find.text(_actionLabel));
  await tester.pumpAndSettle();
  await tester.enterText(find.byType(TextField).first, 'test');
  await tester.enterText(find.byType(TextField).last, '123');
  await tester.showKeyboard(find.byType(TextField).last);
  await tester.pump();
  expect(tester.testTextInput.isVisible, isTrue);

  await tester.tap(find.text(testL10n.threadCreate).last);
  for (int i = 0; i < 30 && h.router.pending.isEmpty; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump();
  }
  await tester.runAsync(() => Future.wait(h.router.pending));

  expect(h.router.navigations, hasLength(1));
  final _Navigation navigation = h.router.navigations.single;
  expect(navigation.location, RoutePaths.guildChannel(_guildId, _sourceId));
  expect(navigation.sheet, 1, reason: 'the thread opens under the sheet');
  expect(navigation.keyboardVisible, isTrue);
  expect(navigation.thread?.name, 'test');
  expect(navigation.starter?.type, messageTypeThreadStarterMessage);
  expect(h.chat.switched, <String>[_sourceId]);

  final List<_Frame> frames = await _record(
    tester,
    span: const Duration(milliseconds: 600),
  );
  double previous = 1;
  for (final _Frame frame in frames) {
    final double sheet = frame.create ?? 0;
    expect(sheet, lessThanOrEqualTo(previous + 0.001), reason: '$frame');
    previous = sheet;
  }
  expect(frames.last.create, isNull);
  expect(h.router.navigations, hasLength(1));
  final db.Message? parentSource = await tester.runAsync<db.Message?>(
    () => h.database.messageDao.getMessage(_parentId, _sourceId),
  );
  expect(parentSource?.content, 'source text');

  await tester.pumpWidget(const SizedBox.shrink());
  await tester.runAsync(h.database.close);
}

void main() {
  const TargetPlatformVariant phones = TargetPlatformVariant(<TargetPlatform>{
    TargetPlatform.iOS,
    TargetPlatform.android,
  });

  testWidgets('hands the action sheet scrim to the create sheet', (
    WidgetTester tester,
  ) async {
    await _expectScrimHandoff(tester);
  }, variant: phones);

  testWidgets('swaps sheets in one frame under reduced motion', (
    WidgetTester tester,
  ) async {
    await _pump(tester, disableAnimations: true);
    await _openActionSheet(tester);
    final double fullScrim = _Frame.of(tester).combinedScrim;

    await tester.tap(find.text(_actionLabel));
    await tester.pump();
    await tester.pump();

    final _Frame frame = _Frame.of(tester);
    expect(frame.action, isNull);
    expect(frame.create, 1);
    expect(frame.scrims, hasLength(1));
    expect(frame.combinedScrim, closeTo(fullScrim, 0.01));
    await tester.pumpAndSettle();
  }, variant: phones);

  testWidgets('closes straight into the named thread', (
    WidgetTester tester,
  ) async {
    await _expectClosesIntoThread(tester);
  }, variant: phones);

  testWidgets('closes into the thread under reduced motion', (
    WidgetTester tester,
  ) async {
    await _expectClosesIntoThread(tester, disableAnimations: true);
  }, variant: phones);
}
