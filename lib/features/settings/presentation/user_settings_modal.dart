import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_diagnostic_clipboard_text.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
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
import 'package:fluxer_app/features/guilds/utils/invite_link_navigator.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_nav.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_search_query.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/app_licenses.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_advanced_settings.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_audio_and_video.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_authorized_apps.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_blocked_users.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_connections.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_default_apps.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_developer_tools.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_gift_inventory.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_language_and_time.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_linked_devices.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_look_and_feel.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_messages_media.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_notifications_settings.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_plutonium_settings.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_privacy_dashboard.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_profile.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_security_login.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_settings_search_field.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_shortcuts.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_modal_frame.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_utils.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_nav_l10n.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_search.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_section_scroll.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_staff_only_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
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
    this.initialSection,
    this.initialFieldId,
    this.guildId,
    super.key,
  });

  final bool openProfileSection;
  final bool openSecuritySection;
  final UserSettingsSection? initialSection;
  final String? initialFieldId;
  final String? guildId;

  static Future<void> show(
    BuildContext context, {
    bool openProfileSection = false,
    bool openSecuritySection = false,
    UserSettingsSection? initialSection,
    String? initialFieldId,
    String? guildId,
  }) {
    if (isMobileLayout(context)) {
      return _showMobileSettings(
        context,
        openProfileSection: openProfileSection,
        openSecuritySection: openSecuritySection,
        initialSection: initialSection,
        initialFieldId: initialFieldId,
        guildId: guildId,
      );
    }

    return showWideSettingsBottomSheet(
      context,
      child: UserSettingsModal(
        openProfileSection: openProfileSection,
        openSecuritySection: openSecuritySection,
        initialSection: initialSection,
        initialFieldId: initialFieldId,
        guildId: guildId,
      ),
    );
  }

  static Future<void> _showMobileSettings(
    BuildContext context, {
    bool openProfileSection = false,
    bool openSecuritySection = false,
    UserSettingsSection? initialSection,
    String? initialFieldId,
    String? guildId,
  }) async {
    await FluxerPageSheet.showScrollable<void>(
      context,
      title: 'Settings',
      presentation: FluxerPageSheetPresentation.root,
      builder: (sheetContext, scrollController, close) =>
          _MobileSettingsNavBody(
            onClose: close,
            scrollController: scrollController,
            openProfileSection: openProfileSection,
            openSecuritySection: openSecuritySection,
            initialSection: initialSection,
            initialFieldId: initialFieldId,
            guildId: guildId,
          ),
    );
  }

  @override
  ConsumerState<UserSettingsModal> createState() => _UserSettingsModalState();
}

