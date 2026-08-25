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
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/test_l10n.dart';

Message _message() {
  return Message(
    id: '1',
    channelId: 'c1',
    authorId: '123456789012345678',
    authorName: 'Alice',
    webhookId: 'wh1',
    content: 'hello world',
    timestamp: DateTime(2026, 1, 1, 12),
  );
}

const MessageRenderSettings _cozySettings = MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
);

const MessageRenderSettings _denseSettings = MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
  messageDisplayCompact: true,
);

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [use12HourTimeFormatProvider.overrideWithValue(false)],
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

void main() {
  group('MessageItem cozy layout', () {
    testWidgets('group-start rows use the full-size avatar and author header', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(MessageItem(message: _message(), renderSettings: _cozySettings)),
      );
      await tester.pump();

      final FluxerAvatar avatar = tester.widget<FluxerAvatar>(
        find.byType(FluxerAvatar),
      );
      expect(avatar.size, kMessageAvatarSize);
      expect(find.textContaining('Alice'), findsOneWidget);
    });

    testWidgets('grouped continuation rows hide avatar and author header', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          MessageItem(
            message: _message(),
            isGrouped: true,
            renderSettings: _cozySettings,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(FluxerAvatar), findsNothing);
      expect(find.text('Alice'), findsNothing);
    });

    testWidgets('long author names truncate instead of wrapping timestamp', (
      tester,
    ) async {
      const String longName = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      final DateTime now = DateTime.now();
      final DateTime timestamp = DateTime(now.year, now.month, now.day, 12);
      await tester.binding.setSurfaceSize(const Size(320, 640));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        _app(
          MessageItem(
            message: _message().copyWith(
              authorName: longName,
              timestamp: timestamp,
            ),
            renderSettings: _cozySettings,
          ),
        ),
      );
      await tester.pump();

      final Finder nameFinder = find.textContaining('AAAA');
      final Finder timestampFinder = find.textContaining('12:00');
      expect(nameFinder, findsOneWidget);
      expect(timestampFinder, findsOneWidget);
      expect(
        (tester.getTopLeft(timestampFinder).dy -
                tester.getTopLeft(nameFinder).dy)
            .abs(),
        lessThan(10),
      );
    });

    testWidgets('dense mode does not use the cozy avatar layout', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(MessageItem(message: _message(), renderSettings: _denseSettings)),
      );
      await tester.pump();

      expect(find.byType(FluxerAvatar), findsNothing);
      expect(find.textContaining('Alice'), findsOneWidget);
    });
  });
}
