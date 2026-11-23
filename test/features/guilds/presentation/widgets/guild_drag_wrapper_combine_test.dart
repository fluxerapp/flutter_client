import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_drag_wrapper.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

import '../../../../helpers/pump_fluxer_app.dart';

class _TouchInput extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _Drop {
  const _Drop(this.sourceId, this.targetId, this.position);

  final String sourceId;
  final String targetId;
  final DropPosition position;
}

class _RecordingGuildList extends OrganizedGuildList {
  _RecordingGuildList(this.drops);

  final List<_Drop> drops;

  @override
  List<GuildNavbarItem> build() => const <GuildNavbarItem>[];

  @override
  void applyDragDrop({
    required String sourceId,
    required String targetId,
    required bool targetIsFolder,
    required DropPosition position,
  }) {
    drops.add(_Drop(sourceId, targetId, position));
  }
}

class _PeekMenu extends GuildIconPeekMenuConfig {
  _PeekMenu()
    : super(guildName: 'Test', hasUnread: false, onAction: (_, _) async {});
}

Widget _guild(String id, {required bool withPeek}) {
  return GuildDragWrapper(
    itemId: id,
    isFolder: false,
    dragFeedback: const SizedBox.square(dimension: 48),
    peekMenu: withPeek ? _PeekMenu() : null,
    child: SizedBox.square(
      key: ValueKey<String>('icon-$id'),
      dimension: 48,
      child: const ColoredBox(color: Colors.blue),
    ),
  );
}

Future<void> _dragOnto(WidgetTester tester, {required bool withPeek}) async {
  final List<_Drop> drops = <_Drop>[];
  await tester.pumpWidget(
    pumpFluxerApp(
      overrides: [
        inputModalityProvider.overrideWith(_TouchInput.new),
        organizedGuildListProvider.overrideWith(
          () => _RecordingGuildList(drops),
        ),
      ],
      child: Scaffold(
        body: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: kGuildNavbarWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _guild('1', withPeek: withPeek),
                const SizedBox(height: 8),
                _guild('2', withPeek: withPeek),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();

  final Offset start = tester.getCenter(
    find.byKey(const ValueKey<String>('icon-1')),
  );
  final Offset target = tester.getCenter(
    find.byKey(const ValueKey<String>('icon-2')),
  );
  final TestGesture gesture = await tester.startGesture(start);
  await tester.pump(kLongPressTimeout + const Duration(milliseconds: 50));
  final Offset step = (target - start) / 12;
  for (var i = 0; i < 12; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 30)),
    );
    await gesture.moveBy(step);
    await tester.pump(const Duration(milliseconds: 16));
  }
  await tester.pump(const Duration(milliseconds: 400));
  final ProviderContainer container = ProviderScope.containerOf(
    tester.element(find.byType(Scaffold)),
  );
  bool isCombiningOntoTarget() {
    final DragState state = container.read(guildDragProvider);
    return state.hoverTargetId == '2' &&
        state.dropPosition == DropPosition.combine;
  }

  Offset pointer = target;
  for (var i = 0; i < 6 && !isCombiningOntoTarget(); i++) {
    final Offset live = tester.getCenter(
      find.byKey(const ValueKey<String>('icon-2')),
    );
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 100)),
    );
    await gesture.moveBy(live - pointer + const Offset(0, 0.01));
    pointer = live + const Offset(0, 0.01);
    await tester.pump(const Duration(milliseconds: 120));
  }
  expect(isCombiningOntoTarget(), isTrue);
  await tester.pumpAndSettle();
  expect(isCombiningOntoTarget(), isTrue);
  await gesture.up();
  await tester.pumpAndSettle();

  expect(drops, hasLength(1));
  expect(drops.single.sourceId, '1');
  expect(drops.single.targetId, '2');
  expect(drops.single.position, DropPosition.combine);
}

void main() {
  testWidgets(
    'touch dragging a guild onto another combines them',
    (WidgetTester tester) => _dragOnto(tester, withPeek: false),
  );

  testWidgets(
    'touch dragging a guild with a peek menu onto another combines them',
    (WidgetTester tester) => _dragOnto(tester, withPeek: true),
  );
}
