// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

Message _message({
  required String id,
  required String authorId,
  required String authorName,
  String content = 'hello',
  int type = messageTypeDefault,
  MessageReference? messageReference,
}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: authorId,
    authorName: authorName,
    content: content,
    timestamp: DateTime.utc(2026),
    type: type,
    replyToId: messageReference?.messageId,
    messageReference: messageReference,
  );
}

final Message _parent = _message(
  id: 'parent-1',
  authorId: '1001',
  authorName: 'Sample User',
  content: 'original',
);

final Message _reply = _message(
  id: 'reply-1',
  authorId: '1002',
  authorName: 'August',
  content: 'reply text',
  type: messageTypeReply,
  messageReference: const MessageReference(
    channelId: 'channel-1',
    messageId: 'parent-1',
    type: MessageReferenceType.valueDefault,
  ),
);

Widget _buildTestApp({
  required FluxerDatabase db,
  required _RecordingChatViewModel recorder,
  required Widget home,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceRuntimeConfigOverride(),
      fluxerDatabaseProvider.overrideWithValue(db),
      chatViewModelProvider.overrideWith(() => recorder),
      currentUserIdProvider.overrideWithValue('1002'),
      activeGuildIdProvider.overrideWithValue(null),
      userSettingsViewModelProvider.overrideWithValue(
        const UserSettingsViewState(
          userId: '1002',
          username: 'august',
          displayName: 'August',
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
    ],
    child: MaterialApp(
      navigatorKey: rootNavigatorKey,
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: home),
    ),
  );
}

Finder get _confirmButton =>
    find.widgetWithText(FluxerButton, testL10n.chatMessageDelete);

Finder get _sheetDescription =>
    find.text(testL10n.chatMessageDeleteConfirmDescription);

Widget _openSheetButton({bool useCallerContext = true}) {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, _) {
      return ElevatedButton(
        onPressed: () {
          unawaited(
            showDeleteMessageConfirmSheet(
              useCallerContext ? context : null,
              ref,
              message: _reply,
            ),
          );
        },
        child: const Text('Open'),
      );
    },
  );
}

Future<void> _pumpOut(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 1));
}

Future<void> _runSheetTest(
  WidgetTester tester, {
  required FluxerDatabase db,
  required _RecordingChatViewModel recorder,
  required Widget home,
  required Future<void> Function() body,
}) async {
  await tester.pumpWidget(
    _buildTestApp(db: db, recorder: recorder, home: home),
  );
  try {
    await body();
  } finally {
    await _pumpOut(tester);
  }
}

void main() {
  late FluxerDatabase db;

  setUp(() {
    db = openTestDatabase();
  });

  testWidgets('does not delete a reply until the user confirms', (
    tester,
  ) async {
    final recorder = _RecordingChatViewModel();
    await _runSheetTest(
      tester,
      db: db,
      recorder: recorder,
      home: _openSheetButton(),
      body: () async {
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        expect(_sheetDescription, findsOneWidget);
        expect(recorder.deletedIds, isEmpty);

        await tester.tap(_confirmButton);
        await tester.pumpAndSettle();

        expect(_sheetDescription, findsNothing);
        expect(recorder.deletedIds, <String>['reply-1']);
      },
    );
  });

  testWidgets('confirms delete after the originating context unmounts', (
    tester,
  ) async {
    final recorder = _RecordingChatViewModel();
    await _runSheetTest(
      tester,
      db: db,
      recorder: recorder,
      home: const _UnmountAfterOpenHost(),
      body: () async {
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();
        expect(_sheetDescription, findsOneWidget);

        tester
            .state<_UnmountAfterOpenHostState>(
              find.byType(_UnmountAfterOpenHost),
            )
            .hideCaller();
        await tester.pump();
        expect(find.text('Open'), findsNothing);

        await tester.tap(_confirmButton);
        await tester.pumpAndSettle();

        expect(_sheetDescription, findsNothing);
        expect(recorder.deletedIds, <String>['reply-1']);
      },
    );
  });

  testWidgets('opens from the root navigator without a caller context', (
    tester,
  ) async {
    final recorder = _RecordingChatViewModel();
    await _runSheetTest(
      tester,
      db: db,
      recorder: recorder,
      home: _openSheetButton(useCallerContext: false),
      body: () async {
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        expect(_sheetDescription, findsOneWidget);

        await tester.tap(_confirmButton);
        await tester.pumpAndSettle();

        expect(recorder.deletedIds, <String>['reply-1']);
      },
    );
  });
}

class _UnmountAfterOpenHost extends ConsumerStatefulWidget {
  const _UnmountAfterOpenHost();

  @override
  ConsumerState<_UnmountAfterOpenHost> createState() =>
      _UnmountAfterOpenHostState();
}

class _UnmountAfterOpenHostState extends ConsumerState<_UnmountAfterOpenHost> {
  bool _showCaller = true;

  void hideCaller() => setState(() => _showCaller = false);

  @override
  Widget build(BuildContext context) {
    if (!_showCaller) {
      return const SizedBox.shrink();
    }
    return Builder(
      builder: (BuildContext callerContext) {
        return ElevatedButton(
          onPressed: () {
            unawaited(
              showDeleteMessageConfirmSheet(
                callerContext,
                ref,
                message: _reply,
              ),
            );
          },
          child: const Text('Open'),
        );
      },
    );
  }
}

class _RecordingChatViewModel extends ChatViewModel {
  final List<String> deletedIds = <String>[];

  @override
  ChatViewState build() => ChatViewState(
    channelId: 'channel-1',
    messages: <Message>[_parent, _reply],
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
  Future<void> deleteMessage(String messageId) async {
    deletedIds.add(messageId);
  }
}
