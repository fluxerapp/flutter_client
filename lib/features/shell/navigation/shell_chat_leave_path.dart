import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';

String shellChatLeavePath(ProviderContainer container, String shellLocation) {
  final RouteKind kind = classifyRoute(shellLocation);
  if (kind != RouteKind.chat) {
    return RoutePaths.me;
  }
  final String? channelId = extractChannelId(shellLocation);
  if (channelId == null) {
    return RoutePaths.me;
  }

  if (shellLocation.startsWith('${RoutePaths.me}/') ||
      shellLocation == RoutePaths.me) {
    return RoutePaths.me;
  }
  if (shellLocation.startsWith('${RoutePaths.favoritesBase}/')) {
    return RoutePaths.favoritesBase;
  }

  final String? guildId = extractGuildId(shellLocation);
  if (guildId != null) {
    final Channel? channel = container
        .read(channelByIdProvider(channelId))
        .asData
        ?.value;
    if (channel != null) {
      if (channel.type == ChannelType.dm ||
          channel.type == ChannelType.groupDm ||
          channel.type == ChannelType.dmPersonalNotes) {
        return RoutePaths.me;
      }
      if (channel.isThread) {
        final String? parentId = channel.parentId;
        if (parentId != null) {
          return RoutePaths.guildChannel(guildId, parentId);
        }
      }
    }
    return RoutePaths.guild(guildId);
  }

  return deletedChannelExitPath(
        location: shellLocation,
        channelId: channelId,
      ) ??
      RoutePaths.me;
}
