import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_search_autocomplete.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_search_field.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../helpers/input_modality_override.dart';
import '../../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../../helpers/open_test_database.dart';
import '../../../../../../helpers/test_l10n.dart';
import '../../../../../../helpers/wide_layout_test_sizes.dart';

Future<void> _pumpField(
  WidgetTester tester, {
  TextDirection direction = TextDirection.ltr,
  bool touch = false,
  VoidCallback? onOutsideTap,
}) async {
  tester.view.physicalSize = kWideTestViewportSize;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues(<String, Object>{});
  final FluxerDatabase database = openTestDatabase();
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        instanceRuntimeConfigOverride(),
        inputModalityOverride(touch: touch),
        androidAnimatorDurationDisabledProvider.overrideWith(
          (ref) => Stream<bool>.value(false),
        ),
        fluxerDatabaseProvider.overrideWithValue(database),
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
        builder: (BuildContext context, Widget? child) =>
            Directionality(textDirection: direction, child: child!),
        home: Scaffold(
          body: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                bottom: 0,
                child: TextButton(
                  onPressed: onOutsideTap,
                  child: const Text('outside'),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: ChannelHeaderSearchField(channelId: '1', guildId: null),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

Finder get _searchIcon => find.byWidgetPredicate(
  (Widget widget) =>
      widget is PhosphorIcon &&
      widget.icon == PhosphorIconsFill.magnifyingGlass,
);

Finder get _clearIcon => find.byWidgetPredicate(
  (Widget widget) =>
      widget is PhosphorIcon && widget.icon == PhosphorIconsBold.x,
);

Future<void> _openSuggestions(WidgetTester tester) async {
  await tester.tap(find.byType(TextField));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
  expect(find.byType(ChannelHeaderSearchAutocomplete), findsOneWidget);
}

Future<void> _openMenu(WidgetTester tester) async {
  await tester.tap(_searchIcon);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  testWidgets('opens below the search icon, aligned to its right edge', (
    WidgetTester tester,
  ) async {
    await _pumpField(tester);
    final Rect icon = tester.getRect(_searchIcon);
    await _openMenu(tester);

    final Rect menu = tester.getRect(find.byType(FluxerDesktopMenuPanel));
    expect(menu.right, moreOrLessEquals(icon.right));
    expect(menu.top, moreOrLessEquals(icon.bottom + 4));
  });

  testWidgets('mirrors to the left edge of the icon in rtl', (
    WidgetTester tester,
  ) async {
    await _pumpField(tester, direction: TextDirection.rtl);
    final Rect icon = tester.getRect(_searchIcon);
    await _openMenu(tester);

    final Rect menu = tester.getRect(find.byType(FluxerDesktopMenuPanel));
    expect(menu.left, moreOrLessEquals(icon.left));
    expect(menu.top, moreOrLessEquals(icon.bottom + 4));
  });

  testWidgets('lists single line radio rows and applies the selection', (
    WidgetTester tester,
  ) async {
    await _pumpField(tester);
    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(ChannelHeaderSearchField)),
    );
    await _openMenu(tester);

    expect(find.byType(FluxerMenuRadioItem), findsNWidgets(5));
    expect(
      find.text(l10n.channelDetailsSearchScopeCurrentDmDescription),
      findsNothing,
    );
    for (final Element row in find.byType(FluxerMenuRadioItem).evaluate()) {
      expect(row.size!.height, kFluxerDesktopMenuRowMinHeight);
    }
    Iterable<bool> selection() => tester
        .widgetList<FluxerMenuRadioItem>(find.byType(FluxerMenuRadioItem))
        .map((FluxerMenuRadioItem item) => item.isSelected);
    expect(selection(), <bool>[true, false, false, false, false]);

    await tester.tap(find.text(l10n.channelDetailsSearchScopeOpenDms));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.byType(FluxerDesktopMenuPanel), findsNothing);
    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(ChannelHeaderSearchField)),
    );
    expect(
      container.read(channelHeaderSearchProvider).scope,
      MessageSearchScopeFilter.openDms,
    );
    await _openMenu(tester);
    expect(selection(), <bool>[false, false, true, false, false]);
  });

  testWidgets('uses the click cursor without a hover or press highlight', (
    WidgetTester tester,
  ) async {
    await _pumpField(tester);
    await tester.enterText(find.byType(TextField), 'hello');
    await tester.pump();
    final TestGesture mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
      pointer: 1,
    );
    await mouse.addPointer(location: const Offset(600, 600));

    for (final Finder icon in <Finder>[_searchIcon, _clearIcon]) {
      await mouse.moveTo(tester.getCenter(icon));
      await tester.pump(const Duration(milliseconds: 300));
      expect(
        RendererBinding.instance.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.click,
      );
      final InkWell ink = tester.widget<InkWell>(
        find.ancestor(of: icon, matching: find.byType(InkWell)).first,
      );
      expect(ink.hoverColor, Colors.transparent);
      expect(ink.highlightColor, Colors.transparent);
      expect(ink.splashFactory, NoSplash.splashFactory);
    }
    final Material scopeSurface = tester.widget<Material>(
      find.ancestor(of: _searchIcon, matching: find.byType(Material)).first,
    );
    expect(scopeSurface.color, Colors.transparent);
  });

  for (final TextDirection direction in TextDirection.values) {
    testWidgets('centers the click area on the icon in ${direction.name}', (
      WidgetTester tester,
    ) async {
      await _pumpField(tester, direction: direction);
      final Rect icon = tester.getRect(_searchIcon);
      final Rect field = tester.getRect(find.byType(AnimatedContainer).first);
      final Rect ink = tester.getRect(
        find.ancestor(of: _searchIcon, matching: find.byType(InkWell)).first,
      );
      expect(ink, icon.inflate(4));
      expect(
        direction == TextDirection.ltr
            ? icon.left - field.left
            : field.right - icon.right,
        11,
      );
    });
  }

  for (final bool touch in <bool>[false, true]) {
    testWidgets(
      'opens on the first click over suggestions, touch: $touch',
      (WidgetTester tester) async {
        await _pumpField(tester, touch: touch);
        await _openSuggestions(tester);
        await _openMenu(tester);

        expect(
          find.byType(FluxerDesktopMenuPanel),
          touch ? findsNothing : findsOneWidget,
        );
        expect(
          find.text(
            FluxerLocalizations.of(
              tester.element(find.byType(ChannelHeaderSearchField)),
            ).channelDetailsSearchScopeOpenDms,
          ),
          findsOneWidget,
        );
        expect(find.byType(ChannelHeaderSearchAutocomplete), findsNothing);
      },
      variant: TargetPlatformVariant.only(
        touch ? TargetPlatform.iOS : TargetPlatform.macOS,
      ),
    );

    testWidgets(
      'dismisses suggestions without activating what is below, touch: $touch',
      (WidgetTester tester) async {
        int outsideTaps = 0;
        await _pumpField(
          tester,
          touch: touch,
          onOutsideTap: () => outsideTaps++,
        );
        await _openSuggestions(tester);
        await tester.tap(find.text('outside'));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 400));
        await tester.pump();

        expect(find.byType(ChannelHeaderSearchAutocomplete), findsNothing);
        expect(outsideTaps, 0);

        await tester.tap(find.text('outside'));
        await tester.pump();
        expect(outsideTaps, 1);
      },
      variant: TargetPlatformVariant.only(
        touch ? TargetPlatform.iOS : TargetPlatform.macOS,
      ),
    );
  }

  testWidgets('clears on the first click and keeps the field focused', (
    WidgetTester tester,
  ) async {
    await _pumpField(tester);
    await _openSuggestions(tester);
    await tester.enterText(find.byType(TextField), 'from:');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(_clearIcon);
    await tester.pump(const Duration(milliseconds: 400));

    final EditableText field = tester.widget<EditableText>(
      find.byType(EditableText),
    );
    expect(field.controller.text, isEmpty);
    expect(field.focusNode.hasFocus, isTrue);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));

  testWidgets('keeps the bottom sheet for touch input', (
    WidgetTester tester,
  ) async {
    await _pumpField(tester, touch: true);
    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(ChannelHeaderSearchField)),
    );
    await _openMenu(tester);

    expect(find.byType(FluxerDesktopMenuPanel), findsNothing);
    expect(
      find.text(l10n.channelDetailsSearchScopeCurrentDmDescription),
      findsOneWidget,
    );
  });
}
