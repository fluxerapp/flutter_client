import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';
import 'package:fluxer_app/features/quick_switcher/providers/recent_channel_visits_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_join_bottom_sheet.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

/// Opens a channel from the guild sidebar or DM list.
Future<void> navigateToChannelContent({
  required BuildContext context,
  required WidgetRef ref,
  required String channelId,
  String? guildId,
  Channel? channel,
  String? messageId,
}) async {
  final bool isDm = guildId == null || guildId.isEmpty;
  if (isDm) {
    await navigateToDmChannelContent(
      context: context,
      ref: ref,
      channelId: channelId,
      messageId: messageId,
    );
    return;
  }

  final Channel? resolvedChannel =
      channel ?? await loadGuildChannelById(ref, channelId);
  if (!context.mounted) {
    return;
  }
  if (resolvedChannel != null) {
    final String chatPath = _guildChannelRoutePath(
      guildId: guildId,
      channelId: resolvedChannel.id,
      messageId: messageId,
    );
    await openGuildChannelContent(
      context: context,
      ref: ref,
      guildId: guildId,
      channel: resolvedChannel,
      chatPath: chatPath,
    );
    return;
  }

  await navigateToChannelJumpLinkFromContext(
    context: context,
    link: ChannelJumpLink(scope: guildId, channelId: channelId),
  );
}

Future<void> navigateToDmChannelContent({
  required BuildContext context,
  required WidgetRef ref,
  required String channelId,
  String? messageId,
}) async {
  final bool canProceed = await promptForChannelGateIfNeeded(
    context: context,
    container: ref.container,
    channelId: channelId,
  );
  if (!context.mounted || !canProceed) {
    return;
  }
  final String path = messageId == null || messageId.isEmpty
      ? RoutePaths.dmChannel(channelId)
      : RoutePaths.dmChannelMessage(channelId, messageId);
  ref
      .read(recentChannelVisitsProvider.notifier)
      .recordVisit(channelId: channelId);
  navigateToContent(context, path);
}

Future<void> navigateToGuildChannelContent({
  required BuildContext context,
  required WidgetRef ref,
  required String guildId,
  required Channel channel,
  String? messageId,
  int? effectivePermissionBits,
}) async {
  final String chatPath = _guildChannelRoutePath(
    guildId: guildId,
    channelId: channel.id,
    messageId: messageId,
  );
  await openGuildChannelContent(
    context: context,
    ref: ref,
    guildId: guildId,
    channel: channel,
    chatPath: chatPath,
    effectivePermissionBits: effectivePermissionBits,
  );
}

String _guildChannelRoutePath({
  required String guildId,
  required String channelId,
  String? messageId,
}) {
  if (messageId == null || messageId.isEmpty) {
    return RoutePaths.guildChannel(guildId, channelId);
  }
  return RoutePaths.guildChannelMessage(guildId, channelId, messageId);
}

Future<void> openGuildChannelContent({
  required BuildContext context,
  required WidgetRef ref,
  required String guildId,
  required Channel channel,
  required String chatPath,
  int? effectivePermissionBits,
}) async {
  if (channel.type == ChannelType.link) {
    final bool canProceed = await promptForChannelGateIfNeeded(
      context: context,
      container: ref.container,
      channelId: channel.id,
      guildId: guildId,
      channelType: channel.type,
    );
    if (!context.mounted || !canProceed) {
      return;
    }
    final String? channelUrl = channel.url;
    if (channelUrl != null && channelUrl.isNotEmpty) {
      unawaited(handleExternalLinkTap(context, channelUrl));
    }
    return;
  }

  final bool canProceed = await promptForChannelGateIfNeeded(
    context: context,
    container: ref.container,
    channelId: channel.id,
    guildId: guildId,
    channelType: channel.type,
  );
  if (!context.mounted || !canProceed) {
    return;
  }

  final int? permissionBits =
      effectivePermissionBits ??
      ref.read(effectiveGuildChannelPermissionBitsProvider(channel.id)).value;
  final int? localConnectBits = channel.type == ChannelType.voice
      ? ref
            .read(channelLocalGuildChannelPermissionBitsProvider(channel.id))
            .value
      : null;
  final VoiceSessionState voiceSession = ref.read(voiceSessionProvider);
  final bool isInCurrentVoiceChannel =
      channel.type == ChannelType.voice &&
      voiceSession.isInVoice &&
      voiceSession.guildId == guildId &&
      voiceSession.channelId == channel.id;

  void recordAndNavigate() {
    ref
        .read(recentChannelVisitsProvider.notifier)
        .recordVisit(channelId: channel.id, guildId: guildId);
    navigateToContent(context, chatPath);
  }

  if (channel.type == ChannelType.voice && isMobileLayout(context)) {
    if (isInCurrentVoiceChannel) {
      recordAndNavigate();
      return;
    }
    final VoiceChannelJoinSheetResult? joinResult =
        await showVoiceChannelJoinBottomSheet(
          context,
          channelName: channel.name,
          guildId: guildId,
          channelId: channel.id,
        );
    if (!context.mounted || joinResult == null) {
      return;
    }
    switch (joinResult) {
      case VoiceChannelJoinOpenChat():
        ref
            .read(recentChannelVisitsProvider.notifier)
            .recordVisit(channelId: channel.id, guildId: guildId);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            unawaited(
              showVoiceChannelChatSheet(
                context,
                channelId: channel.id,
                channelName: channel.name,
              ),
            );
          }
        });
      case VoiceChannelJoinConnectResult(
        :final initialSelfMute,
        :final initialSelfDeaf,
      ):
        recordAndNavigate();
        unawaited(
          joinVoiceChannelWithConfirmation(
            ref: ref,
            context: context,
            guildId: guildId,
            channelId: channel.id,
            initialSelfMute: initialSelfMute,
            initialSelfDeaf: initialSelfDeaf,
          ),
        );
    }
    return;
  }

  recordAndNavigate();
  if (channel.type == ChannelType.voice && !isInCurrentVoiceChannel) {
    final bool canJoinVoice = canJoinGuildVoiceChannelFromBits(
      guildId: guildId,
      channelType: channel.type,
      permissionBits: localConnectBits ?? permissionBits,
    );
    if (canJoinVoice) {
      unawaited(
        joinVoiceChannelWithConfirmation(
          ref: ref,
          context: context,
          guildId: guildId,
          channelId: channel.id,
        ),
      );
    }
  }
}

Future<Channel?> loadGuildChannelById(WidgetRef ref, String channelId) async {
  final row = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (row == null) {
    return null;
  }
  return Channel.fromRow(row);
}
