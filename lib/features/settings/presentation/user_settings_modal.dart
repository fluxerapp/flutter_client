import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/chat_view_model.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_view_model.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_appearance.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_messages_media.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_profile.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserSettingsModal extends ConsumerStatefulWidget {
  const UserSettingsModal({this.openProfileSection = false, super.key});

  final bool openProfileSection;

  static Future<void> show(
    BuildContext context, {
    bool openProfileSection = false,
  }) {
    if (isMobileLayout(context)) {
      return _showMobileSettings(
        context,
        openProfileSection: openProfileSection,
      );
    }

    return showModalBottomSheet<void>(
      elevation: 7,
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(maxWidth: 1400),
      backgroundColor: context.colors.backgroundSecondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => UserSettingsModal(openProfileSection: openProfileSection),
    );
  }

  static Future<void> _showMobileSettings(
    BuildContext context, {
    bool openProfileSection = false,
  }) async {
    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: 'Settings',
      leading: const SizedBox.shrink(),
      useRootNavigator: true,
      builder: (sheetContext, scrollController, close) =>
          _MobileSettingsNavBody(
            onClose: close,
            scrollController: scrollController,
            openProfileSection: openProfileSection,
          ),
    );
  }

  @override
  ConsumerState<UserSettingsModal> createState() => _UserSettingsModalState();
}

class _UserSettingsModalState extends ConsumerState<UserSettingsModal> {
  static const _items = [
    SettingsSidebarItem.separator('YOUR ACCOUNT'),
    SettingsSidebarItem('Profile', icon: PhosphorIconsFill.user),
    SettingsSidebarItem(
      'Security & Login',
      icon: PhosphorIconsFill.shieldCheck,
    ),
    SettingsSidebarItem('Fluxer Plutonium', icon: PhosphorIconsFill.crown),
    SettingsSidebarItem('Gifts & Codes', icon: PhosphorIconsFill.gift),
    SettingsSidebarItem('Privacy Dashboard', icon: PhosphorIconsFill.detective),
    SettingsSidebarItem('Authorized Apps', icon: PhosphorIconsFill.gridFour),
    SettingsSidebarItem('Blocked Users', icon: PhosphorIconsFill.prohibit),
    SettingsSidebarItem('Linked Devices', icon: PhosphorIconsFill.devices),
    SettingsSidebarItem('Connections', icon: PhosphorIconsFill.usersThree),
    SettingsSidebarItem.separator('APPLICATION'),
    SettingsSidebarItem('Look & Feel', icon: PhosphorIconsFill.paintBrush),
    SettingsSidebarItem('Accessibility', icon: PhosphorIconsFill.wheelchair),
    SettingsSidebarItem('Messages & Media', icon: PhosphorIconsFill.chatCircle),
    SettingsSidebarItem('Audio & Video', icon: PhosphorIconsFill.microphone),
    SettingsSidebarItem('Keybinds', icon: PhosphorIconsFill.keyboard),
    SettingsSidebarItem('Sounds & Alerts', icon: PhosphorIconsFill.bell),
    SettingsSidebarItem('Language & Time', icon: PhosphorIconsFill.translate),
    SettingsSidebarItem('Advanced', icon: PhosphorIconsFill.faders),
    SettingsSidebarItem.separator('DEVELOPER'),
    SettingsSidebarItem('Applications', icon: PhosphorIconsFill.code),
    SettingsSidebarItem.separator(),
    SettingsSidebarItem("What's New", icon: PhosphorIconsFill.megaphone),
    SettingsSidebarItem(
      'Log Out',
      icon: PhosphorIconsFill.signOut,
      isDestructive: true,
    ),
  ];

