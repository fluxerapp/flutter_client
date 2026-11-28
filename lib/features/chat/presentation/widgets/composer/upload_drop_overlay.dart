import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/upload_drop/drop_card.dart';
import 'package:fluxer_app/features/chat/providers/composer/composer_watch_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_blocked_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

bool _isDesktopFileDropSupported() {
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
  final OverlayPortalController _portal = OverlayPortalController();
  bool _isDragging = false;
  bool _shiftHeld = false;

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKey);
    super.dispose();
  }

  bool _handleKey(KeyEvent event) {
    _syncShift();
    return false;
  }

  void _syncShift() {
    final bool held = HardwareKeyboard.instance.isShiftPressed;
    if (held != _shiftHeld && mounted) {
      setState(() => _shiftHeld = held);
    }
  }

  void _setDragging(bool dragging) {
    if (dragging == _isDragging) {
      return;
    }
    if (dragging) {
      HardwareKeyboard.instance.addHandler(_handleKey);
      _portal.show();
    } else {
      HardwareKeyboard.instance.removeHandler(_handleKey);
      _portal.hide();
    }
    setState(() {
      _isDragging = dragging;
      _shiftHeld = HardwareKeyboard.instance.isShiftPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDesktopFileDropSupported()) {
      return widget.child;
    }
    return DropTarget(
      onDragEntered: (_) => _setDragging(true),
      onDragUpdated: (_) => _syncShift(),
      onDragExited: (_) => _setDragging(false),
      onDragDone: (DropDoneDetails details) async {
        _setDragging(false);
        if (details.files.isEmpty) {
          return;
        }
        final List<XFile> files = <XFile>[
          for (final DropItem d in details.files) d,
        ];
        final FileUploadValidationResult result = await ref
            .read(
              cloudUploadControllerProvider(
                readAccountUserId(ref),
                widget.channelId,
              ).notifier,
            )
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
      child: OverlayPortal(
        controller: _portal,
        overlayLocation: OverlayChildLocation.rootOverlay,
        overlayChildBuilder: (BuildContext overlayContext) => Positioned.fill(
          child: _UploadDropScrim(
            channelId: widget.channelId,
            shiftHeld: _shiftHeld,
          ),
        ),
        child: widget.child,
      ),
    );
  }

  void _maybeToastValidation(
    BuildContext context,
    WidgetRef ref,
    FileUploadValidationResult result,
  ) {
    final FileUploadValidationCopy? copy = fileUploadValidationCopy(
      FluxerLocalizations.of(context),
      result,
      maxAttachments: kMaxAttachmentsPerMessage,
      maxFileBytes: ref.read(maxAttachmentFileBytesProvider),
    );
    if (copy == null) {
      return;
    }
    unawaited(showErrorDialog(context, title: copy.title, body: copy.body));
  }
}

class _UploadDropScrim extends ConsumerWidget {
  const _UploadDropScrim({required this.channelId, required this.shiftHeld});

  static const double _kScrimOpacity = 0.7;

  final String channelId;
  final bool shiftHeld;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool slowBlocked =
        ref.watch(isSlowmodeBlockedProvider(channelId)).value ?? false;
    return IgnorePointer(
      child: ColoredBox(
        color: Colors.black.withValues(alpha: _kScrimOpacity),
        child: Center(
          child: UploadDropCard(
            destination: _destination(context, ref),
            shiftHeld: shiftHeld && !slowBlocked,
            slowmodeBlocked: slowBlocked,
          ),
        ),
      ),
    );
  }

  String _destination(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ComposerWatch? dm = ref.watch(composerWatchProvider(channelId));
    if (dm != null) {
      final String? groupName = dm.name?.trim();
      if (dm.isGroup && groupName != null && groupName.isNotEmpty) {
        return groupName;
      }
      return dm.recipientDisplayName;
    }
    final String? name = ref.watch(channelByIdProvider(channelId)).value?.name;
    if (name == null || name.isEmpty) {
      return l10n.guildSettingsUnknownChannel;
    }
    return '#$name';
  }
}
