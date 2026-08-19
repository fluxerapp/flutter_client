import 'package:flutter/services.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:material_ui/material_ui.dart';
import 'package:super_clipboard/super_clipboard.dart';

const int _kComposerPrivateUseStart = 0xE000;
const int _kComposerPrivateUseEnd = 0xF8FF;

final RegExp _privateUseAreaPattern = RegExp(r'[\uE000-\uF8FF]');

bool _containsPrivateUseCharacter(String text) {
  for (final int rune in text.runes) {
    if (rune >= _kComposerPrivateUseStart && rune <= _kComposerPrivateUseEnd) {
      return true;
    }
  }
  return false;
}

String stripPrivateUseCharacters(String text) {
  if (text.isEmpty || !_containsPrivateUseCharacter(text)) {
    return text;
  }
  return text.replaceAll(_privateUseAreaPattern, '');
}

bool wireTextLostContentAfterSanitize({
  required String rawWireText,
  required String sanitizedWireText,
}) => rawWireText.trim().isNotEmpty && sanitizedWireText.trim().isEmpty;

Future<String> _wireToDisplayFragment(
  TextEditingController controller,
  String wire, {
  bool includePlainShortcodes = true,
}) async {
  if (controller is ComposerMentionController) {
    return controller.mentionWireToDisplayFragment(
      wire,
      includePlainShortcodes: includePlainShortcodes,
    );
  }
  if (controller is InlineTokenTextEditingController) {
    return controller.wireToDisplayFragment(
      wire,
      includePlainShortcodes: includePlainShortcodes,
    );
  }
  return wire;
}

String? _selectedWireText(TextEditingController controller) {
  if (controller is! InlineTokenTextEditingController) {
    return null;
  }
  final TextSelection selection = controller.selection;
  if (!selection.isValid || selection.isCollapsed) {
    return null;
  }
  return controller.toWireTextRange(selection.start, selection.end);
}

Future<bool> copyInlineTokenSelection(TextEditingController controller) async {
  final String? wire = _selectedWireText(controller);
  if (wire == null) {
    return false;
  }
  await Clipboard.setData(ClipboardData(text: wire));
  return true;
}

Future<bool> cutInlineTokenSelection(TextEditingController controller) async {
  if (controller is! InlineTokenTextEditingController) {
    return false;
  }
  final String? wire = _selectedWireText(controller);
  if (wire == null) {
    return false;
  }
  await Clipboard.setData(ClipboardData(text: wire));
  final TextSelection selection = controller.selection;
  final String newText = controller.text.replaceRange(
    selection.start,
    selection.end,
    '',
  );
  controller.value = controller.value.copyWith(
    text: newText,
    selection: TextSelection.collapsed(offset: selection.start),
    composing: TextRange.empty,
  );
  return true;
}

int projectedWireLengthAfterPaste(
  InlineTokenTextEditingController controller,
  String clipboardText,
) {
  final TextSelection selection = controller.selection;
  final int insertOffset = selection.isValid
      ? selection.start
      : controller.text.length;
  final int replaceEnd = selection.isValid ? selection.end : insertOffset;
  final String sanitized = stripPrivateUseCharacters(clipboardText);
  final String beforeWire = controller.toWireTextRange(0, insertOffset);
  final String afterWire = controller.toWireTextRange(
    replaceEnd,
    controller.text.length,
  );
  return (beforeWire + sanitized + afterWire).trim().length;
}

Future<bool> pasteWireTextIntoInlineTokenController(
  TextEditingController controller,
  String clipboardText,
) async {
  if (controller is! InlineTokenTextEditingController) {
    return false;
  }
  final TextSelection selection = controller.selection;
  final int insertOffset = selection.isValid
      ? selection.start
      : controller.text.length;
  final String sanitized = stripPrivateUseCharacters(clipboardText);
  if (sanitized.isEmpty) {
    return false;
  }
  final String displayFragment = await _wireToDisplayFragment(
    controller,
    sanitized,
  );
  final String newText = controller.text.replaceRange(
    selection.isValid ? selection.start : insertOffset,
    selection.isValid ? selection.end : insertOffset,
    displayFragment,
  );
  controller.value = controller.value.copyWith(
    text: newText,
    selection: TextSelection.collapsed(
      offset: insertOffset + displayFragment.length,
    ),
    composing: TextRange.empty,
  );
  return true;
}

Future<String?> readClipboardPlainText() async {
  try {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    final String? platformText = data?.text;
    if (platformText != null && platformText.isNotEmpty) {
      return platformText;
    }
    final SystemClipboard? clipboard = SystemClipboard.instance;
    if (clipboard == null) {
      return null;
    }
    final ClipboardReader reader = await clipboard.read();
    for (final ClipboardDataReader item in reader.items) {
      if (!item.canProvide(Formats.plainText)) {
        continue;
      }
      final String? text = await item.readValue(Formats.plainText);
      if (text != null && text.isNotEmpty) {
        return text;
      }
    }
    return null;
  } on Object catch (error, stack) {
    talker.warning('[Clipboard] read failed', error, stack);
    return null;
  }
}

Future<void> pasteIntoTextController(TextEditingController controller) async {
  final String? text = await readClipboardPlainText();
  if (text == null || text.isEmpty) {
    return;
  }
  if (controller is InlineTokenTextEditingController) {
    await pasteWireTextIntoInlineTokenController(controller, text);
    return;
  }
  final TextEditingValue oldValue = controller.value;
  final TextSelection selection = oldValue.selection;
  final int insertStart = selection.isValid
      ? selection.start
      : oldValue.text.length;
  final int insertEnd = selection.isValid ? selection.end : insertStart;
  final String newText = oldValue.text.replaceRange(
    insertStart,
    insertEnd,
    text,
  );
  controller.value = oldValue.copyWith(
    text: newText,
    selection: TextSelection.collapsed(offset: insertStart + text.length),
    composing: TextRange.empty,
  );
}
