import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_link.dart';
import 'package:fluxer_app/features/threads/data/thread_api_errors.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

String threadErrorText(FluxerLocalizations l10n, Object error) {
  if (error is DioException) {
    final String? mapped = threadApiErrorMessage(
      apiErrorCode: apiErrorCodeFromDioException(error),
      l10n: l10n,
    );
    if (mapped != null) {
      return mapped;
    }
  }
  return userFacingErrorMessage(error, l10n.genericError);
}

void showThreadToast(
  WidgetRef ref,
  String message, {
  FluxerToastVariant variant = FluxerToastVariant.success,
}) {
  ref
      .read(toastProvider.notifier)
      .show(FluxerToast(message: message, variant: variant));
}

Future<bool> runThreadAction(
  BuildContext context,
  WidgetRef ref,
  Future<void> Function(ThreadsRepository repository) action, {
  String? successMessage,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  try {
    await action(ref.read(threadsRepositoryProvider));
  } on Object catch (error) {
    showThreadToast(
      ref,
      threadErrorText(l10n, error),
      variant: FluxerToastVariant.danger,
    );
    return false;
  }
  if (successMessage != null) {
    showThreadToast(ref, successMessage);
  }
  return true;
}

Future<void> openThread(
  BuildContext context,
  WidgetRef ref,
  Channel thread, {
  String? messageId,
}) => navigateToGuildChannelContent(
  context: context,
  ref: ref,
  guildId: thread.guildId,
  channel: thread,
  messageId: messageId,
);

Future<bool> joinThread(BuildContext context, WidgetRef ref, Channel thread) =>
    runThreadAction(
      context,
      ref,
      (ThreadsRepository repo) =>
          repo.join(guildId: thread.guildId, threadId: thread.id),
    );

Future<bool> leaveThread(BuildContext context, WidgetRef ref, Channel thread) =>
    runThreadAction(
      context,
      ref,
      (ThreadsRepository repo) =>
          repo.leave(guildId: thread.guildId, threadId: thread.id),
    );

Future<bool> updateThread(
  BuildContext context,
  WidgetRef ref,
  Channel thread,
  Map<String, Object?> body, {
  String? successMessage,
}) => runThreadAction(
  context,
  ref,
  (ThreadsRepository repo) =>
      repo.update(guildId: thread.guildId, threadId: thread.id, body: body),
  successMessage: successMessage,
);

Future<bool> setThreadArchived(
  BuildContext context,
  WidgetRef ref,
  Channel thread, {
  required bool archived,
}) =>
    updateThread(context, ref, thread, <String, Object?>{'archived': archived});

Future<bool> setThreadLocked(
  BuildContext context,
  WidgetRef ref,
  Channel thread, {
  required bool locked,
}) => updateThread(context, ref, thread, <String, Object?>{'locked': locked});

Future<void> confirmDeleteThread(
  BuildContext context,
  WidgetRef ref,
  Channel thread,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final bool? confirmed = await FluxerConfirmSheet.show(
    context,
    title: l10n.threadDelete,
    description: l10n.threadDeleteConfirm(thread.name),
    confirmLabel: l10n.threadDelete,
    isDanger: true,
  );
  if (confirmed != true || !context.mounted) {
    return;
  }
  final String? parentId = thread.parentId;
  final bool viewing = ref.read(activeChannelIdProvider) == thread.id;
  final bool deleted = await runThreadAction(
    context,
    ref,
    (ThreadsRepository repo) =>
        repo.delete(guildId: thread.guildId, threadId: thread.id),
    successMessage: l10n.threadDeleted,
  );
  if (deleted && viewing && parentId != null && context.mounted) {
    await navigateToChannelContent(
      context: context,
      ref: ref,
      guildId: thread.guildId,
      channelId: parentId,
    );
  }
}

Future<bool> setThreadNotificationSetting(
  BuildContext context,
  WidgetRef ref,
  Channel thread, {
  required int currentFlags,
  required ThreadNotificationSetting setting,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return runThreadAction(
    context,
    ref,
    (ThreadsRepository repo) => repo.updateSettings(
      guildId: thread.guildId,
      threadId: thread.id,
      body: ThreadMemberSettingsRequest(
        flags: threadNotificationFlags(currentFlags, setting),
      ),
    ),
    successMessage: l10n.channelDetailsNotificationSettingsUpdated,
  );
}

Future<bool> unmuteThread(BuildContext context, WidgetRef ref, Channel thread) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return runThreadAction(
    context,
    ref,
    (ThreadsRepository repo) => repo.updateSettings(
      guildId: thread.guildId,
      threadId: thread.id,
      body: ThreadMemberSettingsRequest(
        muted: false,
        muteConfig:
            const JsonNullable<ThreadMemberSettingsRequestMuteConfig>.of(null),
      ),
    ),
    successMessage: l10n.threadUnmuted,
  );
}

Future<void> muteThreadWithDuration(
  BuildContext context,
  WidgetRef ref,
  Channel thread,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final MuteSelection? selection = await showMuteDurationSheet(
    context,
    muteTitle: l10n.threadMute,
  );
  if (selection == null || !context.mounted) {
    return;
  }
  final int? seconds = selection.durationSeconds;
  await runThreadAction(
    context,
    ref,
    (ThreadsRepository repo) => repo.updateSettings(
      guildId: thread.guildId,
      threadId: thread.id,
      body: ThreadMemberSettingsRequest(
        muted: true,
        muteConfig: JsonNullable<ThreadMemberSettingsRequestMuteConfig>.of(
          ThreadMemberSettingsRequestMuteConfig(
            selectedTimeWindow: seconds ?? -1,
            endTime: seconds == null
                ? null
                : DateTime.now()
                      .toUtc()
                      .add(Duration(seconds: seconds))
                      .toIso8601String(),
          ),
        ),
      ),
    ),
    successMessage: l10n.threadMuted,
  );
}

Future<void> markThreadRead(WidgetRef ref, Channel thread) {
  final ReadStateRepository repository = ref.read(readStateRepositoryProvider);
  return repository.ackLatest(thread.id);
}

Future<void> copyThreadLink(BuildContext context, Channel thread) =>
    copyToClipboard(
      context: context,
      value: channelLink(thread.id, thread.guildId),
    );

Future<void> copyThreadId(BuildContext context, Channel thread) =>
    copyToClipboard(context: context, value: thread.id);
