import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_nav_list.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildSettingsNavPage extends ConsumerStatefulWidget {
  const GuildSettingsNavPage({required this.guildId, super.key});

  final String guildId;

  @override
  ConsumerState<GuildSettingsNavPage> createState() =>
      _GuildSettingsNavPageState();
}

class _GuildSettingsNavPageState extends ConsumerState<GuildSettingsNavPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(guildSyncProvider.notifier).syncIfNeeded(widget.guildId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final Guild? guild = ref.watch(guildByIdProvider(widget.guildId)).value;
    final List<GuildSettingsTab> tabs = visibleGuildSettingsTabsForRef(
      ref: ref,
      permissions: permissions,
      guild: guild,
    );
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
        padding: settingsScrollPadding(context),
        groups: _buildNavGroups(l10n, tabs, context, widget.guildId, ref),
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
