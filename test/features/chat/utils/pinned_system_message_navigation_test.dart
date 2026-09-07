import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_pins_open_request_provider.dart';
import 'package:fluxer_app/features/chat/utils/pinned_system_message_navigation.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('requestOpenChannelPins bumps the header open request', (
    tester,
  ) async {
    late WidgetRef ref;
    await tester.pumpWidget(
      ProviderScope(
        child: Consumer(
          builder: (_, WidgetRef widgetRef, _) {
            ref = widgetRef;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(ref.read(channelPinsOpenRequestProvider), 0);
    requestOpenChannelPins(ref);
    expect(ref.read(channelPinsOpenRequestProvider), 1);
    requestOpenChannelPins(ref);
    expect(ref.read(channelPinsOpenRequestProvider), 2);
  });
}
