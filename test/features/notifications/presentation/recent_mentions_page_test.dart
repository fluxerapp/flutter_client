// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/notifications/presentation/recent_mentions_page.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_empty_state.dart';
import 'package:fluxer_app/features/notifications/providers/notification_stream_providers.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  testWidgets('RecentMentionsPage renders title and mentions body', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = openTestDatabase();
    await tester.pumpWidget(
      _wrap(
        db: db,
        overrides: <Override>[
          mentionFeedCoordinatorProvider.overrideWith(
            _FetchedMentionFeedCoordinator.new,
          ),
          notificationMentionFeedStreamProvider.overrideWith(
            (Ref ref) => Stream<List<NotificationMentionFeedData>>.value(
              const <NotificationMentionFeedData>[],
            ),
          ),
        ],
        child: const RecentMentionsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mentions'), findsOneWidget);
    expect(find.byType(MentionsEmptyState), findsOneWidget);
  });

  testWidgets('mentions from blocked authors stay out of the feed', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(id: 'channel-1', guildId: '', name: 'general'),
    );
    for (final (String id, String authorId, String content)
        in <(String, String, String)>[
          ('2001', 'friend', 'friend mention'),
          ('2002', 'blocked', 'blocked mention'),
        ]) {
      await db.messageDao.upsertMessage(
        Message(
          id: id,
          channelId: 'channel-1',
          authorId: authorId,
          authorName: authorId,
          content: content,
          timestamp: DateTime.utc(2026, 10, 15, 12),
        ).toCompanion(),
      );
    }
    await tester.pumpWidget(
      _wrap(
        db: db,
        blockedUserIds: const <String>{'blocked'},
        overrides: <Override>[
          mentionFeedCoordinatorProvider.overrideWith(
            _FetchedMentionFeedCoordinator.new,
          ),
          notificationMentionFeedStreamProvider.overrideWith(
            (Ref ref) => Stream<List<NotificationMentionFeedData>>.value(
              const <NotificationMentionFeedData>[
                NotificationMentionFeedData(
                  messageId: '2002',
                  channelId: 'channel-1',
                  ordinal: 0,
                ),
                NotificationMentionFeedData(
                  messageId: '2001',
                  channelId: 'channel-1',
                  ordinal: 1,
                ),
              ],
            ),
          ),
        ],
        child: const RecentMentionsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.textContaining('friend mention', findRichText: true),
      findsWidgets,
    );
    expect(
      find.textContaining('blocked mention', findRichText: true),
      findsNothing,
    );

    await releaseTestWidgetTree(tester);
  });
}

class _FetchedMentionFeedCoordinator extends MentionFeedCoordinator {
  @override
  MentionFeedUiState build() => MentionFeedUiState(fetched: true);
}

Widget _wrap({
  required FluxerDatabase db,
  required List<Override> overrides,
  required Widget child,
  Set<String> blockedUserIds = const <String>{},
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(db),
      blockedUserIdsProvider.overrideWithValue(blockedUserIds),
      ...overrides,
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
      home: Scaffold(body: child),
    ),
  );
}
