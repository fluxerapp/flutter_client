import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_gate.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_tab_body.dart';
import 'package:fluxer_app/features/channels/presentation/delete_channel_flow.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/settings_sidebar.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSettingsModal extends ConsumerStatefulWidget {
  const ChannelSettingsModal({
    required this.channelId,
    this.initialTab = ChannelSettingsTab.overview,
    super.key,
  });

  final String channelId;
  final ChannelSettingsTab initialTab;

  static Future<void> show(
    BuildContext context, {
    required String channelId,
    ChannelSettingsTab? initialTab,
  }) {
    if (initialTab == null) {
      return context.push(RoutePaths.channelSettingsPath(channelId));
    }
    return context.push(
      RoutePaths.channelSettingsPath(
        channelId,
        tab: channelSettingsTabQuery(initialTab),
      ),
    );
  }

  @override
  ConsumerState<ChannelSettingsModal> createState() =>
      _ChannelSettingsModalState();
}

class _ChannelSettingsModalState extends ConsumerState<ChannelSettingsModal> {
  late ChannelSettingsTab _selectedTab = widget.initialTab;

  @override
  Widget build(BuildContext context) {
    return ChannelSettingsGate(
      channelId: widget.channelId,
      builder:
          (
            BuildContext context,
            WidgetRef ref,
            Channel channel,
            int permissions,
          ) {
            final FluxerLocalizations l10n = FluxerLocalizations.of(context);
            final List<ChannelSettingsTab> visibleTabs =
                visibleChannelSettingsTabs(
                  channel: channel,
                  permissions: permissions,
                );
            final ChannelSettingsTab activeTab = resolveChannelSettingsTab(
              requested: _selectedTab,
              visibleTabs: visibleTabs,
            );
            if (activeTab != _selectedTab) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() => _selectedTab = activeTab);
                }
              });
            }
            return _ChannelSettingsDesktopLayout(
              l10n: l10n,
              channel: channel,
              permissions: permissions,
              visibleTabs: visibleTabs,
              activeTab: activeTab,
              onTabSelected: (ChannelSettingsTab tab) {
                setState(() => _selectedTab = tab);
              },
              onDelete: () => unawaited(
                DeleteChannelFlow.confirmAndDelete(
                  context,
                  ref,
                  channel: channel,
                ),
              ),
            );
          },
    );
  }
}

class _ChannelSettingsDesktopLayout extends StatelessWidget {
  const _ChannelSettingsDesktopLayout({
    required this.l10n,
    required this.channel,
    required this.permissions,
    required this.visibleTabs,
    required this.activeTab,
    required this.onTabSelected,
    required this.onDelete,
  });

  final FluxerLocalizations l10n;
  final Channel channel;
  final int permissions;
  final List<ChannelSettingsTab> visibleTabs;
  final ChannelSettingsTab activeTab;
  final ValueChanged<ChannelSettingsTab> onTabSelected;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final bool canDelete = canDeleteChannel(permissions: permissions);
    final List<SettingsSidebarItem> sidebarItems = _buildSidebarItems(
      l10n: l10n,
      channel: channel,
      visibleTabs: visibleTabs,
      canDelete: canDelete,
    );
    final int selectedIndex = visibleTabs.isEmpty
        ? -1
        : visibleTabs.indexOf(activeTab);
    final int deleteIndex = sidebarItems.length - 1;
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 300,
            child: ColoredBox(
              color: context.colors.backgroundPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 20, 16, 12),
                    child: Row(
                      children: <Widget>[
                        ChannelIcon(type: channel.type, channel: channel),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            channel.name,
                            style: context.textStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SettingsSidebar(
                      items: sidebarItems,
                      selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
                      onSelected: (int index) {
                        if (canDelete && index == deleteIndex) {
                          onDelete();
                          return;
                        }
                        if (index >= 0 && index < visibleTabs.length) {
                          onTabSelected(visibleTabs[index]);
                        }
                      },
                    ),
                  ),
                ],
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
                        visibleTabs.isEmpty
                            ? channel.name
                            : channelSettingsTabTitle(l10n, activeTab),
                        style: context.textStyles.heading,
                      ),
                      const Spacer(),
                      InkWell(
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: visibleTabs.isEmpty
                      ? const SizedBox.shrink()
                      : ChannelSettingsTabBody(
                          channel: channel,
                          tab: activeTab,
                          permissions: permissions,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<SettingsSidebarItem> _buildSidebarItems({
  required FluxerLocalizations l10n,
  required Channel channel,
  required List<ChannelSettingsTab> visibleTabs,
  required bool canDelete,
}) {
  final List<SettingsSidebarItem> items = <SettingsSidebarItem>[];
  String? previousCategory;
  for (final ChannelSettingsTab tab in visibleTabs) {
    final String? category = channelSettingsTabCategoryLabel(l10n, tab);
    if (category != null && category != previousCategory) {
      items.add(SettingsSidebarItem.separator(category));
      previousCategory = category;
    }
    items.add(
      SettingsSidebarItem(
        channelSettingsTabTitle(l10n, tab),
        icon: channelSettingsTabIcon(tab),
      ),
    );
  }
  if (canDelete) {
    items
      ..add(const SettingsSidebarItem.separator())
      ..add(
        SettingsSidebarItem(
          channelSettingsDeleteLabel(l10n, channel: channel),
          icon: PhosphorIconsFill.trash,
          isDestructive: true,
        ),
      );
  }
  return items;
}
