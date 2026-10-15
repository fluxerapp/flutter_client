import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_drag_wrapper.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_long_press_menu_host.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class _TouchInput extends InputModalityNotifier {
  @override
  bool build() => true;
}

const Key _iconKey = Key('rail-community-icon');

class _Menu implements GuildLongPressMenu {
  int opened = 0;
  int dismissed = 0;

  @override
  void prepareMenu() {}

  @override
  void openMenu() => opened++;

  @override
  void dismissMenu() => dismissed++;
}

Future<void> _pumpRail(WidgetTester tester, _Menu menu) {
  final colorTheme = buildDarkColorTheme();
  return tester.pumpWidget(
    ProviderScope(
      overrides: [inputModalityProvider.overrideWith(_TouchInput.new)],
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: GuildDragWrapper(
              itemId: 'guild-1',
              isFolder: false,
              dragFeedback: const SizedBox.square(dimension: 48),
              longPressMenu: () => menu,
              child: const SizedBox.square(
                key: _iconKey,
                dimension: 48,
                child: ColoredBox(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('holding a community icon opens its sheet, not a popover', (
    tester,
  ) async {
    final _Menu menu = _Menu();
    await _pumpRail(tester, menu);
    await tester.pumpAndSettle();

    expect(find.byType(GuildLongPressMenuHost), findsOneWidget);
    expect(find.byType(GuildIconPeekGestureHost), findsNothing);

    final TestGesture hold = await tester.startGesture(
      tester.getCenter(find.byKey(_iconKey)),
    );
    await tester.pump(kGuildPeekHoldDelay);
    expect(menu.opened, 1);
    await tester.pump();
    expect(find.byType(ContextMenuPanel), findsNothing);
    await hold.up();
    await tester.pumpAndSettle();

    expect(menu.opened, 1);
    expect(menu.dismissed, 0);
    expect(find.byType(ContextMenuPanel), findsNothing);
  });

  testWidgets('a quick tap on a community icon does not open its sheet', (
    tester,
  ) async {
    final _Menu menu = _Menu();
    await _pumpRail(tester, menu);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(_iconKey));
    await tester.pumpAndSettle();

    expect(menu.opened, 0);
  });

  testWidgets('dragging a held community icon dismisses its sheet', (
    tester,
  ) async {
    final _Menu menu = _Menu();
    await _pumpRail(tester, menu);
    await tester.pumpAndSettle();

    final TestGesture hold = await tester.startGesture(
      tester.getCenter(find.byKey(_iconKey)),
    );
    await tester.pump(kGuildPeekHoldDelay);
    expect(menu.opened, 1);
    await tester.pump(kLongPressTimeout - kGuildPeekHoldDelay);
    expect(menu.dismissed, 0);
    for (int i = 0; i < 6; i++) {
      await hold.moveBy(const Offset(0, 12));
      await tester.pump(const Duration(milliseconds: 16));
    }
    expect(menu.dismissed, 1);
    await hold.up();
    await tester.pumpAndSettle();
  });
}
