import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_diagnostic_clipboard_text.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_nav.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_appearance.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_authorized_apps.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_blocked_users.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_connections.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_linked_devices.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_look_and_feel.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_messages_media.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_privacy_dashboard.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_profile.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_security_login.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_nav_l10n.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

String _userSettingsFooterText(AppRuntimeInfo info, FluxerLocalizations l10n) {
  final int? betaNumber = AppBuildConfig.betaNumber;
  final String environmentLabel = AppBuildConfig.isBeta && betaNumber != null
      ? 'beta $betaNumber'
      : info.environment.name;
  final base =
      'v${info.releaseVersion} (${info.buildNumber})'
      ' • $environmentLabel'
      ' • ${formatPushProviderLabel(info.pushProvider)}';
  if (info.buildTimestamp.isEmpty) {
    return base;
  }
  final builtAt = DateTime.tryParse(info.buildTimestamp);
  if (builtAt == null) {
    return '$base • ${info.buildTimestamp}';
  }
  return '$base • ${relativeTime(builtAt, l10n)}';
}

class UserSettingsModal extends ConsumerStatefulWidget {
  const UserSettingsModal({
    this.openProfileSection = false,
    this.openSecuritySection = false,
    super.key,
  });

  final bool openProfileSection;
  final bool openSecuritySection;

  static Future<void> show(
    BuildContext context, {
    bool openProfileSection = false,
    bool openSecuritySection = false,
  }) {
    if (isMobileLayout(context)) {
      return _showMobileSettings(
        context,
        openProfileSection: openProfileSection,
        openSecuritySection: openSecuritySection,
      );
    }

    return showModalBottomSheet<void>(
      elevation: 7,
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(maxWidth: 1400),
      builder: (_) => UserSettingsModal(
        openProfileSection: openProfileSection,
        openSecuritySection: openSecuritySection,
      ),
    );
  }

  static Future<void> _showMobileSettings(
    BuildContext context, {
    bool openProfileSection = false,
    bool openSecuritySection = false,
  }) async {
    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: 'Settings',
      useRootNavigator: true,
      builder: (sheetContext, scrollController, close) =>
          _MobileSettingsNavBody(
            onClose: close,
            scrollController: scrollController,
            openProfileSection: openProfileSection,
            openSecuritySection: openSecuritySection,
          ),
    );
  }

  @override
  ConsumerState<UserSettingsModal> createState() => _UserSettingsModalState();
}

class _UserSettingsModalState extends ConsumerState<UserSettingsModal> {
  var _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    if (widget.openSecuritySection) {
      _selectedIndex = 2;
    } else if (widget.openProfileSection) {
      _selectedIndex = 1;
    }
  }

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
    final l10n = FluxerLocalizations.of(context);
    final selectedEntry = userSettingsDesktopNav[_selectedIndex];
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
                    items: userSettingsDesktopNav
                        .map((entry) => entry.toSidebarItem(l10n))
                        .toList(),
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
                            selectedEntry.displayLabel(l10n),
                            style: context.textStyles.heading,
                          ),
                          const Spacer(),
                          _buildCloseButton(),
                        ],
                      ),
                    ),
                    Expanded(child: _buildContent(state)),
                    const _SettingsBuildInfoFooter(),
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
    final entry = userSettingsDesktopNav[index];
    if (entry.isLogout) {
      unawaited(_logout());
      return;
    }
    if (entry.isSeparator) {
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
      ..invalidate(gatewayForegroundListenerProvider)
      ..invalidate(gatewayReconnectToastListenerProvider)
      ..invalidate(gatewayConnectionFailedProvider)
      ..invalidate(connectivityListenerProvider)
      // Gateway event state
      ..invalidate(typingIndicatorsProvider)
      ..invalidate(voiceStatesMapProvider)
      ..invalidate(activeCallsProvider)
      ..invalidate(outgoingVoiceCallInitiatorProvider)
      ..invalidate(inviteCacheProvider)
      // Session
      ..invalidate(currentUserIdProvider)
      // View models
      ..invalidate(dmViewModelProvider)
      ..invalidate(guildListViewModelProvider)
      ..invalidate(organizedGuildListProvider)
      ..invalidate(folderExpandedStateProvider)
      ..invalidate(channelListViewModelProvider)
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
    final section = userSettingsDesktopNav[_selectedIndex].section;
    if (section == null) {
      return const SizedBox.shrink();
    }
    return _buildUserSettingsSectionContent(
      context: context,
      ref: ref,
      state: state,
      section: section,
    );
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
}

