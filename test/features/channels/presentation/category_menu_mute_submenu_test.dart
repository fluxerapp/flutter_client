import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/presentation/category_menu_data.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/input_modality_override.dart';
import '../../../helpers/test_l10n.dart';

CategoryMenuState _state({required bool isMuted}) => resolveCategoryMenuState(
  hasUnread: false,
  isCollapsed: false,
  allCategoriesCollapsed: false,
  isMuted: isMuted,
  canManageChannels: false,
  developerMode: false,
  hasAgreedToMatureContent: true,
);

Widget _menu({
  required CategoryMenuState state,
  required ValueChanged<int?> onMuteFor,
  required ValueChanged<CategoryMenuAction> onAction,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [inputModalityOverride(touch: false)],
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (BuildContext context) =>
                FluxerDesktopMenuPanel.fitContent(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: categoryMenuGroupsToWidgets(
                      context: context,
                      groups: buildCategoryMenuGroups(
                        l10n: testL10n,
                        state: state,
                      ),
                      menuState: state,
                      onAction: onAction,
                      onMuteFor: onMuteFor,
                    ),
                  ),
                ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('clicking Mute category mutes indefinitely', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final List<int?> mutes = <int?>[];
    await tester.pumpWidget(
      _menu(
        state: _state(isMuted: false),
        onMuteFor: mutes.add,
        onAction: (_) {},
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(testL10n.categoryMuteCategory));
    await tester.pumpAndSettle();
    expect(mutes, <int?>[null]);
  });

  testWidgets('the hover submenu lists mute durations', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final List<int?> mutes = <int?>[];
    await tester.pumpWidget(
      _menu(
        state: _state(isMuted: false),
        onMuteFor: mutes.add,
        onAction: (_) {},
      ),
    );
    await tester.pumpAndSettle();
    final TestGesture mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
    );
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: Offset.zero);
    await mouse.moveTo(
      tester.getCenter(find.text(testL10n.categoryMuteCategory)),
    );
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pumpAndSettle();
    expect(find.text(testL10n.dmMuteFor15Min), findsOneWidget);
    await tester.tap(find.text(testL10n.dmMuteFor15Min));
    expect(mutes, <int?>[900]);
  });

  testWidgets('unmute stays a plain item', (tester) async {
    final List<CategoryMenuAction> actions = <CategoryMenuAction>[];
    await tester.pumpWidget(
      _menu(
        state: _state(isMuted: true),
        onMuteFor: (_) {},
        onAction: actions.add,
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(testL10n.categoryUnmuteCategory));
    expect(actions, <CategoryMenuAction>[CategoryMenuAction.mute]);
  });
}
