import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

bool canStartThreadIn(Channel parent, ThreadActor? actor) {
  if (!isTextThreadParentType(parent.type) || actor == null) {
    return false;
  }
  return canCreateThread(actor, ThreadCreateKind.public) == null ||
      (allowsPrivateThreads(parent) &&
          canCreateThread(actor, ThreadCreateKind.private) == null);
}

bool allowsPrivateThreads(Channel parent) =>
    parent.type == ChannelType.guildText;

bool canStartThreadFromMessage({
  required Channel parent,
  required Message message,
  required ThreadActor? actor,
}) {
  return isTextThreadParentType(parent.type) &&
      actor != null &&
      message.isUserMessage &&
      message.deliveryState == MessageDeliveryState.sent &&
      message.threadJson == null &&
      message.flags & messageFlagHasThread == 0 &&
      canCreateThread(actor, ThreadCreateKind.fromMessage) == null;
}

bool watchCanCreateThreadFromMessage(WidgetRef ref, Message message) {
  if (!ref.watch(anyThreadChannelsActiveProvider)) {
    return false;
  }
  final Channel? parent = ref
      .watch(channelByIdProvider(message.channelId))
      .value;
  if (parent == null ||
      !ref.watch(threadChannelsActiveProvider(parent.guildId))) {
    return false;
  }
  return canStartThreadFromMessage(
    parent: parent,
    message: message,
    actor: ref.watch(parentThreadActorProvider(parent.guildId, parent.id)),
  );
}

Future<void> showCreateThreadSheetForMessage(
  BuildContext context,
  WidgetRef ref, {
  required Message message,
}) async {
  final row = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(message.channelId);
  if (row == null || !context.mounted) {
    return;
  }
  await showCreateThreadSheet(
    context,
    ref,
    parent: Channel.fromRow(row),
    sourceMessage: message,
  );
}

bool bypassesThreadCreateCooldown(ThreadActor actor) =>
    actor.isOwner || bypassesSlowmode(actor.permissions);

Future<void> showCreateThreadSheet(
  BuildContext context,
  WidgetRef hostRef, {
  required Channel parent,
  Message? sourceMessage,
}) {
  return FluxerBottomSheet.show<void>(
    context,
    title: FluxerLocalizations.of(context).threadCreate,
    builder: (sheetContext, close) => _CreateThreadBody(
      parent: parent,
      sourceMessage: sourceMessage,
      hostContext: context,
      hostRef: hostRef,
      close: close,
    ),
  );
}

class _CreateThreadBody extends ConsumerStatefulWidget {
  const _CreateThreadBody({
    required this.parent,
    required this.sourceMessage,
    required this.hostContext,
    required this.hostRef,
    required this.close,
  });

  final Channel parent;
  final Message? sourceMessage;
  final BuildContext hostContext;
  final WidgetRef hostRef;
  final VoidCallback close;

  @override
  ConsumerState<_CreateThreadBody> createState() => _CreateThreadBodyState();
}

