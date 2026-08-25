import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_modal.dart';
import 'package:fluxer_app/material_ui.dart';

class ChannelSettingsFlow {
  ChannelSettingsFlow._();

  static Future<void> show(
    BuildContext context, {
    required String channelId,
    ChannelSettingsTab? initialTab,
  }) {
    return ChannelSettingsModal.show(
      context,
      channelId: channelId,
      initialTab: initialTab,
    );
  }
}
