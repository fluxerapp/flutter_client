import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('syncWithVisibility pauses when animations are disabled', (
    WidgetTester tester,
  ) async {
    final AnimationController controller = AnimationController(
      vsync: const TestVSync(),
      duration: const Duration(milliseconds: 400),
    );
    addTearDown(controller.dispose);

    controller.syncWithVisibility(isVisible: true);
    expect(controller.isAnimating, isTrue);

    controller.syncWithVisibility(isVisible: true, animationsEnabled: false);
    expect(controller.isAnimating, isFalse);

    controller.syncWithVisibility(isVisible: true);
    expect(controller.isAnimating, isTrue);

    controller.syncWithVisibility(isVisible: false);
    expect(controller.isAnimating, isFalse);
  });
}
