import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/assistant/assistant_command.dart';
import 'package:fluxer_app/core/assistant/assistant_command_policy.dart';
import 'package:fluxer_app/core/assistant/assistant_command_result.dart';
import 'package:fluxer_app/core/assistant/assistant_entity_index.dart';
import 'package:fluxer_app/core/assistant/assistant_spoken.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/messages/client_nonce.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';

const Duration _kReadyWait = Duration(seconds: 20);
const Duration _kReadyPoll = Duration(milliseconds: 100);

class AssistantCommandDispatcher {
  const AssistantCommandDispatcher(this._ref);

  final Ref _ref;

  Future<AssistantCommandResult> dispatch(AssistantCommand command) async {
    AssistantCommandSnapshot snapshot = readAssistantCommandSnapshot(_ref);
    AssistantCommandGate gate = gateAssistantCommand(
      command: command,
      snapshot: snapshot,
    );
    if (gate == AssistantCommandGate.waitForReady) {
      final bool ready = await _waitUntilReady();
      snapshot = readAssistantCommandSnapshot(_ref);
      if (!ready) {
        if (!snapshot.authenticated) {
          return _resultForGate(AssistantCommandGate.needsLogin);
        }
        return _resultForGate(AssistantCommandGate.failed);
      }
      gate = gateAssistantCommand(command: command, snapshot: snapshot);
    }
    if (gate != AssistantCommandGate.proceed) {
      return _resultForGate(gate);
    }
    try {
      return await _execute(command);
    } on Object catch (error, stackTrace) {
      talker.error('[Assistant] Command failed', error, stackTrace);
      return _resultForGate(AssistantCommandGate.failed);
    }
  }

  Future<bool> _waitUntilReady() async {
    if (readAssistantCommandSnapshot(_ref).isNavigationReady) {
      return true;
    }
    final DateTime deadline = DateTime.now().add(_kReadyWait);
    while (DateTime.now().isBefore(deadline)) {
      if (!_ref.mounted) {
        return false;
      }
      await Future<void>.delayed(_kReadyPoll);
      if (!_ref.mounted) {
        return false;
      }
      if (readAssistantCommandSnapshot(_ref).isNavigationReady) {
        return true;
      }
    }
    return false;
  }

  Future<AssistantCommandResult> _execute(AssistantCommand command) {
    return switch (command) {
      VoiceSetMuteCommand() => _setMute(command),
      VoiceLeaveCommand() => _leaveVoice(),
      VoiceJoinCommand() => _joinVoice(command),
      VoiceStartDmCallCommand() => _startDmCall(command),
      PresenceSetStatusCommand() => _setStatus(command),
      PresenceSetCustomStatusCommand() => _setCustomStatus(command),
      OpenDmsCommand() => _openPath(RoutePaths.me, command),
      SendDmCommand() => _sendDm(command),
    };
  }

  Future<AssistantCommandResult> _setMute(VoiceSetMuteCommand command) async {
    final notifier = _ref.read(voiceSessionProvider.notifier);
    if (command.muted == null) {
      await notifier.toggleSelfMute();
    } else {
      await notifier.setSelfMute(isMuted: command.muted!, playSound: true);
      await _ref
          .read(localVoiceStateProvider.notifier)
          .setSelfMute(muted: command.muted!);
    }
    final bool muted = _ref.read(localVoiceStateProvider).selfMute;
    return _ok(command, extras: <String, Object?>{'muted': muted});
  }

  Future<AssistantCommandResult> _leaveVoice() async {
    await _ref.read(voiceSessionProvider.notifier).leaveVoice();
    return _ok(const VoiceLeaveCommand());
  }

  Future<AssistantCommandResult> _joinVoice(VoiceJoinCommand command) async {
    final db.FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final db.Channel? row = await database.channelDao.getChannelById(
      command.channelId,
    );
    if (row == null || !isGuildVoiceChannelType(row.type)) {
      return _resultForGate(AssistantCommandGate.notFound);
    }
    final String? guildId = command.guildId;
    if (guildId != null && guildId.isNotEmpty && row.guildId != guildId) {
      return _resultForGate(AssistantCommandGate.notFound);
    }
    final Channel channel = Channel.fromRow(row);
    final bool gated = await isChannelGateBlocking(
      container: _ref.container,
      channelId: command.channelId,
      channel: channel,
    );
    if (gated) {
      _go(buildChannelJumpRoutePath(guildId: row.guildId, channelId: row.id));
      return _ok(command);
    }
    final bool joined = await _ref
        .read(voiceSessionProvider.notifier)
        .connectToVoiceChannel(guildId: row.guildId, channelId: row.id);
    if (!joined) {
      return _resultForGate(AssistantCommandGate.failed);
    }
    return _ok(command);
  }

