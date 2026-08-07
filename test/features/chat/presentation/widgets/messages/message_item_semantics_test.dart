import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

Message _message() => Message(
  id: '1',
  channelId: 'c1',
  authorId: '123456789012345678',
  authorName: 'Webhook',
  webhookId: 'wh1',
  content: 'hello world',
  timestamp: DateTime.utc(2026, 1, 1, 12),
);

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

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
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

void main() {
  testWidgets('exposes author and content in semantics label', (tester) async {
    await tester.pumpWidget(
      _app(MessageItem(message: _message(), renderSettings: _settings)),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
      find.bySemanticsLabel(RegExp('Webhook.*hello world')),
      findsOneWidget,
    );
  });

  testWidgets('reaction chips expose emoji and count labels', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _app(
        MessageReactionsBar(
          reactions: const <Reaction>[
            Reaction(emoji: '👍', count: 3, hasReacted: true),
          ],
          channelId: 'c1',
          onReactionTap: (_, {emojiId, animated = false}) {},
          isMobile: true,
        ),
      ),
    );

    expect(find.bySemanticsLabel('👍, 3'), findsOneWidget);
    handle.dispose();
  });
}
