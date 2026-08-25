import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/rendered_text_test_helpers.dart';
import '../../../../../helpers/test_l10n.dart';

List<String> _renderedTexts(WidgetTester tester) =>
    renderedTextContents(tester);

Message _message() {
  final DateTime timestamp = DateTime(2026, 1, 1, 12);
  return Message(
    id: '1',
    channelId: 'c1',
    authorId: '123456789012345678',
    authorName: 'Alice',
    webhookId: 'wh1',
    content: 'hello world',
    timestamp: timestamp,
  );
}

MessageRenderSettings _settings({
  bool messageDisplayCompact = true,
  bool showUserAvatarsInCompactMode = false,
}) => MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: const ChatPreferencesState(),
  messageGroupSpacing: 0,
  messageDisplayCompact: messageDisplayCompact,
  showUserAvatarsInCompactMode: showUserAvatarsInCompactMode,
);

Widget _app(Widget child, {bool use12Hour = false, Size? viewportSize}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [use12HourTimeFormatProvider.overrideWithValue(use12Hour)],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      builder: viewportSize == null
          ? null
          : (context, appChild) => MediaQuery(
              data: MediaQuery.of(context).copyWith(size: viewportSize),
              child: appChild!,
            ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('MessageItem compact layout', () {
    testWidgets('dense mode shows inline author prefix and timestamp', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(MessageItem(message: _message(), renderSettings: _settings())),
      );
      await tester.pump();

      expect(find.textContaining('Alice'), findsOneWidget);
      expect(find.text(':'), findsOneWidget);
      final DateTime timestamp = DateTime(2026, 1, 1, 12);
      final String expectedTime = formatUserTime(
        timestamp,
        kTestLocale.toString(),
        use12Hour: false,
      );
      expect(find.text(expectedTime), findsOneWidget);
      expect(find.text('[$expectedTime]'), findsNothing);
      expect(find.byType(FluxerAvatar), findsNothing);
    });

    testWidgets('dense mode can show compact avatars when enabled', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          MessageItem(
            message: _message(),
            renderSettings: _settings(showUserAvatarsInCompactMode: true),
          ),
        ),
      );
      await tester.pump();

      final FluxerAvatar avatar = tester.widget<FluxerAvatar>(
        find.byType(FluxerAvatar),
      );
      expect(avatar.size, kCompactAvatarSize);
    });
    testWidgets('wide grouped dense rows keep the author prefix', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          MessageItem(
            message: _message(),
            isGrouped: true,
            renderSettings: _settings(),
          ),
          viewportSize: const Size(1400, 900),
        ),
      );
      await tester.pump();

      expect(find.textContaining('Alice'), findsOneWidget);
      expect(find.text(':'), findsOneWidget);
    });

    testWidgets('mobile grouped dense rows keep body padding without author', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          MessageItem(
            message: _message(),
            isGrouped: true,
            renderSettings: _settings(),
          ),
          viewportSize: const Size(400, 800),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Alice'), findsNothing);
      expect(_renderedTexts(tester), contains('hello world'));
    });

    testWidgets('mobile grouped messages align with group-start text', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          Column(
            children: [
              MessageItem(message: _message(), renderSettings: _settings()),
              MessageItem(
                message: Message(
                  id: '2',
                  channelId: 'c1',
                  authorId: '123456789012345678',
                  authorName: 'Alice',
                  webhookId: 'wh1',
                  content: 'follow up',
                  timestamp: DateTime(2026, 1, 1, 12, 1),
                ),
                isGrouped: true,
                renderSettings: _settings(),
              ),
            ],
          ),
          viewportSize: const Size(400, 800),
        ),
      );
      await tester.pumpAndSettle();

      final Finder groupStartText = findRenderedTextContaining('hello world');
      final Finder groupedText = findRenderedTextContaining('follow up');
      expect(groupStartText, findsOneWidget);
      expect(groupedText, findsOneWidget);
      expect(
        tester.getTopLeft(groupStartText).dx,
        tester.getTopLeft(groupedText).dx,
      );
    });
  });
}
