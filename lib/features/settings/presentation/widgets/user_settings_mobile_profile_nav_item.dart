import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

class UserSettingsMobileProfileNavItem extends StatelessWidget {
  const UserSettingsMobileProfileNavItem({
    required this.displayName,
    required this.userId,
    required this.onTap,
    super.key,
    this.avatarUrl,
    this.avatarColor,
  });

  final String displayName;
  final String userId;
  final String? avatarUrl;
  final int? avatarColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final String label = displayName.trim().isEmpty ? userId : displayName;

    return FluxerBottomSheetSubmenuItem(
      label: label,
      onTap: onTap,
      leading: FluxerAvatar.user(
        fallbackText: label,
        userId: userId,
        imageUrl: avatarUrl,
        avatarColor: avatarColor,
        size: 32,
      ),
    );
  }
}
