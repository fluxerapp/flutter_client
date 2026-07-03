import 'package:flutter/material.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';
import 'package:fluxer_app/features/settings/utils/guild_bans_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildBansListItem extends StatelessWidget {
  GuildBansListItem({
    required this.entry,
    required this.isMobile,
    required this.onTap,
    required this.onMenuPressed,
    super.key,
  });

  final GuildBanEntry entry;
  final bool isMobile;
  final VoidCallback? onTap;
  final ValueChanged<Offset> onMenuPressed;

  final GlobalKey _menuButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final user = entry.ban.user;
    final String displayName = resolveDisplayName(
      username: user.username,
      globalName: user.globalName,
    );
    final String tag = GuildBansUtils.buildUserTag(user);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final Widget row = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: layout.s4,
        vertical: isMobile ? layout.s4 : layout.s3,
      ),
      child: Row(
        children: <Widget>[
          FluxerAvatar.user(
            fallbackText: displayName,
            userId: user.id,
            imageUrl: FluxerMediaUrl.userAvatar(
              userId: user.id,
              hash: user.avatar,
            ),
            avatarColor: user.avatarColor,
            showStatus: false,
          ),
          SizedBox(width: layout.s3),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  displayName,
                  style: textStyles.bodyMedium.copyWith(
                    color: colors.textChat,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tag,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textTertiary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (isMobile)
            PhosphorIcon(
              PhosphorIconsBold.caretRight,
              size: 20,
              color: colors.textTertiary,
            )
          else
            FluxerButton.secondary(
              key: _menuButtonKey,
              icon: PhosphorIconsBold.dotsThreeVertical,
              isSquare: true,
              size: FluxerButtonSize.compact,
              onPressed: _emitMenuPosition,
            ),
        ],
      ),
    );
    if (isMobile) {
      return FluxerTappable(
        onTap: onTap,
        builder: (BuildContext context, _) => row,
      );
    }
    return GestureDetector(
      onSecondaryTapDown: (TapDownDetails details) {
        onMenuPressed(details.globalPosition);
      },
      behavior: HitTestBehavior.opaque,
      child: row,
    );
  }

  void _emitMenuPosition() {
    final RenderBox? renderBox =
        _menuButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final Offset position =
        renderBox.localToGlobal(Offset.zero) +
        Offset(renderBox.size.width, renderBox.size.height / 2);
    onMenuPressed(position);
  }
}
