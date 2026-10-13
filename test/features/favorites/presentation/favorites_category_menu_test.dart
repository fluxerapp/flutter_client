import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_channel_list.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channel_groups_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

class _TouchPrimaryModality extends InputModalityNotifier {
  @override
  bool build() => true;
}

void main() {
  testWidgets('long-pressing a favorites category opens its own menu', (
    tester,
  ) async {
    final FluxerDatabase database = openTestDatabase();
    await database.favoriteChannelsDao.addCategory(
      id: 'category-1',
      name: 'Important',
    );
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          inputModalityProvider.overrideWith(_TouchPrimaryModality.new),
          favoriteChannelGroupsProvider
              .overrideWithValue(const <FavoriteChannelGroup>[
                FavoriteChannelGroup(
                  categoryId: 'category-1',
                  title: 'Important',
                  entries: <ResolvedFavoriteEntry>[],
                ),
              ]),
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
            body: FavoritesChannelList(
              selectedChannelId: null,
              onChannelSelected: (_) {},
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.longPress(find.text('Important'));
    await tester.pumpAndSettle();

    expect(find.text('Create category'), findsNothing);
    expect(find.text('Rename category'), findsOneWidget);
    expect(find.text('Collapse category'), findsOneWidget);
    expect(find.text('Delete category'), findsOneWidget);

    await tester.tap(find.text('Delete category'));
    await tester.pumpAndSettle();

    expect(await database.favoriteChannelsDao.getCategories(), isEmpty);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(minutes: 1));
  });
}
