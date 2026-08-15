import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:material_ui/material_ui.dart';

Future<bool> tryOpenLinkChannel({
  required BuildContext context,
  required ProviderContainer container,
  required Channel channel,
  bool skipGate = false,
}) async {
  if (channel.type != ChannelType.guildLink) {
    return false;
  }
  final String? channelUrl = channel.url;
  if (channelUrl == null || channelUrl.isEmpty) {
    return false;
  }
  if (!skipGate) {
    final bool canProceed = await promptForChannelGateIfNeeded(
      context: context,
      container: container,
      channelId: channel.id,
      guildId: channel.guildId,
      channelType: channel.type,
    );
    if (!context.mounted || !canProceed) {
      return false;
    }
  }
  unawaited(handleExternalLinkTap(context, channelUrl));
  return true;
}
