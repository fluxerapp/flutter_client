import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/blocked_message_groups.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_preview.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

Message _message(String id, String authorId, String content, int minute) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: authorId,
    authorName: authorId,
    content: content,
    timestamp: DateTime.utc(2026, 10, 15, 12, minute),
  );
}

void main() {
  testWidgets('unread preview collapses blocked authors like the chat', (
    WidgetTester tester,
  ) async {
    final List<Message> preview = <Message>[
      _message('1001', 'friend', 'visible hello', 0),
      _message('1002', 'blocked', 'blocked secret one', 1),
      _message('1003', 'blocked', 'blocked secret two', 2),
      _message('1004', 'friend', 'visible bye', 3),
    ];
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          blockedUserIdsProvider.overrideWithValue(<String>{'blocked'}),
        ],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: SingleChildScrollView(
              child: UnreadInboxCardPreview(
                preview: preview,
                read: false,
                showViewAllUnread: false,
                previewRoleGuildId: null,
                onViewAllUnread: (_) {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(BlockedMessageGroups), findsOneWidget);
    expect(find.text('2 blocked messages'), findsOneWidget);
    expect(
      find.textContaining('blocked secret', findRichText: true),
      findsNothing,
    );
    expect(
      find.textContaining('visible hello', findRichText: true),
      findsOneWidget,
    );
    expect(
      find.textContaining('visible bye', findRichText: true),
      findsOneWidget,
    );

    await releaseTestWidgetTree(tester);
  });
}
