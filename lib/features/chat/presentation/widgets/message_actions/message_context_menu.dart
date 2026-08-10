import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/utils/message_action_permissions.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kMenuWidth = 220.0;

Future<MessageAction?> showMessageContextMenu(
  BuildContext context, {
  required Offset position,
  required Message message,
  required MessageActionPermissions permissions,
  required MessageActionCallbacks callbacks,
  ValueChanged<QuickReactionItem>? onQuickReaction,
  List<QuickReactionItem>? quickItems,
}) async {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
  if (overlay == null) {
    return null;
  }

  final local = overlay.globalToLocal(position);

  return Navigator.of(context).push<MessageAction>(
    _ContextMenuRoute(
      position: local,
      overlaySize: overlay.size,
      message: message,
      permissions: permissions,
      callbacks: callbacks,
      onQuickReaction: onQuickReaction,
      quickItems: quickItems,
    ),
  );
}

class _ContextMenuRoute extends PopupRoute<MessageAction> {
  final Offset position;
  final Size overlaySize;
  final Message message;
  final MessageActionPermissions permissions;
  final MessageActionCallbacks callbacks;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final List<QuickReactionItem>? quickItems;

  _ContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.message,
    required this.permissions,
    required this.callbacks,
    this.onQuickReaction,
    this.quickItems,
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
    message: message,
    permissions: permissions,
    callbacks: callbacks,
    onQuickReaction: onQuickReaction,
    quickItems: quickItems,
  );
}

class _ContextMenuPage extends ConsumerWidget {
  final Offset position;
  final Size overlaySize;
  final Animation<double> animation;
  final Message message;
  final MessageActionPermissions permissions;
  final MessageActionCallbacks callbacks;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final List<QuickReactionItem>? quickItems;

