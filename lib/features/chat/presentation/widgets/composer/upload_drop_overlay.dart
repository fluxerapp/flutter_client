import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_blocked_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

bool _isDesktopFileDropSupported() {
  if (kIsWeb) {
    return false;
  }
  return isFluxerDesktopOs;
}

class UploadDropOverlay extends ConsumerStatefulWidget {
  const UploadDropOverlay({
    required this.channelId,
    required this.child,
    super.key,
  });

  final String channelId;
  final Widget child;

  @override
  ConsumerState<UploadDropOverlay> createState() => _UploadDropOverlayState();
}

class _UploadDropOverlayState extends ConsumerState<UploadDropOverlay> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    if (!_isDesktopFileDropSupported()) {
      return widget.child;
    }
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool slowBlocked =
        ref.watch(isSlowmodeBlockedProvider(widget.channelId)).value ?? false;
    final bool shiftHeld = HardwareKeyboard.instance.isShiftPressed;
    return DropTarget(
      onDragEntered: (_) {
        setState(() => _isDragging = true);
      },
      onDragExited: (_) {
        setState(() => _isDragging = false);
      },
      onDragDone: (DropDoneDetails details) async {
        setState(() => _isDragging = false);
        if (details.files.isEmpty) {
          return;
        }
        final List<XFile> files = <XFile>[
          for (final DropItem d in details.files) d,
        ];
        final FileUploadValidationResult result = await ref
            .read(cloudUploadControllerProvider(widget.channelId).notifier)
            .addFiles(composerUploadFiles(files));
        if (context.mounted) {
          _maybeToastValidation(context, ref, result);
        }
        final bool slowBlocked =
            ref.read(isSlowmodeBlockedProvider(widget.channelId)).value ??
            false;
        final bool shiftHeld = HardwareKeyboard.instance.isShiftPressed;
        final bool directSend = shiftHeld && !slowBlocked;
        if (directSend &&
            result.isValid &&
            files.isNotEmpty &&
            context.mounted) {
          await ref.read(chatViewModelProvider.notifier).sendMessage();
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.child,
          if (_isDragging)
            Positioned.fill(
              child: Material(
                color: colors.backgroundPrimary.withValues(alpha: 0.72),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 56,
                        color: colors.interactiveNormal,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        slowBlocked && shiftHeld
                            ? l10n.chatAttachmentDropSlowmodeDisabled
                            : shiftHeld
                            ? l10n.chatAttachmentDropToSend
                            : l10n.chatAttachmentDropToUpload,
                        style: context.textStyles.channelName.copyWith(
                          color: colors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _maybeToastValidation(
    BuildContext context,
    WidgetRef ref,
    FileUploadValidationResult result,
  ) {
    if (result.isValid) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String msg = switch (result.error!) {
      FileUploadValidationError.tooManyAttachments =>
        l10n.chatAttachmentTooMany(kMaxAttachmentsPerMessage),
      FileUploadValidationError.fileTooLarge => l10n.chatAttachmentFileTooLarge,
      FileUploadValidationError.multipartRequestTooLarge =>
        l10n.chatAttachmentPayloadTooLarge,
      FileUploadValidationError.noFiles => '',
    };
    if (msg.isEmpty) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: msg, variant: FluxerToastVariant.warning));
  }
}
