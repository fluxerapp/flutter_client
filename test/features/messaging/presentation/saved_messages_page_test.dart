import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/messaging/presentation/saved_messages_page.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/saved_messages_empty_state.dart';
import 'package:fluxer_app/features/messaging/providers/saved_message_list_provider.dart';
import 'package:fluxer_app/features/messaging/providers/saved_messages_sync_provider.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

class _FetchedSavedMessagesSync extends SavedMessagesSyncNotifier {
  @override
  SavedMessagesSyncState build() => const SavedMessagesSyncState(fetched: true);
}

void main() {
  testWidgets('SavedMessagesPage renders bookmarks empty state', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = openTestDatabase();
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(db),
          savedMessageIdsProvider.overrideWith(
            (Ref ref) => Stream<List<String>>.value(const <String>[]),
          ),
          savedMessagesSyncProvider.overrideWith(_FetchedSavedMessagesSync.new),
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
          home: const Scaffold(body: SavedMessagesPage()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Bookmarks'), findsOneWidget);
    expect(find.byType(SavedMessagesEmptyState), findsOneWidget);
    expect(find.text('No bookmarks'), findsOneWidget);
  });
}
