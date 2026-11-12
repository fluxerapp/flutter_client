import 'dart:async';

import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_desktop_hover_card.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

class GuildStickerGridItem extends StatefulWidget {
  const GuildStickerGridItem({
    required this.entry,
    required this.density,
    required this.canModify,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final GuildStickerSettingsEntry entry;
  final GuildStickerDensity density;
  final bool canModify;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  State<GuildStickerGridItem> createState() => _GuildStickerGridItemState();
}

class _GuildStickerGridItemState extends State<GuildStickerGridItem> {
  final GlobalKey _menuButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    if (isMobile) {
      return _buildMobileItem(context);
    }
    if (usesDesktopPointerUi(context)) {
      return _GuildStickerDesktopCard(
        entry: widget.entry,
        compact: widget.density == GuildStickerDensity.compact,
        canModify: widget.canModify,
        onEdit: widget.onEdit,
        onDelete: widget.onDelete,
      );
    }
    return _buildDesktopItem(context);
  }

  Widget _buildMobileItem(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final double size = widget.density == GuildStickerDensity.cozy ? 120 : 88;
    final colors = context.colors;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              height: size,
              decoration: BoxDecoration(
                color: colors.backgroundSecondaryAlt,
                borderRadius: layout.radiusLg,
              ),
              alignment: Alignment.center,
              child: Image.network(
                FluxerMediaUrl.sticker(id: widget.entry.id),
                width: size - 16,
                height: size - 16,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
            if (widget.canModify)
              PositionedDirectional(
                top: -layout.s1,
                end: -layout.s1,
                child: FluxerButton.secondary(
                  key: _menuButtonKey,
                  icon: PhosphorIconsBold.dotsThreeVertical,
                  isSquare: true,
                  size: FluxerButtonSize.compact,
                  onPressed: () => _emitMenuPosition(context, l10n),
                  semanticLabel: l10n.guildSettingsStickerEditTitle,
                ),
              ),
          ],
        ),
        SizedBox(height: layout.s2),
        Text(
          widget.entry.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textStyles.bodySmall.copyWith(color: colors.textChat),
        ),
      ],
    );
  }

  Widget _buildDesktopItem(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final double size = widget.density == GuildStickerDensity.cozy ? 120 : 88;
    final colors = context.colors;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: size,
          decoration: BoxDecoration(
            color: colors.backgroundSecondaryAlt,
            borderRadius: layout.radiusLg,
          ),
          alignment: Alignment.center,
          child: Image.network(
            FluxerMediaUrl.sticker(id: widget.entry.id),
            width: size - 16,
            height: size - 16,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        ),
        SizedBox(height: layout.s2),
        Text(
          widget.entry.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textStyles.bodySmall.copyWith(color: colors.textChat),
        ),
        if (widget.canModify) ...<Widget>[
          SizedBox(height: layout.s1),
          Row(
            children: <Widget>[
              FluxerButton.ghost(
                size: FluxerButtonSize.small,
                fitContent: true,
                label: l10n.guildSettingsStickerEditTitle,
                onPressed: widget.onEdit,
              ),
              SizedBox(width: layout.s1),
              FluxerButton.ghost(
                size: FluxerButtonSize.small,
                fitContent: true,
                icon: PhosphorIconsBold.trash,
                label: l10n.guildSettingsStickerDeleteTitle,
                onPressed: widget.onDelete,
              ),
            ],
          ),
        ],
      ],
    );
  }

  void _emitMenuPosition(BuildContext context, FluxerLocalizations l10n) {
    final RenderBox? renderBox =
        _menuButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final Offset position =
        renderBox.localToGlobal(Offset.zero) +
        Offset(renderBox.size.width, renderBox.size.height / 2);
    unawaited(_showMobileMenu(context, l10n, position));
  }

  Future<void> _showMobileMenu(
    BuildContext context,
    FluxerLocalizations l10n,
    Offset position,
  ) async {
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
        FluxerMenuItem(
          label: l10n.guildSettingsStickerEditTitle,
          icon: PhosphorIconsBold.pencilSimple,
          onPressed: () {
            close();
            widget.onEdit();
          },
        ),
        FluxerMenuItem(
          label: l10n.guildSettingsStickerDeleteTitle,
          icon: PhosphorIconsBold.trash,
          isDanger: true,
          onPressed: () {
            close();
            widget.onDelete();
          },
        ),
      ],
    );
  }
}

class _GuildStickerDesktopCard extends StatelessWidget {
  const _GuildStickerDesktopCard({
    required this.entry,
    required this.compact,
    required this.canModify,
    required this.onEdit,
    required this.onDelete,
  });

  final GuildStickerSettingsEntry entry;
  final bool compact;
  final bool canModify;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final double padding = compact ? 8 : 12;
    final double gap = compact ? 8 : 12;
    final GuildExpressionUploader uploader = entry.uploader;
    final String authorName = resolveDisplayName(
      username: uploader.username,
      globalName: uploader.globalName,
    );
    return FluxerTappable(
      onTap: canModify ? onEdit : null,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        return Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            AnimatedContainer(
              duration: context.motion.normal,
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                borderRadius: context.layout.radiusLg,
                border: Border.all(color: colors.backgroundHeaderSecondary),
                boxShadow: hovered ? kFluxerDesktopCardHoverShadow : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                      FluxerMediaUrl.sticker(id: entry.id),
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    entry.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.bodyMedium.copyWith(
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                  if (uploader.id.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        FluxerAvatar.user(
                          fallbackText: authorName,
                          userId: uploader.id,
                          imageUrl: FluxerMediaUrl.userAvatar(
                            userId: uploader.id,
                            hash: uploader.avatar,
                          ),
                          avatarColor: uploader.avatarColor,
                          showStatus: false,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            authorName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.bodySmall.copyWith(
                              fontSize: 12,
                              height: 16 / 12,
                              color: colors.textPrimaryMuted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (canModify)
              PositionedDirectional(
                top: 9,
                end: 9,
                child: Visibility.maintain(
                  visible: hovered,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GuildDesktopRoundActionButton(
                        icon: PhosphorIconsBold.pencil,
                        label: l10n.guildSettingsStickerEditTitle,
                        size: 28,
                        danger: false,
                        onPressed: onEdit,
                      ),
                      const SizedBox(width: 4),
                      GuildDesktopRoundActionButton(
                        label: l10n.guildSettingsStickerDeleteTitle,
                        size: 28,
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
