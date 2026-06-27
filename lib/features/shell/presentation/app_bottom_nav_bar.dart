import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_tab_menu_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onBranchSelected,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onBranchSelected;

  static const List<_NavItemConfig> _items = <_NavItemConfig>[
    _NavItemConfig(icon: PhosphorIconsFill.house, label: 'Home'),
    _NavItemConfig(icon: PhosphorIconsFill.bell, label: 'Notifications'),
    _NavItemConfig(label: 'You', isProfile: true),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final UserSettingsViewState user = ref.watch(userSettingsViewModelProvider);
    final String? selfUserId = user.userId.isEmpty ? null : user.userId;
    final String? presenceStatus = selfUserId == null
        ? null
        : ref.watch(userPresenceProvider(selfUserId)).value?.status;

    return Material(
      color: colors.backgroundSecondary,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: context.layout.mobileBottomNavHeight,
          child: Row(
            children: [
              for (var index = 0; index < _items.length; index++)
                Expanded(
                  child: _AppBottomNavItem(
                    config: _items[index],
                    isSelected: currentIndex == index,
                    user: user,
                    presenceStatus: presenceStatus,
                    onTap: () => onBranchSelected(index),
                    onLongPress: index == 2
                        ? () {
                            unawaited(HapticFeedback.mediumImpact());
                            unawaited(ProfileTabMenuSheet.show(context, ref));
                          }
                        : null,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItemConfig {
  const _NavItemConfig({
    required this.label,
    this.icon,
    this.isProfile = false,
  });

  final IconData? icon;
  final String label;
  final bool isProfile;
}

class _AppBottomNavItem extends StatelessWidget {
  const _AppBottomNavItem({
    required this.config,
    required this.isSelected,
    required this.user,
    required this.onTap,
    this.presenceStatus,
    this.onLongPress,
  });

  final _NavItemConfig config;
  final bool isSelected;
  final UserSettingsViewState user;
  final String? presenceStatus;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color itemColor = isSelected
        ? colors.textChat
        : colors.textPrimaryMuted;

    return FluxerTappable(
      onTap: onTap,
      onLongPress: onLongPress,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Semantics(
          button: true,
          selected: isSelected,
          label: config.label,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (config.isProfile)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1 : 0.5,
                  child: FluxerAvatar.user(
                    fallbackText: user.displayName,
                    userId: user.userId,
                    imageUrl: user.avatarUrl,
                    avatarColor: user.avatarColor,
                    status: presenceStatus,
                    size: 24,
                  ),
                )
              else
                PhosphorIcon(config.icon!, color: itemColor, size: 24),
              const SizedBox(height: 4),
              Text(
                config.label,
                style: TextStyle(fontSize: 12, color: itemColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
