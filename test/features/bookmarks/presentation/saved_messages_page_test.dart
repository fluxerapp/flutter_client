import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/bookmarks/data/saved_messages_repository.dart';
import 'package:fluxer_app/features/bookmarks/domain/saved_messages.dart';
import 'package:fluxer_app/features/bookmarks/presentation/saved_messages_page.dart';
import 'package:fluxer_app/features/bookmarks/presentation/widgets/saved_messages_empty_state.dart';
import 'package:fluxer_app/features/bookmarks/providers/saved_messages_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

class _FetchedSavedMessages extends SavedMessagesNotifier {
  @override
  SavedMessagesState build() {
    return const SavedMessagesState(fetched: true, hasMore: false);
  }
}

class _EmptySavedMessagesRepository extends SavedMessagesRepository {
  _EmptySavedMessagesRepository(FluxerDatabase database)
    : super(
        database: database,
        client: FluxerClient(Dio()),
        currentUserId: 'viewer',
      );

  @override
  Future<SavedMessagesFetchPage> fetch({String? before}) async {
    return const SavedMessagesFetchPage(
      messages: <Message>[],
      missing: <SavedMessageMissingEntry>[],
      hasMore: false,
    );
  }
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
          savedMessagesProvider.overrideWith(_FetchedSavedMessages.new),
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

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });

  testWidgets('opening bookmarks fetches after the first frame', (
    WidgetTester tester,
  ) async {
    final FluxerDatabase db = openTestDatabase();
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(db),
          savedMessagesRepositoryProvider.overrideWithValue(
            _EmptySavedMessagesRepository(db),
          ),
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

    expect(find.byType(FluxerLoadingSpinner), findsOneWidget);

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(SavedMessagesEmptyState), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
