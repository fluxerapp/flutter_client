import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

// Webhook author lets the row resolve its display with no provider/DB read.
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
  group('MessageItem vertical padding', () {
    Future<EdgeInsetsGeometry?> pumpPadding(
      WidgetTester tester, {
      required bool isGrouped,
    }) async {
      await tester.pumpWidget(
        _app(
          MessageItem(
            message: _message(),
            isGrouped: isGrouped,
            renderSettings: _settings,
          ),
        ),
      );
      await tester.pump();
      final AnimatedContainer container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer).first,
      );
      return container.padding;
    }

    testWidgets('group-start rows use uniform 2px vertical padding', (
      tester,
    ) async {
      expect(
        await pumpPadding(tester, isGrouped: false),
        const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
      );
    });

    testWidgets('grouped continuation rows use the same 2px padding', (
      tester,
    ) async {
      expect(
        await pumpPadding(tester, isGrouped: true),
        const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
      );
    });
  });
}
