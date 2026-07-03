import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/pages/guild/guild_settings_nav_page.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_bans_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/bans/guild_bans_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_access_gate.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/moderation/guild_moderation_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/overview/guild_overview_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_audit_log_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_bans_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
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

  static Future<void> show(BuildContext context, {required String guildId}) {
    return context.push(RoutePaths.guildSettingsPath(guildId));
  }

  @override
  ConsumerState<GuildSettingsModal> createState() => _GuildSettingsModalState();
}

class _GuildSettingsModalState extends ConsumerState<GuildSettingsModal> {
  late GuildSettingsTab _selectedTab = widget.initialTab;

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
    final List<GuildSettingsTab> visibleTabs = visibleGuildSettingsTabs(
      permissions: permissions,
      guild: guild,
    );
    final GuildSettingsTab activeTab =
        visibleTabs.contains(_selectedTab) || visibleTabs.isEmpty
        ? _selectedTab
        : visibleTabs.first;
    if (activeTab != _selectedTab) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _selectedTab = activeTab);
        }
      });
    }
    final List<SettingsSidebarItem> sidebarItems = _buildSidebarItems(
      l10n,
      visibleTabs,
      ref,
    );
    final int selectedIndex = visibleTabs.indexOf(activeTab);
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 300,
            child: ColoredBox(
              color: context.colors.backgroundPrimary,
              child: SettingsSidebar(
                items: sidebarItems,
                selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
                onSelected: (int index) {
                  if (index >= 0 && index < visibleTabs.length) {
                    final GuildSettingsTab tab = visibleTabs[index];
                    if (isGuildSettingsTabComingSoon(tab)) {
                      ref
                          .read(toastProvider.notifier)
                          .show(FluxerToast(message: l10n.comingSoon));
                      return;
                    }
                    setState(() => _selectedTab = tab);
                  }
                },
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
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 12, 12, 0),
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
                  child: GuildSettingsAccessGate(
                    guildId: widget.guildId,
                    tab: activeTab,
                    child: GuildSettingsTabBody(
                      guildId: widget.guildId,
                      tab: activeTab,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
        PhosphorIconsRegular.x,
        size: 18,
        color: context.colors.interactiveNormal,
      ),
    ),
  );
}

class GuildSettingsTabBody extends ConsumerWidget {
  const GuildSettingsTabBody({
    required this.guildId,
    required this.tab,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final GuildSettingsTab tab;
  final ScrollController? scrollController;

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
      _ => const SizedBox.shrink(),
    };
  }
}

List<SettingsSidebarItem> _buildSidebarItems(
  FluxerLocalizations l10n,
  List<GuildSettingsTab> tabs,
  WidgetRef ref,
) {
  final List<SettingsSidebarItem> items = <SettingsSidebarItem>[];
  String? previousCategory;
  for (final GuildSettingsTab tab in tabs) {
    final String? category = guildSettingsTabCategoryLabel(l10n, tab);
    if (category != null && category != previousCategory) {
      items.add(SettingsSidebarItem.separator(category));
      previousCategory = category;
    }
    final bool isComingSoon = isGuildSettingsTabComingSoon(tab);
    items.add(
      SettingsSidebarItem(
        guildSettingsTabTitle(l10n, tab),
        icon: guildSettingsTabIcon(tab),
        isDisabled: isComingSoon,
      ),
    );
  }
  return items;
}
