import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_roles_settings_bridge.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

List<SettingsSidebarItem> buildGuildSettingsSidebarItems(
  FluxerLocalizations l10n,
  List<GuildSettingsTab> tabs,
) {
  final List<SettingsSidebarItem> items = <SettingsSidebarItem>[];
  String? previousCategory;
  for (final GuildSettingsTab tab in tabs) {
    final String? category = guildSettingsTabCategoryLabel(l10n, tab);
    if (category == null) {
      previousCategory = null;
    } else if (category != previousCategory) {
      items.add(SettingsSidebarItem.separator(category));
      previousCategory = category;
    }
    items.add(
      SettingsSidebarItem(
        guildSettingsTabTitle(l10n, tab),
        icon: guildSettingsTabIcon(tab),
        isDisabled: isGuildSettingsTabComingSoon(tab),
      ),
    );
  }
  return items;
}

class GuildSettingsDesktopSidebar extends StatelessWidget {
  const GuildSettingsDesktopSidebar({
    required this.guild,
    required this.sidebarItems,
    required this.selectedIndex,
    required this.showRolesSidebar,
    required this.rolesBridge,
    required this.onItemSelected,
    required this.onBackToSettings,
    super.key,
  });

  final Guild? guild;
  final List<SettingsSidebarItem> sidebarItems;
  final int selectedIndex;
  final bool showRolesSidebar;
  final GuildRolesSettingsBridge rolesBridge;
  final ValueChanged<int> onItemSelected;
  final VoidCallback onBackToSettings;

  @override
  Widget build(BuildContext context) {
    final Color sidebarBackground = wideSettingsSidebarBackground(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: sidebarBackground,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: SizedBox(
        width: kWideSettingsSidebarWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (guild != null) _GuildSettingsSidebarHeader(guild: guild!),
            Expanded(
              child: AnimatedCrossFade(
                duration: MediaQuery.disableAnimationsOf(context)
                    ? Duration.zero
                    : kWideSettingsSidebarCrossFadeDuration,
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeOut,
                sizeCurve: Curves.easeOut,
                crossFadeState: showRolesSidebar
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                layoutBuilder: wideSettingsSidebarCrossFadeLayout,
                firstChild: SizedBox.expand(
                  child: SettingsSidebar(
                    items: sidebarItems,
                    selectedIndex: selectedIndex,
                    showSearch: false,
                    backgroundColor: Colors.transparent,
                    onSelected: onItemSelected,
                  ),
                ),
                secondChild: SizedBox.expand(
                  child: ListenableBuilder(
                    listenable: rolesBridge,
                    builder: (BuildContext context, Widget? _) {
                      return _GuildSettingsRolesSidebarOverride(
                        rolesBridge: rolesBridge,
                        onBackToSettings: onBackToSettings,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuildSettingsSidebarHeader extends StatelessWidget {
  const _GuildSettingsSidebarHeader({required this.guild});

  final Guild guild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
      child: Row(
        children: <Widget>[
          FluxerGuildIconAvatar(
            name: guild.name,
            imageUrl: guild.iconUrl,
            isUnavailable: guild.unavailable,
            size: 32,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              guild.name,
              style: context.textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _GuildSettingsRolesSidebarOverride extends StatelessWidget {
  const _GuildSettingsRolesSidebarOverride({
    required this.rolesBridge,
    required this.onBackToSettings,
  });

  final GuildRolesSettingsBridge rolesBridge;
  final VoidCallback onBackToSettings;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: GuildRolesSidebarActionButton(
            label: l10n.guildSettingsBackToSettings,
            icon: PhosphorIconsBold.arrowLeft,
            onPressed: onBackToSettings,
          ),
        ),
        Expanded(
          child:
              rolesBridge.sidebar ??
              const Center(child: FluxerLoadingSpinner()),
        ),
      ],
    );
  }
}