// ---------------------------------------------------------------------------
// Mobile settings — stacked bottom sheets
// ---------------------------------------------------------------------------

class _MobileSettingsNavBody extends ConsumerStatefulWidget {
  const _MobileSettingsNavBody({
    required this.onClose,
    required this.scrollController,
    this.openProfileSection = false,
    this.openSecuritySection = false,
  });

  final VoidCallback onClose;
  final ScrollController scrollController;
  final bool openProfileSection;
  final bool openSecuritySection;

  @override
  ConsumerState<_MobileSettingsNavBody> createState() =>
      _MobileSettingsNavBodyState();
}

class _MobileSettingsNavBodyState
    extends ConsumerState<_MobileSettingsNavBody> {
  var _didOpenInitialSection = false;

  @override
  void initState() {
    super.initState();
    if (widget.openProfileSection || widget.openSecuritySection) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_didOpenInitialSection) {
          _didOpenInitialSection = true;
          _openSettingsPage(
            widget.openSecuritySection
                ? UserSettingsSection.securityLogin
                : UserSettingsSection.profile,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerSettingsNavList(
      controller: widget.scrollController,
      groups: buildUserSettingsMobileNavGroups(
        l10n: l10n,
        onOpenSection: _openSettingsPage,
        onOpenAppLogs: _openAppLogs,
        onLogout: _logout,
      ),
      footer: const _SettingsBuildInfoFooter(),
    );
  }

  void _openSettingsPage(UserSettingsSection section) {
    final l10n = FluxerLocalizations.of(context);
    final canDismiss = ValueNotifier<bool>(true);
    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        context,
        title: userSettingsSectionLabel(l10n, section),
        useRootNavigator: true,
        canDismissNotifier: canDismiss,
        builder: (sheetContext, scrollController, close) =>
            _MobileSettingsContentBody(
              section: section,
              onClose: close,
              scrollController: scrollController,
              canDismissNotifier: canDismiss,
            ),
      ),
    );
  }

  void _openAppLogs() {
    unawaited(pushTalkerLogScreen(context));
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
      ..invalidate(gatewayForegroundListenerProvider)
      ..invalidate(gatewayReconnectToastListenerProvider)
      ..invalidate(gatewayConnectionFailedProvider)
      ..invalidate(connectivityListenerProvider)
      // Gateway event state
      ..invalidate(typingIndicatorsProvider)
      ..invalidate(voiceStatesMapProvider)
      ..invalidate(activeCallsProvider)
      ..invalidate(outgoingVoiceCallInitiatorProvider)
      ..invalidate(inviteCacheProvider)
      // Session
      ..invalidate(currentUserIdProvider)
      // View models
      ..invalidate(dmViewModelProvider)
      ..invalidate(guildListViewModelProvider)
      ..invalidate(organizedGuildListProvider)
      ..invalidate(folderExpandedStateProvider)
      ..invalidate(channelListViewModelProvider)
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
    required this.section,
    required this.onClose,
    required this.scrollController,
    this.canDismissNotifier,
  });

  final UserSettingsSection section;
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

    return _buildUserSettingsSectionContent(
      context: context,
      ref: ref,
      state: state,
      section: section,
      scrollController: scrollController,
    );
  }
}

