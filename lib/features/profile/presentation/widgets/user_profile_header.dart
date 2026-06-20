import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
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
    this.showBotTag = false,
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
  final bool showBotTag;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final isUsernameAsDisplay = displayName == username;
    final String? pronounsTrimmed = pronouns?.trim();
    final bool showPronouns =
        pronounsTrimmed != null && pronounsTrimmed.isNotEmpty;

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
            if (showBotTag) const FluxerBotBadge(),
            if (showUsername && isUsernameAsDisplay)
              Text(
                '#$discriminator',
                style: textStyles.heading.copyWith(
                  color: colors.textTertiary,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        if (showUsername) ...[
          SizedBox(height: layout.s1),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 6,
            runSpacing: 4,
            children: [
              if (!isUsernameAsDisplay)
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
        if (customStatus != null) UserProfileCustomStatus(text: customStatus),
      ],
    );
  }
}
