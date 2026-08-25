import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('mentions the replied-to author when the reply pings them', (
    tester,
  ) async {
    final parent = _message(
      id: 'parent-1',
      authorId: '1001',
      authorName: 'Sample User',
      authorIsBot: true,
    );
    final reply = _message(
      id: 'reply-1',
      authorId: '1002',
      authorName: 'August',
      type: messageTypeReply,
      mentionedUserIds: const ['1001'],
      messageReference: const MessageReference(
        channelId: 'channel-1',
        messageId: 'parent-1',
        type: MessageReferenceType.valueDefault,
      ),
    );

    await tester.pumpWidget(
      _buildTestApp(
        chatState: _chatState(messages: [parent]),
        child: InlineReplyPreview(message: reply),
      ),
    );

    expect(find.text('@Sample User'), findsOneWidget);
    expect(find.text('Sample User'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });

  testWidgets('hides spoiler text in the replied-to content preview', (
    tester,
  ) async {
    final parent = _message(
      id: 'parent-1',
      authorId: '1001',
      authorName: 'Sample User',
      content: '||top secret||',
    );
    final reply = _message(
      id: 'reply-1',
      authorId: '1002',
      authorName: 'August',
      type: messageTypeReply,
      messageReference: const MessageReference(
        channelId: 'channel-1',
        messageId: 'parent-1',
        type: MessageReferenceType.valueDefault,
      ),
    );

    await tester.pumpWidget(
      _buildTestApp(
        chatState: _chatState(messages: [parent]),
        child: InlineReplyPreview(message: reply),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('top secret'), findsNothing);
    expect(find.byType(GestureDetector), findsWidgets);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}

Widget _buildTestApp({
  required ChatViewState chatState,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      chatViewModelProvider.overrideWithValue(chatState),
      activeGuildIdProvider.overrideWithValue(null),
      currentUserIdProvider.overrideWithValue(null),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

ChatViewState _chatState({required List<Message> messages}) {
  return ChatViewState(
    channelId: 'channel-1',
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

Message _message({
  required String id,
  required String authorId,
  required String authorName,
  bool authorIsBot = false,
  int type = messageTypeDefault,
  List<String> mentionedUserIds = const [],
  MessageReference? messageReference,
  String content = 'hello',
}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: authorId,
    authorName: authorName,
    authorIsBot: authorIsBot,
    content: content,
    timestamp: DateTime.utc(2026),
    type: type,
    mentionedUserIds: mentionedUserIds,
    replyToId: messageReference?.messageId,
    messageReference: messageReference,
  );
}
