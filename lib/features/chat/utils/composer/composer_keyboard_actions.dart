import 'package:flutter/services.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_code_block.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_markdown_wrap.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';

bool composerValueIsComposing(TextEditingValue value) =>
    value.composing.isValid &&
    !value.composing.isCollapsed &&
    !InlineTokenTextEditingController.isInlinePrediction(value);

String? composerMarkdownWrapperFor(TextEditingValue value, KeyEvent event) {
  final TextSelection selection = value.selection;
  if (event is! KeyDownEvent ||
      !selection.isValid ||
      selection.isCollapsed ||
      composerValueIsComposing(value)) {
    return null;
  }
  return composerMarkdownShortcutWrapper(event);
}

bool composerSelectionInCodeBlock(TextEditingValue value) {
  final TextSelection selection = value.selection;
  if (!selection.isValid) {
    return false;
  }
  return isOffsetInsideCodeBlock(value.text, selection.start);
}

TextEditingValue? applyComposerCodeIndent(
  TextEditingValue value, {
  required bool unindent,
}) {
  final TextSelection selection = value.selection;
  if (!selection.isValid) {
    return null;
  }
  final CodeIndentPlan? plan = analyzeCodeIndent(
    value.text,
    selection.start,
    selection.end,
    unindent: unindent,
  );
  if (plan == null) {
    return null;
  }
  final List<CodeIndentEdit> edits = List<CodeIndentEdit>.of(plan.edits)
    ..sort((CodeIndentEdit a, CodeIndentEdit b) => b.start.compareTo(a.start));
  var text = value.text;
  for (final CodeIndentEdit edit in edits) {
    text = text.replaceRange(edit.start, edit.end, edit.text);
  }
  final bool backward = selection.baseOffset > selection.extentOffset;
  return TextEditingValue(
    text: text,
    selection: backward
        ? TextSelection(
            baseOffset: plan.selectionEnd,
            extentOffset: plan.selectionStart,
          )
        : TextSelection(
            baseOffset: plan.selectionStart,
            extentOffset: plan.selectionEnd,
          ),
  );
}

Message? lastEditableComposerMessage(
  List<Message> messages,
  String? currentUserId,
) {
  if (currentUserId == null) {
    return null;
  }
  for (final Message message in messages.reversed) {
    if (message.authorId == currentUserId &&
        message.deliveryState == MessageDeliveryState.sent &&
        message.isUserMessage &&
        !message.isClientSystemMessage &&
        message.messageSnapshots.isEmpty) {
      return message;
    }
  }
  return null;
}