  const _ContextMenuPage({
    required this.position,
    required this.overlaySize,
    required this.animation,
    required this.message,
    required this.permissions,
    required this.callbacks,
    this.onQuickReaction,
    this.quickItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = _buildItems(context, ref);
    final estimatedHeight = _estimateHeight(items);

    final opensLeft = position.dx + _kMenuWidth > overlaySize.width - 8;
    final opensUp = position.dy + estimatedHeight > overlaySize.height - 8;

    var left = opensLeft ? position.dx - _kMenuWidth : position.dx;
    var top = opensUp ? position.dy - estimatedHeight : position.dy;
    if (left < 8) {
      left = 8;
    }
    if (top < 8) {
      top = 8;
    }

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
              child: _MenuPanel(items: items),
            ),
          ),
        ),
      ],
    );
  }

  double _estimateHeight(List<Widget> items) {
    var height = 16.0; // 8px vertical padding * 2
    for (final item in items) {
      if (item is _MenuDivider) {
        height += 13; // 1px + 6px * 2
      } else if (item is QuickReactionRow) {
        height += 40; // emoji row
      } else {
        height += 38; // 36px + 1px * 2 margin
      }
    }
    return height;
  }

  List<Widget> _buildItems(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    void pop(MessageAction action) => Navigator.of(context).pop(action);
    final bool showShortcuts =
        !isTouchPrimaryInput(ref) &&
        ref.watch(
          appearancePreferencesProvider.select(
            (s) => s.showContextMenuShortcuts,
          ),
        );
    String? shortcut(String key) => showShortcuts ? key : null;
    final bool isEmbedsSuppressed = message.suppressEmbeds;
    final bool canShowSuppressEmbeds = canSuppressEmbedsOnMessage(
      message: message,
      isOwnMessage: permissions.isOwnMessage,
      isDmChannel: permissions.isDmChannel,
      canDelete: permissions.canDelete,
    );
    final bool showMediaDeleteButton = ref.watch(
      appearancePreferencesProvider.select((s) => s.showMediaDeleteButton),
    );
    final bool showSuppressEmbedsButton = ref.watch(
      appearancePreferencesProvider.select((s) => s.showSuppressEmbedsButton),
    );

    return [
      if (ref.watch(
        advancedPreferencesProvider.select(
          (state) => state.showMessageActionBarQuickReactions,
        ),
      ))
        QuickReactionRow(
          items: quickItems ?? kQuickReactionDefaults,
          onReaction: (item) {
            onQuickReaction?.call(item);
            Navigator.of(context).pop();
          },
        ),
      _MenuItem(
        label: l10n.chatMessageAddReaction,
        icon: PhosphorIconsBold.smiley,
        trailing: PhosphorIconsBold.caretRight,
        shortcut: shortcut('+'),
        onTap: () => pop(MessageAction.addReaction),
      ),
      if (message.hasFailed)
        _MenuItem(
          label: l10n.retry,
          icon: PhosphorIconsBold.arrowClockwise,
          onTap: () => pop(MessageAction.retry),
        ),
      const _MenuDivider(),
      if (permissions.isOwnMessage)
        _MenuItem(
          label: l10n.chatMessageEdit,
          icon: PhosphorIconsBold.pencilSimple,
          shortcut: shortcut('E'),
          onTap: () => pop(MessageAction.edit),
        ),
      _MenuItem(
        label: l10n.chatMessageReply,
        icon: PhosphorIconsBold.arrowBendUpLeft,
        shortcut: shortcut('R'),
        onTap: () => pop(MessageAction.reply),
      ),
      _MenuItem(
        label: l10n.chatMessageForward,
        icon: PhosphorIconsBold.shareFat,
        onTap: () => pop(MessageAction.forward),
      ),
      const _MenuDivider(),
      if (message.content.isNotEmpty)
        _MenuItem(
          label: l10n.chatMessageCopyText,
          icon: PhosphorIconsBold.copy,
          onTap: () => pop(MessageAction.copyText),
        ),
      _MenuItem(
        label: message.isPinned ? l10n.chatMessageUnpin : l10n.chatMessagePin,
        icon: PhosphorIconsBold.pushPin,
        shortcut: shortcut('P'),
        onTap: () => pop(MessageAction.pin),
      ),
      _MenuItem(
        label: 'Bookmark Message',
        icon: PhosphorIconsBold.bookmarkSimple,
        onTap: () => pop(MessageAction.bookmark),
      ),
      _MenuItem(
        label: 'Mark as Unread',
        icon: PhosphorIconsBold.envelopeSimple,
        onTap: () => pop(MessageAction.markAsUnread),
      ),
      _MenuItem(
        label: 'Copy Message Link',
        icon: PhosphorIconsBold.link,
        onTap: () => pop(MessageAction.copyMessageLink),
      ),
      if (canShowSuppressEmbeds && showSuppressEmbedsButton)
        _MenuItem(
          label: isEmbedsSuppressed
              ? l10n.chatMessageUnsuppressEmbeds
              : l10n.chatMessageSuppressEmbeds,
          icon: PhosphorIconsBold.eyeSlash,
          onTap: () => pop(MessageAction.suppressEmbeds),
        ),
      ..._buildAttachmentItems(context, showMediaDeleteButton),
      if (permissions.canDelete) ...[
        const _MenuDivider(),
        _MenuItem(
          label: l10n.chatMessageDelete,
          icon: PhosphorIconsBold.trash,
          isDanger: true,
          onTap: () => pop(MessageAction.delete),
        ),
      ],
      if (message.hasFailed) ...[
        const _MenuDivider(),
        _MenuItem(
          label: l10n.chatMessageDeleteFailed,
          icon: PhosphorIconsBold.trash,
          isDanger: true,
          onTap: () => pop(MessageAction.deleteFailed),
        ),
      ],
      const _MenuDivider(),
      _MenuItem(
        label: 'Debug Message',
        icon: PhosphorIconsFill.bug,
        onTap: () {},
      ),
      _MenuItem(
        label: 'Copy Message ID',
        icon: PhosphorIconsBold.hash,
        onTap: () => pop(MessageAction.copyMessageId),
      ),
    ];
  }

  List<Widget> _buildAttachmentItems(
    BuildContext context,
    bool showMediaDeleteButton,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<Widget> items = <Widget>[];
    for (final Attachment attachment in message.attachments) {
      if (showMediaDeleteButton &&
          canDeleteAttachmentOnMessage(
            message: message,
            isOwnMessage: permissions.isOwnMessage,
            isSendDisabled: permissions.isSendDisabled,
          )) {
        items.add(
          _MenuItem(
            label: l10n.chatMessageDeleteAttachment,
            icon: PhosphorIconsBold.trash,
            isDanger: true,
            onTap: () {
              callbacks.onDeleteAttachment?.call(attachment);
              Navigator.of(context).pop();
            },
          ),
        );
      }
      if (canEditAttachmentAltText(
        message: message,
        isOwnMessage: permissions.isOwnMessage,
        attachment: attachment,
        canManageMessages: permissions.canManageMessages,
        isDmChannel: permissions.isDmChannel,
      )) {
        items.add(
          _MenuItem(
            label: l10n.chatMessageEditAttachmentAltText,
            icon: PhosphorIconsBold.pencilSimple,
            onTap: () {
              Navigator.of(context).pop();
              callbacks.onEditAttachmentAltText?.call(attachment);
            },
          ),
        );
      }
    }
    return items;
  }
}

