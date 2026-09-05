import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_panel.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/material_ui.dart';
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

List<ComposerAutocompletePanelRow> _rows(
  int count, {
  ValueChanged<int>? onTap,
}) {
  return List<ComposerAutocompletePanelRow>.generate(
    count,
    (int i) => ComposerAutocompletePanelRow(
      title: ':row$i:',
      onTap: () => onTap?.call(i),
      emojiSurrogates: '\u{1F604}',
    ),
  );
}

void main() {
  test('panel max height caps at the default and at available space', () {
    expect(
      composerAutocompletePanelMaxHeight(availableHeight: 800),
      kComposerAutocompletePanelMaxHeight,
    );
    expect(composerAutocompletePanelMaxHeight(availableHeight: 180), 180);
    expect(composerAutocompletePanelMaxHeight(availableHeight: -10), 0);
    expect(
      composerAutocompletePanelMaxHeight(availableHeight: double.infinity),
      kComposerAutocompletePanelMaxHeight,
    );
  });

  test('overlay placement prefers the side with more room inside insets', () {
    final ({bool openAbove, double maxHeight}) above =
        composerAutocompleteOverlayPlacement(
          target: const Rect.fromLTWH(0, 500, 100, 48),
          overlaySize: const Size(400, 800),
          topSafePadding: 47,
          bottomSafePadding: 34,
        );
    expect(above.openAbove, isTrue);
    expect(above.maxHeight, 500 - 47 - kComposerAutocompletePanelSafeGap);

    final ({bool openAbove, double maxHeight}) below =
        composerAutocompleteOverlayPlacement(
          target: const Rect.fromLTWH(0, 80, 100, 48),
          overlaySize: const Size(400, 400),
          topSafePadding: 47,
          bottomSafePadding: 34,
        );
    expect(below.openAbove, isFalse);
    expect(below.maxHeight, 400 - 128 - 34 - kComposerAutocompletePanelSafeGap);
  });

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

  testWidgets('command heading renders uppercase above rows', (tester) async {
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

    host.value = ComposerAutocompletePanelSnapshot(
      heading: 'Commands',
      selectedIndex: 0,
      rows: <ComposerAutocompletePanelRow>[
        ComposerAutocompletePanelRow(title: '/me', onTap: () {}),
      ],
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.text('COMMANDS'), findsOneWidget);
    expect(find.text('/me'), findsOneWidget);
  });

  testWidgets('gif empty state shows title and search hint', (tester) async {
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

    host.value = const ComposerAutocompletePanelSnapshot(
      rows: <ComposerAutocompletePanelRow>[],
      selectedIndex: 0,
      gifEmpty: true,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.text('GIFs'), findsOneWidget);
    expect(find.text('No GIFs found'), findsOneWidget);
    expect(find.text('Try another search term'), findsOneWidget);
  });

  testWidgets('panel strip stays inside a short stack', (tester) async {
    final host = ComposerAutocompletePanelHost(null);
    addTearDown(host.dispose);
    final scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    const Key stackKey = Key('autocomplete-stack');

    await tester.pumpWidget(
      _app(
        SizedBox(
          key: stackKey,
          width: 320,
          height: 180,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              ComposerAutocompletePanelLayer(
                host: host,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );

    host.value = ComposerAutocompletePanelSnapshot(
      rows: _rows(20),
      selectedIndex: 0,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    final Rect stackRect = tester.getRect(find.byKey(stackKey));
    final Rect panelRect = tester.getRect(
      find.byType(ComposerAutocompletePanelBody),
    );
    expect(panelRect.top, greaterThanOrEqualTo(stackRect.top));
    expect(panelRect.height, lessThanOrEqualTo(stackRect.height));
    expect(panelRect.height, lessThan(kComposerAutocompletePanelMaxHeight));
  });

  testWidgets('panel absorbs taps over widgets stacked behind it', (
    tester,
  ) async {
    final host = ComposerAutocompletePanelHost(null);
    addTearDown(host.dispose);
    final scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    var behindTaps = 0;
    var rowTaps = 0;

    await tester.pumpWidget(
      _app(
        SizedBox(
          width: 320,
          height: 400,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => behindTaps++,
                  child: const ColoredBox(color: Color(0xFFFF0000)),
                ),
              ),
              ComposerAutocompletePanelLayer(
                host: host,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );

    host.value = ComposerAutocompletePanelSnapshot(
      rows: _rows(8, onTap: (_) => rowTaps++),
      selectedIndex: 0,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    final Rect panelRect = tester.getRect(
      find.byType(ComposerAutocompletePanelBody),
    );
    await tester.tapAt(panelRect.topCenter);
    await tester.pump();
    expect(behindTaps, 0);

    await tester.tap(find.text(':row0:'));
    await tester.pump();
    expect(rowTaps, 1);
    expect(behindTaps, 0);
  });
}
