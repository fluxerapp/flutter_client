import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/link_channel_navigator.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_access_denied_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';

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

final class ChannelJumpOpenLink extends ChannelJumpResolution {
  const ChannelJumpOpenLink({required this.channelId, required this.guildId});

  final String channelId;
  final String guildId;
}

final class ChannelJumpRedirectGuild extends ChannelJumpResolution {
  const ChannelJumpRedirectGuild({required this.guildId});

  final String guildId;
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
  talker.debug(
    '[ChannelJump] resolve scope=${link.scope} channel=${link.channelId} message=$messageId',
  );
  if (!link.isDm) {
    final db.FluxerDatabase database = container.read(fluxerDatabaseProvider);
    final db.Channel? channel = await database.channelDao.getChannelById(
      link.channelId,
    );
    if (channel == null) {
      final bool isGatewayReady = container.read(gatewayReadyProvider);
      talker.debug(
        '[ChannelJump] channel not found; gatewayReady=$isGatewayReady',
      );
      if (!isGatewayReady) {
        final String path = buildChannelJumpRoutePath(
          channelId: link.channelId,
          guildId: link.scope,
          messageId: messageId,
        );
        talker.debug('[ChannelJump] pending path=$path');
        return ChannelJumpPending(path: path);
      }
      return const ChannelJumpAccessDenied();
    }
    if (ChannelType.fromWire(channel.type) == ChannelType.guildLink) {
      return ChannelJumpOpenLink(
        channelId: link.channelId,
        guildId: channel.guildId,
      );
    }
    if (ChannelType.fromWire(channel.type) == ChannelType.guildCategory) {
      return ChannelJumpRedirectGuild(guildId: channel.guildId);
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
  final bool isInPlace =
      messageId != null && messageId.isNotEmpty && activeChannelId == channelId;
  talker.debug(
    '[ChannelJump] activeChannel=$activeChannelId channel=$channelId inPlace=$isInPlace',
  );
  if (isInPlace) {
    return ChannelJumpInPlace(channelId: channelId, messageId: messageId);
  }
  talker.debug('[ChannelJump] navigate path=$path');
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
}) async {
  switch (resolution) {
    case ChannelJumpAccessDenied():
      final BuildContext? sheetContext = (context != null && context.mounted)
          ? context
          : _rootContext();
      if (sheetContext != null) {
        await showChannelAccessDeniedSheet(sheetContext);
      } else {
        talker.debug(
          '[ChannelJump] access denied with no context to report it',
        );
      }
    case ChannelJumpPending(:final path):
      container.read(pendingPushNotificationPathProvider.notifier).store(path);
    case ChannelJumpInPlace(:final channelId, :final messageId):
      // A fresh jump intent: re-opens consumption so a deliberate repeat tap
      // on the same message is honoured rather than treated as already done.
      container
          .read(channelJumpTargetLedgerProvider.notifier)
          .request(channelId: channelId, messageId: messageId);
      await container
          .read(chatViewModelProvider.notifier)
          .goToRepliedMessage(channelId: channelId, messageId: messageId);
    case ChannelJumpOpenLink(:final channelId):
      final db.Channel? channel = await container
          .read(fluxerDatabaseProvider)
          .channelDao
          .getChannelById(channelId);
      if (channel == null) {
        return;
      }
      // Re-resolve after the await: the sheet that owned the original
      // context is routinely dismissed by the tap that started the jump.
      final BuildContext? linkContext = (context != null && context.mounted)
          ? context
          : _rootContext();
      if (linkContext == null || !linkContext.mounted) {
        return;
      }
      await tryOpenLinkChannel(
        context: linkContext,
        container: container,
        channel: Channel.fromRow(channel),
      );
    case ChannelJumpRedirectGuild(:final guildId):
      _navigateToPathViaContainer(container, RoutePaths.guild(guildId));
    case ChannelJumpNavigate(:final path, :final channelId, :final messageId):
      final db.Channel? channel = await container
          .read(fluxerDatabaseProvider)
          .channelDao
          .getChannelById(channelId);
      // Always consult the gate. It answers "is a gate required" from the
      // container alone, so an ungated channel still navigates without any
      // context, and a gated one fails closed when there is nothing to show
      // the prompt on. Skipping the call when the context is dead is what
      // used to walk straight past the gate.
      final BuildContext? gateContext = (context != null && context.mounted)
          ? context
          : _rootContext();
      final bool canProceed = await promptForChannelGateIfNeeded(
        context: (gateContext != null && gateContext.mounted)
            ? gateContext
            : null,
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
      if (messageId != null && messageId.isNotEmpty) {
        // Same fresh-intent reset as the in-place branch: the route is about to
        // carry this message id durably, so consumption must start open.
        container
            .read(channelJumpTargetLedgerProvider.notifier)
            .request(channelId: channelId, messageId: messageId);
      }
      _navigateToPathViaContainer(container, path);
  }
}

/// The root navigator's context, or null when it is not usable.
///
/// Callers fall back to this so a dismissed sheet degrades to the root
/// navigator instead of silently disabling gates and dialogs.
BuildContext? _rootContext() {
  final BuildContext? root = rootNavigatorKey.currentContext;
  return (root != null && root.mounted) ? root : null;
}

void _navigateToPathViaContainer(ProviderContainer container, String path) {
  navigateToContentViaContainer(container, path);
}

/// Jumps to [link].
///
/// Takes a [ProviderContainer] rather than a `WidgetRef` on purpose: callers
/// routinely dismiss the widget that started the jump, and a ref or context
/// captured inside this call chain would be dead by the time the awaits
/// finish. Capture the container before the first await and pass it here.
Future<void> navigateToChannelJumpLink({
  required ProviderContainer container,
  required ChannelJumpLink link,
  BuildContext? context,
}) {
  return _navigateToChannelJumpLink(
    container: container,
    context: context,
    link: link,
  );
}

Future<void> navigateToChannelJumpLinkFromContext({
  required BuildContext context,
  required ChannelJumpLink link,
}) {
  if (!context.mounted) {
    return Future<void>.value();
  }
  return _navigateToChannelJumpLink(
    container: ProviderScope.containerOf(context),
    context: context,
    link: link,
  );
}

/// Resolves and applies a jump.
///
/// The container is captured by the caller before any await, because the
/// widget that started the jump is routinely dismissed by the same tap. The
/// context is carried only so gates and dialogs have somewhere to appear, and
/// is re-checked at each use rather than gating the whole operation.
Future<void> _navigateToChannelJumpLink({
  required ProviderContainer container,
  required ChannelJumpLink link,
  BuildContext? context,
}) async {
  talker.debug('[ChannelJump] link=$link');
  final ChannelJumpResolution resolution = await resolveChannelJumpLink(
    container: container,
    link: link,
  );
  await _applyChannelJumpResolution(
    container: container,
    resolution: resolution,
    context: (context != null && context.mounted) ? context : null,
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
  if (guildChannel == null) {
    talker.warning(
      '[ChannelJump] navigateToChannelMessage channel=$channelId not found; '
      'aborting jump',
    );
    return;
  }
  final ChannelJumpLink link = MessageJumpLink(
    scope: guildChannel.guildId,
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
  talker.debug('[ChannelJump] via link=$link');
  final ProviderContainer container = ref.container;
  final ChannelJumpResolution resolution = await resolveChannelJumpLink(
    container: container,
    link: link,
  );
  await _applyChannelJumpResolution(
    container: container,
    resolution: resolution,
    context: (context != null && context.mounted) ? context : null,
  );
}
