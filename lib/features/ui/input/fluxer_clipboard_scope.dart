import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/text_editing_shortcuts.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

typedef FluxerPasteCallback = Future<void> Function();

typedef FluxerNativePasteCallback =
    Future<bool> Function({
      required String? text,
      required List<NativePasteFile> files,
    });

typedef NativePasteFile = ({Uint8List bytes, String? name, String? mimeType});

class FluxerClipboardScope extends StatefulWidget {
  const FluxerClipboardScope({
    required this.controller,
    required this.builder,
    this.focusNode,
    this.onPaste,
    this.onNativePaste,
    this.injectPasteWhenMissing = false,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FluxerPasteCallback? onPaste;
  final FluxerNativePasteCallback? onNativePaste;
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
  static final Set<FluxerClipboardScopeState> _mounted =
      <FluxerClipboardScopeState>{};

  static FluxerClipboardScopeState? get focused {
    for (final FluxerClipboardScopeState scope in _mounted) {
      if (scope._effectiveFocusNode.hasFocus) {
        return scope;
      }
    }
    return null;
  }

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
    _mounted.add(this);
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
    _mounted.remove(this);
    _unbindFocusNode(widget.focusNode);
    _ownedFocusNode?.dispose();
    super.dispose();
  }

  void _bindFocusNode(FocusNode? externalFocusNode) {
    if (externalFocusNode != null) {
      _effectiveFocusNode = externalFocusNode;
      _chainedKeyHandler = externalFocusNode.onKeyEvent;
      externalFocusNode.onKeyEvent = _handleKeyEvent;
      return;
    }
    _ownedFocusNode = FocusNode();
    _effectiveFocusNode = _ownedFocusNode!;
    _effectiveFocusNode.onKeyEvent = _handleKeyEvent;
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

  Future<bool> handleNativePaste({
    required String? text,
    required List<NativePasteFile> files,
  }) async {
    if (widget.onNativePaste != null) {
      return widget.onNativePaste!(text: text, files: files);
    }
    if (_isInlineTokenController && text != null && text.isNotEmpty) {
      await pasteWireTextIntoInlineTokenController(widget.controller, text);
      return true;
    }
    return false;
  }

  KeyEventResult handleKeyboardShortcut(KeyEvent event) {
    final TextEditingShortcutKind? shortcut = matchTextEditingShortcut(event);
    if (shortcut == null) {
      return KeyEventResult.ignored;
    }
    return handleTextEditingShortcut(shortcut);
  }

  KeyEventResult handleTextEditingShortcut(TextEditingShortcutKind shortcut) {
    switch (shortcut) {
      case TextEditingShortcutKind.selectAll:
        widget.controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: widget.controller.text.length,
        );
        return KeyEventResult.handled;
      case TextEditingShortcutKind.undo:
        return _invokeTextIntent(
          const UndoTextIntent(SelectionChangedCause.keyboard),
        );
      case TextEditingShortcutKind.redo:
        return _invokeTextIntent(
          const RedoTextIntent(SelectionChangedCause.keyboard),
        );
      case TextEditingShortcutKind.copy:
        if (!_isInlineTokenController) {
          return KeyEventResult.ignored;
        }
        unawaited(handleCopy());
        return KeyEventResult.handled;
      case TextEditingShortcutKind.cut:
        if (!_isInlineTokenController) {
          return KeyEventResult.ignored;
        }
        unawaited(handleCut());
        return KeyEventResult.handled;
      case TextEditingShortcutKind.paste:
        if (usesNativePaste) {
          return KeyEventResult.skipRemainingHandlers;
        }
        if (!_interceptKeyboardClipboard) {
          return KeyEventResult.ignored;
        }
        unawaited(handlePaste());
        return KeyEventResult.handled;
    }
  }

  KeyEventResult _invokeTextIntent(Intent intent) {
    final BuildContext? context = _effectiveFocusNode.context;
    if (context == null || Actions.maybeInvoke(context, intent) == null) {
      return KeyEventResult.ignored;
    }
    return KeyEventResult.handled;
  }

  Future<void> _pasteFromContextMenu(
    EditableTextState editableTextState,
  ) async {
    final String before = widget.controller.text;
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
    ContextMenuController.removeAny();
  }

  void _showPasteFailedFeedback() {
    final FluxerLocalizations? l10n = Localizations.of<FluxerLocalizations>(
      context,
      FluxerLocalizations,
    );
    if (l10n == null) {
      return;
    }
    ProviderScope.containerOf(context, listen: false)
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.clipboardPasteFailed,
            variant: FluxerToastVariant.danger,
          ),
        );
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
    if (usesNativePaste &&
        SystemContextMenu.isSupportedByField(editableTextState)) {
      return SystemContextMenu.editableText(
        editableTextState: editableTextState,
        items: _systemContextMenuItems(context, items),
      );
    }
    return AdaptiveTextSelectionToolbar(
      anchors: editableTextState.contextMenuAnchors,
      children: _toolbarButtons(context, editableTextState, items),
    );
  }

  List<IOSSystemContextMenuItem> _systemContextMenuItems(
    BuildContext context,
    List<ContextMenuButtonItem> items,
  ) {
    final WidgetsLocalizations localizations = WidgetsLocalizations.of(context);
    final List<IOSSystemContextMenuItem> systemItems =
        <IOSSystemContextMenuItem>[];
    for (final ContextMenuButtonItem item in items) {
      final IOSSystemContextMenuItem? systemItem = switch (item.type) {
        ContextMenuButtonType.copy when _isInlineTokenController =>
          IOSSystemContextMenuItemCustom(
            title: localizations.copyButtonLabel,
            onPressed: () => unawaited(handleCopy()),
          ),
        ContextMenuButtonType.cut when _isInlineTokenController =>
          IOSSystemContextMenuItemCustom(
            title: localizations.cutButtonLabel,
            onPressed: () => unawaited(handleCut()),
          ),
        ContextMenuButtonType.copy => const IOSSystemContextMenuItemCopy(),
        ContextMenuButtonType.cut => const IOSSystemContextMenuItemCut(),
        ContextMenuButtonType.paste => const IOSSystemContextMenuItemPaste(),
        ContextMenuButtonType.selectAll =>
          const IOSSystemContextMenuItemSelectAll(),
        ContextMenuButtonType.lookUp => const IOSSystemContextMenuItemLookUp(),
        ContextMenuButtonType.searchWeb =>
          const IOSSystemContextMenuItemSearchWeb(),
        ContextMenuButtonType.share => const IOSSystemContextMenuItemShare(),
        ContextMenuButtonType.liveTextInput =>
          const IOSSystemContextMenuItemLiveText(),
        ContextMenuButtonType.delete || ContextMenuButtonType.custom => null,
      };
      if (systemItem != null) {
        systemItems.add(systemItem);
      }
    }
    return systemItems;
  }

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

  void _performImeShortcut(TextEditingShortcutIntent intent) {
    if (handleTextEditingShortcut(intent.kind) == KeyEventResult.handled) {
      return;
    }
    _invokeTextIntent(textEditingIntentFor(intent.kind));
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        TextEditingShortcutIntent: CallbackAction<TextEditingShortcutIntent>(
          onInvoke: _performImeShortcut,
        ),
      },
      child: widget.builder(context, this, _effectiveFocusNode),
    );
  }
}

