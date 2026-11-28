import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum DmNavbarAction {
  markAsRead,
  mute,
  unmute,
  pinDm,
  unpinDm,
  alwaysShow,
  removeAlwaysShow,
  deleteMyMessages,
  closeDm,
  copyChannelId,
  copyUserId,
}

Future<DmNavbarAction?> showDmNavbarContextMenu(
  BuildContext context, {
  required Offset position,
  required String channelId,
  required bool hasUnread,
  required bool isMuted,
  required bool isPinned,
  required bool isCollapsed,
  required bool isAllowlisted,
  required bool isGroupDm,
}) async {
  if (!usesDesktopPointerUi(context)) {
    return await _showBottomSheet(
      context,
      hasUnread: hasUnread,
      isMuted: isMuted,
      isPinned: isPinned,
      isCollapsed: isCollapsed,
      isAllowlisted: isAllowlisted,
      isGroupDm: isGroupDm,
    );
  }

  return await pushFluxerDesktopMenu<DmNavbarAction>(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback _) =>
        FluxerDesktopMenuPanel.fitContent(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildMenuItems(
                context: menuContext,
                pop: (DmNavbarAction action) =>
                    Navigator.of(menuContext).pop(action),
                hasUnread: hasUnread,
                isMuted: isMuted,
                isPinned: isPinned,
                isCollapsed: isCollapsed,
                isAllowlisted: isAllowlisted,
                isGroupDm: isGroupDm,
              ),
            ),
          ),
        ),
  );
}

Future<DmNavbarAction?> _showBottomSheet(
  BuildContext context, {
  required bool hasUnread,
  required bool isMuted,
  required bool isPinned,
  required bool isCollapsed,
  required bool isAllowlisted,
  required bool isGroupDm,
}) {
  return FluxerBottomSheet.show<DmNavbarAction>(
    context,
    builder: (context, close) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FluxerMenuGroup(
        children: _buildBottomSheetItems(
          context: context,
          hasUnread: hasUnread,
          isMuted: isMuted,
          isPinned: isPinned,
          isCollapsed: isCollapsed,
          isAllowlisted: isAllowlisted,
          isGroupDm: isGroupDm,
        ),
      ),
    ),
  );
}

List<FluxerBottomSheetMenuItem> _buildBottomSheetItems({
  required BuildContext context,
  required bool hasUnread,
  required bool isMuted,
  required bool isPinned,
  required bool isCollapsed,
  required bool isAllowlisted,
  required bool isGroupDm,
}) {
  void pop(DmNavbarAction action) => Navigator.of(context).pop(action);
  final l10n = FluxerLocalizations.of(context);

  return [
    if (hasUnread)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsBold.checkCircle,
        label: l10n.dmMarkAsRead,
        onTap: () => pop(DmNavbarAction.markAsRead),
      ),
    FluxerBottomSheetMenuItem(
      icon: isMuted ? PhosphorIconsBold.bell : PhosphorIconsBold.bellSlash,
      label: isMuted ? l10n.dmUnmuteConversation : l10n.dmMuteConversation,
      onTap: () => pop(isMuted ? DmNavbarAction.unmute : DmNavbarAction.mute),
    ),
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsBold.pushPin,
      label: isPinned ? l10n.dmUnpinDm : l10n.dmPinDm,
      onTap: () =>
          pop(isPinned ? DmNavbarAction.unpinDm : DmNavbarAction.pinDm),
    ),
    if (isCollapsed)
      FluxerBottomSheetMenuItem(
        icon: isAllowlisted
            ? PhosphorIconsBold.eyeSlash
            : PhosphorIconsBold.eye,
        label: isAllowlisted
            ? l10n.dmRemoveFromAlwaysShown
            : l10n.dmAlwaysShowInSidebar,
        onTap: () => pop(
          isAllowlisted
              ? DmNavbarAction.removeAlwaysShow
              : DmNavbarAction.alwaysShow,
        ),
      ),
    if (!isGroupDm)
      FluxerBottomSheetMenuItem(
        icon: PhosphorIconsBold.userCircle,
        label: l10n.dmCopyUserId,
        onTap: () => pop(DmNavbarAction.copyUserId),
      ),
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsBold.hash,
      label: l10n.dmCopyChannelId,
      onTap: () => pop(DmNavbarAction.copyChannelId),
    ),
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsBold.trash,
      label: l10n.channelMenuDeleteMyMessagesConfirm,
      isDanger: true,
      onTap: () => pop(DmNavbarAction.deleteMyMessages),
    ),
    FluxerBottomSheetMenuItem(
      icon: PhosphorIconsBold.x,
      label: isGroupDm ? l10n.dmLeaveGroup : l10n.dmCloseDm,
      isDanger: true,
      onTap: () => pop(DmNavbarAction.closeDm),
    ),
  ];
}

List<Widget> _buildMenuItems({
  required BuildContext context,
  required void Function(DmNavbarAction) pop,
  required bool hasUnread,
  required bool isMuted,
  required bool isPinned,
  required bool isCollapsed,
  required bool isAllowlisted,
  required bool isGroupDm,
}) {
  final l10n = FluxerLocalizations.of(context);

  return [
    if (hasUnread)
      FluxerMenuItem(
        icon: PhosphorIconsBold.checkCircle,
        label: l10n.dmMarkAsRead,
        onPressed: () => pop(DmNavbarAction.markAsRead),
      ),
    FluxerMenuItem(
      icon: isMuted ? PhosphorIconsBold.bell : PhosphorIconsBold.bellSlash,
      label: isMuted ? l10n.dmUnmuteConversation : l10n.dmMuteConversation,
      onPressed: () =>
          pop(isMuted ? DmNavbarAction.unmute : DmNavbarAction.mute),
    ),
    FluxerMenuItem(
      icon: PhosphorIconsBold.pushPin,
      label: isPinned ? l10n.dmUnpinDm : l10n.dmPinDm,
      onPressed: () =>
          pop(isPinned ? DmNavbarAction.unpinDm : DmNavbarAction.pinDm),
    ),
    if (isCollapsed)
      FluxerMenuItem(
        icon: isAllowlisted
            ? PhosphorIconsBold.eyeSlash
            : PhosphorIconsBold.eye,
        label: isAllowlisted
            ? l10n.dmRemoveFromAlwaysShown
            : l10n.dmAlwaysShowInSidebar,
        onPressed: () => pop(
          isAllowlisted
              ? DmNavbarAction.removeAlwaysShow
              : DmNavbarAction.alwaysShow,
        ),
      ),
    const FluxerMenuDivider(),
    if (!isGroupDm)
      FluxerMenuItem(
        icon: PhosphorIconsBold.userCircle,
        label: l10n.dmCopyUserId,
        onPressed: () => pop(DmNavbarAction.copyUserId),
      ),
    FluxerMenuItem(
      icon: PhosphorIconsBold.hash,
      label: l10n.dmCopyChannelId,
      onPressed: () => pop(DmNavbarAction.copyChannelId),
    ),
    const FluxerMenuDivider(),
    FluxerMenuItem(
      icon: PhosphorIconsBold.trash,
      label: l10n.channelMenuDeleteMyMessagesConfirm,
      isDanger: true,
      onPressed: () => pop(DmNavbarAction.deleteMyMessages),
    ),
    FluxerMenuItem(
      icon: PhosphorIconsBold.x,
      label: isGroupDm ? l10n.dmLeaveGroup : l10n.dmCloseDm,
      isDanger: true,
      onPressed: () => pop(DmNavbarAction.closeDm),
    ),
  ];
}
