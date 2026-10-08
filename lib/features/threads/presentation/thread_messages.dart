import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

bool isThreadSystemMessageType(int type) =>
    type == messageTypeThreadCreated || type == messageTypeThreadStarterMessage;

bool messageMayCarryThread(Message message) =>
    message.threadJson != null || message.flags & messageFlagHasThread != 0;

class ThreadMessageGate extends ConsumerWidget {
  const ThreadMessageGate({
    required this.guildId,
    required this.child,
    super.key,
  });

  final String? guildId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(threadChannelsActiveProvider(guildId))
        ? child
        : const SizedBox.shrink();
  }
}

Future<void> openThreadById(
  BuildContext context,
  WidgetRef ref, {
  required String guildId,
  required String threadId,
}) => navigateToChannelContent(
  context: context,
  ref: ref,
  guildId: guildId,
  channelId: threadId,
);

class ThreadStarterMessage extends ConsumerWidget {
  const ThreadStarterMessage({
    required this.message,
    required this.guildId,
    super.key,
  });

  final Message message;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(threadChannelsActiveProvider(guildId))) {
      return const SizedBox.shrink();
    }
    final MessageReference? reference = message.messageReference;
    final String? sourceChannelId = reference?.channelId;
    final String? sourceMessageId = reference?.messageId;
    if (sourceChannelId == null ||
        sourceChannelId.isEmpty ||
        sourceMessageId == null ||
        sourceMessageId.isEmpty) {
      return const ThreadStarterDeletedNotice();
    }
    ref.watch(messageReferencesProvider);
    final MessageReferenceResolution resolution = ref
        .read(messageReferencesProvider.notifier)
        .resolveSync(
          channelId: sourceChannelId,
          messageId: sourceMessageId,
          channelMessages: const <Message>[],
        );
    final Message? source = resolution.message;
    return switch (resolution.state) {
      MessageReferenceState.deleted => const ThreadStarterDeletedNotice(),
      MessageReferenceState.notLoaded => const SizedBox(height: 48),
      MessageReferenceState.loaded when source != null => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kMessageRowPaddingHorizontal - 8,
        ),
        child: MessageItem(
          message: source,
          inboxPreviewMode: true,
          allowAuthorProfileInPreview: true,
          hideMentionHighlight: true,
          previewRoleGuildId: guildId,
          currentUserId: ref.watch(currentUserIdProvider),
        ),
      ),
      MessageReferenceState.loaded => const ThreadStarterDeletedNotice(),
    };
  }
}

class ThreadStarterDeletedNotice extends StatelessWidget {
  const ThreadStarterDeletedNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kMessageRowPaddingHorizontal,
        kMessageRowPaddingVertical,
        kMessageRowPaddingHorizontal,
        kMessageRowPaddingVertical,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: kMessageAvatarSize,
            child: PhosphorIcon(
              PhosphorIconsBold.chatsCircle,
              size: kSystemMessageIconSize,
              color: context.colors.textTertiaryMuted,
            ),
          ),
          const SizedBox(width: kMessageAvatarTextGap),
          Expanded(
            child: Text(
              FluxerLocalizations.of(context).threadStarterDeleted,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiaryMuted,
                fontStyle: FontStyle.italic,
                fontSize: kSystemMessageBodyFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

({String? name, int? messageCount}) _threadSummaryFromJson(String? raw) {
  if (raw == null) {
    return (name: null, messageCount: null);
  }
  final Object? decoded = jsonDecode(raw);
  if (decoded is! Map<String, dynamic>) {
    return (name: null, messageCount: null);
  }
  return (
    name: decoded['name'] as String?,
    messageCount: (decoded['message_count'] as num?)?.toInt(),
  );
}

class ThreadFailedToMentionRolesNote extends ConsumerWidget {
  const ThreadFailedToMentionRolesNote({
    required this.message,
    required this.guildId,
    super.key,
  });

  final Message message;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? resolvedGuildId =
        guildId ?? ref.watch(channelGuildIdProvider(message.channelId)).value;
    if (resolvedGuildId == null ||
        !ref.watch(threadChannelsActiveProvider(resolvedGuildId))) {
      return const SizedBox.shrink();
    }
    final Channel? channel = ref
        .watch(channelByIdProvider(message.channelId))
        .value;
    if (channel == null || !channel.isThread) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        FluxerLocalizations.of(context).threadFailedToMentionSomeRoles,
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textPrimaryMuted,
        ),
      ),
    );
  }
}

class MessageThreadChip extends ConsumerWidget {
  const MessageThreadChip({
    required this.message,
    required this.guildId,
    super.key,
  });

  final Message message;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? resolvedGuildId =
        guildId ?? ref.watch(channelGuildIdProvider(message.channelId)).value;
    if (resolvedGuildId == null ||
        !ref.watch(threadChannelsActiveProvider(resolvedGuildId))) {
      return const SizedBox.shrink();
    }
    final Channel? thread = ref.watch(channelByIdProvider(message.id)).value;
    if (thread != null && thread.parentId != message.channelId) {
      return const SizedBox.shrink();
    }
    final ({String? name, int? messageCount}) fallback = _threadSummaryFromJson(
      message.threadJson,
    );
    final String? name = thread?.name ?? fallback.name;
    if (name == null || name.isEmpty) {
      return const SizedBox.shrink();
    }
    final int count = thread?.messageCount ?? fallback.messageCount ?? 0;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color countColor = Theme.of(context).brightness == Brightness.light
        ? context.colors.brandPrimary
        : context.colors.brandPrimaryLight;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          color: context.colors.backgroundSecondaryAlt,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => unawaited(
              openThreadById(
                context,
                ref,
                guildId: resolvedGuildId,
                threadId: message.id,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PhosphorIcon(
                    PhosphorIconsBold.chatsCircle,
                    size: 16,
                    color: context.colors.textPrimaryMuted,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.label.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.threadMessageCount(count),
                    style: context.textStyles.bodySmall.copyWith(
                      color: countColor,
                    ),
                  ),
                  PhosphorIcon(
                    PhosphorIconsBold.caretRight,
                    size: 12,
                    color: countColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
