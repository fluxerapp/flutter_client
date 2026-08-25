import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';

void _showIncomingVoiceJoinErrorToast(
  ProviderContainer container,
  FluxerLocalizations l10n,
) {
  final String? errorMessage = container
      .read(voiceSessionProvider)
      .errorMessage;
  final String message = errorMessage == null
      ? l10n.voiceJoinIncomingCallFailed
      : resolveVoiceSessionErrorMessage(errorMessage, l10n);
  container
      .read(toastProvider.notifier)
      .show(FluxerToast(message: message, variant: FluxerToastVariant.danger));
}

Future<void> executeAcceptIncomingVoiceCall(
  WidgetRef ref,
  BuildContext ctx,
  String channelId,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(ctx);
  final String? uid = ref.read(currentUserIdProvider);
  if (uid != null) {
    ref
        .read(activeCallsProvider.notifier)
        .removeUserFromPendingRing(channelId: channelId, userId: uid);
  }
  if (!ctx.mounted) {
    return;
  }
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final db.Channel? guildRow = await database.channelDao.getChannelById(
    channelId,
  );
  final String? guildIdForJoin = guildRow?.guildId;
  if (!ctx.mounted) {
    return;
  }
  try {
    final VoiceJoinResult result = await joinVoiceChannelWithConfirmation(
      ref: ref,
      context: ctx,
      guildId: guildIdForJoin,
      channelId: channelId,
    );
    if (result == VoiceJoinResult.failed) {
      _showIncomingVoiceJoinErrorToast(ref.container, l10n);
      return;
    }
    if (result != VoiceJoinResult.succeeded) {
      return;
    }
    if (guildIdForJoin == null && ctx.mounted) {
      unawaited(ctx.push(RoutePaths.dmChannelCall(channelId)));
    }
  } on Object {
    _showIncomingVoiceJoinErrorToast(ref.container, l10n);
  }
}

Future<void> executeDeclineIncomingVoiceCall(
  WidgetRef ref,
  BuildContext ctx,
  String channelId,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(ctx);
  final VoiceSessionState voice = ref.read(voiceSessionProvider);
  ref.read(activeCallsProvider.notifier).clearPendingRingForChannel(channelId);
  if (voice.channelId == channelId && voice.isConnected) {
    await ref.read(voiceSessionProvider.notifier).leaveVoice(endCall: false);
  }
  try {
    final FluxerClient client = ref.read(fluxerClientProvider);
    await client.channels.stopRingingCallRecipients(
      channelId: channelId,
      body: const CallRingBodySchema(),
    );
  } on Object {
    if (!ctx.mounted) {
      return;
    }
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(l10n.incomingVoiceRingingUpdateFailed)),
    );
  }
}

Future<void> executeIgnoreIncomingVoiceCall(
  WidgetRef ref,
  BuildContext ctx,
  String channelId,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(ctx);
  final String? uid = ref.read(currentUserIdProvider);
  if (uid == null) {
    return;
  }
  ref
      .read(activeCallsProvider.notifier)
      .removeUserFromPendingRing(channelId: channelId, userId: uid);
  try {
    final FluxerClient client = ref.read(fluxerClientProvider);
    await client.channels.stopRingingCallRecipients(
      channelId: channelId,
      body: CallRingBodySchema(recipients: [uid]),
    );
  } on Object {
    if (!ctx.mounted) {
      return;
    }
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(l10n.incomingVoiceRingingUpdateFailed)),
    );
  }
}

Future<void> executeAcceptIncomingVoiceCallFromCallKit(
  Ref ref,
  String channelId,
) async {
  try {
    await executeAcceptIncomingVoiceCallCore(ref, channelId);
  } on Object {
    final BuildContext? ctx = rootNavigatorKey.currentContext;
    if (ctx == null || !ctx.mounted) {
      return;
    }
    _showIncomingVoiceJoinErrorToast(
      ref.container,
      FluxerLocalizations.of(ctx),
    );
  }
}

Future<void> executeDeclineIncomingVoiceCallFromCallKit(
  Ref ref,
  String channelId,
) async {
  await executeDeclineIncomingVoiceCallCore(ref, channelId);
  try {
    final FluxerClient client = ref.read(fluxerClientProvider);
    await client.channels.stopRingingCallRecipients(
      channelId: channelId,
      body: const CallRingBodySchema(),
    );
  } on Object {
    final BuildContext? ctx = rootNavigatorKey.currentContext;
    if (ctx == null || !ctx.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(l10n.incomingVoiceRingingUpdateFailed)),
    );
  }
}

Future<void> executeIgnoreIncomingVoiceCallFromCallKit(
  Ref ref,
  String channelId,
) async {
  try {
    await executeIgnoreIncomingVoiceCallCore(ref, channelId);
  } on Object {
    final BuildContext? ctx = rootNavigatorKey.currentContext;
    if (ctx == null || !ctx.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(l10n.incomingVoiceRingingUpdateFailed)),
    );
  }
}

Future<void> executeAcceptIncomingVoiceCallCore(
  Ref ref,
  String channelId,
) async {
  final String? uid = ref.read(currentUserIdProvider);
  if (uid != null) {
    ref
        .read(activeCallsProvider.notifier)
        .removeUserFromPendingRing(channelId: channelId, userId: uid);
  }
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final db.Channel? guildRow = await database.channelDao.getChannelById(
    channelId,
  );
  final String? guildIdForJoin = guildRow?.guildId;
  await ref
      .read(voiceSessionProvider.notifier)
      .connectToVoiceChannel(guildId: guildIdForJoin, channelId: channelId);
}

Future<void> executeDeclineIncomingVoiceCallCore(
  Ref ref,
  String channelId,
) async {
  final VoiceSessionState voice = ref.read(voiceSessionProvider);
  ref.read(activeCallsProvider.notifier).clearPendingRingForChannel(channelId);
  if (voice.channelId == channelId && voice.isConnected) {
    await ref.read(voiceSessionProvider.notifier).leaveVoice(endCall: false);
  }
}

Future<void> executeIgnoreIncomingVoiceCallCore(
  Ref ref,
  String channelId,
) async {
  final String? uid = ref.read(currentUserIdProvider);
  if (uid == null) {
    return;
  }
  ref
      .read(activeCallsProvider.notifier)
      .removeUserFromPendingRing(channelId: channelId, userId: uid);
  final FluxerClient client = ref.read(fluxerClientProvider);
  await client.channels.stopRingingCallRecipients(
    channelId: channelId,
    body: CallRingBodySchema(recipients: [uid]),
  );
}