Widget _buildUserSettingsSectionContent({
  required BuildContext context,
  required WidgetRef ref,
  required UserSettingsViewState state,
  required UserSettingsSection section,
  ScrollController? scrollController,
}) {
  switch (section) {
    case UserSettingsSection.profile:
      return FluxerSettingsSheet(
        hasUnsavedChanges: state.isDirty,
        isSaving: state.isSaving,
        onReset: () => ref.read(userSettingsViewModelProvider.notifier).reset(),
        onSave: () => ref.read(userSettingsViewModelProvider.notifier).save(),
        child: scrollController == null
            ? const UserProfile()
            : UserProfile(scrollController: scrollController),
      );
    case UserSettingsSection.lookAndFeel:
      if (scrollController == null) {
        return UserAppearance(
          isCompact: state.messageDisplayCompact,
          onToggleCompact: () =>
              ref.read(userSettingsViewModelProvider.notifier).toggleCompact(),
        );
      }
      return UserLookAndFeel(scrollController: scrollController);
    case UserSettingsSection.securityLogin:
      return scrollController == null
          ? const UserSecurityLogin()
          : UserSecurityLogin(scrollController: scrollController);
    case UserSettingsSection.privacyDashboard:
      return scrollController == null
          ? const UserPrivacyDashboard()
          : UserPrivacyDashboard(scrollController: scrollController);
    case UserSettingsSection.accessibility:
      return scrollController == null
          ? const UserAccessibility()
          : UserAccessibility(scrollController: scrollController);
    case UserSettingsSection.messagesAndMedia:
      return scrollController == null
          ? const UserMessagesMedia()
          : UserMessagesMedia(scrollController: scrollController);
    case UserSettingsSection.authorizedApps:
      return scrollController == null
          ? const UserAuthorizedApps()
          : UserAuthorizedApps(scrollController: scrollController);
    case UserSettingsSection.blockedUsers:
      return scrollController == null
          ? const UserBlockedUsers()
          : UserBlockedUsers(scrollController: scrollController);
    case UserSettingsSection.linkedDevices:
      return scrollController == null
          ? const UserLinkedDevices()
          : UserLinkedDevices(scrollController: scrollController);
    case UserSettingsSection.connections:
      return scrollController == null
          ? const UserConnections()
          : UserConnections(scrollController: scrollController);
    // case UserSettingsSection.fluxerPlutonium:
    // case UserSettingsSection.giftsAndCodes:
    case UserSettingsSection.expressionPacks:
    case UserSettingsSection.audioAndVideo:
    case UserSettingsSection.keybinds:
    case UserSettingsSection.soundsAndAlerts:
    case UserSettingsSection.languageAndTime:
    case UserSettingsSection.advanced:
    case UserSettingsSection.applications:
    case UserSettingsSection.developerTools:
    case UserSettingsSection.limitsConfig:
    case UserSettingsSection.featureFlags:
    case UserSettingsSection.whatsNew:
      return _buildUserSettingsPlaceholder(
        context,
        section,
        scrollController: scrollController,
      );
  }
}

Widget _buildUserSettingsPlaceholder(
  BuildContext context,
  UserSettingsSection section, {
  ScrollController? scrollController,
}) {
  final child = Center(
    child: Text(
      userSettingsSectionLabel(FluxerLocalizations.of(context), section),
      style: TextStyle(color: context.colors.textPrimaryMuted, fontSize: 24),
    ),
  );
  if (scrollController == null) {
    return child;
  }
  return CustomScrollView(
    controller: scrollController,
    physics: const AlwaysScrollableScrollPhysics(),
    slivers: [SliverFillRemaining(hasScrollBody: false, child: child)],
  );
}

class _SettingsBuildInfoFooter extends ConsumerWidget {
  const _SettingsBuildInfoFooter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runtimeInfoAsync = ref.watch(appRuntimeInfoProvider);
    final l10n = FluxerLocalizations.of(context);
    return runtimeInfoAsync.when(
      data: (AppRuntimeInfo info) {
        final text = _userSettingsFooterText(info, l10n);
        if (text.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
          child: Align(
            child: Semantics(
              button: true,
              label: 'Copy app info',
              child: GestureDetector(
                onTap: () => _copyBuildInfoToClipboard(context, ref, info),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: context.colors.textPrimaryMuted,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  void _copyBuildInfoToClipboard(
    BuildContext context,
    WidgetRef ref,
    AppRuntimeInfo info,
  ) {
    final clipboardText = formatAppDiagnosticClipboardText(info);
    unawaited(Clipboard.setData(ClipboardData(text: clipboardText)));
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: FluxerLocalizations.of(context).copiedToClipboard,
            variant: FluxerToastVariant.success,
          ),
        );
  }
}