const MethodChannel _nativePasteChannel = MethodChannel(
  'fluxer_app/native_paste',
);

bool get usesNativePaste =>
    !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

void installNativePasteHandler() {
  _nativePasteChannel.setMethodCallHandler(handleNativePasteCall);
}

Future<bool> handleNativePasteCall(MethodCall call) async {
  if (call.method != 'paste') {
    return false;
  }
  final FluxerClipboardScopeState? scope = FluxerClipboardScopeState.focused;
  if (scope == null) {
    return false;
  }
  final Map<Object?, Object?> arguments =
      call.arguments as Map<Object?, Object?>? ?? const <Object?, Object?>{};
  final List<Object?> rawFiles =
      arguments['files'] as List<Object?>? ?? const <Object?>[];
  return scope.handleNativePaste(
    text: arguments['text'] as String?,
    files: <NativePasteFile>[
      for (final Map<Object?, Object?> file
          in rawFiles.whereType<Map<Object?, Object?>>())
        (
          bytes: file['data']! as Uint8List,
          name: file['name'] as String?,
          mimeType: file['mimeType'] as String?,
        ),
    ],
  );
}

class NativePasteShortcuts extends StatelessWidget {
  const NativePasteShortcuts({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!usesNativePaste) {
      return child;
    }
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyV, meta: true):
            DoNothingAndStopPropagationTextIntent(),
      },
      child: child,
    );
  }
}
