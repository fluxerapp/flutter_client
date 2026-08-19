import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:material_ui/material_ui.dart';

Widget _buildScrollable({
  required ScrollController scrollController,
  required List<Widget> children,
  double height = 120,
}) {
  return MaterialApp(
    home: Center(
      child: SizedBox(
        width: 240,
        height: height,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    ),
  );
}

GuildScrollIndicatorController _createController({
  required ScrollController scrollController,
  required Map<String, GlobalKey> itemKeys,
}) {
  return GuildScrollIndicatorController(
    scrollController: scrollController,
    itemKeys: itemKeys,
    resolveSeverity: (String itemId) => GuildScrollIndicatorSeverity.unread,
  );
}

class _UnlaidOutChildHost extends SingleChildRenderObjectWidget {
  const _UnlaidOutChildHost({required super.child});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderUnlaidOutChildHost();
}

class _RenderUnlaidOutChildHost extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    size = constraints.constrain(const Size(48, 48));
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {}
}

void main() {
  group('GuildScrollIndicatorController', () {
    testWidgets('scheduleUpdate skips an attached keyed item before layout', (
      WidgetTester tester,
    ) async {
      final scrollController = ScrollController();
      final itemKeys = <String, GlobalKey>{'unread': GlobalKey()};
      final indicatorController = _createController(
        scrollController: scrollController,
        itemKeys: itemKeys,
      );
      addTearDown(() {
        indicatorController.detach();
        scrollController.dispose();
      });

      await tester.pumpWidget(
        _buildScrollable(
          scrollController: scrollController,
          children: <Widget>[
            _UnlaidOutChildHost(
              child: SizedBox(key: itemKeys['unread'], width: 24, height: 24),
            ),
            const SizedBox(height: 400),
          ],
        ),
      );
      expect(tester.takeException(), isNull);

      final renderObject = itemKeys['unread']!.currentContext!
          .findRenderObject();
      expect(renderObject, isA<RenderBox>());
      final itemBox = renderObject! as RenderBox;
      expect(itemBox.attached, isTrue);
      expect(itemBox.hasSize, isFalse);

      indicatorController.scheduleUpdate();
      await tester.pump();

      expect(tester.takeException(), isNull);
      expect(indicatorController.topIndicator.value.show, isFalse);
      expect(indicatorController.bottomIndicator.value.show, isFalse);
    });

    testWidgets(
      'shows only one indicator when unread items exist above and below viewport',
      (WidgetTester tester) async {
        final scrollController = ScrollController();
        final itemKeys = <String, GlobalKey>{
          'above': GlobalKey(),
          'below': GlobalKey(),
        };
        final indicatorController = _createController(
          scrollController: scrollController,
          itemKeys: itemKeys,
        );
        addTearDown(() {
          indicatorController.detach();
          scrollController.dispose();
        });

        await tester.pumpWidget(
          _buildScrollable(
            scrollController: scrollController,
            children: <Widget>[
              SizedBox(key: itemKeys['above'], height: 40),
              const SizedBox(height: 260),
              SizedBox(key: itemKeys['below'], height: 40),
            ],
          ),
        );
        scrollController.jumpTo(130);
        await tester.pump();
        indicatorController.update();

        final bool topVisible = indicatorController.topIndicator.value.show;
        final bool bottomVisible =
            indicatorController.bottomIndicator.value.show;
        expect(topVisible || bottomVisible, isTrue);
        expect(topVisible && bottomVisible, isFalse);
        expect(indicatorController.bottomIndicator.value.targetId, 'below');
      },
    );

    testWidgets(
      'laid-out unread items above and below the viewport show one indicator at each edge',
      (WidgetTester tester) async {
        final scrollController = ScrollController();
        final itemKeys = <String, GlobalKey>{
          'above': GlobalKey(),
          'below': GlobalKey(),
        };
        final indicatorController = _createController(
          scrollController: scrollController,
          itemKeys: itemKeys,
        );
        addTearDown(() {
          indicatorController.detach();
          scrollController.dispose();
        });

        await tester.pumpWidget(
          _buildScrollable(
            scrollController: scrollController,
            children: <Widget>[
              SizedBox(key: itemKeys['above'], height: 40),
              const SizedBox(height: 260),
              SizedBox(key: itemKeys['below'], height: 40),
            ],
          ),
        );

        expect(
          (itemKeys['below']!.currentContext!.findRenderObject()! as RenderBox)
              .hasSize,
          isTrue,
        );
        indicatorController.update();

        expect(indicatorController.topIndicator.value.show, isFalse);
        expect(indicatorController.bottomIndicator.value, (
          show: true,
          severity: GuildScrollIndicatorSeverity.unread,
          targetId: 'below',
        ));

        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        await tester.pump();
        expect(
          (itemKeys['above']!.currentContext!.findRenderObject()! as RenderBox)
              .hasSize,
          isTrue,
        );
        indicatorController.update();

        expect(indicatorController.topIndicator.value, (
          show: true,
          severity: GuildScrollIndicatorSeverity.unread,
          targetId: 'above',
        ));
        expect(indicatorController.bottomIndicator.value.show, isFalse);
      },
    );
    testWidgets('hides indicator after tracked item is removed from the tree', (
      WidgetTester tester,
    ) async {
      final scrollController = ScrollController();
      final itemKeys = <String, GlobalKey>{'below': GlobalKey()};
      final indicatorController = _createController(
        scrollController: scrollController,
        itemKeys: itemKeys,
      );
      addTearDown(() {
        indicatorController.detach();
        scrollController.dispose();
      });

      await tester.pumpWidget(
        _buildScrollable(
          scrollController: scrollController,
          children: <Widget>[
            const SizedBox(height: 260),
            SizedBox(key: itemKeys['below'], height: 40),
          ],
        ),
      );
      indicatorController.update();
      expect(indicatorController.bottomIndicator.value.show, isTrue);

      await tester.pumpWidget(
        _buildScrollable(
          scrollController: scrollController,
          children: const <Widget>[SizedBox(height: 260)],
        ),
      );
      indicatorController.scheduleUpdate();
      await tester.pump();

      expect(indicatorController.topIndicator.value.show, isFalse);
      expect(indicatorController.bottomIndicator.value.show, isFalse);
    });
  });
}
