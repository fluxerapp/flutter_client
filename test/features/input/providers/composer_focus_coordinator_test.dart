import 'package:flutter/services.dart';
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
        insertTypedText: (_) => false,
      )
      ..register(
        requestFocus: requestSheetFocus,
        readText: () => 'sheet',
        hasFocus: () => true,
        insertTypedText: (_) => false,
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

  test('typed text goes to the active composer only', () {
    final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator();
    final List<String> channelTyped = <String>[];
    final List<String> sheetTyped = <String>[];

    void requestChannelFocus() {}

    void requestSheetFocus() {}

    expect(coordinator.typeIntoComposer('a'), isFalse);

    coordinator
      ..register(
        requestFocus: requestChannelFocus,
        readText: () => '',
        hasFocus: () => false,
        insertTypedText: (String text) {
          channelTyped.add(text);
          return true;
        },
      )
      ..register(
        requestFocus: requestSheetFocus,
        readText: () => '',
        hasFocus: () => false,
        insertTypedText: (String text) {
          sheetTyped.add(text);
          return false;
        },
      );
    expect(coordinator.typeIntoComposer('h'), isFalse);
    expect(sheetTyped, <String>['h']);
    expect(channelTyped, isEmpty);

    coordinator.unregister(requestSheetFocus);
    expect(coordinator.typeIntoComposer('i'), isTrue);
    expect(channelTyped, <String>['i']);
  });

  test('key claims and empty arrow up go to the active composer only', () {
    final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator();
    const KeyEvent tab = KeyDownEvent(
      physicalKey: PhysicalKeyboardKey.tab,
      logicalKey: LogicalKeyboardKey.tab,
      timeStamp: Duration.zero,
    );
    var claims = true;
    var arrowUpCalls = 0;

    void requestChannelFocus() {}

    void requestSheetFocus() {}

    expect(coordinator.composerClaimsKeyEvent(tab), isFalse);
    expect(coordinator.composerHandleArrowUpEmpty(), isFalse);

    coordinator.register(
      requestFocus: requestChannelFocus,
      readText: () => '',
      hasFocus: () => true,
      insertTypedText: (_) => false,
      claimsKeyEvent: (KeyEvent event) => claims,
      handleArrowUpEmpty: () {
        arrowUpCalls++;
        return true;
      },
    );
    expect(coordinator.composerClaimsKeyEvent(tab), isTrue);
    expect(coordinator.composerHandleArrowUpEmpty(), isTrue);
    expect(arrowUpCalls, 1);

    claims = false;
    expect(coordinator.composerClaimsKeyEvent(tab), isFalse);

    claims = true;
    coordinator.register(
      requestFocus: requestSheetFocus,
      readText: () => '',
      hasFocus: () => true,
      insertTypedText: (_) => false,
    );
    expect(coordinator.composerClaimsKeyEvent(tab), isFalse);
    expect(coordinator.composerHandleArrowUpEmpty(), isFalse);
    expect(arrowUpCalls, 1);

    coordinator.unregister(requestSheetFocus);
    expect(coordinator.composerClaimsKeyEvent(tab), isTrue);
  });
}
