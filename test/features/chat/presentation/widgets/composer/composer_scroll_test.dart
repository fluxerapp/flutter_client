import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer_scroll.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';

void main() {
  group('scheduleComposerScrollToEnd', () {
    testWidgets(
      'jumps to maxScrollExtent after inserts overflow visible rows',
      (WidgetTester tester) async {
        final InlineTokenTextEditingController controller =
            InlineTokenTextEditingController();
        final ScrollController scrollController = ScrollController();
        addTearDown(controller.dispose);
        addTearDown(scrollController.dispose);

        await _pumpComposerField(
          tester,
          controller: controller,
          scrollController: scrollController,
          maxLines: 4,
        );

        controller.value = const TextEditingValue(
          text: 'line1\nline2\nline3\nline4\nline5\nline6\nline7',
          selection: TextSelection.collapsed(offset: 41),
        );
        scheduleComposerScrollToEnd(scrollController);
        await tester.pumpAndSettle();

        expect(scrollController.hasClients, isTrue);
        expect(scrollController.position.maxScrollExtent, greaterThan(0));
        expect(
          scrollController.offset,
          scrollController.position.maxScrollExtent,
        );
      },
    );

    testWidgets('does not scroll when content still fits in visible rows', (
      WidgetTester tester,
    ) async {
      final InlineTokenTextEditingController controller =
          InlineTokenTextEditingController();
      final ScrollController scrollController = ScrollController();
      addTearDown(controller.dispose);
      addTearDown(scrollController.dispose);

      await _pumpComposerField(
        tester,
        controller: controller,
        scrollController: scrollController,
        maxLines: 6,
      );

      controller.value = const TextEditingValue(
        text: 'hi',
        selection: TextSelection.collapsed(offset: 2),
      );
      scheduleComposerScrollToEnd(scrollController);
      await tester.pumpAndSettle();

      expect(scrollController.hasClients, isTrue);
      expect(scrollController.position.maxScrollExtent, 0);
      expect(scrollController.offset, 0);
    });
  });
}

Future<void> _pumpComposerField(
  WidgetTester tester, {
  required InlineTokenTextEditingController controller,
  required ScrollController scrollController,
  required int maxLines,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 200,
          child: TextField(
            controller: controller,
            scrollController: scrollController,
            minLines: 1,
            maxLines: maxLines,
          ),
        ),
      ),
    ),
  );
}
