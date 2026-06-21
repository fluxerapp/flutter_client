import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_badges.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_custom_status.dart';
import 'package:fluxer_app/features/ui/ui.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({
    required this.username,
    required this.discriminator,
    required this.displayName,
    required this.flags,
    required this.hasPlutonium,
    required this.customStatus,
    this.isLifetimePlutonium = false,
    this.premiumSince,
    this.pronouns,
    this.premiumLifetimeSequence,
    this.showUsername = true,
    this.isBot = false,
    this.isSystem = false,
    super.key,
  });

  final String username;
  final String discriminator;
  final String displayName;
  final int flags;
  final bool hasPlutonium;
  final String? customStatus;
  final bool isLifetimePlutonium;
  final String? premiumSince;
  final String? pronouns;
  final int? premiumLifetimeSequence;
  final bool showUsername;
  final bool isBot;
  final bool isSystem;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String? pronounsTrimmed = pronouns?.trim();
    final bool showPronouns =
        pronounsTrimmed != null && pronounsTrimmed.isNotEmpty;
    final bool showUserTag = isBot || isSystem;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 6,
          runSpacing: 4,
          children: [
            Text(
              displayName,
              style: textStyles.heading.copyWith(
                color: colors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (showUserTag) FluxerUserTag(isSystem: isSystem),
          ],
        ),
        if (showUsername) ...[
          SizedBox(height: layout.s1),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 4,
            children: [
              Text(
                '$username#$discriminator',
                style: textStyles.bodySmall.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              UserProfileBadges(
                flags: flags,
                hasPlutonium: hasPlutonium,
                isLifetimePlutonium: isLifetimePlutonium,
                premiumSince: premiumSince,
                premiumLifetimeSequence: premiumLifetimeSequence,
              ),
            ],
          ),
        ],
        SizedBox(height: layout.s1),
        if (showPronouns) ...[
          Text(
            pronounsTrimmed,
            style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
          ),
          SizedBox(height: layout.s1),
        ],
        if (hasVisibleCustomStatus(customStatus))
          UserProfileCustomStatus(text: customStatus),
      ],
    );
  }
}
