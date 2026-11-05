import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double kUserProfileAvatarSize = 80;
const double kUserProfileAvatarRingWidth = 3.2;

class UserProfileIdentityAvatar extends StatelessWidget {
  const UserProfileIdentityAvatar({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.avatarColor,
    required this.showStatus,
    this.onTap,
    super.key,
  });

  final String userId;
  final String displayName;
  final String? avatarUrl;
  final int? avatarColor;
  final bool showStatus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Widget avatar = Container(
      padding: const EdgeInsets.all(kUserProfileAvatarRingWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.backgroundPrimary,
      ),
      child: FluxerAvatar.userPresence(
        fallbackText: displayName,
        userId: userId,
        imageUrl: avatarUrl,
        avatarColor: avatarColor,
        showStatus: showStatus,
        size: kUserProfileAvatarSize,
      ),
    );
    if (onTap == null) {
      return avatar;
    }
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: FluxerLocalizations.of(context).statusChangeSheetTitle,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) => avatar,
    );
  }
}
