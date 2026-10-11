import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

void main() {
  testWidgets('focusing a closed composer does not jump to the anchor height', (
    tester,
  ) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    container
        .read(mobileKeyboardMetricsProvider.notifier)
        .captureKeyboardAnchor(336);

    await tester.tap(channelComposerField());
    await tester.pump();

    expect(
      container.read(mobileKeyboardMetricsProvider).unmeasuredKeyboardReserved,
      isFalse,
    );
    expect(container.read(bottomInputSlotProvider).slotHeight, 0);

    container
        .read(mobileKeyboardMetricsProvider.notifier)
        .syncViewInsets(24, safeAreaBottom: 34);
    expect(container.read(bottomInputSlotProvider).slotHeight, 24);

    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 400));
    await releaseTestWidgetTree(tester);
  });
}
