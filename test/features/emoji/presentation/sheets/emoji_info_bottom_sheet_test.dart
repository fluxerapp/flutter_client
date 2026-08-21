import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/features/emoji/presentation/sheets/emoji_info_bottom_sheet.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

class _FakeFavoriteEmojiKeys extends FavoriteEmojiKeys {
  @override
  Future<List<String>> build() => Future.value(const <String>[]);
}

class _FakeGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: [
      Guild(id: 'guild-1', name: 'Test Community', ownerId: 'owner'),
    ],
  );
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();

  return ProviderScope(
    overrides: [
      favoriteEmojiKeysProvider.overrideWith(_FakeFavoriteEmojiKeys.new),
      guildListViewModelProvider.overrideWith(_FakeGuildListViewModel.new),
      guildByIdProvider('guild-1').overrideWith(
        (ref) async => const Guild(
          id: 'guild-1',
          name: 'Test Community',
          ownerId: 'owner',
        ),
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
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await EmojiRegistry.preload();
  });

  testWidgets('shows default emoji info content', (tester) async {
    final entry = EmojiRegistry.allEmojis.first;

    await tester.pumpWidget(
      _buildTestApp(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                unawaited(
                  EmojiInfoBottomSheet.show(
                    context,
                    emoji: EmojiInfoData(name: entry.surrogates),
                  ),
                );
              },
              child: const Text('Open'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text(':${entry.primaryName}:'), findsOneWidget);
    expect(
      find.text(testL10n.emojiInfoDefaultDescription('Fluxer')),
      findsOneWidget,
    );
  });

  testWidgets('shows guild section for custom emoji', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                unawaited(
                  EmojiInfoBottomSheet.show(
                    context,
                    emoji: const EmojiInfoData(
                      id: 'emoji-1',
                      name: 'party',
                      guildId: 'guild-1',
                    ),
                  ),
                );
              },
              child: const Text('Open'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text(':party:'), findsOneWidget);
    expect(find.text(testL10n.emojiInfoCustomGuildDescription), findsOneWidget);
    expect(
      find.text(testL10n.emojiInfoFromHeader.toUpperCase()),
      findsOneWidget,
    );
    expect(find.text('Test Community'), findsOneWidget);
    expect(find.text(testL10n.emojiInfoPrivateCommunity), findsOneWidget);
    expect(
      find.bySemanticsLabel(testL10n.emojiInfoAddToFavorites),
      findsOneWidget,
    );
  });

  testWidgets('shows favorite toggle for unicode emoji', (tester) async {
    final entry = EmojiRegistry.allEmojis.first;
    final data = EmojiInfoData(name: entry.surrogates);

    await tester.pumpWidget(
      _buildTestApp(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                unawaited(
                  EmojiInfoBottomSheet.show(
                    context,
                    emoji: data,
                  ),
                );
              },
              child: const Text('Open'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel(testL10n.emojiInfoAddToFavorites), findsOneWidget);
    expect(data.favoriteKeyForGuild(null), isNotNull);
  });
}
