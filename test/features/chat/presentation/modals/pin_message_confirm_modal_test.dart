// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:async';

import 'package:dio/dio.dart';
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
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/modals/pin_message_confirm_modal.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_confirm_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
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

final Message _message = Message(
  id: 'msg-1',
  channelId: 'channel-1',
  authorId: 'user-1',
  authorName: 'user',
  content: 'hello',
  timestamp: DateTime.utc(2026),
);

Finder get _confirmButton =>
    find.widgetWithText(FluxerButton, testL10n.chatMessagePinConfirm);

Finder get _cancelButton => find.widgetWithText(FluxerButton, testL10n.cancel);

Finder get _modalDescription =>
    find.text(testL10n.chatMessagePinConfirmDescription);

Widget _buildTestApp({
  required FluxerDatabase db,
  required _RecordingPinsRepository recorder,
  required Widget home,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceRuntimeConfigOverride(),
      fluxerDatabaseProvider.overrideWithValue(db),
      channelPinsRepositoryProvider.overrideWithValue(recorder),
      chatViewModelProvider.overrideWith(_StubChatViewModel.new),
      currentUserIdProvider.overrideWithValue('user-1'),
      activeGuildIdProvider.overrideWithValue(null),
      userSettingsViewModelProvider.overrideWithValue(
        const UserSettingsViewState(
          userId: 'user-1',
          username: 'user',
          displayName: 'user',
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

Widget _openModalButton() {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, _) {
      return ElevatedButton(
        onPressed: () {
          unawaited(
            showPinMessageConfirmModal(context, ref, message: _message),
          );
        },
        child: const Text('Open'),
      );
    },
  );
}

Widget _dispatchPinButton() {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, _) {
      return ElevatedButton(
        onPressed: () {
          unawaited(
            dispatchMessageAction(
              ref: ref,
              context: context,
              message: _message,
              action: MessageAction.pin,
              callbacks: const MessageActionCallbacks(),
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

void main() {
  late FluxerDatabase db;
  late _RecordingPinsRepository recorder;

  setUp(() {
    db = openTestDatabase();
    recorder = _RecordingPinsRepository(db);
  });

  testWidgets('does not pin until the user confirms', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(db: db, recorder: recorder, home: _openModalButton()),
    );
    try {
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text(testL10n.chatMessagePin), findsOneWidget);
      expect(_modalDescription, findsOneWidget);
      expect(find.byType(MessageConfirmPreview), findsOneWidget);
      expect(find.byType(MessageItem), findsOneWidget);
      expect(find.textContaining('hello', findRichText: true), findsOneWidget);
      expect(_cancelButton, findsOneWidget);
      expect(recorder.pinnedIds, isEmpty);

      await tester.tap(_confirmButton);
      await tester.pumpAndSettle();

      expect(_modalDescription, findsNothing);
      expect(recorder.pinnedIds, <String>['msg-1']);
    } finally {
      await _pumpOut(tester);
    }
  });

  testWidgets('cancel does not pin', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(db: db, recorder: recorder, home: _openModalButton()),
    );
    try {
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(_modalDescription, findsOneWidget);

      await tester.tap(_cancelButton);
      await tester.pumpAndSettle();

      expect(_modalDescription, findsNothing);
      expect(recorder.pinnedIds, isEmpty);
    } finally {
      await _pumpOut(tester);
    }
  });

  testWidgets('pin action prompts for confirmation before pinning', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(db: db, recorder: recorder, home: _dispatchPinButton()),
    );
    try {
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(_modalDescription, findsOneWidget);
      expect(recorder.pinnedIds, isEmpty);

      await tester.tap(_confirmButton);
      await tester.pumpAndSettle();

      expect(recorder.pinnedIds, <String>['msg-1']);
    } finally {
      await _pumpOut(tester);
    }
  });
}

class _RecordingPinsRepository extends ChannelPinsRepository {
  _RecordingPinsRepository(FluxerDatabase db)
    : super(FluxerClient(Dio()), db, 'user-1');

  final List<String> pinnedIds = <String>[];

  @override
  Future<void> pinMessage({
    required String channelId,
    required String messageId,
  }) async {
    pinnedIds.add(messageId);
  }
}

class _StubChatViewModel extends ChatViewModel {
  @override
  ChatViewState build() => ChatViewState(
    channelId: 'channel-1',
    messages: <Message>[_message],
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
