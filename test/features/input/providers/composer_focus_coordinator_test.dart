import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';

void main() {
  test('unregistering the top composer restores the one underneath', () {
    final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator();
    var channelFocusRequests = 0;
    var sheetFocusRequests = 0;

    void requestChannelFocus() {
      channelFocusRequests++;
    }

    void requestSheetFocus() {
      sheetFocusRequests++;
    }

    coordinator
      ..register(
        requestFocus: requestChannelFocus,
        readText: () => 'channel',
        hasFocus: () => false,
      )
      ..register(
        requestFocus: requestSheetFocus,
        readText: () => 'sheet',
        hasFocus: () => true,
      )
      ..requestComposerFocus();
    expect(sheetFocusRequests, 1);
    expect(coordinator.readComposerText(), 'sheet');
    expect(coordinator.composerHasFocus(), isTrue);

    coordinator
      ..unregister(requestSheetFocus)
      ..requestComposerFocus();
    expect(channelFocusRequests, 1);
    expect(coordinator.readComposerText(), 'channel');
    expect(coordinator.composerHasFocus(), isFalse);

    coordinator
      ..unregister(requestChannelFocus)
      ..requestComposerFocus();
    expect(channelFocusRequests, 1);
    expect(coordinator.readComposerText(), '');
  });
}
