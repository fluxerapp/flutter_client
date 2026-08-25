import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_gate.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_page_shell.dart';
import 'package:fluxer_app/features/channels/presentation/delete_channel_flow.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_nav_list.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSettingsNavPage extends ConsumerWidget {
  const ChannelSettingsNavPage({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChannelSettingsGate(
      channelId: channelId,
      builder:
          (
            BuildContext context,
            WidgetRef ref,
            Channel channel,
            int permissions,
          ) {
            final FluxerLocalizations l10n = FluxerLocalizations.of(context);
            final Color backgroundColor = channelSettingsPageBackgroundColor(
              context,
            );
            final List<ChannelSettingsTab> visibleTabs =
                visibleChannelSettingsTabs(
                  channel: channel,
                  permissions: permissions,
                );
            final bool canDelete = canDeleteChannel(permissions: permissions);
            return Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                backgroundColor: backgroundColor,
                elevation: 0,
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                leading: IconButton(
                  icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft),
                  onPressed: () => context.pop(),
                ),
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ChannelIcon(type: channel.type, channel: channel),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        channel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                actions: const <Widget>[SizedBox(width: 48)],
              ),
              body: FluxerSettingsNavList(
                padding: EdgeInsets.fromLTRB(
                  context.layout.s4,
                  context.layout.s4,
                  context.layout.s4,
                  context.layout.s4,
                ),
                groups: _buildNavGroups(
                  context: context,
                  l10n: l10n,
                  channelId: channelId,
                  visibleTabs: visibleTabs,
                ),
                footer: canDelete
                    ? Padding(
                        padding: EdgeInsets.only(top: context.layout.s2),
                        child: FluxerMenuGroup(
                          children: <Widget>[
                            FluxerBottomSheetMenuItem(
                              label: channelSettingsDeleteLabel(
                                l10n,
                                channel: channel,
                              ),
                              icon: PhosphorIconsFill.trash,
                              isDanger: true,
                              onTap: () => unawaited(
                                DeleteChannelFlow.confirmAndDelete(
                                  context,
                                  ref,
                                  channel: channel,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            );
          },
    );
  }
}

List<FluxerSettingsNavGroup> _buildNavGroups({
  required BuildContext context,
  required FluxerLocalizations l10n,
  required String channelId,
  required List<ChannelSettingsTab> visibleTabs,
}) {
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

  for (final ChannelSettingsTab tab in visibleTabs) {
    final String? category = channelSettingsTabCategoryLabel(l10n, tab);
    if (category != currentCategory) {
      flushGroup();
      currentCategory = category;
    }
    currentItems.add(
      FluxerSettingsNavItem(
        label: channelSettingsTabTitle(l10n, tab),
        icon: channelSettingsTabIcon(tab),
        onTap: () => context.push(channelSettingsTabPath(channelId, tab)),
      ),
    );
  }
  flushGroup();
  return groups;
}
