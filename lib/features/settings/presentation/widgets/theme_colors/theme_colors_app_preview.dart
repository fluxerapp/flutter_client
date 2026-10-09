import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_preview_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_preview_content.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ThemeColorsAppPreview extends StatelessWidget {
  const ThemeColorsAppPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return ExcludeSemantics(
      child: IgnorePointer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ThemeColorsChannelListPreview(),
            SizedBox(height: layout.s2),
            const ThemeColorsChatPreview(),
          ],
        ),
      ),
    );
  }
}

class ThemeColorsChannelListPreview extends StatelessWidget {
  const ThemeColorsChannelListPreview({this.framed = true, super.key});

  final bool framed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    const double railWidth = 56;

    final content = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: railWidth,
            decoration: BoxDecoration(
              color: colors.serverSidebarBackground,
              border: Border(right: BorderSide(color: colors.borderColor)),
            ),
            padding: EdgeInsets.symmetric(vertical: layout.s2),
            child: Column(
              children: [
                _PreviewGuildNavIcon(
                  isActive: false,
                  child: PhosphorIcon(
                    PhosphorIconsFill.chatCircle,
                    size: 22,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: layout.s2),
                _PreviewGuildNavIcon(
                  isActive: false,
                  child: PhosphorIcon(
                    PhosphorIconsFill.star,
                    size: 20,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: layout.s2),
                _PreviewGuildNavIcon(
                  isActive: true,
                  child: PhosphorIcon(
                    PhosphorIconsFill.rocketLaunch,
                    size: 22,
                    color: colors.textOnBrandPrimary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: colors.channelSidebarBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 42,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: layout.s3),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ThemeColorsPreviewContent.communityName,
                          style: textStyles.label.copyWith(
                            color: colors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      layout.s2,
                      0,
                      layout.s2,
                      layout.s2,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SelectedChannelRow(),
                        _InactiveChannelRow(
                          name: ThemeColorsPreviewContent.channelMemes,
                        ),
                        _InactiveChannelRow(
                          name: ThemeColorsPreviewContent.channelPets,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (!framed) {
      return content;
    }
    return ThemeColorsPreviewCard(child: content);
  }
}

class _PreviewGuildNavIcon extends StatelessWidget {
  const _PreviewGuildNavIcon({required this.isActive, required this.child});

  final bool isActive;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const double size = GuildNavbarIconShape.size;
    final double radius = isActive
        ? GuildNavbarIconShape.activeRadius
        : GuildNavbarIconShape.idleRadius;
    final Color background = isActive
        ? colors.brandPrimary
        : colors.serverIconBackground;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: ColoredBox(
        color: background,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class ThemeColorsChatPreview extends StatelessWidget {
  const ThemeColorsChatPreview({this.framed = true, super.key});

  final bool framed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final content = ColoredBox(
      color: colors.chatBackground,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColoredBox(
            color: colors.backgroundChannelHeader,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: layout.s3,
                vertical: layout.s2,
              ),
              child: Text(
                ThemeColorsPreviewContent.selectedChannel,
                style: textStyles.channelName.copyWith(
                  color: colors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(layout.s3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FluxerAvatar.user(
                  userId: ThemeColorsPreviewContent.messageAuthorUserId,
                  showStatus: false,
                  size: 36,
                ),
                SizedBox(width: layout.s3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ThemeColorsPreviewContent.messageAuthor,
                        style: textStyles.username.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                      Text(
                        ThemeColorsPreviewContent.messageBody,
                        style: textStyles.messageText.copyWith(
                          color: colors.textChat,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ColoredBox(
            color: colors.chatInputBackground,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: layout.s3,
                vertical: layout.s3,
              ),
              child: Text(
                ThemeColorsPreviewContent.composerHint,
                style: textStyles.messageText.copyWith(
                  color: colors.textChatMuted,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );

    if (!framed) {
      return content;
    }
    return ThemeColorsPreviewCard(child: content);
  }
}

class _SelectedChannelRow extends StatelessWidget {
  const _SelectedChannelRow();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: layout.s2,
        vertical: layout.s1 + 2,
      ),
      decoration: BoxDecoration(
        color: colors.backgroundModifierSelected,
        borderRadius: layout.radiusMd,
      ),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsBold.hash,
            size: 18,
            color: colors.interactiveActive,
          ),
          SizedBox(width: layout.s2),
          Expanded(
            child: Text(
              ThemeColorsPreviewContent.selectedChannel,
              style: textStyles.bodyMedium.copyWith(
                color: colors.interactiveActive,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _InactiveChannelRow extends StatelessWidget {
  const _InactiveChannelRow({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: layout.s2,
        vertical: layout.s1 + 2,
      ),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsBold.hash,
            size: 18,
            color: colors.interactiveNormal,
          ),
          SizedBox(width: layout.s2),
          Expanded(
            child: Text(
              name,
              style: textStyles.bodyMedium.copyWith(
                color: colors.interactiveNormal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
