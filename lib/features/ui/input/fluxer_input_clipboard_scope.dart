import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';

class FluxerInputClipboardScope extends StatefulWidget {
  const FluxerInputClipboardScope({
    required this.controller,
    required this.builder,
    this.onPaste,
    super.key,
  });

  final TextEditingController controller;
  final Future<void> Function()? onPaste;
  final Widget Function(
    BuildContext context,
    FluxerInputClipboardScopeState state,
  )
  builder;

  @override
  State<FluxerInputClipboardScope> createState() =>
      FluxerInputClipboardScopeState();
}

class FluxerInputClipboardScopeState extends State<FluxerInputClipboardScope> {
  bool get _isInlineTokenController =>
      widget.controller is InlineTokenTextEditingController;

  Future<void> handleCopy() async {
    if (!_isInlineTokenController) {
      return;
    }
    await copyInlineTokenSelection(widget.controller);
  }

  Future<void> handleCut() async {
    if (!_isInlineTokenController) {
      return;
    }
    await cutInlineTokenSelection(widget.controller);
  }

  Future<void> handlePaste() async {
    if (widget.onPaste != null) {
      await widget.onPaste!();
      return;
    }
    await pasteIntoTextController(widget.controller);
  }

  KeyEventResult handleKeyboardShortcut(KeyEvent event) {
    if (!_isInlineTokenController) {
      return KeyEventResult.ignored;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final bool isModifierPressed =
        HardwareKeyboard.instance.isMetaPressed ||
        HardwareKeyboard.instance.isControlPressed;
    if (!isModifierPressed) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyC) {
      unawaited(handleCopy());
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyX) {
      unawaited(handleCut());
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyV) {
      unawaited(handlePaste());
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  List<ContextMenuButtonItem> _composeContextMenuItems(
    EditableTextState editableTextState,
  ) {
    if (!_isInlineTokenController) {
      return editableTextState.contextMenuButtonItems;
    }
    return editableTextState.contextMenuButtonItems.map((
      ContextMenuButtonItem item,
    ) {
      switch (item.type) {
        case ContextMenuButtonType.copy:
          return item.copyWith(
            onPressed: () {
              ContextMenuController.removeAny();
              unawaited(handleCopy());
            },
          );
        case ContextMenuButtonType.cut:
          return item.copyWith(
            onPressed: () {
              ContextMenuController.removeAny();
              unawaited(handleCut());
            },
          );
        case ContextMenuButtonType.paste:
          return item.copyWith(
            onPressed: () {
              ContextMenuController.removeAny();
              unawaited(handlePaste());
            },
          );
        case ContextMenuButtonType.custom:
        case ContextMenuButtonType.delete:
        case ContextMenuButtonType.lookUp:
        case ContextMenuButtonType.searchWeb:
        case ContextMenuButtonType.share:
        case ContextMenuButtonType.selectAll:
        case ContextMenuButtonType.liveTextInput:
          return item;
      }
    }).toList();
  }

  Widget buildContextMenu(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: _composeContextMenuItems(editableTextState),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this);
  }
}
