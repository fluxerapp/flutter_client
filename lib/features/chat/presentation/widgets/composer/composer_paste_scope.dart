import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/utils/composer_clipboard_paste.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';

class ComposerPasteScope extends ConsumerStatefulWidget {
  const ComposerPasteScope({
    required this.channelId,
    required this.controller,
    required this.isAttachEnabled,
    required this.onValidationResult,
    required this.builder,
    this.maxMessageLength,
    this.canAttachOnExceed,
    this.onPasteExceedsLimit,
    super.key,
  });

  final String channelId;
  final TextEditingController controller;
  final bool isAttachEnabled;
  final void Function(FileUploadValidationResult result) onValidationResult;
  final int? maxMessageLength;
  final bool Function()? canAttachOnExceed;
  final void Function(String pastedText)? onPasteExceedsLimit;
  final Widget Function(BuildContext context, ComposerPasteScopeState state)
  builder;

  @override
  ConsumerState<ComposerPasteScope> createState() => ComposerPasteScopeState();
}

class ComposerPasteScopeState extends ConsumerState<ComposerPasteScope> {
  Future<void> handleCopy() {
    return copyInlineTokenSelection(widget.controller);
  }

  Future<void> handleCut() {
    return cutInlineTokenSelection(widget.controller);
  }

  Future<void> handlePaste() {
    return handleComposerPaste(
      ref: ref,
      channelId: widget.channelId,
      controller: widget.controller,
      isAttachEnabled: widget.isAttachEnabled,
      maxMessageLength: widget.maxMessageLength,
      canAttachOnExceed: widget.canAttachOnExceed,
      onPasteExceedsLimit: widget.onPasteExceedsLimit,
      onValidationResult: widget.onValidationResult,
    );
  }

  List<ContextMenuButtonItem> _composeContextMenuItems(
    EditableTextState editableTextState,
  ) {
    final bool isInlineToken =
        widget.controller is InlineTokenTextEditingController;
    final List<ContextMenuButtonItem> buttonItems = editableTextState
        .contextMenuButtonItems
        .map((ContextMenuButtonItem item) {
          if (isInlineToken &&
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
    final bool hasPasteButton = buttonItems.any(
      (ContextMenuButtonItem item) => item.type == ContextMenuButtonType.paste,
    );
    final bool shouldInjectPaste = widget.isAttachEnabled && !hasPasteButton;
    if (!shouldInjectPaste) {
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
