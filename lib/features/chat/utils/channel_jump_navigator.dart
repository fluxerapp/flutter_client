import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_access_denied_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

/// Builds the in-app route for a resolved channel jump target.
String buildChannelJumpRoutePath({
  required String channelId,
  String? guildId,
  String? messageId,
}) {
  final bool isDm = guildId == null || guildId.isEmpty;
  if (isDm) {
    if (messageId != null && messageId.isNotEmpty) {
      return RoutePaths.dmChannelMessage(channelId, messageId);
    }
    return RoutePaths.dmChannel(channelId);
  }
  if (messageId != null && messageId.isNotEmpty) {
    return RoutePaths.guildChannelMessage(guildId, channelId, messageId);
  }
  return RoutePaths.guildChannel(guildId, channelId);
}

/// Parses `/channels/...` path segments into a [ChannelJumpLink], or null.
ChannelJumpLink? channelJumpLinkFromPathSegments(List<String> segments) {
  if (segments.isEmpty || segments.first != 'channels') {
    return null;
  }
  if (segments.length >= 4) {
    return MessageJumpLink(
      scope: segments[1],
      channelId: segments[2],
      messageId: segments[3],
    );
  }
  if (segments.length >= 3) {
    return ChannelJumpLink(scope: segments[1], channelId: segments[2]);
  }
  return null;
}

sealed class ChannelJumpResolution {
  const ChannelJumpResolution();
}

final class ChannelJumpAccessDenied extends ChannelJumpResolution {
  const ChannelJumpAccessDenied();
}

final class ChannelJumpPending extends ChannelJumpResolution {
  const ChannelJumpPending({required this.path});

  final String path;
}

final class ChannelJumpInPlace extends ChannelJumpResolution {
  const ChannelJumpInPlace({required this.channelId, required this.messageId});

  final String channelId;
  final String messageId;
}

final class ChannelJumpNavigate extends ChannelJumpResolution {
  const ChannelJumpNavigate({
    required this.path,
    required this.channelId,
    this.messageId,
  });

  final String path;
  final String channelId;
  final String? messageId;
}

Future<ChannelJumpResolution> resolveChannelJumpLink({
  required ProviderContainer container,
  required ChannelJumpLink link,
}) async {
  final String? messageId = link is MessageJumpLink ? link.messageId : null;
  if (!link.isDm) {
    final db.FluxerDatabase database = container.read(fluxerDatabaseProvider);
    final db.Channel? channel = await database.channelDao.getChannelById(
      link.channelId,
    );
    if (channel == null) {
      final String path = buildChannelJumpRoutePath(
        channelId: link.channelId,
        guildId: link.isDm ? null : link.scope,
        messageId: messageId,
      );
      return ChannelJumpPending(path: path);
    }
    final String path = buildChannelJumpRoutePath(
      channelId: link.channelId,
      guildId: channel.guildId,
      messageId: messageId,
    );
    return _resolveNavigation(
      container: container,
      channelId: link.channelId,
      messageId: messageId,
      path: path,
    );
  }
  final String path = buildChannelJumpRoutePath(
    channelId: link.channelId,
    messageId: messageId,
  );
  return _resolveNavigation(
    container: container,
    channelId: link.channelId,
    messageId: messageId,
    path: path,
  );
}

ChannelJumpResolution _resolveNavigation({
  required ProviderContainer container,
  required String channelId,
  required String? messageId,
  required String path,
}) {
  final String? activeChannelId = container.read(activeChannelIdProvider);
  if (messageId != null &&
      messageId.isNotEmpty &&
      activeChannelId == channelId) {
    return ChannelJumpInPlace(channelId: channelId, messageId: messageId);
  }
  return ChannelJumpNavigate(
    path: path,
    channelId: channelId,
    messageId: messageId,
  );
}

Future<void> _applyChannelJumpResolution({
  required ProviderContainer container,
  required ChannelJumpResolution resolution,
  BuildContext? context,
  void Function(String path)? navigateToPath,
}) async {
  switch (resolution) {
    case ChannelJumpAccessDenied():
      final BuildContext? sheetContext =
          context ?? rootNavigatorKey.currentContext;
      if (sheetContext != null && sheetContext.mounted) {
        await showChannelAccessDeniedSheet(sheetContext);
      }
    case ChannelJumpPending(:final path):
      container.read(pendingPushNotificationPathProvider.notifier).store(path);
    case ChannelJumpInPlace(:final channelId, :final messageId):
      await container
          .read(chatViewModelProvider.notifier)
          .goToRepliedMessage(channelId: channelId, messageId: messageId);
    case ChannelJumpNavigate(:final path, :final channelId):
      final BuildContext? gateContext =
          context ?? rootNavigatorKey.currentContext;
      if (gateContext != null && gateContext.mounted) {
        final db.Channel? channel = await container
            .read(fluxerDatabaseProvider)
            .channelDao
            .getChannelById(channelId);
        if (!gateContext.mounted) {
          return;
        }
        final bool canProceed = await promptForChannelGateIfNeeded(
          context: gateContext,
          container: container,
          channelId: channelId,
          guildId: channel?.guildId,
          channelType: channel == null
              ? null
              : ChannelType.fromWire(channel.type),
        );
        if (!canProceed) {
          return;
        }
      }
      if (navigateToPath != null) {
        navigateToPath(path);
      } else {
        _navigateToPathViaContainer(container, path);
      }
  }
}

void _navigateToPathViaContainer(ProviderContainer container, String path) {
  final RevealSide? eager = eagerRevealSideFor(path);
  if (eager != null) {
    container.read(currentRevealSideProvider.notifier).set(eager);
    container.read(drawerRevealSyncTriggerProvider.notifier).nudge();
  }
  container.read(fluxerRouterProvider).go(path);
}

Future<void> navigateToChannelJumpLink({
  required WidgetRef ref,
  required BuildContext context,
  required ChannelJumpLink link,
}) {
  return navigateToChannelJumpLinkFromContext(context: context, link: link);
}

Future<void> navigateToChannelJumpLinkFromContext({
  required BuildContext context,
  required ChannelJumpLink link,
}) async {
  if (!context.mounted) {
    return;
  }
  final ProviderContainer container = ProviderScope.containerOf(context);
  final ChannelJumpResolution resolution = await resolveChannelJumpLink(
    container: container,
    link: link,
  );
  if (!context.mounted) {
    return;
  }
  await _applyChannelJumpResolution(
    container: container,
    resolution: resolution,
    context: context,
    navigateToPath: (String path) => navigateToContent(context, path),
  );
}

Future<void> navigateToChannelMessage({
  required Ref ref,
  required String channelId,
  required String messageId,
  BuildContext? context,
}) async {
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final db.Channel? guildChannel = await database.channelDao.getChannelById(
    channelId,
  );
  if (context != null && !context.mounted) {
    return;
  }
  final ChannelJumpLink link = MessageJumpLink(
    scope: guildChannel?.guildId ?? '@me',
    channelId: channelId,
    messageId: messageId,
  );
  await navigateToChannelJumpLinkVia(ref: ref, link: link, context: context);
}

Future<void> navigateToChannelJumpLinkVia({
  required Ref ref,
  required ChannelJumpLink link,
  BuildContext? context,
}) async {
  final ProviderContainer container = ref.container;
  final ChannelJumpResolution resolution = await resolveChannelJumpLink(
    container: container,
    link: link,
  );
  if (context != null && !context.mounted) {
    return;
  }
  await _applyChannelJumpResolution(
    container: container,
    resolution: resolution,
    context: context,
  );
}