  var _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.92;
    final state = ref.watch(userSettingsViewModelProvider);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.borderColor),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        position: DecorationPosition.foreground,
        child: SizedBox(height: height, child: _buildDesktopLayout(state)),
      ),
    );
  }

  Widget _buildDesktopLayout(UserSettingsViewState state) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: ColoredBox(
                  color: context.colors.backgroundPrimary,
                  child: SettingsSidebar(
                    items: _items,
                    selectedIndex: _selectedIndex,
                    onSelected: _onItemSelected,
                    userId: state.userId,
                    username: state.displayName,
                    avatarUrl: state.avatarUrl,
                    avatarColor: state.avatarColor,
                  ),
                ),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: context.colors.borderColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 12, 12, 0),
                      child: Row(
                        children: [
                          Text(
                            _items[_selectedIndex].label,
                            style: context.textStyles.heading,
                          ),
                          const Spacer(),
                          _buildCloseButton(),
                        ],
                      ),
                    ),
                    Expanded(child: _buildContent(state)),
                    _buildBuildInfoFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onItemSelected(int index) {
    if (_items[index].isDestructive) {
      unawaited(_logout());
      return;
    }
    setState(() => _selectedIndex = index);
  }

  Future<void> _logout() async {
    final userId = ref.read(currentUserIdProvider) ?? '';

    await ref.read(gatewayConnectionProvider).disconnect();
    ref.read(gatewayReadyProvider.notifier).reset();

    ref
      // Gateway
      ..invalidate(gatewayConnectionProvider)
      ..invalidate(gatewayEventListenerProvider)
      ..invalidate(gatewayStateListenerProvider)
      ..invalidate(connectivityListenerProvider)
      // Gateway event state
      ..invalidate(typingIndicatorsProvider)
      ..invalidate(voiceStatesMapProvider)
      ..invalidate(activeCallsProvider)
      ..invalidate(inviteCacheProvider)
      // Session
      ..invalidate(currentUserIdProvider)
      // View models
      ..invalidate(dmViewModelProvider)
      ..invalidate(guildListViewModelProvider)
      ..invalidate(organizedGuildListProvider)
      ..invalidate(folderExpandedStateProvider)
      ..invalidate(channelListViewModelProvider)
      ..invalidate(memberListViewModelProvider)
      ..invalidate(chatViewModelProvider)
      ..invalidate(userSettingsViewModelProvider)
      ..invalidate(loginViewModelProvider);

    // AccountManager handles API logout + auth state reset.
    await ref.read(accountManagerProvider.notifier).signOut(userId);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildContent(UserSettingsViewState state) {
    final label = _items[_selectedIndex].label;
    switch (label) {
      case 'Profile':
        return FluxerSettingsSheet(
          hasUnsavedChanges: state.isDirty,
          isSaving: state.isSaving,
          onReset: () =>
              ref.read(userSettingsViewModelProvider.notifier).reset(),
          onSave: () => ref.read(userSettingsViewModelProvider.notifier).save(),
          child: const UserProfile(),
        );
      case 'Look & Feel':
        return UserAppearance(
          isCompact: state.messageDisplayCompact,
          onToggleCompact: () =>
              ref.read(userSettingsViewModelProvider.notifier).toggleCompact(),
        );
      case 'Messages & Media':
        return const UserMessagesMedia();
      default:
        return Center(
          child: Text(
            label,
            style: TextStyle(
              color: context.colors.textPrimaryMuted,
              fontSize: 24,
            ),
          ),
        );
    }
  }

  Widget _buildCloseButton() => InkWell(
    onTap: () => Navigator.of(context).pop(),
    borderRadius: BorderRadius.circular(20),
    child: SizedBox(
      width: 36,
      height: 36,
      child: PhosphorIcon(
        PhosphorIconsRegular.x,
        size: 18,
        color: context.colors.interactiveNormal,
      ),
    ),
  );

  Widget _buildBuildInfoFooter() {
    final runtimeInfoAsync = ref.watch(appRuntimeInfoProvider);
    final text = runtimeInfoAsync.when(
      data: (runtimeInfo) =>
          'v${runtimeInfo.version} (${runtimeInfo.buildNumber})'
          ' • ${runtimeInfo.environment.name}'
          ' • ${_formatProviderLabel(runtimeInfo.pushProvider.name)}',
      loading: () => '',
      error: (_, _) => '',
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
      child: Align(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: context.colors.textPrimaryMuted,
          ),
        ),
      ),
    );
  }

  String _formatProviderLabel(String providerName) {
    switch (providerName) {
      case 'firebaseMessaging':
        return 'fcm';
      case 'unifiedPush':
        return 'unifiedpush';
      case 'apple':
        return 'apns';
      default:
        return providerName;
    }
  }
}

// ---------------------------------------------------------------------------
// Mobile settings — stacked bottom sheets
// ---------------------------------------------------------------------------

class _MobileSettingsNavBody extends ConsumerStatefulWidget {
  const _MobileSettingsNavBody({
    required this.onClose,
    required this.scrollController,
    this.openProfileSection = false,
  });

  final VoidCallback onClose;
  final ScrollController scrollController;
  final bool openProfileSection;

