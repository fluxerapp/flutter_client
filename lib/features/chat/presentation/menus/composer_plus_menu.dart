import 'package:fluxer_app/features/chat/domain/composer_button_toggle.dart';
import 'package:fluxer_app/features/chat/presentation/menus/composer_button_toggle_item.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class ComposerPlusMenuActions {
  const ComposerPlusMenuActions({
    required this.canSendMessages,
    required this.canAttachFiles,
    required this.onUploadFile,
    this.onUploadAsFile,
    this.onCreateThread,
    this.onSendGift,
    this.onSendVoiceMessage,
    this.voiceMessageShortcut,
  });

  final bool canSendMessages;
  final bool canAttachFiles;
  final VoidCallback onUploadFile;
  final VoidCallback? onUploadAsFile;
  final VoidCallback? onCreateThread;
  final VoidCallback? onSendGift;
  final VoidCallback? onSendVoiceMessage;
  final String? voiceMessageShortcut;
}

Future<void> showComposerPlusMenu(
  BuildContext context, {
  required ComposerPlusMenuActions actions,
}) {
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  final Rect? anchor = box != null && box.hasSize
      ? box.localToGlobal(Offset.zero) & box.size
      : null;
  return FluxerActionMenu.show(
    context,
    position: anchor?.topLeft ?? Offset.zero,
    anchorRect: anchor,
    placement: FluxerDesktopPlacement.aboveStart,
    builder: (BuildContext menuContext, VoidCallback close) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(menuContext);
      final String? uploadHint = !actions.canSendMessages
          ? l10n.channelNoSendPermissionHint
          : !actions.canAttachFiles
          ? l10n.composerPlusCannotUploadFiles
          : null;
      final String? sendHint = actions.canSendMessages
          ? null
          : l10n.channelNoSendPermissionHint;
      VoidCallback run(VoidCallback action) => () {
        close();
        action();
      };
      final VoidCallback? onUploadAsFile = actions.onUploadAsFile;
      final VoidCallback? onCreateThread = actions.onCreateThread;
      final VoidCallback? onSendGift = actions.onSendGift;
      final VoidCallback? onSendVoiceMessage = actions.onSendVoiceMessage;
      return <Widget>[
        FluxerMenuItem(
          label: l10n.composerPlusUploadFile,
          icon: PhosphorIconsBold.paperclip,
          hint: uploadHint,
          enabled: uploadHint == null,
          onPressed: run(actions.onUploadFile),
        ),
        if (onUploadAsFile != null)
          FluxerMenuItem(
            label: l10n.composerPlusUploadAsFile,
            icon: PhosphorIconsRegular.uploadSimple,
            hint: uploadHint,
            enabled: uploadHint == null,
            onPressed: run(onUploadAsFile),
          ),
        if (onCreateThread != null)
          FluxerMenuItem(
            label: l10n.threadCreate,
            icon: PhosphorIconsRegular.chats,
            onPressed: run(onCreateThread),
          ),
        if (onSendGift != null)
          FluxerMenuItem(
            label: l10n.composerPlusSendGift,
            icon: PhosphorIconsRegular.gift,
            hint: sendHint,
            enabled: sendHint == null,
            onPressed: run(onSendGift),
          ),
        if (onSendVoiceMessage != null)
          FluxerMenuItem(
            label: l10n.composerPlusSendVoiceMessage,
            icon: PhosphorIconsBold.microphone,
            hint: uploadHint ?? actions.voiceMessageShortcut,
            enabled: uploadHint == null,
            onPressed: run(onSendVoiceMessage),
          ),
        FluxerMenuSubmenuItem(
          label: l10n.composerPlusCustomize,
          submenuBuilder: (BuildContext submenuContext) => <Widget>[
            for (final ComposerButtonToggle toggle
                in ComposerButtonToggle.values)
              ComposerButtonToggleItem(toggle: toggle),
          ],
        ),
      ];
    },
  );
}
