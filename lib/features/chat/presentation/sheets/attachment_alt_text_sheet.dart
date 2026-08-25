import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

/// Shows a bottom sheet for editing the alt text of [attachment]
Future<String?> showAttachmentAltTextSheet(
  BuildContext context, {
  required Attachment attachment,
  bool useRootNavigator = true,
}) {
  return FluxerBottomSheet.show<String?>(
    context,
    useRootNavigator: useRootNavigator,
    title: FluxerLocalizations.of(context).chatAttachmentEditTitle,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return _AttachmentAltTextSheetBody(
        attachment: attachment,
        onClose: close,
        useRootNavigator: useRootNavigator,
      );
    },
  );
}

Future<void> editMessageAttachmentAltText(
  BuildContext context,
  WidgetRef ref, {
  required String messageId,
  required Attachment attachment,
  bool useRootNavigator = true,
}) async {
  final String? description = await showAttachmentAltTextSheet(
    context,
    attachment: attachment,
    useRootNavigator: useRootNavigator,
  );
  if (description == null || !context.mounted) {
    return;
  }
  await ref
      .read(chatViewModelProvider.notifier)
      .editAttachmentAltText(
        messageId: messageId,
        attachmentId: attachment.id,
        description: description.isEmpty ? null : description,
      );
}

class _AttachmentAltTextSheetBody extends ConsumerStatefulWidget {
  const _AttachmentAltTextSheetBody({
    required this.attachment,
    required this.onClose,
    required this.useRootNavigator,
  });

  final Attachment attachment;
  final VoidCallback onClose;
  final bool useRootNavigator;

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
    Navigator.of(
      context,
      rootNavigator: widget.useRootNavigator,
    ).pop(description.isEmpty ? '' : description);
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