  Future<AssistantCommandResult> _startDmCall(
    VoiceStartDmCallCommand command,
  ) async {
    final String? channelId = await _resolveDmChannelId(
      friendId: command.friendId,
      channelId: command.channelId,
    );
    if (channelId == null) {
      return _resultForGate(AssistantCommandGate.notFound);
    }
    final dm = findDmById(
      _ref.read(dmViewModelProvider).conversations,
      channelId,
    );
    if (dm != null && !canStartDmCall(dm)) {
      return _resultForGate(AssistantCommandGate.failed);
    }
    final bool joined = await _ref
        .read(voiceSessionProvider.notifier)
        .connectToVoiceChannel(
          guildId: null,
          channelId: channelId,
          startOutgoingCall: true,
        );
    if (!joined) {
      return _resultForGate(AssistantCommandGate.failed);
    }
    _go(RoutePaths.dmChannelCall(channelId));
    return _ok(command);
  }

  Future<AssistantCommandResult> _setStatus(
    PresenceSetStatusCommand command,
  ) async {
    final PresenceStatus status = PresenceStatus.fromJson(command.status);
    if (status == PresenceStatus.$unknown) {
      return _resultForGate(AssistantCommandGate.failed);
    }
    await _ref
        .read(userStatusServiceProvider)
        .setPresenceStatus(status: status);
    return _ok(command);
  }

  Future<AssistantCommandResult> _setCustomStatus(
    PresenceSetCustomStatusCommand command,
  ) async {
    final String text = command.text.trim();
    if (text.isEmpty) {
      await _ref.read(userStatusServiceProvider).clearCustomStatus();
    } else {
      await _ref
          .read(userStatusServiceProvider)
          .setCustomStatus(
            buildCustomStatusPayload(
              text: text,
              emojiId: null,
              emojiName: null,
              expiresAt: null,
            ),
          );
    }
    return _ok(command);
  }

  Future<AssistantCommandResult> _openPath(
    String path,
    AssistantCommand command,
  ) async {
    _go(path);
    return _ok(command);
  }

  Future<AssistantCommandResult> _sendDm(SendDmCommand command) async {
    final String text = command.text.trim();
    if (text.isEmpty) {
      return _resultForGate(AssistantCommandGate.failed);
    }
    final String? channelId = await _resolveDmChannelId(
      friendId: command.friendId,
      channelId: command.channelId,
    );
    if (channelId == null) {
      return _resultForGate(AssistantCommandGate.notFound);
    }
    final MessageRepository repo = _ref.read(messageRepositoryProvider);
    await repo.sendMessage(
      channelId: channelId,
      content: text,
      clientNonce: clientNonceGenerator.next(),
    );
    _go(RoutePaths.dmChannel(channelId));
    return _ok(command);
  }

  Future<String?> _resolveDmChannelId({
    required String? friendId,
    required String? channelId,
  }) async {
    if (channelId != null && channelId.isNotEmpty) {
      return channelId;
    }
    if (friendId == null || friendId.isEmpty) {
      return null;
    }
    return _ref.read(dmRepositoryProvider).ensureDmChannel(friendId);
  }

  void _go(String path) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!_ref.mounted) {
        return;
      }
      navigateToContentViaRef(_ref, path);
    });
  }

  AssistantCommandResult _ok(
    AssistantCommand command, {
    Map<String, Object?> extras = const <String, Object?>{},
  }) {
    final FluxerLocalizations l10n = _ref.read(appLocalizationsProvider);
    return AssistantCommandResult(
      status: AssistantCommandStatus.ok,
      spoken: spokenForAssistantSuccess(
        command: command,
        l10n: l10n,
        extras: extras,
      ),
      extras: extras,
    );
  }

  AssistantCommandResult _resultForGate(AssistantCommandGate gate) {
    final FluxerLocalizations l10n = _ref.read(appLocalizationsProvider);
    final AssistantCommandGateSpoken spoken = switch (gate) {
      AssistantCommandGate.needsLogin => AssistantCommandGateSpoken.needsLogin,
      AssistantCommandGate.notInVoice => AssistantCommandGateSpoken.notInVoice,
      AssistantCommandGate.notFound => AssistantCommandGateSpoken.notFound,
      AssistantCommandGate.dmsDisabled =>
        AssistantCommandGateSpoken.dmsDisabled,
      AssistantCommandGate.proceed ||
      AssistantCommandGate.waitForReady ||
      AssistantCommandGate.failed => AssistantCommandGateSpoken.failed,
    };
    return AssistantCommandResult(
      status: statusForAssistantGate(gate),
      spoken: spokenForAssistantGate(gate: spoken, l10n: l10n),
    );
  }
}

AssistantCommandSnapshot readAssistantCommandSnapshot(Ref ref) {
  final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
  final AssistantEntityIndex index = ref.read(assistantEntityIndexProvider);
  return AssistantCommandSnapshot(
    authenticated: ref.read(authStateProvider),
    gatewayReady: ref.read(gatewayReadyProvider),
    connectionFailed: ref.read(gatewayConnectionFailedProvider),
    inVoice: ref.read(voiceSessionProvider).isInVoice,
    dmsDisabled: ref.read(instanceRuntimeConfigProvider).directMessagesDisabled,
    voiceEnabled: ref.read(instanceRuntimeConfigProvider).voiceEnabled,
    knownGuildIds: <String>{for (final Guild guild in guilds) guild.id},
    voiceChannelIds: index.voiceChannelIds,
    voiceChannelGuildIds: index.voiceChannelGuildIds,
  );
}
