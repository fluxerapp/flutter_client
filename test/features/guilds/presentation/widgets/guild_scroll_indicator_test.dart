import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/material_ui.dart';

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

void _expectShowing(GuildScrollIndicatorState state, String targetId) {
  expect(state.show, isTrue);
  expect(state.severity, GuildScrollIndicatorSeverity.unread);
  expect(state.targetId, targetId);
}

Widget _buildLazyList({
  required ScrollController scrollController,
  required Map<String, GlobalKey> itemKeys,
  required int count,
}) {
  return MaterialApp(
    theme: ThemeData(
      extensions: const <ThemeExtension<dynamic>>[FluxerMotionTheme.standard()],
    ),
    home: Center(
      child: SizedBox(
        width: 240,
        height: 120,
        child: ListView.builder(
          controller: scrollController,
          scrollCacheExtent: const ScrollCacheExtent.pixels(0),
          itemCount: count,
          itemBuilder: (BuildContext context, int index) => SizedBox(
            key: itemKeys.putIfAbsent('item-$index', GlobalKey.new),
            height: 40,
          ),
        ),
      ),
    ),
  );
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
      'shows an indicator at each edge when unread items exist above and below viewport',
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

        _expectShowing(indicatorController.topIndicator.value, 'above');
        _expectShowing(indicatorController.bottomIndicator.value, 'below');
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
        _expectShowing(indicatorController.bottomIndicator.value, 'below');

        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        await tester.pump();
        expect(
          (itemKeys['above']!.currentContext!.findRenderObject()! as RenderBox)
              .hasSize,
          isTrue,
        );
        indicatorController.update();

        _expectShowing(indicatorController.topIndicator.value, 'above');
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

    testWidgets('an unread item far below the viewport shows the bottom pill '
        'even though the lazy list never built it', (
      WidgetTester tester,
    ) async {
      final scrollController = ScrollController();
      final itemKeys = <String, GlobalKey>{};
      final List<String> order = <String>[
        for (var i = 0; i < 50; i++) 'item-$i',
      ];
      final indicatorController = GuildScrollIndicatorController(
        scrollController: scrollController,
        itemKeys: itemKeys,
        resolveSeverity: (String id) =>
            id == 'item-45' ? GuildScrollIndicatorSeverity.unread : null,
        orderedIds: () => order,
      );
      addTearDown(() {
        indicatorController.detach();
        scrollController.dispose();
      });

      await tester.pumpWidget(
        _buildLazyList(
          scrollController: scrollController,
          itemKeys: itemKeys,
          count: order.length,
        ),
      );
      expect(itemKeys['item-45']?.currentContext, isNull);
      indicatorController.update();

      _expectShowing(indicatorController.bottomIndicator.value, 'item-45');
      expect(indicatorController.topIndicator.value.show, isFalse);
    });

    testWidgets('tapping a pill for an item the lazy list never built '
        'scrolls it into view', (WidgetTester tester) async {
      final scrollController = ScrollController();
      final itemKeys = <String, GlobalKey>{};
      final List<String> order = <String>[
        for (var i = 0; i < 50; i++) 'item-$i',
      ];
      final indicatorController = GuildScrollIndicatorController(
        scrollController: scrollController,
        itemKeys: itemKeys,
        resolveSeverity: (String id) =>
            id == 'item-45' ? GuildScrollIndicatorSeverity.mention : null,
        orderedIds: () => order,
      );
      addTearDown(() {
        indicatorController.detach();
        scrollController.dispose();
      });

      await tester.pumpWidget(
        _buildLazyList(
          scrollController: scrollController,
          itemKeys: itemKeys,
          count: order.length,
        ),
      );
      expect(itemKeys['item-45']?.currentContext, isNull);
      indicatorController.update();

      indicatorController.scrollTo(
        indicatorController.bottomIndicator.value.targetId,
        GuildScrollIndicatorEdge.bottom,
      );
      await tester.pumpAndSettle();

      final BuildContext? target = itemKeys['item-45']?.currentContext;
      expect(target, isNotNull);
      final RenderBox targetBox = target!.findRenderObject()! as RenderBox;
      final RenderBox viewport =
          scrollController.position.context.storageContext.findRenderObject()!
              as RenderBox;
      final double viewportTop = viewport.localToGlobal(Offset.zero).dy;
      final double targetTop = targetBox.localToGlobal(Offset.zero).dy;
      expect(targetTop, greaterThanOrEqualTo(viewportTop));
      expect(
        targetTop + targetBox.size.height,
        lessThanOrEqualTo(viewportTop + viewport.size.height),
      );
    });

    testWidgets('an unchanged indicator does not notify listeners again', (
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
      var notifications = 0;
      indicatorController.bottomIndicator.addListener(() => notifications++);
      indicatorController.topIndicator.addListener(() => notifications++);

      indicatorController
        ..update()
        ..update();

      expect(notifications, 0);
    });

    testWidgets('the first evaluation lands without animating, later changes '
        'animate, and resetAnimation lands the next one again', (
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
      Widget list({required bool withItem}) => _buildScrollable(
        scrollController: scrollController,
        children: <Widget>[
          const SizedBox(height: 260),
          if (withItem) SizedBox(key: itemKeys['below'], height: 40),
        ],
      );

      await tester.pumpWidget(list(withItem: true));
      indicatorController.update();
      expect(indicatorController.bottomIndicator.value.show, isTrue);
      expect(indicatorController.bottomIndicator.value.animate, isFalse);

      await tester.pumpWidget(list(withItem: false));
      indicatorController.update();
      expect(indicatorController.bottomIndicator.value.show, isFalse);
      expect(indicatorController.bottomIndicator.value.animate, isTrue);

      await tester.pumpWidget(list(withItem: true));
      indicatorController
        ..resetAnimation()
        ..update();
      expect(indicatorController.bottomIndicator.value.show, isTrue);
      expect(indicatorController.bottomIndicator.value.animate, isFalse);
    });
  });
}
