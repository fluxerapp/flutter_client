import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatBackButton extends StatelessWidget {
  const ChatBackButton({
    required this.unreadCount,
    required this.onPressed,
    this.badgeCutoutColor,
    super.key,
  });

  final int unreadCount;
  final VoidCallback onPressed;
  final Color? badgeCutoutColor;

  @override
  Widget build(BuildContext context) {
    final String backLabel = MaterialLocalizations.of(
      context,
    ).backButtonTooltip;
    final String semanticLabel = unreadCount > 0
        ? '$backLabel, $unreadCount'
        : backLabel;
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft, size: 24),
            color: context.colors.textPrimaryMuted,
            onPressed: onPressed,
            tooltip: semanticLabel,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            style: IconButton.styleFrom(shape: const CircleBorder()),
          ),
          if (unreadCount > 0)
            Positioned(
              bottom: -6,
              left: 16,
              child: ExcludeSemantics(
                child: FluxerBadgeEntrance(
                  child: FluxerBadge.count(
                    count: unreadCount,
                    cutoutColor:
                        badgeCutoutColor ?? context.colors.chatInputBackground,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
