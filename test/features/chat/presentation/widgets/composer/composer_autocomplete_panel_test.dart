import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:riverpod/src/framework.dart' show Override;
import '../../../../../helpers/test_l10n.dart';

Widget _app(Widget child, {List<Override> overrides = const <Override>[]}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  testWidgets('unicode emoji row renders the glyph and the :name: label', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        ComposerAutocompletePanelListTile(
          title: ':grinning:',
          isSelected: false,
          onTap: () {},
          emojiSurrogates: '\u{1F600}',
        ),
      ),
    );

    expect(find.byType(UnicodeEmojiWidget), findsOneWidget);
    expect(find.text(':grinning:'), findsOneWidget);
  });

  testWidgets('custom emoji row renders a network image and the :name: label', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        ComposerAutocompletePanelListTile(
          title: ':partyblob:',
          isSelected: false,
          onTap: () {},
          emojiImageUrl: 'https://cdn.example/emoji/1.webp',
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text(':partyblob:'), findsOneWidget);
  });

  testWidgets('mention row keeps its avatar and shows no emoji preview', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        ComposerAutocompletePanelListTile(
          title: '@Alice',
          isSelected: false,
          onTap: () {},
          userAvatarFallbackText: 'Alice',
        ),
        overrides: <Override>[
          userPresenceProvider(
            '',
          ).overrideWith((Ref ref) => Stream.value(null)),
        ],
      ),
    );

    expect(find.byType(FluxerAvatar), findsOneWidget);
    expect(find.text('@Alice'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsNothing);
  });

  testWidgets('panel strip animates open and closed from host updates', (
    tester,
  ) async {
    final host = ComposerAutocompletePanelHost(null);
    addTearDown(host.dispose);
    final scrollController = ScrollController();
    addTearDown(scrollController.dispose);

    await tester.pumpWidget(
      _app(
        SizedBox(
          width: 320,
          child: ComposerAutocompletePanelStrip(
            host: host,
            scrollController: scrollController,
          ),
        ),
      ),
    );

    expect(find.byType(ListView), findsNothing);

    host.value = ComposerAutocompletePanelSnapshot(
      rows: <ComposerAutocompletePanelRow>[
        ComposerAutocompletePanelRow(
          title: ':smile:',
          onTap: () {},
          emojiSurrogates: '\u{1F604}',
        ),
      ],
      selectedIndex: 0,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text(':smile:'), findsOneWidget);

    host.value = null;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.byType(ListView), findsNothing);
  });
}
