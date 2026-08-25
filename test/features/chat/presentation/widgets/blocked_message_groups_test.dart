import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/blocked_message_groups.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

Message _message({required String id}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: 'blocked-user',
    authorName: 'blocked-user',
    content: 'hello',
    timestamp: DateTime.utc(2026, 1, 1, 12),
  );
}

ChannelStreamItem _blockedItem({required List<Message> messages}) {
  return ChannelStreamItem(
    type: ChannelStreamType.messageGroupBlocked,
    messages: messages,
    groupKey: messages.first.id,
  );
}

Widget _wrap(Widget child) {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: MediaQuery(
      data: const MediaQueryData(disableAnimations: true),
      child: Scaffold(body: child),
    ),
  );
}

void main() {
  group('BlockedMessageGroups', () {
    testWidgets('collapsed state shows banner and hides messages', (
      WidgetTester tester,
    ) async {
      final List<Message> messages = <Message>[
        _message(id: 'msg-1'),
        _message(id: 'msg-2'),
      ];

      await tester.pumpWidget(
        _wrap(
          BlockedMessageGroups(
            item: _blockedItem(messages: messages),
            isRevealed: false,
            onToggle: () {},
            messageBuilder: (Message message, Message? previousMessage) {
              return Text('msg-${message.id}');
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(testL10n.chatBlockedMessagesCollapsed(messages.length)),
        findsOneWidget,
      );
      expect(find.text('msg-msg-1'), findsNothing);
      expect(find.text('msg-msg-2'), findsNothing);
    });

    testWidgets('revealed state keeps banner and shows messages', (
      WidgetTester tester,
    ) async {
      final List<Message> messages = <Message>[
        _message(id: 'msg-1'),
        _message(id: 'msg-2'),
      ];

      await tester.pumpWidget(
        _wrap(
          BlockedMessageGroups(
            item: _blockedItem(messages: messages),
            isRevealed: true,
            onToggle: () {},
            messageBuilder: (Message message, Message? previousMessage) {
              return Text('msg-${message.id}');
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(testL10n.chatBlockedMessagesCollapsed(messages.length)),
        findsOneWidget,
      );
      expect(find.text('msg-msg-1'), findsOneWidget);
      expect(find.text('msg-msg-2'), findsOneWidget);
    });

    testWidgets('tapping banner invokes onToggle', (WidgetTester tester) async {
      var toggleCount = 0;
      final List<Message> messages = <Message>[_message(id: 'msg-1')];

      await tester.pumpWidget(
        _wrap(
          BlockedMessageGroups(
            item: _blockedItem(messages: messages),
            isRevealed: true,
            onToggle: () {
              toggleCount++;
            },
            messageBuilder: (Message message, Message? previousMessage) {
              return Text('msg-${message.id}');
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.text(testL10n.chatBlockedMessagesCollapsed(messages.length)),
      );
      await tester.pumpAndSettle();

      expect(toggleCount, 1);
    });
  });
}
