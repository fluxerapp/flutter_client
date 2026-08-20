import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/utils/composer_clipboard_paste.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:material_ui/material_ui.dart';

class ComposerClipboardScope extends ConsumerStatefulWidget {
  const ComposerClipboardScope({
    required this.channelId,
    required this.controller,
    required this.isAttachEnabled,
    required this.onValidationResult,
    required this.builder,
    this.focusNode,
    this.maxMessageLength,
    this.canAttachOnExceed,
    this.onPasteExceedsLimit,
    this.onPasteLostContent,
    super.key,
  });

  final String channelId;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool isAttachEnabled;
  final void Function(FileUploadValidationResult result) onValidationResult;
  final int? maxMessageLength;
  final bool Function()? canAttachOnExceed;
  final void Function(String pastedText)? onPasteExceedsLimit;
  final void Function()? onPasteLostContent;
  final Widget Function(
    BuildContext context,
    FluxerClipboardScopeState clipboardScope,
    FocusNode focusNode,
  )
  builder;

  @override
  ConsumerState<ComposerClipboardScope> createState() =>
      _ComposerClipboardScopeState();
}

class _ComposerClipboardScopeState
    extends ConsumerState<ComposerClipboardScope> {
  Future<void> _handlePaste() {
    return handleComposerPaste(
      ref: ref,
      channelId: widget.channelId,
      controller: widget.controller,
      isAttachEnabled: widget.isAttachEnabled,
      maxMessageLength: widget.maxMessageLength,
      canAttachOnExceed: widget.canAttachOnExceed,
      onPasteExceedsLimit: widget.onPasteExceedsLimit,
      onPasteLostContent: widget.onPasteLostContent,
      onValidationResult: widget.onValidationResult,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FluxerClipboardScope(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onPaste: _handlePaste,
      injectPasteWhenMissing: widget.isAttachEnabled,
      builder: widget.builder,
    );
  }
}
