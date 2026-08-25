import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_tab_menu_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onBranchSelected,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onBranchSelected;

  List<_NavItemConfig> _items(FluxerLocalizations l10n) => <_NavItemConfig>[
    _NavItemConfig(icon: PhosphorIconsFill.house, label: l10n.navHome),
    _NavItemConfig(icon: PhosphorIconsFill.bell, label: l10n.navNotifications),
    _NavItemConfig(label: l10n.navYou, isProfile: true),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final items = _items(l10n);
    final UserSettingsViewState user = ref.watch(userSettingsViewModelProvider);

    return Material(
      color: colors.backgroundSecondary,
      child: SafeArea(
        top: false,
        child: FluxerConstrainedUiTextScale(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.layout.mobileBottomNavHeight,
            ),
            child: Row(
              children: [
                for (var index = 0; index < items.length; index++)
                  Expanded(
                    child: _AppBottomNavItem(
                      config: items[index],
                      isSelected: currentIndex == index,
                      user: user,
                      onTap: () => onBranchSelected(index),
                      onLongPress: index == 2
                          ? () {
                              FluxerHaptics.medium();
                              unawaited(ProfileTabMenuSheet.show(context, ref));
                            }
                          : null,
                    ),
                  ),
              ],
            ),
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
    this.onLongPress,
  });

  final _NavItemConfig config;
  final bool isSelected;
  final UserSettingsViewState user;
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
                  duration: context.motion.panel,
                  opacity: isSelected ? 1 : 0.5,
                  child: FluxerAvatar.userPresence(
                    fallbackText: user.displayName,
                    userId: user.userId,
                    imageUrl: user.avatarUrl,
                    avatarColor: user.avatarColor,
                    size: 24,
                  ),
                )
              else
                PhosphorIcon(config.icon!, color: itemColor, size: 24),
              const SizedBox(height: 4),
              Text(
                config.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.timestamp.copyWith(color: itemColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
