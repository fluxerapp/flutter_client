import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/incoming_voice_call_sheet.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

/// Channel ids where this user still has a pending incoming ring presentation.
final Provider<List<String>> pendingIncomingVoiceChannelIdsProvider =
    Provider<List<String>>((Ref ref) {
      final String? uid = ref.watch(currentUserIdProvider);
      if (uid == null) {
        return const <String>[];
      }
      final VoiceSessionState voice = ref.watch(voiceSessionProvider);
      final Map<String, CallState> calls = ref.watch(activeCallsProvider);
      final Set<String> initiatorChannels = ref.watch(
        outgoingVoiceCallInitiatorProvider,
      );
      final List<String> out = <String>[];
      for (final MapEntry<String, CallState> e in calls.entries) {
        final String channelId = e.key;
        if (!e.value.pendingRingUserIds.contains(uid)) {
          continue;
        }
        if (voice.isConnected && voice.channelId == channelId) {
          continue;
        }
        if (initiatorChannels.contains(channelId)) {
          continue;
        }
        out.add(channelId);
      }
      out.sort();
      return out;
    });

/// Presents ringing calls in a Fluxer draggable bottom sheet like fluxer-web
/// IncomingCallUI on mobile.
class IncomingVoiceCallLayer extends ConsumerStatefulWidget {
  const IncomingVoiceCallLayer({required this.child, super.key});

  final Widget child;

  static Future<void> _executeAccept(
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
      await joinVoiceChannelWithConfirmation(
        ref: ref,
        context: ctx,
        guildId: guildIdForJoin,
        channelId: channelId,
      );
    } on Object {
      if (!ctx.mounted) {
        return;
      }
      ScaffoldMessenger.of(
        ctx,
      ).showSnackBar(SnackBar(content: Text(l10n.voiceJoinIncomingCallFailed)));
    }
  }

  static Future<void> _executeDecline(
    WidgetRef ref,
    BuildContext ctx,
    String channelId,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(ctx);
    final VoiceSessionState voice = ref.read(voiceSessionProvider);
    ref
        .read(activeCallsProvider.notifier)
        .clearPendingRingForChannel(channelId);
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

  static Future<void> _executeIgnore(
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

  @override
  ConsumerState<IncomingVoiceCallLayer> createState() =>
      _IncomingVoiceCallLayerState();
}

class _IncomingVoiceCallLayerState
    extends ConsumerState<IncomingVoiceCallLayer> {
  bool _sheetOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _enqueuePresentSheet());
  }

  void _enqueuePresentSheet() {
    if (!mounted || _sheetOpen) {
      return;
    }
    final List<String> pending = ref.read(
      pendingIncomingVoiceChannelIdsProvider,
    );
    if (pending.isEmpty) {
      return;
    }
    final String channelId = pending.first;
    _sheetOpen = true;
    unawaited(_runSheetLifecycle(channelId));
  }

  Future<void> _runSheetLifecycle(String channelId) async {
    final BuildContext? sheetContext = rootNavigatorKey.currentContext;
    if (sheetContext == null || !sheetContext.mounted) {
      _sheetOpen = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _enqueuePresentSheet();
        }
      });
      return;
    }
    try {
      final String? result = await showIncomingVoiceCallSheet(
        sheetContext,
        ref: ref,
        channelId: channelId,
      );
      if (!mounted) {
        return;
      }
      final BuildContext actionContext =
          rootNavigatorKey.currentContext ?? context;
      if (!actionContext.mounted) {
        return;
      }
      if (result == kIncomingVoiceResultAccept) {
        await IncomingVoiceCallLayer._executeAccept(
          ref,
          actionContext,
          channelId,
        );
      } else if (result == kIncomingVoiceResultReject) {
        await IncomingVoiceCallLayer._executeDecline(
          ref,
          actionContext,
          channelId,
        );
      } else {
        await IncomingVoiceCallLayer._executeIgnore(
          ref,
          actionContext,
          channelId,
        );
      }
    } finally {
      _sheetOpen = false;
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _enqueuePresentSheet();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<List<String>>(pendingIncomingVoiceChannelIdsProvider, (_, _) {
      _enqueuePresentSheet();
    });
    return widget.child;
  }
}
