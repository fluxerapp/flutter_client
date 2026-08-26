import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

typedef FluxerPasteCallback = Future<void> Function({bool attachmentsOnly});

typedef FluxerNativeTextPasteCallback =
    Future<void> Function({
      required String textBefore,
      required TextSelection selectionBefore,
    });

class FluxerClipboardScope extends StatefulWidget {
  const FluxerClipboardScope({
    required this.controller,
    required this.builder,
    this.focusNode,
    this.onPaste,
    this.onNativeTextPaste,
    this.injectPasteWhenMissing = false,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FluxerPasteCallback? onPaste;
  final FluxerNativeTextPasteCallback? onNativeTextPaste;
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
  List<Widget>? _cachedToolbarButtons;
  String? _cachedToolbarSignature;

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

  Future<void> handlePaste({bool attachmentsOnly = false}) async {
    if (widget.onPaste != null) {
      await widget.onPaste!(attachmentsOnly: attachmentsOnly);
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

  Future<void> _pasteFromContextMenu(
    EditableTextState editableTextState,
  ) async {
    final String before = widget.controller.text;
    final TextSelection selectionBefore = widget.controller.selection;
    if (_shouldPreferNativeTextPaste) {
      await editableTextState.pasteText(SelectionChangedCause.toolbar);
      if (widget.controller.text != before) {
        await _finishNativeTextPaste(
          textBefore: before,
          selectionBefore: selectionBefore,
        );
      } else if (widget.onPaste != null) {
        await handlePaste(attachmentsOnly: true);
      }
      ContextMenuController.removeAny();
      return;
    }
    if (widget.onPaste != null || _isInlineTokenController) {
      await handlePaste();
    } else {
      await editableTextState.pasteText(SelectionChangedCause.toolbar);
      if (widget.controller.text == before) {
        await handlePaste();
      }
    }
    final bool inserted = widget.controller.text != before;
    if (!inserted && widget.onPaste == null && mounted) {
      _showPasteFailedFeedback();
    }
    // Dismissing the menu before the paste makes Clipboard.getData return
    // empty on Android, so remove it only once the text landed.
    ContextMenuController.removeAny();
  }

  Future<void> _finishNativeTextPaste({
    required String textBefore,
    required TextSelection selectionBefore,
  }) async {
    if (widget.onNativeTextPaste != null) {
      await widget.onNativeTextPaste!(
        textBefore: textBefore,
        selectionBefore: selectionBefore,
      );
      return;
    }
    if (_isInlineTokenController) {
      await reprocessNativeInlineTokenPaste(
        controller: widget.controller as InlineTokenTextEditingController,
        textBefore: textBefore,
        selectionBefore: selectionBefore,
      );
    }
  }

  bool get _shouldPreferNativeTextPaste =>
      defaultTargetPlatform == TargetPlatform.iOS &&
      (widget.onPaste != null || _isInlineTokenController);

  void _showPasteFailedFeedback() {
    final FluxerLocalizations? l10n = Localizations.of<FluxerLocalizations>(
      context,
      FluxerLocalizations,
    );
    if (l10n == null) {
      return;
    }
    ScaffoldMessenger.maybeOf(
      context,
    )?.showSnackBar(SnackBar(content: Text(l10n.clipboardPasteFailed)));
  }

  List<ContextMenuButtonItem> _composeContextMenuItems(
    EditableTextState editableTextState,
  ) {
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
            onPressed: () =>
                unawaited(_pasteFromContextMenu(editableTextState)),
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
        onPressed: () => unawaited(_pasteFromContextMenu(editableTextState)),
      ),
      ...buttonItems,
    ];
  }

  Widget buildContextMenu(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    final List<ContextMenuButtonItem> items = _composeContextMenuItems(
      editableTextState,
    );
    return AdaptiveTextSelectionToolbar(
      anchors: editableTextState.contextMenuAnchors,
      children: _toolbarButtons(context, editableTextState, items),
    );
  }

  /// Reuses button instances across rebuilds: the Material toolbar resets its
  /// subtree with a fresh [UniqueKey] when its children are not `listEquals`
  /// equal, disposing the recognizer that a press in flight is using.
  List<Widget> _toolbarButtons(
    BuildContext context,
    EditableTextState editableTextState,
    List<ContextMenuButtonItem> items,
  ) {
    final String signature = <String>[
      '${identityHashCode(editableTextState)}',
      Theme.of(context).platform.name,
      '${Localizations.maybeLocaleOf(context)}',
      for (final ContextMenuButtonItem item in items) item.type.name,
    ].join('|');
    final List<Widget>? cached = _cachedToolbarButtons;
    if (cached != null && _cachedToolbarSignature == signature) {
      return cached;
    }
    final List<Widget> buttons =
        AdaptiveTextSelectionToolbar.getAdaptiveButtons(
          context,
          items,
        ).toList();
    _cachedToolbarButtons = buttons;
    _cachedToolbarSignature = signature;
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this, _effectiveFocusNode);
  }
}
