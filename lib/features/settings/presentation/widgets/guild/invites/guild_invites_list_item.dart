import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_desktop_hover_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invite_countdown_text.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_invites_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';

class GuildInvitesListItem extends StatelessWidget {
  GuildInvitesListItem({
    required this.entry,
    required this.l10n,
    required this.showCreatedDate,
    required this.isMobile,
    required this.categoryName,
    required this.onCopy,
    required this.onRevoke,
    this.showChannel = true,
    this.onTap,
    this.onMenuPressed,
    super.key,
  });

  final GuildInviteEntry entry;
  final FluxerLocalizations l10n;
  final bool showCreatedDate;
  final bool isMobile;
  final String? categoryName;
  final bool showChannel;
  final VoidCallback onCopy;
  final VoidCallback onRevoke;
  final VoidCallback? onTap;
  final ValueChanged<Offset>? onMenuPressed;

  final GlobalKey _menuButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (!isMobile && usesDesktopPointerUi(context)) {
      return _GuildInviteDesktopPointerCard(
        item: this,
        cells: _buildDesktopPointerCells,
      );
    }
    final Widget cardContent = isMobile
        ? _buildMobileContent(context)
        : _buildDesktopContent(context);
    final Widget card = Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.layout.s3),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.colors.backgroundHeaderSecondary),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          cardContent,
          if (!isMobile)
            PositionedDirectional(
              top: -context.layout.s2,
              end: -context.layout.s2,
              child: _buildRevokeButton(context),
            ),
        ],
      ),
    );
    if (isMobile) {
      return FluxerTappable(
        onTap: onTap,
        builder: (BuildContext context, _) => card,
      );
    }
    return card;
  }

  Widget _buildMobileContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildLabeledRow(
                context,
                label: l10n.guildSettingsInvitesLabelInviter,
                child: _buildInviter(context),
              ),
              if (showChannel) ...<Widget>[
                SizedBox(height: context.layout.s2),
                _buildLabeledRow(
                  context,
                  label: l10n.guildSettingsInvitesLabelChannel,
                  child: _buildChannel(context),
                ),
              ],
              SizedBox(height: context.layout.s2),
              _buildLabeledRow(
                context,
                label: l10n.guildSettingsInvitesLabelCode,
                child: _buildInviteCodeText(context),
              ),
              SizedBox(height: context.layout.s2),
              _buildLabeledRow(
                context,
                label: l10n.guildSettingsInvitesLabelUses,
                child: Text(
                  GuildInvitesUtils.formatUses(entry),
                  style: _inviteMonospaceStyle(context),
                ),
              ),
              SizedBox(height: context.layout.s2),
              _buildLabeledRow(
                context,
                label: showCreatedDate
                    ? l10n.guildSettingsInvitesLabelCreated
                    : l10n.guildSettingsInvitesLabelExpires,
                child: _buildDateDisplay(context),
              ),
            ],
          ),
        ),
        if (onMenuPressed != null)
          FluxerButton.secondary(
            key: _menuButtonKey,
            icon: PhosphorIconsBold.dotsThreeVertical,
            isSquare: true,
            size: FluxerButtonSize.compact,
            onPressed: _emitMenuPosition,
          ),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(flex: showChannel ? 20 : 24, child: _buildInviter(context)),
        if (showChannel) ...<Widget>[
          SizedBox(width: context.layout.s2),
          Expanded(flex: 15, child: _buildChannel(context)),
        ],
        SizedBox(width: context.layout.s2),
        Expanded(flex: showChannel ? 18 : 22, child: _buildCodeCell(context)),
        SizedBox(width: context.layout.s2),
        Expanded(
          flex: 10,
          child: Text(
            GuildInvitesUtils.formatUses(entry),
            style: _inviteMonospaceStyle(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: context.layout.s2),
        Expanded(
          flex: showChannel ? 16 : 18,
          child: _buildDateDisplay(context),
        ),
      ],
    );
  }

  List<Widget> _buildDesktopPointerCells(
    BuildContext context, {
    required bool hovered,
  }) {
    final TextStyle text = context.textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 1.5,
      color: context.colors.textPrimary,
    );
    final TextStyle mono = text.copyWith(
      fontFamily: 'monospace',
      fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
    );
    final String? inviterId = entry.inviterId;
    final Widget inviter;
    if (inviterId == null) {
      inviter = Text(
        l10n.guildSettingsInvitesUnknown,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: text.copyWith(color: context.colors.textPrimaryMuted),
      );
    } else {
      final String displayName = resolveDisplayName(
        username: entry.inviterUsername ?? '',
        globalName: entry.inviterGlobalName,
      );
      inviter = Row(
        children: <Widget>[
          FluxerAvatar.user(
            fallbackText: displayName,
            userId: inviterId,
            imageUrl: FluxerMediaUrl.userAvatar(
              userId: inviterId,
              hash: entry.inviterAvatar,
            ),
            avatarColor: entry.inviterAvatarColor,
            showStatus: false,
            size: 32,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text,
            ),
          ),
        ],
      );
    }
    final ChannelType channelType = ChannelType.fromWire(entry.channelType);
    final Channel channel = Channel(
      id: entry.channelId,
      guildId: '',
      name: entry.channelName,
      type: channelType,
    );
    final Widget channelCell = Row(
      children: <Widget>[
        ChannelIcon(
          type: channelType,
          channel: channel,
          color: context.colors.textTertiary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                entry.channelName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: text.copyWith(fontWeight: FontWeight.w500),
              ),
              if (!channel.isCategory)
                Text(
                  categoryName ?? l10n.guildSettingsInvitesNoCategory,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: text.copyWith(
                    fontSize: 12,
                    color: context.colors.textTertiary,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
    final Widget codeCell = Row(
      children: <Widget>[
        Flexible(
          child: Text(
            entry.code,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: mono,
          ),
        ),
        const SizedBox(width: 8),
        Visibility.maintain(
          visible: hovered,
          child: FluxerButton.desktop(
            icon: PhosphorIconsRegular.clipboard,
            semanticLabel: l10n.guildSettingsInvitesCopyLink,
            showTooltip: true,
            hoverBackground: context.colors.backgroundHeaderSecondary,
            duration: context.motion.panel,
            onPressed: onCopy,
          ),
        ),
      ],
    );
    final Widget dateCell = showCreatedDate
        ? Text(
            GuildInvitesUtils.formatCreatedDate(entry, l10n),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: text,
          )
        : GuildInviteCountdownText(
            expiresAt: entry.expiresAt,
            expiredLabel: l10n.guildSettingsInvitesExpired,
            neverLabel: l10n.guildSettingsInvitesNever,
            textStyle: mono,
            plainTextStyle: text,
          );
    return <Widget>[
      inviter,
      if (showChannel) channelCell,
      codeCell,
      Text(
        GuildInvitesUtils.formatUses(entry),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: mono,
      ),
      dateCell,
    ];
  }

  Widget _buildCodeCell(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: _buildInviteCodeText(context)),
        _buildCopyButton(context),
      ],
    );
  }

  Widget _buildInviteCodeText(BuildContext context) {
    return Text(
      entry.code,
      style: _inviteMonospaceStyle(context),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCopyButton(BuildContext context) {
    return FluxerButton.secondary(
      icon: PhosphorIconsBold.clipboard,
      isSquare: true,
      size: FluxerButtonSize.compact,
      onPressed: onCopy,
      semanticLabel: l10n.guildSettingsInvitesCopyLink,
    );
  }

  Widget _buildRevokeButton(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundPrimary,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.backgroundHeaderSecondary),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: FluxerButton.secondary(
        icon: PhosphorIconsBold.x,
        isSquare: true,
        size: FluxerButtonSize.compact,
        onPressed: onRevoke,
        semanticLabel: l10n.guildSettingsInvitesRevoke,
      ),
    );
  }

  void _emitMenuPosition() {
    final RenderBox? renderBox =
        _menuButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || onMenuPressed == null) {
      return;
    }
    final Offset position =
        renderBox.localToGlobal(Offset.zero) +
        Offset(renderBox.size.width, renderBox.size.height / 2);
    onMenuPressed!(position);
  }

  Widget _buildLabeledRow(
    BuildContext context, {
    required String label,
    required Widget child,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: context.textStyles.smallText.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }

  TextStyle _inviteMonospaceStyle(BuildContext context) {
    return context.textStyles.bodySmall.copyWith(
      fontFamily: 'monospace',
      color: context.colors.textPrimary,
      fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
    );
  }

  Widget _buildInviter(BuildContext context) {
    final String? inviterId = entry.inviterId;
    if (inviterId == null) {
      return Text(
        l10n.guildSettingsInvitesUnknown,
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textPrimaryMuted,
        ),
      );
    }
    final String displayName = resolveDisplayName(
      username: entry.inviterUsername ?? '',
      globalName: entry.inviterGlobalName,
    );
    return Row(
      children: <Widget>[
        FluxerAvatar.user(
          fallbackText: displayName,
          userId: inviterId,
          imageUrl: FluxerMediaUrl.userAvatar(
            userId: inviterId,
            hash: entry.inviterAvatar,
          ),
          avatarColor: entry.inviterAvatarColor,
          showStatus: false,
          size: 32,
        ),
        SizedBox(width: context.layout.s2),
        Expanded(
          child: Text(
            displayName,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildChannel(BuildContext context) {
    final ChannelType channelType = ChannelType.fromWire(entry.channelType);
    final Channel channel = Channel(
      id: entry.channelId,
      guildId: '',
      name: entry.channelName,
      type: channelType,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ChannelIcon(type: channelType, channel: channel),
        SizedBox(width: context.layout.s2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                entry.channelName,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (!channel.isCategory)
                Text(
                  categoryName ?? l10n.guildSettingsInvitesNoCategory,
                  style: context.textStyles.timestamp.copyWith(
                    color: context.colors.textTertiary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateDisplay(BuildContext context) {
    if (showCreatedDate) {
      return Text(
        GuildInvitesUtils.formatCreatedDate(entry, l10n),
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textPrimary,
        ),
      );
    }
    return GuildInviteCountdownText(
      expiresAt: entry.expiresAt,
      expiredLabel: l10n.guildSettingsInvitesExpired,
      neverLabel: l10n.guildSettingsInvitesNever,
      textStyle: _inviteMonospaceStyle(context),
      plainTextStyle: context.textStyles.bodySmall.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }
}

Widget guildInvitesDesktopPointerGrid({
  required bool showChannel,
  required List<Widget> cells,
}) {
  final List<double?> widths = showChannel
      ? const <double?>[170, 130, null, 90, 140]
      : const <double?>[190, null, 90, 140];
  const double minFlexWidth = 140;
  final double gap = showChannel ? 8 : 12;
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final double fixed = widths.whereType<double>().fold<double>(
        0,
        (double sum, double width) => sum + width,
      );
      final double gaps = gap * (widths.length - 1);
      final double flexWidth = (constraints.maxWidth - fixed - gaps).clamp(
        minFlexWidth,
        double.infinity,
      );
      final List<Widget> children = <Widget>[];
      for (int i = 0; i < cells.length && i < widths.length; i++) {
        if (i > 0) {
          children.add(SizedBox(width: gap));
        }
        children.add(SizedBox(width: widths[i] ?? flexWidth, child: cells[i]));
      }
      return ClipRect(
        child: OverflowBox(
          alignment: AlignmentDirectional.centerStart,
          maxWidth: double.infinity,
          child: Row(mainAxisSize: MainAxisSize.min, children: children),
        ),
      );
    },
  );
}

class _GuildInviteDesktopPointerCard extends StatelessWidget {
  const _GuildInviteDesktopPointerCard({
    required this.item,
    required this.cells,
  });

  final GuildInvitesListItem item;
  final List<Widget> Function(BuildContext context, {required bool hovered})
  cells;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GuildDesktopHoverCard(
      overhang: 8,
      cornerButton: GuildDesktopRoundActionButton(
        label: item.l10n.guildSettingsInvitesRevoke,
        onPressed: item.onRevoke,
      ),
      builder: (BuildContext context, {required bool hovered}) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: context.layout.radiusMd,
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: guildInvitesDesktopPointerGrid(
          showChannel: item.showChannel,
          cells: cells(context, hovered: hovered),
        ),
      ),
    );
  }
}
