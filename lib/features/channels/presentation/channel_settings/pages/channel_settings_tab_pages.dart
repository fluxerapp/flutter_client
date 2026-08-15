import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_gate.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_page_shell.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_tab_body.dart';
import 'package:material_ui/material_ui.dart';

class ChannelSettingsOverviewPage extends ConsumerWidget {
  const ChannelSettingsOverviewPage({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ChannelSettingsTabPage(
      channelId: channelId,
      tab: ChannelSettingsTab.overview,
    );
  }
}

class ChannelSettingsPermissionsPage extends ConsumerWidget {
  const ChannelSettingsPermissionsPage({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ChannelSettingsTabPage(
      channelId: channelId,
      tab: ChannelSettingsTab.permissions,
    );
  }
}

class ChannelSettingsInvitesPage extends ConsumerWidget {
  const ChannelSettingsInvitesPage({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ChannelSettingsTabPage(
      channelId: channelId,
      tab: ChannelSettingsTab.invites,
    );
  }
}

class ChannelSettingsWebhooksPage extends ConsumerWidget {
  const ChannelSettingsWebhooksPage({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ChannelSettingsTabPage(
      channelId: channelId,
      tab: ChannelSettingsTab.webhooks,
    );
  }
}

class _ChannelSettingsTabPage extends ConsumerWidget {
  const _ChannelSettingsTabPage({required this.channelId, required this.tab});

  final String channelId;
  final ChannelSettingsTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChannelSettingsGate(
      channelId: channelId,
      tab: tab,
      builder:
          (
            BuildContext context,
            WidgetRef ref,
            Channel channel,
            int permissions,
          ) => ChannelSettingsPageShell(
            tab: tab,
            body: ChannelSettingsTabBody(
              channel: channel,
              tab: tab,
              permissions: permissions,
            ),
          ),
    );
  }
}