  @override
  ConsumerState<_MobileSettingsNavBody> createState() =>
      _MobileSettingsNavBodyState();
}

class _MobileSettingsNavBodyState
    extends ConsumerState<_MobileSettingsNavBody> {
  var _didOpenProfile = false;

  @override
  void initState() {
    super.initState();
    if (widget.openProfileSection) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_didOpenProfile) {
          _didOpenProfile = true;
          _openSettingsPage('Profile');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FluxerSettingsNavList(
      controller: widget.scrollController,
      groups: [
        FluxerSettingsNavGroup(
          label: 'YOUR ACCOUNT',
          items: [
            FluxerSettingsNavItem(
              label: 'Profile',
              icon: PhosphorIconsFill.user,
              onTap: () => _openSettingsPage('Profile'),
            ),
            FluxerSettingsNavItem(
              label: 'Security & Login',
              icon: PhosphorIconsFill.shieldCheck,
              onTap: () => _openSettingsPage('Security & Login'),
            ),
            FluxerSettingsNavItem(
              label: 'Fluxer Plutonium',
              icon: PhosphorIconsFill.crown,
              onTap: () => _openSettingsPage('Fluxer Plutonium'),
            ),
            FluxerSettingsNavItem(
              label: 'Gifts & Codes',
              icon: PhosphorIconsFill.gift,
              onTap: () => _openSettingsPage('Gifts & Codes'),
            ),
            FluxerSettingsNavItem(
              label: 'Privacy Dashboard',
              icon: PhosphorIconsFill.detective,
              onTap: () => _openSettingsPage('Privacy Dashboard'),
            ),
            FluxerSettingsNavItem(
              label: 'Authorized Apps',
              icon: PhosphorIconsFill.gridFour,
              onTap: () => _openSettingsPage('Authorized Apps'),
            ),
            FluxerSettingsNavItem(
              label: 'Blocked Users',
              icon: PhosphorIconsFill.prohibit,
              onTap: () => _openSettingsPage('Blocked Users'),
            ),
            FluxerSettingsNavItem(
              label: 'Linked Devices',
              icon: PhosphorIconsFill.devices,
              onTap: () => _openSettingsPage('Linked Devices'),
            ),
            FluxerSettingsNavItem(
              label: 'Connections',
              icon: PhosphorIconsFill.usersThree,
              onTap: () => _openSettingsPage('Connections'),
            ),
          ],
        ),
        FluxerSettingsNavGroup(
          label: 'APPLICATION',
          items: [
            FluxerSettingsNavItem(
              label: 'Look & Feel',
              icon: PhosphorIconsFill.paintBrush,
              onTap: () => _openSettingsPage('Look & Feel'),
            ),
            FluxerSettingsNavItem(
              label: 'Accessibility',
              icon: PhosphorIconsFill.wheelchair,
              onTap: () => _openSettingsPage('Accessibility'),
            ),
            FluxerSettingsNavItem(
              label: 'Messages & Media',
              icon: PhosphorIconsFill.chatCircle,
              onTap: () => _openSettingsPage('Messages & Media'),
            ),
            FluxerSettingsNavItem(
              label: 'Audio & Video',
              icon: PhosphorIconsFill.microphone,
              onTap: () => _openSettingsPage('Audio & Video'),
            ),
            FluxerSettingsNavItem(
              label: 'Keybinds',
              icon: PhosphorIconsFill.keyboard,
              onTap: () => _openSettingsPage('Keybinds'),
            ),
            FluxerSettingsNavItem(
              label: 'Sounds & Alerts',
              icon: PhosphorIconsFill.bell,
              onTap: () => _openSettingsPage('Sounds & Alerts'),
            ),
            FluxerSettingsNavItem(
              label: 'Language & Time',
              icon: PhosphorIconsFill.translate,
              onTap: () => _openSettingsPage('Language & Time'),
            ),
            FluxerSettingsNavItem(
              label: 'Advanced',
              icon: PhosphorIconsFill.faders,
              onTap: () => _openSettingsPage('Advanced'),
            ),
          ],
        ),
        FluxerSettingsNavGroup(
          label: 'DEVELOPER',
          items: [
            FluxerSettingsNavItem(
              label: 'Applications',
              icon: PhosphorIconsFill.code,
              onTap: () => _openSettingsPage('Applications'),
            ),
          ],
        ),
        FluxerSettingsNavGroup(
          items: [
            FluxerSettingsNavItem(
              label: "What's New",
              icon: PhosphorIconsFill.megaphone,
              onTap: () => _openSettingsPage("What's New"),
            ),
            FluxerSettingsNavItem(
              label: 'Log Out',
              icon: PhosphorIconsFill.signOut,
              isDanger: true,
              onTap: _logout,
            ),
          ],
        ),
      ],
      footer: _MobileBuildInfoFooter(),
    );
  }

  void _openSettingsPage(String label) {
    final canDismiss = ValueNotifier<bool>(true);
    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        context,
        title: label,
        useRootNavigator: true,
        canDismissNotifier: canDismiss,
        builder: (sheetContext, scrollController, close) =>
            _MobileSettingsContentBody(
              label: label,
              onClose: close,
              scrollController: scrollController,
              canDismissNotifier: canDismiss,
            ),
      ),
    );
  }

  Future<void> _logout() async {
    final userId = ref.read(currentUserIdProvider) ?? '';

    await ref.read(gatewayConnectionProvider).disconnect();
    ref.read(gatewayReadyProvider.notifier).reset();

    ref
      // Gateway
      ..invalidate(gatewayConnectionProvider)
      ..invalidate(gatewayEventListenerProvider)
      ..invalidate(gatewayStateListenerProvider)
      ..invalidate(connectivityListenerProvider)
      // Gateway event state
      ..invalidate(typingIndicatorsProvider)
      ..invalidate(voiceStatesMapProvider)
      ..invalidate(activeCallsProvider)
      ..invalidate(inviteCacheProvider)
      // Session
      ..invalidate(currentUserIdProvider)
      // View models
      ..invalidate(dmViewModelProvider)
      ..invalidate(guildListViewModelProvider)
      ..invalidate(organizedGuildListProvider)
      ..invalidate(folderExpandedStateProvider)
      ..invalidate(channelListViewModelProvider)
      ..invalidate(memberListViewModelProvider)
      ..invalidate(chatViewModelProvider)
      ..invalidate(userSettingsViewModelProvider)
      ..invalidate(loginViewModelProvider);

    await ref.read(accountManagerProvider.notifier).signOut(userId);
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

class _MobileSettingsContentBody extends ConsumerWidget {
  const _MobileSettingsContentBody({
    required this.label,
    required this.onClose,
    required this.scrollController,
    this.canDismissNotifier,
  });

  final String label;
  final VoidCallback onClose;
  final ScrollController scrollController;
  final ValueNotifier<bool>? canDismissNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userSettingsViewModelProvider);

    ref.listen(userSettingsViewModelProvider, (_, next) {
      if (canDismissNotifier != null) {
        canDismissNotifier!.value = !next.isDirty;
      }
    });

    switch (label) {
      case 'Profile':
        return FluxerSettingsSheet(
          hasUnsavedChanges: state.isDirty,
          isSaving: state.isSaving,
          onReset: () =>
              ref.read(userSettingsViewModelProvider.notifier).reset(),
          onSave: () => ref.read(userSettingsViewModelProvider.notifier).save(),
          child: UserProfile(scrollController: scrollController),
        );
      case 'Look & Feel':
        return UserAppearance(
          isCompact: state.messageDisplayCompact,
          onToggleCompact: () =>
              ref.read(userSettingsViewModelProvider.notifier).toggleCompact(),
        );
      case 'Messages & Media':
        return const UserMessagesMedia();
      default:
        return Center(
          child: Text(
            label,
            style: TextStyle(
              color: context.colors.textPrimaryMuted,
              fontSize: 24,
            ),
          ),
        );
    }
  }
}

class _MobileBuildInfoFooter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runtimeInfoAsync = ref.watch(appRuntimeInfoProvider);
    final text = runtimeInfoAsync.when(
      data: (runtimeInfo) =>
          'v${runtimeInfo.version} (${runtimeInfo.buildNumber})'
          ' • ${runtimeInfo.environment.name}'
          ' • ${_formatProviderLabel(runtimeInfo.pushProvider.name)}',
      loading: () => '',
      error: (_, _) => '',
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
      child: Align(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: context.colors.textPrimaryMuted,
          ),
        ),
      ),
    );
  }

  static String _formatProviderLabel(String providerName) {
    switch (providerName) {
      case 'firebaseMessaging':
        return 'fcm';
      case 'unifiedPush':
        return 'unifiedpush';
      case 'apple':
        return 'apns';
      default:
        return providerName;
    }
  }
}
