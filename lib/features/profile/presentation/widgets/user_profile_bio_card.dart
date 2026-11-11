import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_connections_section.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_timezone_section.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class UserProfileBioCard extends ConsumerWidget {
  const UserProfileBioCard({
    required this.bio,
    required this.userId,
    this.compact = false,
    this.connections = const <ConnectionResponse>[],
    this.accountMemberSince,
    this.guildMemberSince,
    this.guildName,
    this.guildIconUrl,
    this.guildId,
    this.timezoneOffset,
    super.key,
  });

  final String? bio;
  final String userId;
  final List<ConnectionResponse> connections;
  final DateTime? accountMemberSince;
  final DateTime? guildMemberSince;
  final String? guildName;
  final String? guildIconUrl;
  final String? guildId;
  final int? timezoneOffset;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final trimmedBio = bio?.trim();
    final hasBio = trimmedBio != null && trimmedBio.isNotEmpty;
    final memberSince =
        accountMemberSince ??
        (userId.isEmpty ? null : dateTimeFromUserSnowflakeOrNull(userId));
    final double sectionGap = compact ? layout.s2 : layout.s4;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: compact ? Colors.transparent : colors.backgroundSecondary,
        borderRadius: layout.radiusXl,
      ),
      child: Padding(
        padding: compact ? EdgeInsets.zero : EdgeInsets.all(layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasBio) ...[
              if (!compact) ...[
                Text(
                  l10n.userProfileAboutMe,
                  style: textStyles.label.copyWith(
                    color: colors.textChat,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: layout.s2),
              ],
              MessageMarkdown(
                data: trimmedBio,
                guildId: guildId,
                markdownContext: FluxerMarkdownContext.restrictedUserBio,
                baseStyle: textStyles.bodySmall.copyWith(
                  color: colors.textChat,
                  height: compact ? 1.5 : 1.35,
                ),
              ),
              SizedBox(height: sectionGap),
            ],
            if (timezoneOffset != null) ...[
              UserProfileTimezoneSection(
                timezoneOffset: timezoneOffset!,
                compact: compact,
              ),
              SizedBox(height: sectionGap),
            ],
            if (memberSince != null) ...[
              Text(
                l10n.userProfileMemberSince,
                style: textStyles.label.copyWith(
                  color: colors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: compact ? 20 / 14 : null,
                ),
              ),
              SizedBox(height: compact ? layout.s1 : layout.s2),
              Wrap(
                spacing: layout.s2,
                runSpacing: layout.s1,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: <Widget>[
                      if (guildMemberSince != null)
                        Tooltip(
                          message: l10n.profilePreviewMemberSince(
                            ref.watch(
                              instanceRuntimeConfigProvider.select(
                                (config) => config.productName,
                              ),
                            ),
                          ),
                          child: const InstanceBrandMark(size: 16),
                        ),
                      Text(
                        formatUserMediumDate(
                          memberSince.toLocal(),
                          l10n.localeName,
                        ),
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textChat,
                          fontSize: 14,
                          height: compact ? 20 / 14 : null,
                        ),
                      ),
                    ],
                  ),
                  if (guildMemberSince != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: <Widget>[
                        FluxerGuildIconAvatar(
                          name: guildName ?? '',
                          imageUrl: guildIconUrl,
                          isCircle: true,
                          size: 16,
                        ),
                        Text(
                          formatUserMediumDate(
                            guildMemberSince!.toLocal(),
                            l10n.localeName,
                          ),
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textChat,
                            fontSize: 14,
                            height: compact ? 20 / 14 : null,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
            if (connections.isNotEmpty) ...[
              SizedBox(height: sectionGap),
              UserProfileConnectionsSection(
                connections: connections,
                embedded: true,
                variant: compact
                    ? UserProfileConnectionsVariant.compact
                    : FluxerDesktopSurfaceScope.maybeOf(context) ==
                          FluxerDesktopSurface.modal
                    ? UserProfileConnectionsVariant.cards
                    : UserProfileConnectionsVariant.list,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
