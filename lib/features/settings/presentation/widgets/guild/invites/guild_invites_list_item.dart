import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invite_countdown_text.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildInvitesListItem extends StatelessWidget {
  GuildInvitesListItem({
    required this.entry,
    required this.l10n,
    required this.inviteUrl,
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
  final String inviteUrl;
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
            Positioned(
              top: -context.layout.s2,
              right: -context.layout.s2,
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
            label.toUpperCase(),
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

Future<void> copyInviteLink({
  required BuildContext context,
  required String inviteUrl,
  required FluxerLocalizations l10n,
  required void Function(String message) showToast,
}) async {
  await Clipboard.setData(ClipboardData(text: inviteUrl));
  if (!context.mounted) {
    return;
  }
  showToast(l10n.copiedToClipboard);
}
