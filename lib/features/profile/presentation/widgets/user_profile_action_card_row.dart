import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileActionCardRow extends StatelessWidget {
  const UserProfileActionCardRow({
    required this.isCurrentUser,
    required this.isFriend,
    required this.isBlocked,
    required this.onMessage,
    required this.onVoiceCall,
    required this.onVideoCall,
    required this.onEditProfile,
    this.canCall = true,
    super.key,
  });

  final bool isCurrentUser;
  final bool isFriend;
  final bool isBlocked;
  final bool canCall;
  final Future<void> Function() onMessage;
  final Future<void> Function() onVoiceCall;
  final Future<void> Function() onVideoCall;
  final VoidCallback onEditProfile;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    if (isCurrentUser) {
      return SizedBox(
        width: double.infinity,
        child: FluxerButton.primary(
          label: l10n.userProfileEditProfile,
          icon: PhosphorIconsFill.pencil,
          onPressed: onEditProfile,
        ),
      );
    }

    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _ProfileActionCard(
            label: isBlocked ? l10n.userProfileOpenDm : l10n.userProfileMessage,
            icon: PhosphorIconsFill.chatTeardrop,
            onTap: onMessage,
            usesBrandPrimaryCircle: true,
          ),
        ),
        if (isFriend && canCall) ...[
          Expanded(
            child: _ProfileActionCard(
              label: l10n.userProfileVoiceCall,
              icon: PhosphorIconsFill.phone,
              onTap: onVoiceCall,
            ),
          ),
          Expanded(
            child: _ProfileActionCard(
              label: l10n.userProfileVideoCall,
              icon: PhosphorIconsFill.videoCamera,
              onTap: onVideoCall,
            ),
          ),
        ],
      ],
    );
  }
}

class _ProfileActionCard extends StatelessWidget {
  const _ProfileActionCard({
    required this.label,
    required this.icon,
    required this.onTap,
    this.usesBrandPrimaryCircle = false,
  });

  final String label;
  final IconData icon;
  final Future<void> Function() onTap;
  final bool usesBrandPrimaryCircle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Color circleColor = usesBrandPrimaryCircle
        ? colors.brandPrimary
        : colors.backgroundTertiary;
    final Color iconColor = usesBrandPrimaryCircle
        ? colors.textOnBrandPrimary
        : colors.interactiveNormal;
    return FluxerTappable(
      onTap: () async {
        await onTap();
      },
      builder: (context, _) => DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusXl,
        ),
        child: Padding(
          padding: EdgeInsets.all(layout.s3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                child: PhosphorIcon(icon, size: 24, color: iconColor),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: context.textStyles.timestamp.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