class _CreateThreadBodyState extends ConsumerState<_CreateThreadBody> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _message = TextEditingController();
  Timer? _ticker;
  bool _private = false;
  bool _submitting = false;
  String? _nameError;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted &&
          ref
                  .read(threadCreateCooldownsProvider.notifier)
                  .remainingSeconds(widget.parent.id) >
              0) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _name.dispose();
    _message.dispose();
    super.dispose();
  }

  String get _sourcePreview =>
      (widget.sourceMessage?.content ?? '').trim().replaceAll('\n', ' ');

  String _resolveName() {
    final String typed = _name.text.trim();
    final String name = typed.isNotEmpty ? typed : _sourcePreview;
    return name.length > threadNameMaxLength
        ? name.substring(0, threadNameMaxLength)
        : name;
  }

  Future<Map<String, Object?>> _create({
    required ThreadsRepository repo,
    required String name,
    required bool private,
  }) async {
    final Channel parent = widget.parent;
    final Message? source = widget.sourceMessage;
    final int? duration = parent.defaultAutoArchiveDuration;
    final Object response = source != null
        ? await repo.startFromMessage(
            guildId: parent.guildId,
            channelId: parent.id,
            messageId: source.id,
            body: StartThreadFromMessageRequest(
              name: name,
              autoArchiveDuration: duration == null
                  ? null
                  : ThreadAutoArchiveDurationSchema.fromJson(duration),
            ),
          )
        : await repo.start(
            guildId: parent.guildId,
            channelId: parent.id,
            body: StartThreadRequestBody(<String, dynamic>{
              'name': name,
              'type': private
                  ? ChannelType.privateThread.wireValue
                  : publicThreadTypeFor(parent.type).wireValue,
              'auto_archive_duration': ?duration,
            }),
          );
    final Object json = response is ThreadChannelResponse
        ? response.toJson()
        : (response as StartForumThreadResponse).toJson();
    return jsonDecode(jsonEncode(json)) as Map<String, Object?>;
  }

  Future<void> _submit({required bool private}) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String name = _resolveName();
    if (name.isEmpty) {
      setState(() => _nameError = l10n.threadNameRequired);
      return;
    }
    final Channel parent = widget.parent;
    final String content = _message.text.trim();
    setState(() => _submitting = true);
    final Map<String, Object?> json;
    try {
      json = await _create(
        repo: ref.read(threadsRepositoryProvider),
        name: name,
        private: private,
      );
    } on Object catch (error) {
      if (!mounted) {
        return;
      }
      setState(() => _submitting = false);
      final Message? source = widget.sourceMessage;
      if (source != null &&
          error is DioException &&
          apiErrorCodeFromDioException(error) ==
              'THREAD_ALREADY_CREATED_FOR_MESSAGE') {
        final BuildContext hostContext = widget.hostContext;
        final WidgetRef hostRef = widget.hostRef;
        widget.close();
        if (hostContext.mounted) {
          unawaited(
            navigateToChannelContent(
              context: hostContext,
              ref: hostRef,
              guildId: parent.guildId,
              channelId: source.id,
            ),
          );
        }
        return;
      }
      showThreadToast(
        ref,
        l10n.threadCreateFailed(threadErrorText(l10n, error)),
        variant: FluxerToastVariant.danger,
      );
      return;
    }
    final ChannelResponse created = ChannelResponse.fromJson(json);
    await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .upsertChannel(channelFromSdk(created, parent.guildId));
    ref
        .read(threadCreateCooldownsProvider.notifier)
        .start(parent.id, parent.rateLimitPerUser);
    if (content.isNotEmpty) {
      final Toast toasts = ref.read(toastProvider.notifier);
      unawaited(
        ref
            .read(messageRepositoryProvider)
            .sendMessage(channelId: created.id, content: content)
            .then<void>(
              (_) {},
              onError: (Object error) => toasts.show(
                FluxerToast(
                  message: threadErrorText(l10n, error),
                  variant: FluxerToastVariant.danger,
                ),
              ),
            ),
      );
    }
    if (!mounted) {
      return;
    }
    final BuildContext hostContext = widget.hostContext;
    final WidgetRef hostRef = widget.hostRef;
    widget.close();
    if (!hostContext.mounted) {
      return;
    }
    await navigateToChannelContent(
      context: hostContext,
      ref: hostRef,
      guildId: parent.guildId,
      channelId: created.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel parent = widget.parent;
    final Message? source = widget.sourceMessage;
    if (!ref.watch(threadChannelsActiveProvider(parent.guildId))) {
      return const SizedBox.shrink();
    }
    final ThreadActor? actor = ref.watch(
      parentThreadActorProvider(parent.guildId, parent.id),
    );
    ref.watch(threadCreateCooldownsProvider);
    final bool canPublic =
        actor != null &&
        canCreateThread(
              actor,
              source != null
                  ? ThreadCreateKind.fromMessage
                  : ThreadCreateKind.public,
            ) ==
            null;
    final bool canPrivate =
        source == null &&
        allowsPrivateThreads(parent) &&
        actor != null &&
        canCreateThread(actor, ThreadCreateKind.private) == null;
    final int cooldown = actor == null || bypassesThreadCreateCooldown(actor)
        ? 0
        : ref
              .read(threadCreateCooldownsProvider.notifier)
              .remainingSeconds(parent.id);
    final bool private = canPrivate && (_private || !canPublic);
    final bool disabled =
        _submitting || cooldown > 0 || (!canPublic && !canPrivate);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        0,
        context.layout.s4,
        context.layout.s4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (source != null && _sourcePreview.isNotEmpty) ...<Widget>[
            Row(
              children: <Widget>[
                PhosphorIcon(
                  PhosphorIconsBold.chatsCircle,
                  size: 16,
                  color: context.colors.textPrimaryMuted,
                ),
                SizedBox(width: context.layout.s2),
                Expanded(
                  child: Text(
                    _sourcePreview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.layout.s3),
          ],
          FluxerInput(
            controller: _name,
            label: l10n.threadName,
            hint: _sourcePreview.isNotEmpty
                ? _sourcePreview
                : l10n.threadNewThreadPlaceholder,
            maxLength: threadNameMaxLength,
            autofocus: true,
            errorText: _nameError,
            onChanged: (_) {
              if (_nameError != null) {
                setState(() => _nameError = null);
              }
            },
          ),
          if (canPrivate && canPublic) ...<Widget>[
            SizedBox(height: context.layout.s3),
            FluxerSwitchGroup(
              children: <Widget>[
                FluxerSwitchGroupItem(
                  label: l10n.threadPrivate,
                  description: l10n.threadPrivateDescription,
                  value: _private,
                  onChanged: (bool value) => setState(() => _private = value),
                ),
              ],
            ),
          ],
          SizedBox(height: context.layout.s3),
          FluxerInput(
            controller: _message,
            label: l10n.threadStarterMessage,
            hint: l10n.threadStarterMessagePlaceholder,
            maxLines: 4,
            minLines: 1,
          ),
          if (cooldown > 0) ...<Widget>[
            SizedBox(height: context.layout.s2),
            Text(
              l10n.threadCreateCooldown(cooldown),
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ],
          SizedBox(height: context.layout.s4),
          FluxerButton.primary(
            label: l10n.threadCreate,
            isLoading: _submitting,
            onPressedAsync: disabled ? null : () => _submit(private: private),
          ),
        ],
      ),
    );
  }
}
