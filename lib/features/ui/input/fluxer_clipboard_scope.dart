import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:material_ui/material_ui.dart';

typedef FluxerPasteCallback = Future<void> Function();

class FluxerClipboardScope extends StatefulWidget {
  const FluxerClipboardScope({
    required this.controller,
    required this.builder,
    this.focusNode,
    this.onPaste,
    this.injectPasteWhenMissing = false,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FluxerPasteCallback? onPaste;
  final bool injectPasteWhenMissing;
  final Widget Function(
    BuildContext context,
    FluxerClipboardScopeState scope,
    FocusNode focusNode,
  )
  builder;

  @override
  State<FluxerClipboardScope> createState() => FluxerClipboardScopeState();
}

class FluxerClipboardScopeState extends State<FluxerClipboardScope> {
  FocusNode? _ownedFocusNode;
  FocusOnKeyEventCallback? _chainedKeyHandler;

  late FocusNode _effectiveFocusNode;

  bool get _isInlineTokenController =>
      widget.controller is InlineTokenTextEditingController;

  bool get _usesCustomPaste => widget.onPaste != null;

  bool get _interceptKeyboardClipboard =>
      _usesCustomPaste || _isInlineTokenController;

  @override
  void initState() {
    super.initState();
    _bindFocusNode(widget.focusNode);
  }

  @override
  void didUpdateWidget(FluxerClipboardScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      _unbindFocusNode(oldWidget.focusNode);
      _bindFocusNode(widget.focusNode);
    }
  }

  @override
  void dispose() {
    _unbindFocusNode(widget.focusNode);
    _ownedFocusNode?.dispose();
    super.dispose();
  }

  void _bindFocusNode(FocusNode? externalFocusNode) {
    if (externalFocusNode != null) {
      _effectiveFocusNode = externalFocusNode;
      if (_interceptKeyboardClipboard) {
        _chainedKeyHandler = externalFocusNode.onKeyEvent;
        externalFocusNode.onKeyEvent = _handleKeyEvent;
      }
      return;
    }
    _ownedFocusNode = FocusNode();
    _effectiveFocusNode = _ownedFocusNode!;
    if (_interceptKeyboardClipboard) {
      _effectiveFocusNode.onKeyEvent = _handleKeyEvent;
    }
  }

  void _unbindFocusNode(FocusNode? externalFocusNode) {
    if (externalFocusNode != null) {
      if (externalFocusNode.onKeyEvent == _handleKeyEvent) {
        externalFocusNode.onKeyEvent = _chainedKeyHandler;
      }
      _chainedKeyHandler = null;
      return;
    }
    _ownedFocusNode?.onKeyEvent = null;
    _ownedFocusNode?.dispose();
    _ownedFocusNode = null;
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final KeyEventResult clipboardResult = handleKeyboardShortcut(event);
    if (clipboardResult == KeyEventResult.handled) {
      return clipboardResult;
    }
    final FocusOnKeyEventCallback? chained = _chainedKeyHandler;
    if (chained != null) {
      return chained(node, event);
    }
    return KeyEventResult.ignored;
  }

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
    if (!_interceptKeyboardClipboard) {
      return KeyEventResult.ignored;
    }
    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }
    final bool isModifierPressed =
        HardwareKeyboard.instance.isMetaPressed ||
        HardwareKeyboard.instance.isControlPressed;
    if (!isModifierPressed || HardwareKeyboard.instance.isAltPressed) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyC) {
      if (!_isInlineTokenController) {
        return KeyEventResult.ignored;
      }
      unawaited(handleCopy());
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.keyX) {
      if (!_isInlineTokenController) {
        return KeyEventResult.ignored;
      }
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
    if (!_interceptKeyboardClipboard) {
      return editableTextState.contextMenuButtonItems;
    }
    final List<ContextMenuButtonItem> buttonItems = editableTextState
        .contextMenuButtonItems
        .map((ContextMenuButtonItem item) {
          if (_isInlineTokenController &&
              (item.type == ContextMenuButtonType.copy ||
                  item.type == ContextMenuButtonType.cut)) {
            return item.copyWith(
              onPressed: () {
                ContextMenuController.removeAny();
                if (item.type == ContextMenuButtonType.copy) {
                  unawaited(handleCopy());
                } else {
                  unawaited(handleCut());
                }
              },
            );
          }
          if (item.type != ContextMenuButtonType.paste) {
            return item;
          }
          return item.copyWith(
            onPressed: () {
              ContextMenuController.removeAny();
              unawaited(handlePaste());
            },
          );
        })
        .toList();
    if (!widget.injectPasteWhenMissing) {
      return buttonItems;
    }
    final bool hasPasteButton = buttonItems.any(
      (ContextMenuButtonItem item) => item.type == ContextMenuButtonType.paste,
    );
    if (hasPasteButton) {
      return buttonItems;
    }
    return <ContextMenuButtonItem>[
      ContextMenuButtonItem(
        type: ContextMenuButtonType.paste,
        onPressed: () {
          ContextMenuController.removeAny();
          unawaited(handlePaste());
        },
      ),
      ...buttonItems,
    ];
  }

  Widget buildContextMenu(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    if (!_interceptKeyboardClipboard) {
      if (SystemContextMenu.isSupportedByField(editableTextState)) {
        return SystemContextMenu.editableText(
          editableTextState: editableTextState,
        );
      }
      return AdaptiveTextSelectionToolbar.editableText(
        editableTextState: editableTextState,
      );
    }
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: _composeContextMenuItems(editableTextState),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this, _effectiveFocusNode);
  }
}