class _MenuPanel extends StatelessWidget {
  final List<Widget> items;

  const _MenuPanel({required this.items});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Material(
      color: context.colors.backgroundPrimary,
      borderRadius: layout.radiusSm,
      elevation: 8,
      shadowColor: Colors.black45,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: layout.radiusSm,
          border: Border.all(color: context.colors.backgroundModifierAccent),
        ),
        child: SizedBox(
          width: _kMenuWidth,
          child: Padding(
            padding: EdgeInsets.all(layout.s2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items,
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final IconData? trailing;
  final String? shortcut;
  final VoidCallback onTap;
  final bool isDanger;

  const _MenuItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.trailing,
    this.shortcut,
    this.isDanger = false,
  });

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;
  bool _isPressed = false;

  Color _iconColor(FluxerColorTheme colors) {
    if (widget.isDanger) {
      return colors.menuDangerText;
    }
    if (_isHovered || _isPressed) {
      return colors.textPrimary;
    }
    return colors.textSecondary;
  }

  Color _textColor(FluxerColorTheme colors) {
    if (widget.isDanger) {
      return colors.menuDangerText;
    }
    return colors.textPrimary;
  }

  Color _backgroundColor(FluxerColorTheme colors) {
    if (_isPressed) {
      return colors.backgroundModifierHover;
    }
    if (_isHovered) {
      return colors.backgroundModifierAccent;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 80),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: _backgroundColor(colors),
            borderRadius: layout.radiusSm,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: layout.s2,
              vertical: layout.s2 - 1,
            ),
            child: Row(
              children: [
                PhosphorIcon(widget.icon, size: 20, color: _iconColor(colors)),
                SizedBox(width: layout.s2),
                Expanded(
                  child: Text(
                    widget.label,
                    style: context.textStyles.bodySmall.copyWith(
                      color: _textColor(colors),
                    ),
                  ),
                ),
                if (widget.shortcut != null) ...[
                  SizedBox(width: layout.s2),
                  Text(
                    widget.shortcut!,
                    style: context.textStyles.timestamp.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ],
                if (widget.trailing != null)
                  PhosphorIcon(
                    widget.trailing!,
                    size: 16,
                    color: colors.textPrimaryMuted,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuDivider extends StatelessWidget {
  const _MenuDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.layout.s2 - 1),
      child: Divider(height: 1, color: context.colors.backgroundModifierAccent),
    );
  }
}
