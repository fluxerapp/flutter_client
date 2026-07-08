import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/utils/composer_clipboard_paste.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';

class ComposerPasteScope extends ConsumerStatefulWidget {
  const ComposerPasteScope({
    required this.channelId,
    required this.controller,
    required this.isAttachEnabled,
    required this.onValidationResult,
    required this.builder,
    super.key,
  });

  final String channelId;
  final TextEditingController controller;
  final bool isAttachEnabled;
  final void Function(FileUploadValidationResult result) onValidationResult;
  final Widget Function(BuildContext context, ComposerPasteScopeState state)
  builder;

  @override
  ConsumerState<ComposerPasteScope> createState() => ComposerPasteScopeState();
}

class ComposerPasteScopeState extends ConsumerState<ComposerPasteScope> {
  Future<void> handlePaste() {
    return handleComposerPaste(
      ref: ref,
      channelId: widget.channelId,
      controller: widget.controller,
      isAttachEnabled: widget.isAttachEnabled,
      onValidationResult: widget.onValidationResult,
    );
  }

  Widget buildContextMenu(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    final List<ContextMenuButtonItem> buttonItems = editableTextState
        .contextMenuButtonItems
        .map((ContextMenuButtonItem item) {
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
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: editableTextState.contextMenuAnchors,
      buttonItems: buttonItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this);
  }
}
