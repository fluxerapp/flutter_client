import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/notifications/presentation/recent_mentions_page.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_empty_state.dart';
import 'package:fluxer_app/features/notifications/providers/notification_stream_providers.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
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
}

class _FetchedMentionFeedCoordinator extends MentionFeedCoordinator {
  @override
  MentionFeedUiState build() => MentionFeedUiState(fetched: true);
}

Widget _wrap({
  required FluxerDatabase db,
  required List<Override> overrides,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(db),
      ...overrides,
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
