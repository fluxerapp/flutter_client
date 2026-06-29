import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_nav_list.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildSettingsNavPage extends ConsumerWidget {
  const GuildSettingsNavPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(guildId),
    );
    final Guild? guild = ref.watch(guildByIdProvider(guildId)).value;
    final List<GuildSettingsTab> tabs = visibleGuildSettingsTabs(
      permissions: permissions,
      guild: guild,
    );
    final layout = context.layout;
    final Color backgroundColor = guildSettingsPageBackgroundColor(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(l10n.guildSettingsCommunitySettings),
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft),
          onPressed: () => context.pop(),
        ),
      ),
      body: FluxerSettingsNavList(
        padding: EdgeInsets.fromLTRB(
          layout.s4,
          layout.s4,
          layout.s4,
          layout.s4,
        ),
        groups: _buildNavGroups(l10n, tabs, context, guildId, ref),
      ),
    );
  }

  List<FluxerSettingsNavGroup> _buildNavGroups(
    FluxerLocalizations l10n,
    List<GuildSettingsTab> tabs,
    BuildContext context,
    String guildId,
    WidgetRef ref,
  ) {
    final List<FluxerSettingsNavGroup> groups = <FluxerSettingsNavGroup>[];
    String? currentCategory;
    List<FluxerSettingsNavItem> currentItems = <FluxerSettingsNavItem>[];
    void flushGroup() {
      if (currentItems.isEmpty) {
        return;
      }
      groups.add(
        FluxerSettingsNavGroup(label: currentCategory, items: currentItems),
      );
      currentItems = <FluxerSettingsNavItem>[];
    }

    for (final GuildSettingsTab tab in tabs) {
      final String? category = guildSettingsTabCategoryLabel(l10n, tab);
      if (category != currentCategory) {
        flushGroup();
        currentCategory = category;
      }
      final bool isComingSoon = isGuildSettingsTabComingSoon(tab);
      currentItems.add(
        FluxerSettingsNavItem(
          label: guildSettingsTabTitle(l10n, tab),
          icon: guildSettingsTabIcon(tab),
          onTap: () => context.push(guildSettingsTabPath(guildId, tab)),
          isDisabled: isComingSoon,
          onDisabledTap: () {
            ref
                .read(toastProvider.notifier)
                .show(FluxerToast(message: l10n.comingSoon));
          },
        ),
      );
    }
    flushGroup();
    return groups;
  }
}

IconData guildSettingsTabIcon(GuildSettingsTab tab) {
  return switch (tab) {
    GuildSettingsTab.overview => PhosphorIconsFill.gear,
    GuildSettingsTab.roles => PhosphorIconsFill.shield,
    GuildSettingsTab.emoji => PhosphorIconsFill.smiley,
    GuildSettingsTab.stickers => PhosphorIconsFill.sticker,
    GuildSettingsTab.moderation => PhosphorIconsFill.hammer,
    GuildSettingsTab.auditLog => PhosphorIconsFill.bookOpen,
    GuildSettingsTab.webhooks => PhosphorIconsFill.webhooksLogo,
    GuildSettingsTab.discovery => PhosphorIconsFill.compass,
    GuildSettingsTab.members => PhosphorIconsFill.users,
    GuildSettingsTab.invites => PhosphorIconsFill.ticket,
    GuildSettingsTab.bans => PhosphorIconsFill.prohibit,
  };
}
