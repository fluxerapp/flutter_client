import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_dart/export.dart';

Future<void> runVoiceParticipantModeration(
  WidgetRef ref, {
  required String failureMessage,
  required Future<void> Function() action,
}) async {
  try {
    await action();
  } on Object catch (error, stackTrace) {
    talker.error(
      '[VoiceParticipantModeration] action failed: $error',
      error,
      stackTrace,
    );
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: failureMessage,
            variant: FluxerToastVariant.danger,
          ),
        );
  }
}

GuildMemberUpdateRequest _memberVoiceUpdate({
  bool? mute,
  bool? deaf,
  String? connectionId,
}) {
  return GuildMemberUpdateRequest(
    nick: null,
    communicationDisabledUntil: null,
    mute: mute,
    deaf: deaf,
    connectionId: connectionId,
  );
}

Future<void> _updateGuildMemberVoiceState({
  required WidgetRef ref,
  required String guildId,
  required String userId,
  required String failureMessage,
  required GuildMemberUpdateRequest body,
}) {
  return runVoiceParticipantModeration(
    ref,
    failureMessage: failureMessage,
    action: () => ref
        .read(fluxerClientProvider)
        .guilds
        .updateGuildMember(guildId: guildId, userId: userId, body: body),
  );
}

Future<void> updateVoiceParticipantCommunityMute({
  required WidgetRef ref,
  required String guildId,
  required String userId,
  required bool muted,
  required String failureMessage,
}) {
  return _updateGuildMemberVoiceState(
    ref: ref,
    guildId: guildId,
    userId: userId,
    failureMessage: failureMessage,
    body: _memberVoiceUpdate(mute: muted),
  );
}

Future<void> updateVoiceParticipantCommunityDeafen({
  required WidgetRef ref,
  required String guildId,
  required String userId,
  required bool deafened,
  required String failureMessage,
}) {
  return _updateGuildMemberVoiceState(
    ref: ref,
    guildId: guildId,
    userId: userId,
    failureMessage: failureMessage,
    body: _memberVoiceUpdate(deaf: deafened),
  );
}

Future<void> disconnectVoiceParticipant({
  required WidgetRef ref,
  required String guildId,
  required String userId,
  required String? connectionId,
  required String failureMessage,
}) {
  return _updateGuildMemberVoiceState(
    ref: ref,
    guildId: guildId,
    userId: userId,
    failureMessage: failureMessage,
    body: _memberVoiceUpdate(connectionId: connectionId),
  );
}
