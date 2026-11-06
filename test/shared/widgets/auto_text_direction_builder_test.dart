import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/auto_text_direction_builder.dart';

void main() {
  testWidgets('tracks the first strong character of the controller', (
    tester,
  ) async {
    final TextEditingController controller = TextEditingController();
    addTearDown(controller.dispose);
    TextDirection? direction;
    int builds = 0;
    await tester.pumpWidget(
      AutoTextDirectionBuilder(
        controller: controller,
        builder: (BuildContext context, TextDirection? next) {
          direction = next;
          builds++;
          return const SizedBox.shrink();
        },
      ),
    );
    expect(direction, isNull);

    controller.text = '123 שלום';
    await tester.pump();
    expect(direction, TextDirection.rtl);

    final int buildsAfterRtl = builds;
    controller.text = '123 שלום עולם';
    await tester.pump();
    expect(builds, buildsAfterRtl);

    controller.text = 'hello שלום';
    await tester.pump();
    expect(direction, TextDirection.ltr);
  });
}
