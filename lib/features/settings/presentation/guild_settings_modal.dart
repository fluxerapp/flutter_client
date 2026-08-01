import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_bans_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invites_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/bans/guild_bans_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channels_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_emoji_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_sticker_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_access_gate.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_desktop_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_open_gate.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invites_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/moderation/guild_moderation_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/overview/guild_overview_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_roles_settings_bridge.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_roles_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_error_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_status_body.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_modal_frame.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_audit_log_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_bans_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_discovery_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_emoji_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_invites_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_sticker_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_webhooks_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildSettingsModal extends ConsumerStatefulWidget {
  const GuildSettingsModal({
    required this.guildId,
    this.initialTab = GuildSettingsTab.overview,
    super.key,
  });

  final String guildId;
  final GuildSettingsTab initialTab;

  static Future<void> show(
    BuildContext context, {
    required String guildId,
    GuildSettingsTab? initialTab,
  }) {
    if (isMobileLayout(context)) {
      if (initialTab == null) {
        return context.push(RoutePaths.guildSettingsPath(guildId));
      }
      return context.push(
        RoutePaths.guildSettingsPath(
          guildId,
          tab: guildSettingsTabQuery(initialTab),
        ),
      );
    }

    return showWideSettingsBottomSheet(
      context,
      child: GuildSettingsOpenGate(
        guildId: guildId,
        builder: (BuildContext context) => GuildSettingsModal(
          guildId: guildId,
          initialTab: initialTab ?? GuildSettingsTab.overview,
        ),
      ),
    );
  }

  @override
  ConsumerState<GuildSettingsModal> createState() => _GuildSettingsModalState();
}

class _GuildSettingsModalState extends ConsumerState<GuildSettingsModal> {
  late GuildSettingsTab _selectedTab = widget.initialTab;
  final GuildRolesSettingsBridge _rolesBridge = GuildRolesSettingsBridge();
  bool _rolesSidebarDismissed = false;

