import 'dart:async';

import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
              Positioned(
                top: -layout.s1,
                right: -layout.s1,
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
