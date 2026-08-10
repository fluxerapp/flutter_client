import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';

void main() {
  test('mobile chat strips keyboard insets from message list subtree', () {
    expect(
      mobileChannelScaffoldShouldRemoveKeyboardInset(
        isChatRoute: true,
        isExpressionPanelOpen: true,
      ),
      isTrue,
    );
    expect(
      mobileChannelScaffoldShouldRemoveKeyboardInset(
        isChatRoute: true,
        isExpressionPanelOpen: false,
      ),
      isTrue,
    );
    expect(
      mobileChannelScaffoldShouldRemoveKeyboardInset(
        isChatRoute: false,
        isExpressionPanelOpen: false,
      ),
      isFalse,
    );
  });
}
