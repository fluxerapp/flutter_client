import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

AdaptiveBottomNavigationBar adaptiveShellTabBar({
  required BuildContext context,
  required WidgetRef ref,
  required int selectedIndex,
  required ValueChanged<int> onTap,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final colors = context.colors;
  final UserSettingsViewState user = ref.watch(userSettingsViewModelProvider);
  final int unreadCount =
      ref.watch(
        appIconBadgeProvider.select((AppIconBadgeValue? badge) => badge?.count),
      ) ??
      0;

  final String? avatarUrl = user.avatarUrl;
  final Object profileIcon = avatarUrl != null && avatarUrl.isNotEmpty
      ? NetworkImage(avatarUrl)
      : PhosphorIconsFill.user;

  return AdaptiveBottomNavigationBar(
    selectedIndex: selectedIndex,
    onTap: onTap,
    selectedItemColor: colors.textChat,
    unselectedItemColor: colors.textPrimaryMuted,
    items: <AdaptiveNavigationDestination>[
      AdaptiveNavigationDestination(
        icon: PhosphorIconsFill.house,
        label: l10n.navHome,
        badgeCount: unreadCount > 0 ? unreadCount : null,
      ),
      AdaptiveNavigationDestination(
        icon: PhosphorIconsFill.bell,
        label: l10n.navNotifications,
      ),
      AdaptiveNavigationDestination(icon: profileIcon, label: l10n.navYou),
    ],
  );
}
