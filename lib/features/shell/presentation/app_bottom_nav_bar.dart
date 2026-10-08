import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_tab_menu_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
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

    final Widget itemRow = Row(
      children: [
        for (var index = 0; index < items.length; index++)
          Expanded(
            child: _AppBottomNavItem(
              config: items[index],
              isSelected: currentIndex == index,
              user: user,
              ref: ref,
              onTap: () => onBranchSelected(index),
            ),
          ),
      ],
    );

    return Material(
      color: colors.backgroundSecondary,
      child: SafeArea(
        top: false,
        child: FluxerConstrainedUiTextScale(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: context.layout.mobileBottomNavHeight,
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (!isCompactWideMobileLayout(context) ||
                    !constraints.hasBoundedWidth) {
                  return itemRow;
                }
                final double peekWidth = mobileDrawerPeekWidth(context);
                if (constraints.maxWidth <= peekWidth) {
                  return itemRow;
                }
                return Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(width: peekWidth, child: itemRow),
                );
              },
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

class _AppBottomNavItem extends StatefulWidget {
  const _AppBottomNavItem({
    required this.config,
    required this.isSelected,
    required this.user,
    required this.ref,
    required this.onTap,
  });

  final _NavItemConfig config;
  final bool isSelected;
  final UserSettingsViewState user;
  final WidgetRef ref;
  final VoidCallback onTap;

  @override
  State<_AppBottomNavItem> createState() => _AppBottomNavItemState();
}

class _AppBottomNavItemState extends State<_AppBottomNavItem> {
  static const double _kNavAvatarSize = 24;

  void _openProfileMenu() {
    FluxerHaptics.medium();
    unawaited(ProfileTabMenuSheet.show(context, widget.ref));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color itemColor = widget.isSelected
        ? colors.textChat
        : colors.textPrimaryMuted;

    return FluxerTappable(
      onTap: widget.onTap,
      onLongPress: widget.config.isProfile ? _openProfileMenu : null,
      selected: widget.isSelected,
      semanticLabel: widget.config.label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.config.isProfile)
              AnimatedOpacity(
                duration: context.motion.panel,
                opacity: widget.isSelected ? 1 : 0.5,
                child: FluxerAvatar.userPresence(
                  fallbackText: widget.user.displayName,
                  userId: widget.user.userId,
                  imageUrl: widget.user.avatarUrl,
                  avatarColor: widget.user.avatarColor,
                  size: _kNavAvatarSize,
                ),
              )
            else
              PhosphorIcon(widget.config.icon!, color: itemColor, size: 24),
            const SizedBox(height: 4),
            Text(
              widget.config.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.timestamp.copyWith(color: itemColor),
            ),
          ],
        );
      },
    );
  }
}
