import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';

class ComposerMessageLengthPasteFormatter extends TextInputFormatter {
  ComposerMessageLengthPasteFormatter({
    required this.controller,
    required this.maxLength,
    required this.canAttachOnExceed,
    required this.onPasteExceedsLimit,
  });

  final ComposerMentionController controller;
  final int maxLength;
  final bool Function() canAttachOnExceed;
  final void Function(String pastedText) onPasteExceedsLimit;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == oldValue.text) {
      return newValue;
    }
    final int replacedLength =
        oldValue.selection.end - oldValue.selection.start;
    final int insertedLength =
        newValue.text.length - oldValue.text.length + replacedLength;
    if (insertedLength <= 1) {
      return newValue;
    }
    if (oldValue.composing.isValid) {
      return newValue;
    }
    if (!canAttachOnExceed()) {
      return newValue;
    }
    final TextEditingValue savedValue = controller.value;
    controller.value = newValue;
    final int newWireLength = controller.toWireText().trim().length;
    if (newWireLength <= maxLength) {
      return newValue;
    }
    controller.value = savedValue;
    final String pastedText = _extractInsertedText(oldValue, newValue);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onPasteExceedsLimit(pastedText);
    });
    return oldValue;
  }

  static String _extractInsertedText(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int start = oldValue.selection.start;
    final int end = oldValue.selection.end;
    final int tailStart =
        start + (newValue.text.length - oldValue.text.length + (end - start));
    if (start >= 0 && tailStart <= newValue.text.length && tailStart >= start) {
      return newValue.text.substring(start, tailStart);
    }
    return newValue.text;
  }
}
