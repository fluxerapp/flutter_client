// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

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
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/test_l10n.dart';

const MessageRenderSettings _settings = MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
);

void main() {
  testWidgets('reply row height follows the chat text scaler (#154)', (
    tester,
  ) async {
    final Message parent = _message(id: 'parent-1', authorName: 'Parent');
    final Message reply = _message(
      id: 'reply-1',
      authorName: 'Replier',
      type: messageTypeReply,
      messageReference: const MessageReference(
        channelId: 'channel-1',
        messageId: 'parent-1',
        type: MessageReferenceType.valueDefault,
      ),
    );

    await tester.pumpWidget(
      _app(
        chatState: _chatState(messages: [parent]),
        child: MessageItem(message: reply, renderSettings: _settings),
      ),
    );
    await tester.pump();

    final SizedBox row = tester.widget<SizedBox>(
      find
          .ancestor(
            of: find.byType(InlineReplyPreview),
            matching: find.byType(SizedBox),
          )
          .first,
    );
    expect(row.height, 30);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}

Widget _app({required ChatViewState chatState, required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceRuntimeConfigOverride(),
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
      home: Scaffold(
        body: Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.5)),
            child: child,
          ),
        ),
      ),
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

// Webhook author lets the row resolve its display with no provider/DB read.
Message _message({
  required String id,
  required String authorName,
  int type = messageTypeDefault,
  MessageReference? messageReference,
}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: '123456789012345678',
    authorName: authorName,
    webhookId: 'wh1',
    content: 'hello world',
    timestamp: DateTime.utc(2026, 1, 1, 12),
    type: type,
    replyToId: messageReference?.messageId,
    messageReference: messageReference,
  );
}
