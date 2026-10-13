import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';

class EmojiTextEditingController extends InlineTokenTextEditingController {
  String get actualText => toWireText();

  int get actualTextLength => wireLength;

  void loadWithTokens(String rawText) {
    clearTokens();
    text = substituteEmojiTokens(rawText, allocateToken);
  }
}
