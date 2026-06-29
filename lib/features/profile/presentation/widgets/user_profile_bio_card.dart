import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_connections_section.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:intl/intl.dart';

class UserProfileBioCard extends StatelessWidget {
  const UserProfileBioCard({
    required this.bio,
    required this.userId,
    this.connections = const <ConnectionResponse>[],
    this.memberRoles = const <MemberRole>[],
    this.accountMemberSince,
    this.guildMemberSince,
    this.guildName,
    this.guildIconUrl,
    super.key,
  });

  final String? bio;
  final String userId;
  final List<ConnectionResponse> connections;
  final List<MemberRole> memberRoles;
  final DateTime? accountMemberSince;
  final DateTime? guildMemberSince;
  final String? guildName;
  final String? guildIconUrl;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final trimmedBio = bio?.trim();
    final hasBio = trimmedBio != null && trimmedBio.isNotEmpty;
    final memberSince =
        accountMemberSince ??
        (userId.isEmpty ? null : dateTimeFromUserSnowflakeOrNull(userId));

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusXl,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasBio) ...[
              Text(
                l10n.userProfileAboutMe,
                style: textStyles.label.copyWith(
                  color: colors.textChat,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: layout.s2),
              MessageMarkdown(
                data: trimmedBio,
                markdownContext: FluxerMarkdownContext.restrictedUserBio,
                baseStyle: textStyles.bodySmall.copyWith(
                  color: colors.textChat,
                  height: 1.35,
                ),
              ),
              SizedBox(height: layout.s4),
            ],
            if (memberSince != null) ...[
              Text(
                l10n.userProfileMemberSince,
                style: textStyles.label.copyWith(
                  color: colors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: layout.s2),
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
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: colors.brandPrimary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            Assets.fluxerSymbol,
                            width: 12,
                            height: 12,
                            colorFilter: ColorFilter.mode(
                              colors.textOnBrandPrimary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      Text(
                        DateFormat.yMMMd().format(memberSince.toLocal()),
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textChat,
                          fontSize: 14,
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
                          DateFormat.yMMMd().format(
                            guildMemberSince!.toLocal(),
                          ),
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textChat,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
            if (memberRoles.isNotEmpty) ...[
              SizedBox(height: layout.s3),
              Text(
                'Roles',
                style: textStyles.label.copyWith(
                  color: colors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: memberRoles
                    .map(
                      (MemberRole role) => DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.backgroundPrimary,
                          border: Border.all(
                            color: colors.backgroundHeaderSecondary,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 24),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(width: 1),
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: role.color == 0
                                        ? colors.textTertiary
                                        : Color(0xFF000000 | role.color),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  role.name,
                                  style: textStyles.label.copyWith(
                                    color: colors.textPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    height: 1.33,
                                  ),
                                ),
                                const SizedBox(width: 1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(growable: false),
              ),
            ],
            if (connections.isNotEmpty) ...[
              SizedBox(height: layout.s4),
              UserProfileConnectionsSection(
                connections: connections,
                embedded: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
