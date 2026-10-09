import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/theme_color_editor.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_alert.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_banner.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_app_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_preview_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_preview_content.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ThemeColorsGroupPreview extends StatelessWidget {
  const ThemeColorsGroupPreview({required this.groupId, super.key});

  final ThemeColorEditorGroupId groupId;

  @override
  Widget build(BuildContext context) {
    return switch (groupId) {
      ThemeColorEditorGroupId.brandButtons => const _BrandPreview(),
      ThemeColorEditorGroupId.chatSurfaces => const _ChatPreview(),
      ThemeColorEditorGroupId.sidebars => const _SidebarPreview(),
      ThemeColorEditorGroupId.text => const _TextPreview(),
      ThemeColorEditorGroupId.headers => const _HeaderPreview(),
      ThemeColorEditorGroupId.status => const _StatusPreview(),
      ThemeColorEditorGroupId.embedsMarkup => const _EmbedPreview(),
      ThemeColorEditorGroupId.accentsAlerts => const _AlertPreview(),
      ThemeColorEditorGroupId.controls => const _ControlsPreview(),
    };
  }
}

class _BrandPreview extends StatelessWidget {
  const _BrandPreview();

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return ThemeColorsPreviewCard(
      padding: ThemeColorsPreviewCard.contentPadding(context),
      child: Wrap(
        spacing: layout.s2,
        runSpacing: layout.s2,
        children: [
          FluxerButton.primary(
            label: ThemeColorsPreviewContent.buttonPrimary,
            fitContent: true,
            onPressed: () {},
          ),
          FluxerButton.secondary(
            label: ThemeColorsPreviewContent.buttonSecondary,
            fitContent: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ChatPreview extends StatelessWidget {
  const _ChatPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return ThemeColorsPreviewCard(
      child: ColoredBox(
        color: colors.chatBackground,
        child: Padding(
          padding: EdgeInsets.all(layout.s3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FluxerAvatar.user(
                userId: ThemeColorsPreviewContent.chatPreviewAuthorUserId,
                showStatus: false,
              ),
              SizedBox(width: layout.s2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ThemeColorsPreviewContent.chatPreviewAuthor,
                      style: textStyles.username.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    Text(
                      ThemeColorsPreviewContent.chatPreviewMessage,
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
      ),
    );
  }
}

class _SidebarPreview extends StatelessWidget {
  const _SidebarPreview();

  @override
  Widget build(BuildContext context) {
    return const ThemeColorsPreviewCard(
      child: ThemeColorsChannelListPreview(framed: false),
    );
  }
}

class _TextPreview extends StatelessWidget {
  const _TextPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return ThemeColorsPreviewCard(
      padding: ThemeColorsPreviewCard.contentPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ThemeColorsPreviewContent.textPrimarySample,
            style: textStyles.bodyMedium.copyWith(color: colors.textPrimary),
          ),
          SizedBox(height: layout.s1),
          Text(
            ThemeColorsPreviewContent.textSecondarySample,
            style: textStyles.bodyMedium.copyWith(color: colors.textSecondary),
          ),
          SizedBox(height: layout.s1),
          Text(
            ThemeColorsPreviewContent.textLinkSample,
            style: textStyles.bodyMedium.copyWith(
              color: colors.textLink,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderPreview extends StatelessWidget {
  const _HeaderPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return ThemeColorsPreviewCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColoredBox(
            color: colors.backgroundHeaderPrimary,
            child: Padding(
              padding: EdgeInsets.all(layout.s2),
              child: Text(
                ThemeColorsPreviewContent.appHeaderSample,
                style: textStyles.bodyMedium.copyWith(
                  color: colors.textPrimary,
                ),
              ),
            ),
          ),
          ColoredBox(
            color: colors.backgroundChannelHeader,
            child: Padding(
              padding: EdgeInsets.all(layout.s2),
              child: Text(
                ThemeColorsPreviewContent.channelHeaderSample,
                style: textStyles.channelName.copyWith(
                  color: colors.textPrimary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPreview extends StatelessWidget {
  const _StatusPreview();

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return ThemeColorsPreviewCard(
      padding: ThemeColorsPreviewCard.contentPadding(context),
      child: Row(
        children: [
          const FluxerStatusIndicator(status: 'online', size: 14),
          SizedBox(width: layout.s3),
          const FluxerStatusIndicator(status: 'idle', size: 14),
          SizedBox(width: layout.s3),
          const FluxerStatusIndicator(status: 'dnd', size: 14),
          SizedBox(width: layout.s3),
          const FluxerStatusIndicator(status: 'offline', size: 14),
        ],
      ),
    );
  }
}

class _EmbedPreview extends StatelessWidget {
  const _EmbedPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final mentionStyle = textStyles.messageText.copyWith(
      color: colors.markupMentionText,
      fontWeight: FontWeight.w500,
    );

    return ThemeColorsPreviewCard(
      padding: ThemeColorsPreviewCard.contentPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              layout.s3,
              layout.s2 + 2,
              layout.s3,
              layout.s2 + 2,
            ),
            decoration: BoxDecoration(
              color: colors.embedBackground,
              border: Border(
                left: BorderSide(color: colors.embedBorder, width: 4),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ThemeColorsPreviewContent.embedProvider,
                  style: textStyles.embedFooter.copyWith(
                    color: colors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: layout.s1),
                Text(
                  ThemeColorsPreviewContent.embedTitle,
                  style: textStyles.embedFooter.copyWith(
                    color: colors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: layout.s2),
          _MentionPill(
            style: mentionStyle,
            child: Text(
              ThemeColorsPreviewContent.mentionLabel,
              style: mentionStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _MentionPill extends StatelessWidget {
  const _MentionPill({required this.child, required this.style});

  final Widget child;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fontSize = style.fontSize ?? 14;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.markupMentionFill,
        borderRadius: BorderRadius.circular(fontSize * (4 / 14)),
        border: Border.all(color: colors.markupMentionBorder),
      ),
      padding: EdgeInsets.symmetric(horizontal: fontSize * (4 / 14)),
      child: child,
    );
  }
}

class _AlertPreview extends StatelessWidget {
  const _AlertPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final bodyStyle = textStyles.messageText.copyWith(
      color: colors.textChat,
      fontSize: 13,
    );

    return ThemeColorsPreviewCard(
      padding: ThemeColorsPreviewCard.contentPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const GuildDiscoveryBanner(
            title: ThemeColorsPreviewContent.discoveryBannerTitle,
            message: ThemeColorsPreviewContent.discoveryBannerMessage,
          ),
          SizedBox(height: layout.s3),
          _ToastStyleRow(
            icon: PhosphorIconsBold.check,
            iconColor: colors.accentSuccess,
            label: ThemeColorsPreviewContent.toastSaved,
          ),
          SizedBox(height: layout.s2),
          _ToastStyleRow(
            icon: PhosphorIconsBold.warning,
            iconColor: colors.accentWarning,
            label: ThemeColorsPreviewContent.toastWarning,
          ),
          SizedBox(height: layout.s3),
          _PreviewMessageAlert(
            type: AlertType.note,
            body: ThemeColorsPreviewContent.alertNoteBody,
            bodyStyle: bodyStyle,
          ),
          _PreviewMessageAlert(
            type: AlertType.warning,
            body: ThemeColorsPreviewContent.alertWarningBody,
            bodyStyle: bodyStyle,
          ),
        ],
      ),
    );
  }
}

class _PreviewMessageAlert extends StatelessWidget {
  const _PreviewMessageAlert({
    required this.type,
    required this.body,
    required this.bodyStyle,
  });

  final AlertType type;
  final String body;
  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    final accent = type.accentColor(context);
    final titleStyle = bodyStyle.copyWith(
      color: accent,
      fontWeight: FontWeight.w600,
      fontSize: (bodyStyle.fontSize ?? 16) * 0.875,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 48,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(type.icon, size: 16, color: accent),
                    const SizedBox(width: 6),
                    Text(type.label, style: titleStyle),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body, style: bodyStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ToastStyleRow extends StatelessWidget {
  const _ToastStyleRow({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: layout.s3,
          vertical: layout.s2,
        ),
        decoration: BoxDecoration(
          color: colors.backgroundPrimary,
          borderRadius: layout.radiusFull,
          border: Border.all(color: colors.backgroundModifierAccent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(icon, size: 20, color: iconColor),
            SizedBox(width: layout.s2),
            Text(
              label,
              style: textStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _ControlsPreview extends StatelessWidget {
  const _ControlsPreview();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return ThemeColorsPreviewCard(
      padding: ThemeColorsPreviewCard.contentPadding(context),
      child: Row(
        children: [
          const FluxerSwitchControl(value: true),
          SizedBox(width: layout.s3),
          const FluxerSwitchControl(value: false),
          SizedBox(width: layout.s3),
          Container(
            width: 48,
            height: 32,
            decoration: BoxDecoration(
              color: colors.backgroundSecondaryAlt,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: colors.borderColor),
            ),
          ),
        ],
      ),
    );
  }
}
