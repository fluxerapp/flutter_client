import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/'
    'widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kMenuWidth = 220.0;

Future<MessageAction?> showMessageContextMenu(
  BuildContext context, {
  required Offset position,
  required Message message,
  required bool isOwnMessage,
  required bool canDelete,
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
      isOwnMessage: isOwnMessage,
      canDelete: canDelete,
      onQuickReaction: onQuickReaction,
      quickItems: quickItems,
    ),
  );
}

class _ContextMenuRoute extends PopupRoute<MessageAction> {
  final Offset position;
  final Size overlaySize;
  final Message message;
  final bool isOwnMessage;
  final bool canDelete;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final List<QuickReactionItem>? quickItems;

  _ContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.message,
    required this.isOwnMessage,
    required this.canDelete,
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
    isOwnMessage: isOwnMessage,
    canDelete: canDelete,
    onQuickReaction: onQuickReaction,
    quickItems: quickItems,
  );
}

class _ContextMenuPage extends StatelessWidget {
  final Offset position;
  final Size overlaySize;
  final Animation<double> animation;
  final Message message;
  final bool isOwnMessage;
  final bool canDelete;
  final ValueChanged<QuickReactionItem>? onQuickReaction;
  final List<QuickReactionItem>? quickItems;

  const _ContextMenuPage({
    required this.position,
    required this.overlaySize,
    required this.animation,
    required this.message,
    required this.isOwnMessage,
    required this.canDelete,
    this.onQuickReaction,
    this.quickItems,
  });

  @override
  Widget build(BuildContext context) {
    final items = _buildItems(context);
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

  List<Widget> _buildItems(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    void pop(MessageAction action) => Navigator.of(context).pop(action);

    return [
      QuickReactionRow(
        items: quickItems ?? kQuickReactionDefaults,
        onReaction: (item) {
          onQuickReaction?.call(item);
          Navigator.of(context).pop();
        },
      ),
      _MenuItem(
        label: l10n.chatMessageAddReaction,
        icon: PhosphorIconsRegular.smiley,
        trailing: PhosphorIconsRegular.caretRight,
        onTap: () => pop(MessageAction.addReaction),
      ),
      if (message.hasFailed)
        _MenuItem(
          label: l10n.retry,
          icon: PhosphorIconsRegular.arrowClockwise,
          onTap: () => pop(MessageAction.retry),
        ),
      const _MenuDivider(),
      if (isOwnMessage)
        _MenuItem(
          label: l10n.chatMessageEdit,
          icon: PhosphorIconsRegular.pencilSimple,
          onTap: () => pop(MessageAction.edit),
        ),
      _MenuItem(
        label: l10n.chatMessageReply,
        icon: PhosphorIconsRegular.arrowBendUpLeft,
        onTap: () => pop(MessageAction.reply),
      ),
      _MenuItem(
        label: l10n.chatMessageForward,
        icon: PhosphorIconsRegular.shareFat,
        onTap: () => pop(MessageAction.forward),
      ),
      const _MenuDivider(),
      if (message.content.isNotEmpty)
        _MenuItem(
          label: l10n.chatMessageCopyText,
          icon: PhosphorIconsRegular.copy,
          onTap: () => pop(MessageAction.copyText),
        ),
      _MenuItem(
        label: message.isPinned ? l10n.chatMessageUnpin : l10n.chatMessagePin,
        icon: PhosphorIconsRegular.pushPin,
        onTap: () => pop(MessageAction.pin),
      ),
      _MenuItem(
        label: 'Bookmark Message',
        icon: PhosphorIconsRegular.bookmarkSimple,
        onTap: () => pop(MessageAction.bookmark),
      ),
      _MenuItem(
        label: 'Mark as Unread',
        icon: PhosphorIconsRegular.envelopeSimple,
        onTap: () => pop(MessageAction.markAsUnread),
      ),
      _MenuItem(
        label: 'Copy Message Link',
        icon: PhosphorIconsRegular.link,
        onTap: () => pop(MessageAction.copyMessageLink),
      ),
      if (canDelete) ...[
        const _MenuDivider(),
        _MenuItem(
          label: l10n.chatMessageDelete,
          icon: PhosphorIconsRegular.trash,
          isDanger: true,
          onTap: () => pop(MessageAction.delete),
        ),
      ],
      if (message.hasFailed) ...[
        const _MenuDivider(),
        _MenuItem(
          label: l10n.chatMessageDeleteFailed,
          icon: PhosphorIconsRegular.trash,
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
        icon: PhosphorIconsRegular.hash,
        onTap: () => pop(MessageAction.copyMessageId),
      ),
    ];
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
  final bool isDanger;
  final VoidCallback onTap;

  const _MenuItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.trailing,
    this.isDanger = false,
  });

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Color textColor;
    final Color hoverBg;
    final Color hoverText;

    if (widget.isDanger) {
      textColor = colors.textDanger;
      hoverBg = colors.buttonDangerFill;
      hoverText = colors.buttonDangerText;
    } else {
      textColor = colors.textPrimary;
      hoverBg = colors.backgroundModifierHover;
      hoverText = colors.textPrimary;
    }

    final activeColor = _isHovered ? hoverText : textColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: _isHovered ? hoverBg : Colors.transparent,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: context.textStyles.label.copyWith(color: activeColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: layout.s3),
              PhosphorIcon(
                widget.trailing ?? widget.icon,
                size: layout.s5,
                color: activeColor,
              ),
            ],
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
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(vertical: context.layout.s1_5),
      color: context.colors.backgroundModifierAccent.withValues(alpha: 0.3),
    );
  }
}