class _UserSettingsModalState extends ConsumerState<UserSettingsModal>
    with UserSettingsSearchQueryMixin {
  var _selectedIndex = 1;

  @override
  void dispose() {
    disposeSearchQuery();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final bool showBilling = userSettingsShowBillingNav(ref);
    final bool showJoinFluxerLabs = userSettingsShowJoinFluxerLabsNav(ref);
    final bool isTouchPrimary = ref.read(inputModalityProvider);
    final int? sectionIndex = widget.initialSection == null
        ? null
        : indexForUserSettingsSection(
            widget.initialSection!,
            showBilling: showBilling,
            showJoinFluxerLabs: showJoinFluxerLabs,
            isTouchPrimary: isTouchPrimary,
          );
    if (sectionIndex != null) {
      _selectedIndex = sectionIndex;
    } else if (widget.openSecuritySection) {
      _selectedIndex = 2;
    } else if (widget.openProfileSection) {
      _selectedIndex = 1;
    }

    final String? guildId = widget.guildId;
    if (guildId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          unawaited(
            ref
                .read(userSettingsViewModelProvider.notifier)
                .selectGuild(guildId),
          );
        }
      });
    }

    _scheduleFieldScroll(widget.initialFieldId);
  }

  void _scheduleFieldScroll(String? fieldId) {
    if (fieldId == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      UserSettingsSectionScrollKeys.scheduleScrollToField(context, fieldId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSettingsViewModelProvider);
    final bool showBilling = userSettingsShowBillingNav(ref);
    final bool showJoinFluxerLabs = userSettingsShowJoinFluxerLabsNav(ref);
    final bool isTouchPrimary = isTouchPrimaryInput(ref);
    final List<UserSettingsDesktopNavEntry> desktopNav =
        buildUserSettingsDesktopNav(
          showBilling: showBilling,
          showJoinFluxerLabs: showJoinFluxerLabs,
          isTouchPrimary: isTouchPrimary,
        );

    return WideSettingsModalFrame(
      includeOuterPadding: false,
      child: _buildDesktopLayout(
        state: state,
        desktopNav: desktopNav,
        showBilling: showBilling,
        isTouchPrimary: isTouchPrimary,
      ),
    );
  }

  Widget _buildDesktopLayout({
    required UserSettingsViewState state,
    required List<UserSettingsDesktopNavEntry> desktopNav,
    required bool showBilling,
    required bool isTouchPrimary,
  }) {
    final l10n = FluxerLocalizations.of(context);
    final selectedEntry = desktopNav[_selectedIndex];
    final double contentGutter = wideSettingsContentEdgeGutter(context);
    final List<UserSettingsSearchHit> hits = searchVisibleUserSettings(
      l10n: l10n,
      query: debouncedSearchQuery,
      showBilling: showBilling,
      isTouchPrimary: isTouchPrimaryInput(ref),
    );
    final UserSettingsSearchSidebar? searchSidebar = isSettingsSearchActive
        ? buildUserSettingsSearchSidebar(
            l10n: l10n,
            hits: hits,
            showBilling: showBilling,
            isTouchPrimary: isTouchPrimary,
          )
        : null;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: kWideSettingsSidebarWidth,
                child: ColoredBox(
                  color: context.colors.backgroundPrimary,
                  child: SettingsSidebar(
                    items:
                        searchSidebar?.items ??
                        desktopNav
                            .map((entry) => entry.toSidebarItem(l10n))
                            .toList(),
                    selectedIndex: searchSidebar == null ? _selectedIndex : -1,
                    onSelected: (index) {
                      if (searchSidebar != null) {
                        _onSearchHitSelected(searchSidebar.hitAtIndex[index]);
                        return;
                      }
                      _onItemSelected(index, desktopNav);
                    },
                    searchController: searchController,
                    onSearchChanged: onSearchQueryChanged,
                    onSearchClear: clearSearchQuery,
                    emptySearchMessage: isSettingsSearchActive
                        ? l10n.userSettingsSearchNoResults
                        : null,
                    userId: state.userId,
                    username: state.displayName,
                    avatarUrl: state.avatarUrl,
                    avatarColor: state.avatarColor,
                    footer: const _SettingsBuildInfoFooter(inSidebar: true),
                  ),
                ),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: context.colors.borderColor,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: contentGutter),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
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
                      Expanded(
                        child: WideSettingsContentLayout(
                          includeHorizontalGutter: false,
                          child: _buildContent(state, desktopNav),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onItemSelected(
    int index,
    List<UserSettingsDesktopNavEntry> desktopNav,
  ) {
    final entry = desktopNav[index];
    if (entry.isLogout) {
      unawaited(_logout());
      return;
    }
    if (entry.isJoinFluxerLabs) {
      unawaited(_joinFluxerLabs());
      return;
    }
    if (entry.isSeparator) {
      return;
    }
    setState(() => _selectedIndex = index);
  }

  Future<void> _joinFluxerLabs() async {
    await handleInviteLinkTap(context, kFluxerLabsInviteUrl);
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop();
  }

  void _onSearchHitSelected(UserSettingsSearchHit? hit) {
    if (hit == null) {
      return;
    }
    final bool showBilling = userSettingsShowBillingNav(ref);
    final bool showJoinFluxerLabs = userSettingsShowJoinFluxerLabsNav(ref);
    final bool isTouchPrimary = ref.read(inputModalityProvider);
    final int? index = indexForUserSettingsSection(
      hit.section,
      showBilling: showBilling,
      showJoinFluxerLabs: showJoinFluxerLabs,
      isTouchPrimary: isTouchPrimary,
    );
    if (index == null) {
      return;
    }
    resetSearchQuery();
    setState(() => _selectedIndex = index);
    _scheduleFieldScroll(hit.fieldId);
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
      ..invalidate(gatewayReconnectBannerListenerProvider)
      ..invalidate(gatewayReconnectBannerProvider)
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

  Widget _buildContent(
    UserSettingsViewState state,
    List<UserSettingsDesktopNavEntry> desktopNav,
  ) {
    final section = desktopNav[_selectedIndex].section;
    if (section == null) {
      return const SizedBox.shrink();
    }
    final bool isTouchPrimary = isTouchPrimaryInput(ref);
    return _buildUserSettingsSectionContent(
      context: context,
      ref: ref,
      state: state,
      section: section,
      isTouchPrimary: isTouchPrimary,
      onNavigateSection: (UserSettingsSection target) {
        final bool showBilling = userSettingsShowBillingNav(ref);
        final bool showJoinFluxerLabs = userSettingsShowJoinFluxerLabsNav(ref);
        final bool isTouchPrimary = ref.read(inputModalityProvider);
        final int? index = indexForUserSettingsSection(
          target,
          showBilling: showBilling,
          showJoinFluxerLabs: showJoinFluxerLabs,
          isTouchPrimary: isTouchPrimary,
        );
        if (index != null) {
          setState(() => _selectedIndex = index);
        }
      },
    );
  }

  Widget _buildCloseButton() => InkWell(
    onTap: () => Navigator.of(context).pop(),
    borderRadius: BorderRadius.circular(20),
    child: SizedBox(
      width: 36,
      height: 36,
      child: PhosphorIcon(
        PhosphorIconsBold.x,
        size: 18,
        color: context.colors.interactiveNormal,
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Mobile settings — page sheets
// ---------------------------------------------------------------------------

class _MobileSettingsNavBody extends ConsumerStatefulWidget {
  const _MobileSettingsNavBody({
    required this.onClose,
    required this.scrollController,
    this.openProfileSection = false,
    this.openSecuritySection = false,
    this.initialSection,
    this.initialFieldId,
    this.guildId,
  });

  final VoidCallback onClose;
  final ScrollController scrollController;
  final bool openProfileSection;
  final bool openSecuritySection;
  final UserSettingsSection? initialSection;
  final String? initialFieldId;
  final String? guildId;

  @override
  ConsumerState<_MobileSettingsNavBody> createState() =>
      _MobileSettingsNavBodyState();
}

class _MobileSettingsNavBodyState extends ConsumerState<_MobileSettingsNavBody>
    with UserSettingsSearchQueryMixin {
  var _didOpenInitialSection = false;

  @override
  void dispose() {
    disposeSearchQuery();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final UserSettingsSection? initialSection =
        widget.initialSection ??
        (widget.openSecuritySection
            ? UserSettingsSection.securityLogin
            : widget.openProfileSection
            ? UserSettingsSection.profile
            : null);
    if (initialSection != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_didOpenInitialSection) {
          _didOpenInitialSection = true;
          _openSettingsPage(
            initialSection,
            initialFieldId: widget.initialFieldId,
          );
        }
      });
    }

    final String? guildId = widget.guildId;
    if (guildId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          unawaited(
            ref
                .read(userSettingsViewModelProvider.notifier)
                .selectGuild(guildId),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final bool showBilling = userSettingsShowBillingNav(ref);
    final bool showJoinFluxerLabs = userSettingsShowJoinFluxerLabsNav(ref);
    final bool isTouchPrimary = isTouchPrimaryInput(ref);
    final List<UserSettingsSearchHit> hits = searchVisibleUserSettings(
      l10n: l10n,
      query: debouncedSearchQuery,
      showBilling: showBilling,
      isTouchPrimary: isTouchPrimary,
    );
    return FluxerSettingsNavList(
      controller: widget.scrollController,
      padding: EdgeInsets.fromLTRB(
        layout.s4,
        0,
        layout.s4,
        kSettingsScrollBottomPadding,
      ),
      header: UserSettingsSearchField(
        controller: searchController,
        onChanged: onSearchQueryChanged,
        onClear: clearSearchQuery,
      ),
      groups: isSettingsSearchActive
          ? buildUserSettingsSearchNavGroups(
              l10n: l10n,
              hits: hits,
              onOpen: _openSettingsPage,
              showBilling: showBilling,
              isTouchPrimary: isTouchPrimary,
            )
          : buildUserSettingsMobileNavGroups(
              l10n: l10n,
              onOpenSection: _openSettingsPage,
              onOpenAppLogs: _openAppLogs,
              onJoinFluxerLabs: () => unawaited(_joinFluxerLabs()),
              onLogout: _logout,
              showBilling: showBilling,
              showJoinFluxerLabs: showJoinFluxerLabs,
              isTouchPrimary: isTouchPrimary,
            ),
      empty: isSettingsSearchActive
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: layout.s6),
              child: Text(
                l10n.userSettingsSearchNoResults,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
              ),
            )
          : null,
      footer: const _SettingsBuildInfoFooter(),
    );
  }

  void _openSettingsPage(
    UserSettingsSection section, {
    String? initialFieldId,
  }) {
    if (!isUserSettingsStaffOnlySectionAvailable(section)) {
      return;
    }
    if (!isUserSettingsBillingSectionAvailable(
      section,
      showBilling: userSettingsShowBillingNav(ref),
    )) {
      return;
    }
    if (section == UserSettingsSection.shortcuts &&
        ref.read(inputModalityProvider)) {
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    final canDismiss = ValueNotifier<bool>(true);
    unawaited(
      FluxerPageSheet.showScrollable<void>(
        context,
        title: userSettingsSectionLabel(l10n, section),
        canDismissNotifier: canDismiss,
        builder: (sheetContext, scrollController, close) =>
            _MobileSettingsContentBody(
              section: section,
              onClose: close,
              scrollController: scrollController,
              canDismissNotifier: canDismiss,
              initialFieldId: initialFieldId,
            ),
      ),
    );
  }

  Future<void> _joinFluxerLabs() async {
    await handleInviteLinkTap(context, kFluxerLabsInviteUrl);
    if (!mounted) {
      return;
    }
    widget.onClose();
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
      ..invalidate(gatewayReconnectBannerListenerProvider)
      ..invalidate(gatewayReconnectBannerProvider)
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

class _MobileSettingsContentBody extends ConsumerStatefulWidget {
  const _MobileSettingsContentBody({
    required this.section,
    required this.onClose,
    required this.scrollController,
    this.canDismissNotifier,
    this.initialFieldId,
  });

  final UserSettingsSection section;
  final VoidCallback onClose;
  final ScrollController scrollController;
  final ValueNotifier<bool>? canDismissNotifier;
  final String? initialFieldId;

  @override
  ConsumerState<_MobileSettingsContentBody> createState() =>
      _MobileSettingsContentBodyState();
}

class _MobileSettingsContentBodyState
    extends ConsumerState<_MobileSettingsContentBody> {
  @override
  void initState() {
    super.initState();
    final String? fieldId = widget.initialFieldId;
    if (fieldId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        UserSettingsSectionScrollKeys.scheduleScrollToField(context, fieldId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSettingsViewModelProvider);

    ref.listen(userSettingsViewModelProvider, (_, next) {
      if (widget.canDismissNotifier != null) {
        widget.canDismissNotifier!.value = !next.isDirty;
      }
    });

    return _buildUserSettingsSectionContent(
      context: context,
      ref: ref,
      state: state,
      section: widget.section,
      isTouchPrimary: isTouchPrimaryInput(ref),
      scrollController: widget.scrollController,
    );
  }
}

Widget _buildUserSettingsSectionContent({
  required BuildContext context,
  required WidgetRef ref,
  required UserSettingsViewState state,
  required UserSettingsSection section,
  required bool isTouchPrimary,
  ScrollController? scrollController,
  void Function(UserSettingsSection section)? onNavigateSection,
}) {
  if (!isUserSettingsStaffOnlySectionAvailable(section)) {
    return const SizedBox.shrink();
  }
  if (!isUserSettingsBillingSectionAvailable(
    section,
    showBilling: userSettingsShowBillingNav(ref),
  )) {
    return const SizedBox.shrink();
  }
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
    case UserSettingsSection.chat:
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
    case UserSettingsSection.advanced:
      return scrollController == null
          ? const UserAdvancedSettings()
          : UserAdvancedSettings(scrollController: scrollController);
    case UserSettingsSection.defaultApps:
      if (!isFluxerNativeMobileOs) {
        return const SizedBox.shrink();
      }
      return scrollController == null
          ? const UserDefaultApps()
          : UserDefaultApps(scrollController: scrollController);
    case UserSettingsSection.languageAndTime:
      return scrollController == null
          ? const UserLanguageAndTime()
          : UserLanguageAndTime(scrollController: scrollController);
    case UserSettingsSection.fluxerPlutonium:
      return UserPlutoniumSettings(
        scrollController: scrollController,
        onOpenGifts: onNavigateSection == null
            ? null
            : () => onNavigateSection(UserSettingsSection.giftsAndCodes),
      );
    case UserSettingsSection.giftsAndCodes:
      return UserGiftInventory(
        scrollController: scrollController,
        onOpenPlutonium: onNavigateSection == null
            ? null
            : () => onNavigateSection(UserSettingsSection.fluxerPlutonium),
      );
    case UserSettingsSection.audioAndVideo:
      return scrollController == null
          ? const UserAudioAndVideo()
          : UserAudioAndVideo(scrollController: scrollController);
    case UserSettingsSection.notifications:
      return scrollController == null
          ? const UserNotificationsSettings()
          : UserNotificationsSettings(scrollController: scrollController);
    case UserSettingsSection.shortcuts:
      if (isTouchPrimary) {
        return const SizedBox.shrink();
      }
      return scrollController == null
          ? const UserShortcuts()
          : UserShortcuts(scrollController: scrollController);
    case UserSettingsSection.applications:
    case UserSettingsSection.limitsConfig:
    case UserSettingsSection.featureFlags:
    case UserSettingsSection.whatsNew:
      return _buildUserSettingsPlaceholder(
        context,
        section,
        scrollController: scrollController,
      );
    case UserSettingsSection.developerTools:
      return scrollController == null
          ? const UserDeveloperTools()
          : UserDeveloperTools(scrollController: scrollController);
    case UserSettingsSection.appLicenses:
      return scrollController == null
          ? const AppLicenses()
          : AppLicenses(scrollController: scrollController);
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
      style: context.textStyles.heading.copyWith(
        color: context.colors.textPrimaryMuted,
        fontSize: 24,
      ),
    ),
  );
  if (scrollController == null) {
    return child;
  }
  return CustomScrollView(
    controller: scrollController,
    slivers: [SliverFillRemaining(hasScrollBody: false, child: child)],
  );
}

class _SettingsBuildInfoFooter extends ConsumerWidget {
  const _SettingsBuildInfoFooter({this.inSidebar = false});

  final bool inSidebar;

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
        final Widget buildInfo = Semantics(
          button: true,
          label: 'Copy app info',
          child: FluxerGestureDetector(
            onTap: () => _copyBuildInfoToClipboard(context, info),
            child: Text(
              text,
              textAlign: inSidebar ? TextAlign.start : TextAlign.center,
              style: context.textStyles.timestamp.copyWith(
                fontSize: 11,
                color: inSidebar
                    ? context.colors.textTertiarySecondary
                    : context.colors.textPrimaryMuted,
              ),
            ),
          ),
        );
        if (inSidebar) {
          return buildInfo;
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
          child: Align(child: buildInfo),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  void _copyBuildInfoToClipboard(BuildContext context, AppRuntimeInfo info) {
    final clipboardText = formatAppDiagnosticClipboardText(info);
    unawaited(copyToClipboard(context: context, value: clipboardText));
  }
}
