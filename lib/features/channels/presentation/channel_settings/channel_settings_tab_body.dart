import 'package:flutter/material.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_invites_widget.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_overview_widget.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_permissions_settings_widget.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_webhooks_widget.dart';

class ChannelSettingsTabBody extends StatelessWidget {
  const ChannelSettingsTabBody({
    required this.channel,
    required this.tab,
    required this.permissions,
    this.scrollController,
    super.key,
  });

  final Channel channel;
  final ChannelSettingsTab tab;
  final int permissions;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return switch (tab) {
      ChannelSettingsTab.overview => ChannelOverviewWidget(
        channel: channel,
        permissions: permissions,
        scrollController: scrollController,
      ),
      ChannelSettingsTab.permissions => ChannelPermissionsSettingsWidget(
        channel: channel,
        permissions: permissions,
        scrollController: scrollController,
      ),
      ChannelSettingsTab.invites => ChannelInvitesWidget(
        channel: channel,
        permissions: permissions,
        scrollController: scrollController,
      ),
      ChannelSettingsTab.webhooks => ChannelWebhooksWidget(
        channel: channel,
        permissions: permissions,
        scrollController: scrollController,
      ),
    };
  }
}
