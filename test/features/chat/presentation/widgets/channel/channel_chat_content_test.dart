import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

void main() {
  test('loads chat immediately outside mobile drawer context', () {
    expect(
      computeChannelChatShouldLoadMessages(
        isMobile: false,
        revealSide: RevealSide.left,
      ),
      isTrue,
    );
  });

  test('defers mobile chat loading until the chat side is visible', () {
    expect(
      computeChannelChatShouldLoadMessages(
        isMobile: true,
        revealSide: RevealSide.left,
      ),
      isFalse,
    );
    expect(
      computeChannelChatShouldLoadMessages(
        isMobile: true,
        revealSide: RevealSide.main,
      ),
      isTrue,
    );
  });
}
