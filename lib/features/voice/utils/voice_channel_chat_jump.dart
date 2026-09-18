import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';

/// Jump target for a voice channel text-chat surface.
String? resolveVoiceChannelChatJumpTarget({
  required String channelId,
  required String? routeTarget,
  required ChannelJumpTargetConsumption consumption,
}) {
  final String? fromRoute = resolveEffectiveChannelJumpTarget(
    channelId: channelId,
    routeTarget: routeTarget,
    consumption: consumption,
  );
  if (fromRoute != null) {
    return fromRoute;
  }
  return resolveEffectiveChannelJumpTarget(
    channelId: channelId,
    routeTarget: consumption.latestIntentByChannel[channelId],
    consumption: consumption,
  );
}
