import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_drag_wrapper.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_rail_drag_auto_scroll.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class _TouchInput extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _RecordingGuildList extends OrganizedGuildList {
  final List<String> drops = <String>[];

  @override
  List<GuildNavbarItem> build() => const <GuildNavbarItem>[];

  @override
  void applyDragDrop({
    required String sourceId,
    required String targetId,
    required bool targetIsFolder,
    required DropPosition position,
  }) {
    drops.add('$sourceId ${position.name} $targetId');
  }
}

const double _railTop = 100;
const double _railHeight = 400;
const double _railTopInset = 40;
const int _itemCount = 40;

Future<ScrollController> _pumpRail(
  WidgetTester tester,
  ProviderContainer container,
) async {
  final ScrollController controller = ScrollController();
  addTearDown(controller.dispose);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: _railTop),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: kGuildNavbarWidth,
                height: _railHeight,
                child: GuildRailDragAutoScroll(
                  controller: controller,
                  topInset: _railTopInset,
                  child: ListView.builder(
                    controller: controller,
                    padding: const EdgeInsets.only(top: _railTopInset),
                    itemCount: _itemCount,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GuildDragWrapper(
                          key: ValueKey<String>('guild-$index'),
                          itemId: '$index',
                          isFolder: false,
                          allowCombine: false,
                          dragFeedback: GuildDragFeedback(label: '$index'),
                          child: SizedBox.square(
                            key: ValueKey<String>('icon-$index'),
                            dimension: 48,
                            child: const ColoredBox(color: Colors.blue),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return controller;
}

ProviderContainer _container() {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      inputModalityProvider.overrideWith(_TouchInput.new),
      organizedGuildListProvider.overrideWith(_RecordingGuildList.new),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

Future<TestGesture> _liftItem(WidgetTester tester, int index) async {
  final TestGesture gesture = await tester.startGesture(
    tester.getCenter(find.byKey(ValueKey<String>('icon-$index'))),
  );
  await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
  return gesture;
}

Future<void> _moveTo(
  WidgetTester tester,
  TestGesture gesture,
  Offset from,
  Offset to,
) async {
  const int steps = 12;
  for (int i = 1; i <= steps; i++) {
    await gesture.moveTo(Offset.lerp(from, to, i / steps)!);
    await tester.pump(const Duration(milliseconds: 16));
  }
}

bool _isVisibleInRail(WidgetTester tester, String itemId) {
  final Rect rect = tester.getRect(
    find.byKey(ValueKey<String>('guild-$itemId'), skipOffstage: false),
  );
  return rect.bottom > _railTop + _railTopInset &&
      rect.top < _railTop + _railHeight;
}

void main() {
  testWidgets('holding a guild near the bottom edge scrolls the rail', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = _container();
    final ScrollController controller = await _pumpRail(tester, container);
    final Offset start = tester.getCenter(
      find.byKey(const ValueKey<String>('icon-1')),
    );

    final TestGesture gesture = await _liftItem(tester, 1);
    await _moveTo(
      tester,
      gesture,
      start,
      Offset(start.dx, _railTop + _railHeight - 8),
    );
    for (int i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }

    expect(controller.offset, greaterThan(100));
    final DragState state = container.read(guildDragProvider);
    expect(state.hoverTargetId, isNotNull);
    expect(_isVisibleInRail(tester, state.hoverTargetId!), isTrue);
    expect(int.parse(state.hoverTargetId!), greaterThan(6));

    await gesture.up();
    await tester.pumpAndSettle();
    final _RecordingGuildList list =
        container.read(organizedGuildListProvider.notifier)
            as _RecordingGuildList;
    expect(list.drops, hasLength(1));
    expect(list.drops.single, startsWith('1 '));
    expect(list.drops.single, isNot(endsWith(' 2')));
  });

  testWidgets('holding a guild near the top edge scrolls the rail back', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = _container();
    final ScrollController controller = await _pumpRail(tester, container);
    controller.jumpTo(600);
    await tester.pumpAndSettle();
    final Finder icon = find.byKey(const ValueKey<String>('icon-16'));
    final Offset start = tester.getCenter(icon);

    final TestGesture gesture = await _liftItem(tester, 16);
    await _moveTo(
      tester,
      gesture,
      start,
      Offset(start.dx, _railTop + _railTopInset + 8),
    );
    for (int i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }

    expect(controller.offset, lessThan(500));
    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('the dragged icon and drop target never leave the rail', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = _container();
    await _pumpRail(tester, container);
    final Offset start = tester.getCenter(
      find.byKey(const ValueKey<String>('icon-2')),
    );

    final TestGesture gesture = await _liftItem(tester, 2);
    await _moveTo(
      tester,
      gesture,
      start,
      Offset(start.dx, _railTop + _railHeight + 300),
    );
    for (int i = 0; i < 20; i++) {
      final DragState state = container.read(guildDragProvider);
      expect(
        state.dragFeedbackGlobalY,
        lessThanOrEqualTo(_railTop + _railHeight - kGuildDragFeedbackSize / 2),
      );
      if (state.hoverTargetId case final String targetId) {
        expect(_isVisibleInRail(tester, targetId), isTrue);
      }
      await tester.pump(const Duration(milliseconds: 16));
    }

    await _moveTo(
      tester,
      gesture,
      Offset(start.dx, _railTop + _railHeight + 300),
      Offset(start.dx, 0),
    );
    expect(
      container.read(guildDragProvider).dragFeedbackGlobalY,
      greaterThanOrEqualTo(
        _railTop + _railTopInset + kGuildDragFeedbackSize / 2,
      ),
    );

    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('a drag that scrolls its source far away still ends', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = _container();
    final ScrollController controller = await _pumpRail(tester, container);
    final Offset start = tester.getCenter(
      find.byKey(const ValueKey<String>('icon-0')),
    );

    final TestGesture gesture = await _liftItem(tester, 0);
    await _moveTo(
      tester,
      gesture,
      start,
      Offset(start.dx, _railTop + _railHeight + 40),
    );
    for (int i = 0; i < 120; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
    expect(controller.offset, greaterThan(1000));

    await gesture.up();
    await tester.pumpAndSettle();

    expect(container.read(guildDragProvider).isDragging, isFalse);
    expect(tester.binding.transientCallbackCount, 0);
  });
}
