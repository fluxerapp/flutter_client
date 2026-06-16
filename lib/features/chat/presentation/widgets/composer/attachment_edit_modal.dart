import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class AttachmentEditModal {
  AttachmentEditModal._();

  static Future<void> show(
    BuildContext context, {
    required String channelId,
    required PendingAttachment attachment,
  }) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).chatAttachmentEditTitle,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return _AttachmentEditSheetBody(
          channelId: channelId,
          attachment: attachment,
          onClose: close,
        );
      },
    );
  }
}

class _AttachmentEditSheetBody extends ConsumerStatefulWidget {
  const _AttachmentEditSheetBody({
    required this.channelId,
    required this.attachment,
    required this.onClose,
  });

  final String channelId;
  final PendingAttachment attachment;
  final VoidCallback onClose;

  @override
  ConsumerState<_AttachmentEditSheetBody> createState() =>
      _AttachmentEditSheetBodyState();
}

class _AttachmentEditSheetBodyState
    extends ConsumerState<_AttachmentEditSheetBody> {
  late final TextEditingController _filenameController;
  late final TextEditingController _descriptionController;
  late final ValueNotifier<bool> _spoilerNotifier;

  @override
  void initState() {
    super.initState();
    _filenameController = TextEditingController(
      text: widget.attachment.filename,
    );
    _descriptionController = TextEditingController(
      text: widget.attachment.description ?? '',
    );
    _spoilerNotifier = ValueNotifier<bool>(
      (widget.attachment.flags & attachmentFlagIsSpoiler) != 0,
    );
  }

  @override
  void dispose() {
    _filenameController.dispose();
    _descriptionController.dispose();
    _spoilerNotifier.dispose();
    super.dispose();
  }

  void _executeSaveAndClose() {
    final String name = _filenameController.text.trim();
    final String desc = _descriptionController.text.trim();
    int flags = widget.attachment.flags & ~attachmentFlagIsSpoiler;
    if (_spoilerNotifier.value) {
      flags |= attachmentFlagIsSpoiler;
    }
    ref
        .read(cloudUploadControllerProvider(widget.channelId).notifier)
        .updateAttachment(
          widget.attachment.id,
          filename: name.isNotEmpty ? name : widget.attachment.filename,
          description: desc.isEmpty ? null : desc,
          flags: flags,
        );
    FocusManager.instance.primaryFocus?.unfocus();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerInput(
              controller: _filenameController,
              label: FluxerLocalizations.of(
                context,
              ).chatAttachmentFilenameLabel,
            ),
            const SizedBox(height: 12),
            FluxerInput.multiline(
              controller: _descriptionController,
              textCapitalization: TextCapitalization.sentences,
              label: FluxerLocalizations.of(
                context,
              ).chatAttachmentDescriptionLabel,
              hint: FluxerLocalizations.of(
                context,
              ).chatAttachmentDescriptionHint,
              maxLines: 4,
              minLines: 2,
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder<bool>(
              valueListenable: _spoilerNotifier,
              builder: (BuildContext ctx, bool isSpoiler, _) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        FluxerLocalizations.of(
                          context,
                        ).chatAttachmentSpoilerLabel,
                        style: context.textStyles.bodyMedium.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    Switch(
                      value: isSpoiler,
                      onChanged: (bool v) => _spoilerNotifier.value = v,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            FluxerButton.primary(
              label: FluxerLocalizations.of(context).save,
              onPressed: _executeSaveAndClose,
            ),
          ],
        ),
      ),
    );
  }
}
