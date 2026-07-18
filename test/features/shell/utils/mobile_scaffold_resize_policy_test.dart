import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';

void main() {
  test('mobile chat never resizes scaffold for keyboard', () {
    expect(
      mobileChannelScaffoldShouldResizeForKeyboard(
        isChatRoute: true,
        isExpressionPanelOpen: true,
      ),
      isFalse,
    );
    expect(
      mobileChannelScaffoldShouldResizeForKeyboard(
        isChatRoute: true,
        isExpressionPanelOpen: false,
      ),
      isFalse,
    );
  });

  test('mobile chat strips keyboard insets from message list subtree', () {
    expect(
      mobileChannelScaffoldShouldRemoveKeyboardInset(
        isChatRoute: true,
        isExpressionPanelOpen: true,
      ),
      isTrue,
    );
  });

  test(
    'non-chat mobile channel screens keep default keyboard resize behavior',
    () {
      expect(
        mobileChannelScaffoldShouldResizeForKeyboard(
          isChatRoute: false,
          isExpressionPanelOpen: true,
        ),
        isTrue,
      );
    },
  );
}
