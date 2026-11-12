import 'dart:async';
import 'dart:math' as math;

import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_emoji_rename_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_expression_desktop_card.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

class GuildEmojiListItem extends StatefulWidget {
  const GuildEmojiListItem({
    required this.entry,
    required this.canModify,
    required this.onRename,
    required this.onDelete,
    super.key,
  });

  final GuildEmojiSettingsEntry entry;
  final bool canModify;
  final Future<void> Function(String name) onRename;
  final VoidCallback onDelete;

  @override
  State<GuildEmojiListItem> createState() => _GuildEmojiListItemState();
}

class _GuildEmojiListItemState extends State<GuildEmojiListItem> {
  final GlobalKey _menuButtonKey = GlobalKey();
  late final TextEditingController _nameController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.entry.name);
  }

  @override
  void didUpdateWidget(covariant GuildEmojiListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isEditing && oldWidget.entry.name != widget.entry.name) {
      _nameController.text = widget.entry.name;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    if (isMobile) {
      return _buildMobileItem(context);
    }
    if (usesDesktopPointerUi(context)) {
      return _buildDesktopPointerItem(context);
    }
    return _buildDesktopItem(context);
  }

  Widget _buildDesktopPointerItem(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final TextStyle base = context.textStyles.bodyMedium.copyWith(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: colors.textPrimary,
    );
    final GuildExpressionUploader uploader = widget.entry.uploader;
    final String displayName = resolveDisplayName(
      username: uploader.username,
      globalName: uploader.globalName,
    );
    final Widget name = widget.canModify
        ? GuildExpressionInlineNameEdit(
            value: widget.entry.name,
            style: base,
            onSave: widget.onRename,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              ':${widget.entry.name}:',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: base,
            ),
          );
    final Widget uploaderCell = uploader.id.isEmpty
        ? Text(
            l10n.guildSettingsInvitesUnknown,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: base.copyWith(fontSize: 14, color: colors.textPrimaryMuted),
          )
        : Row(
            children: <Widget>[
              FluxerAvatar.user(
                fallbackText: displayName,
                userId: uploader.id,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: uploader.id,
                  hash: uploader.avatar,
                ),
                avatarColor: uploader.avatarColor,
                showStatus: false,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: base.copyWith(fontSize: 14, height: 20 / 14),
                ),
              ),
            ],
          );
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GuildExpressionDesktopCard(
        deleteLabel: l10n.guildSettingsEmojiDeleteTitle,
        onDelete: widget.canModify ? widget.onDelete : null,
        child: guildEmojiDesktopGrid(
          cells: <Widget>[
            Center(
              child: SizedBox.square(
                dimension: 40,
                child: Image.network(
                  FluxerMediaUrl.customEmoji(
                    id: widget.entry.id,
                    animated: widget.entry.animated,
                  ),
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
              ),
            ),
            Align(alignment: AlignmentDirectional.centerStart, child: name),
            uploaderCell,
          ],
        ),
      ),
    );
  }

  Widget _buildMobileItem(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String displayName = resolveDisplayName(
      username: widget.entry.uploader.username,
      globalName: widget.entry.uploader.globalName,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4, vertical: layout.s3),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 40,
            child: Image.network(
              FluxerMediaUrl.customEmoji(
                id: widget.entry.id,
                animated: widget.entry.animated,
              ),
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
          SizedBox(width: layout.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ':${widget.entry.name}:',
                  style: textStyles.bodyMedium.copyWith(color: colors.textChat),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  displayName,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textTertiary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (widget.canModify)
            FluxerButton.secondary(
              key: _menuButtonKey,
              icon: PhosphorIconsBold.dotsThreeVertical,
              isSquare: true,
              size: FluxerButtonSize.compact,
              onPressed: _emitMenuPosition,
              semanticLabel: l10n.guildSettingsEmojiRenameTitle,
            ),
        ],
      ),
    );
  }

  Widget _buildDesktopItem(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String displayName = resolveDisplayName(
      username: widget.entry.uploader.username,
      globalName: widget.entry.uploader.globalName,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4, vertical: layout.s2),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 40,
            child: Image.network(
              FluxerMediaUrl.customEmoji(
                id: widget.entry.id,
                animated: widget.entry.animated,
              ),
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
          SizedBox(width: layout.s3),
          Expanded(
            flex: 2,
            child: _isEditing
                ? FluxerInput(
                    controller: _nameController,
                    hint: l10n.guildSettingsEmojiRenameHint,
                  )
                : Text(
                    ':${widget.entry.name}:',
                    style: textStyles.bodyMedium.copyWith(
                      color: colors.textChat,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              displayName,
              style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (widget.canModify) ...<Widget>[
            FluxerButton.ghost(
              size: FluxerButtonSize.small,
              fitContent: true,
              label: _isEditing
                  ? l10n.save
                  : l10n.guildSettingsEmojiRenameTitle,
              onPressed: _isEditing
                  ? _saveRename
                  : () => setState(() => _isEditing = true),
            ),
            SizedBox(width: layout.s2),
            FluxerButton.ghost(
              size: FluxerButtonSize.small,
              fitContent: true,
              icon: PhosphorIconsBold.trash,
              label: l10n.guildSettingsEmojiDeleteTitle,
              onPressed: widget.onDelete,
            ),
          ],
        ],
      ),
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
    unawaited(_showMobileMenu(position));
  }

  Future<void> _showMobileMenu(Offset position) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
        FluxerMenuItem(
          label: l10n.guildSettingsEmojiRenameTitle,
          icon: PhosphorIconsBold.pencilSimple,
          onPressed: () {
            close();
            unawaited(_openRenameSheet());
          },
        ),
        FluxerMenuItem(
          label: l10n.guildSettingsEmojiDeleteTitle,
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

  Future<void> _openRenameSheet() async {
    final String? name = await showGuildEmojiRenameSheet(
      context: context,
      initialName: widget.entry.name,
    );
    if (name == null || name == widget.entry.name) {
      return;
    }
    await widget.onRename(name);
  }

  Future<void> _saveRename() async {
    final String nextName = _nameController.text.trim();
    if (nextName == widget.entry.name) {
      setState(() => _isEditing = false);
      return;
    }
    await widget.onRename(nextName);
    if (mounted) {
      setState(() => _isEditing = false);
    }
  }
}

class GuildEmojiListHeader extends StatelessWidget {
  const GuildEmojiListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    final colors = context.colors;
    if (usesDesktopPointerUi(context)) {
      final TextStyle style = textStyles.bodySmall.copyWith(
        fontSize: 12,
        height: 1.5,
        fontWeight: FontWeight.w600,
        color: colors.textPrimaryMuted,
      );
      Widget cell(String label, {TextAlign align = TextAlign.start}) => Text(
        label.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        style: style,
      );
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(13, 0, 12, 8),
        child: guildEmojiDesktopGrid(
          cells: <Widget>[
            cell(l10n.guildMenuSettingsEmoji, align: TextAlign.center),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: cell(l10n.guildSettingsEmojiColumnName),
            ),
            cell(l10n.guildSettingsEmojiColumnUploader),
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s3,
        context.layout.s4,
        context.layout.s1,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 40 + context.layout.s3),
          Expanded(
            flex: 2,
            child: Text(
              l10n.guildSettingsEmojiColumnName,
              style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              l10n.guildSettingsEmojiColumnUploader,
              style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
            ),
          ),
        ],
      ),
    );
  }
}

Widget guildEmojiDesktopGrid({required List<Widget> cells}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      const double gap = 12;
      const double emojiColumn = 72;
      final double remaining = math.max(
        0,
        constraints.maxWidth - emojiColumn - gap * 2,
      );
      double nameColumn = remaining / 1.85;
      double uploaderColumn = remaining - nameColumn;
      if (remaining < 380) {
        nameColumn = remaining * 200 / 380;
        uploaderColumn = remaining - nameColumn;
      } else if (nameColumn < 200) {
        nameColumn = 200;
        uploaderColumn = remaining - nameColumn;
      } else if (uploaderColumn < 180) {
        uploaderColumn = 180;
        nameColumn = remaining - uploaderColumn;
      }
      return Row(
        children: <Widget>[
          SizedBox(width: emojiColumn, child: cells[0]),
          const SizedBox(width: gap),
          SizedBox(width: nameColumn, child: cells[1]),
          const SizedBox(width: gap),
          SizedBox(width: uploaderColumn, child: cells[2]),
        ],
      );
    },
  );
}
