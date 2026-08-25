import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';
import 'package:fluxer_app/material_ui.dart';

/// Opens a favorited channel while keeping the user in the favorites shell.
Future<void> navigateToFavoriteChannel({
  required BuildContext context,
  required WidgetRef ref,
  required String channelId,
  String? guildId,
  Channel? channel,
  String? messageId,
}) async {
  final String chatPath = messageId == null || messageId.isEmpty
      ? RoutePaths.favoritesChannel(channelId)
      : RoutePaths.favoritesChannelMessage(channelId, messageId);
  final bool isDm = guildId == null || guildId.isEmpty;

  if (isDm) {
    final bool canProceed = await promptForChannelGateIfNeeded(
      context: context,
      container: ref.container,
      channelId: channelId,
    );
    if (!context.mounted || !canProceed) {
      return;
    }
    navigateToContent(context, chatPath);
    return;
  }

  final Channel? resolvedChannel =
      channel ?? await loadGuildChannelById(ref, channelId);
  if (!context.mounted) {
    return;
  }
  if (resolvedChannel != null) {
    await openGuildChannelContent(
      context: context,
      ref: ref,
      guildId: guildId,
      channel: resolvedChannel,
      chatPath: chatPath,
    );
    return;
  }

  final bool canProceed = await promptForChannelGateIfNeeded(
    context: context,
    container: ref.container,
    channelId: channelId,
    guildId: guildId,
  );
  if (!context.mounted || !canProceed) {
    return;
  }
  navigateToContent(context, chatPath);
}
