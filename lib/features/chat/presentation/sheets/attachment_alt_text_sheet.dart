import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Shows a bottom sheet for editing the alt text of [attachment]
Future<String?> showAttachmentAltTextSheet(
  BuildContext context, {
  required Attachment attachment,
}) {
  return FluxerBottomSheet.show<String?>(
    context,
    title: FluxerLocalizations.of(context).chatAttachmentEditTitle,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return _AttachmentAltTextSheetBody(
        attachment: attachment,
        onClose: close,
      );
    },
  );
}

class _AttachmentAltTextSheetBody extends ConsumerStatefulWidget {
  const _AttachmentAltTextSheetBody({
    required this.attachment,
    required this.onClose,
  });

  final Attachment attachment;
  final VoidCallback onClose;

  @override
  ConsumerState<_AttachmentAltTextSheetBody> createState() =>
      _AttachmentAltTextSheetBodyState();
}

class _AttachmentAltTextSheetBodyState
    extends ConsumerState<_AttachmentAltTextSheetBody> {
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(
      text: widget.attachment.description ?? '',
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _executeSaveAndClose() {
    final String description = _descriptionController.text.trim();
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop(description.isEmpty ? '' : description);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerInput.multiline(
              controller: _descriptionController,
              textCapitalization: TextCapitalization.sentences,
              label: l10n.chatAttachmentDescriptionLabel,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed: widget.onClose,
                    label: l10n.cancel,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: _executeSaveAndClose,
                    label: l10n.save,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
