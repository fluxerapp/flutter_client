import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  if (isMobileLayout(context)) {
    return _showBottomSheet(
      context,
      hasUnread: hasUnread,
      isMuted: isMuted,
      isPinned: isPinned,
      isCollapsed: isCollapsed,
      isAllowlisted: isAllowlisted,
      isGroupDm: isGroupDm,
    );
  }

  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
  if (overlay == null) {
    return null;
  }

  final local = overlay.globalToLocal(position);

  return Navigator.of(context).push<DmNavbarAction>(
    _DmNavbarContextMenuRoute(
      position: local,
      overlaySize: overlay.size,
      hasUnread: hasUnread,
      isMuted: isMuted,
      isPinned: isPinned,
      isCollapsed: isCollapsed,
      isAllowlisted: isAllowlisted,
      isGroupDm: isGroupDm,
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
      label: l10n.dmCloseDm,
      isDanger: true,
      onTap: () => pop(DmNavbarAction.closeDm),
    ),
  ];
}

class _DmNavbarContextMenuRoute extends PopupRoute<DmNavbarAction> {
  final Offset position;
  final Size overlaySize;
  final bool hasUnread;
  final bool isMuted;
  final bool isPinned;
  final bool isCollapsed;
  final bool isAllowlisted;
  final bool isGroupDm;

  _DmNavbarContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.hasUnread,
    required this.isMuted,
    required this.isPinned,
    required this.isCollapsed,
    required this.isAllowlisted,
    required this.isGroupDm,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 120);

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) => _ContextMenuPage(
    position: position,
    overlaySize: overlaySize,
    animation: animation,
    hasUnread: hasUnread,
    isMuted: isMuted,
    isPinned: isPinned,
    isCollapsed: isCollapsed,
    isAllowlisted: isAllowlisted,
    isGroupDm: isGroupDm,
  );
}

class _ContextMenuPage extends StatelessWidget {
  final Offset position;
  final Size overlaySize;
  final Animation<double> animation;
  final bool hasUnread;
  final bool isMuted;
  final bool isPinned;
  final bool isCollapsed;
  final bool isAllowlisted;
  final bool isGroupDm;

  const _ContextMenuPage({
    required this.position,
    required this.overlaySize,
    required this.animation,
    required this.hasUnread,
    required this.isMuted,
    required this.isPinned,
    required this.isCollapsed,
    required this.isAllowlisted,
    required this.isGroupDm,
  });

  @override
  Widget build(BuildContext context) {
    void pop(DmNavbarAction action) => Navigator.of(context).pop(action);

    final items = _buildMenuItems(
      context: context,
      pop: pop,
      hasUnread: hasUnread,
      isMuted: isMuted,
      isPinned: isPinned,
      isCollapsed: isCollapsed,
      isAllowlisted: isAllowlisted,
      isGroupDm: isGroupDm,
    );

    final menuHeight = estimateContextMenuHeight(items);
    final opensLeft = position.dx + kContextMenuWidth > overlaySize.width - 8;
    final opensUp = position.dy + menuHeight > overlaySize.height - 8;

    var left = opensLeft ? position.dx - kContextMenuWidth : position.dx;
    var top = opensUp ? position.dy - menuHeight : position.dy;
    left = left.clamp(8.0, overlaySize.width - kContextMenuWidth - 8);
    top = top.clamp(8.0, overlaySize.height - menuHeight - 8);

    final alignment = Alignment(opensLeft ? 1.0 : -1.0, opensUp ? 1.0 : -1.0);

    return Stack(
      children: [
        Positioned(
          left: left,
          top: top,
          child: FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              alignment: alignment,
              child: ContextMenuPanel(items: items),
            ),
          ),
        ),
      ],
    );
  }
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
      ContextMenuItem(
        icon: PhosphorIconsBold.checkCircle,
        label: l10n.dmMarkAsRead,
        onTap: () => pop(DmNavbarAction.markAsRead),
      ),
    ContextMenuItem(
      icon: isMuted ? PhosphorIconsBold.bell : PhosphorIconsBold.bellSlash,
      label: isMuted ? l10n.dmUnmuteConversation : l10n.dmMuteConversation,
      onTap: () => pop(isMuted ? DmNavbarAction.unmute : DmNavbarAction.mute),
    ),
    ContextMenuItem(
      icon: PhosphorIconsBold.pushPin,
      label: isPinned ? l10n.dmUnpinDm : l10n.dmPinDm,
      onTap: () =>
          pop(isPinned ? DmNavbarAction.unpinDm : DmNavbarAction.pinDm),
    ),
    if (isCollapsed)
      ContextMenuItem(
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
    const ContextMenuDivider(),
    if (!isGroupDm)
      ContextMenuItem(
        icon: PhosphorIconsBold.userCircle,
        label: l10n.dmCopyUserId,
        onTap: () => pop(DmNavbarAction.copyUserId),
      ),
    ContextMenuItem(
      icon: PhosphorIconsBold.hash,
      label: l10n.dmCopyChannelId,
      onTap: () => pop(DmNavbarAction.copyChannelId),
    ),
    const ContextMenuDivider(),
    ContextMenuItem(
      icon: PhosphorIconsBold.trash,
      label: l10n.channelMenuDeleteMyMessagesConfirm,
      isDanger: true,
      onTap: () => pop(DmNavbarAction.deleteMyMessages),
    ),
    ContextMenuItem(
      icon: PhosphorIconsBold.x,
      label: l10n.dmCloseDm,
      isDanger: true,
      onTap: () => pop(DmNavbarAction.closeDm),
    ),
  ];
}