  @override
  void dispose() {
    _rolesBridge.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(guildSyncProvider.notifier).syncIfNeeded(widget.guildId);
      if (widget.initialTab == GuildSettingsTab.members &&
          !isMobileLayout(context)) {
        context.pop();
        unawaited(context.push(RoutePaths.guildMembers(widget.guildId)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final AsyncValue<Guild?> guildAsync = ref.watch(
      guildByIdProvider(widget.guildId),
    );
    final Guild? guild = guildAsync.value;
    final List<GuildSettingsTab> visibleTabs = visibleGuildSettingsTabsForRef(
      ref: ref,
      permissions: permissions,
      guild: guild,
    );
    final GuildSettingsTab activeTab = visibleTabs.isEmpty
        ? _selectedTab
        : visibleTabs.contains(_selectedTab)
        ? _selectedTab
        : visibleTabs.first;
    if (activeTab != _selectedTab) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _selectedTab = activeTab);
        }
      });
    }
    final List<SettingsSidebarItem> sidebarItems =
        buildGuildSettingsSidebarItems(l10n, visibleTabs);
    final int sidebarSelectedIndex = settingsSidebarIndexForLabel(
      sidebarItems,
      guildSettingsTabTitle(l10n, activeTab),
    );
    final double contentGutter = wideSettingsContentEdgeGutter(context);
    final Color contentBackground = wideSettingsContentBackground(context);
    final bool showRolesSidebar =
        activeTab == GuildSettingsTab.roles && !_rolesSidebarDismissed;

    return WideSettingsModalFrame(
      includeOuterPadding: false,
      backgroundColor: contentBackground,
      child: Scaffold(
        backgroundColor: contentBackground,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GuildSettingsDesktopSidebar(
              guild: guild,
              sidebarItems: sidebarItems,
              selectedIndex: sidebarSelectedIndex,
              showRolesSidebar: showRolesSidebar,
              rolesBridge: _rolesBridge,
              onItemSelected: (int index) => _handleSettingsSidebarSelected(
                l10n: l10n,
                sidebarItems: sidebarItems,
                visibleTabs: visibleTabs,
                index: index,
              ),
              onBackToSettings: () =>
                  setState(() => _rolesSidebarDismissed = true),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: contentGutter),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text(
                            guildSettingsTabTitle(l10n, activeTab),
                            style: context.textStyles.heading,
                          ),
                          const Spacer(),
                          _buildCloseButton(context),
                        ],
                      ),
                    ),
                    Expanded(
                      child: WideSettingsContentLayout(
                        includeHorizontalGutter: false,
                        child: GuildSettingsAccessGate(
                          guildId: widget.guildId,
                          tab: activeTab,
                          child: GuildSettingsTabBody(
                            guildId: widget.guildId,
                            tab: activeTab,
                            rolesBridge: _rolesBridge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) => InkWell(
    onTap: () => context.pop(),
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

  void _handleSettingsSidebarSelected({
    required FluxerLocalizations l10n,
    required List<SettingsSidebarItem> sidebarItems,
    required List<GuildSettingsTab> visibleTabs,
    required int index,
  }) {
    final String? label = settingsSidebarLabelAtIndex(sidebarItems, index);
    if (label == null) {
      return;
    }
    for (final GuildSettingsTab tab in visibleTabs) {
      if (guildSettingsTabTitle(l10n, tab) != label) {
        continue;
      }
      if (isGuildSettingsTabComingSoon(tab)) {
        ref
            .read(toastProvider.notifier)
            .show(FluxerToast(message: l10n.comingSoon));
        return;
      }
      if (tab == GuildSettingsTab.members) {
        context.pop();
        unawaited(context.push(RoutePaths.guildMembers(widget.guildId)));
        return;
      }
      setState(() {
        _rolesSidebarDismissed = tab != GuildSettingsTab.roles;
        _selectedTab = tab;
      });
      return;
    }
  }
}

class GuildSettingsTabBody extends ConsumerWidget {
  const GuildSettingsTabBody({
    required this.guildId,
    required this.tab,
    this.scrollController,
    this.rolesBridge,
    super.key,
  });

  final String guildId;
  final GuildSettingsTab tab;
  final ScrollController? scrollController;
  final GuildRolesSettingsBridge? rolesBridge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    if (isGuildSettingsTabComingSoon(tab)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsFill.clockCountdown,
              size: 64,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.comingSoon,
              style: context.textStyles.heading.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ],
        ),
      );
    }

    return switch (tab) {
      GuildSettingsTab.overview => GuildSettingsAsyncBody<GuildSettingsDetails>(
        value: ref.watch(guildSettingsOverviewProvider(guildId)),
        scrollController: scrollController,
        usesSettingsSheet: true,
        data: (GuildSettingsDetails details) => GuildOverviewWidget(
          guildId: guildId,
          details: details,
          scrollController: scrollController,
        ),
      ),
      GuildSettingsTab.moderation =>
        GuildSettingsAsyncBody<GuildSettingsDetails>(
          value: ref.watch(guildSettingsModerationProvider(guildId)),
          scrollController: scrollController,
          usesSettingsSheet: true,
          data: (GuildSettingsDetails details) => GuildModerationWidget(
            guildId: guildId,
            details: details,
            scrollController: scrollController,
          ),
        ),
      GuildSettingsTab.auditLog => GuildSettingsAsyncBody<GuildAuditLogState>(
        value: ref.watch(guildAuditLogProvider(guildId)),
        scrollController: scrollController,
        usesSettingsSheet: true,
        data: (GuildAuditLogState state) =>
            GuildAuditLogWidget(guildId: guildId, state: state),
      ),
      GuildSettingsTab.bans => GuildSettingsAsyncBody<GuildBansState>(
        value: ref.watch(guildBansProvider(guildId)),
        scrollController: scrollController,
        usesSettingsSheet: true,
        data: (GuildBansState state) => GuildBansWidget(
          guildId: guildId,
          state: state,
          scrollController: scrollController,
        ),
      ),
      GuildSettingsTab.invites => GuildSettingsAsyncBody<GuildInvitesState>(
        value: ref.watch(guildInvitesProvider(guildId)),
        scrollController: scrollController,
        usesSettingsSheet: true,
        data: (GuildInvitesState state) => GuildInvitesWidget(
          guildId: guildId,
          state: state,
          scrollController: scrollController,
        ),
      ),
      GuildSettingsTab.channels => GuildChannelsSettingsWidget(
        guildId: guildId,
      ),
      GuildSettingsTab.roles => GuildRolesSettingsWidget(
        guildId: guildId,
        bridge: rolesBridge,
        embedSidebarInParent: rolesBridge != null,
      ),
      GuildSettingsTab.emoji => GuildSettingsAsyncBody<GuildEmojiSettingsState>(
        value: ref.watch(guildEmojiSettingsProvider(guildId)),
        scrollController: scrollController,
        usesSettingsSheet: true,
        data: (GuildEmojiSettingsState state) => GuildEmojiSettingsWidget(
          guildId: guildId,
          state: state,
          scrollController: scrollController,
        ),
      ),
      GuildSettingsTab.stickers =>
        GuildSettingsAsyncBody<GuildStickerSettingsState>(
          value: ref.watch(guildStickerSettingsProvider(guildId)),
          scrollController: scrollController,
          usesSettingsSheet: true,
          data: (GuildStickerSettingsState state) => GuildStickerSettingsWidget(
            guildId: guildId,
            state: state,
            scrollController: scrollController,
          ),
        ),
      GuildSettingsTab.webhooks =>
        ref
            .watch(guildWebhooksProvider(guildId))
            .when(
              loading: () =>
                  GuildWebhooksLoadingBody(scrollController: scrollController),
              error: (Object error, StackTrace stackTrace) =>
                  GuildWebhooksStatusBody(
                    scrollController: scrollController,
                    child: GuildWebhooksErrorState(
                      onRetry: () => unawaited(
                        ref
                            .read(guildWebhooksProvider(guildId).notifier)
                            .reload(),
                      ),
                    ),
                  ),
              data: (List<WebhookResponse> webhooks) => GuildWebhooksWidget(
                guildId: guildId,
                webhooks: webhooks,
                scrollController: scrollController,
              ),
            ),
      GuildSettingsTab.discovery =>
        GuildSettingsAsyncBody<GuildDiscoverySettingsState>(
          value: ref.watch(guildDiscoverySettingsProvider(guildId)),
          scrollController: scrollController,
          usesSettingsSheet: true,
          data: (GuildDiscoverySettingsState state) =>
              GuildDiscoverySettingsWidget(
                guildId: guildId,
                state: state,
                scrollController: scrollController,
              ),
        ),
      GuildSettingsTab.members => const SizedBox.shrink(),
    };
  }
}
