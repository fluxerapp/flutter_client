import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';

class MessageActionCallbacks {
  const MessageActionCallbacks({
    this.onReply,
    this.onForward,
    this.onEdit,
    this.onDelete,
    this.onRetry,
    this.onDeleteFailed,
    this.onMarkAsUnread,
    this.onViewReactions,
    this.onRemoveAllReactions,
    this.onReport,
    this.onAddReaction,
  });

  final VoidCallback? onReply;
  final VoidCallback? onForward;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRetry;
  final VoidCallback? onDeleteFailed;
  final VoidCallback? onMarkAsUnread;
  final VoidCallback? onViewReactions;
  final VoidCallback? onRemoveAllReactions;
  final VoidCallback? onReport;
  final VoidCallback? onAddReaction;
}

class MessageActionPermissions {
  const MessageActionPermissions({
    required this.isOwnMessage,
    required this.isDmChannel,
    required this.canDelete,
    required this.canReport,
    required this.canAddReactions,
    required this.canPinMessage,
    required this.canManageMessages,
    required this.canSendMessages,
    required this.developerMode,
  });

  final bool isOwnMessage;
  final bool isDmChannel;
  final bool canDelete;
  final bool canReport;
  final bool canAddReactions;
  final bool canPinMessage;
  final bool canManageMessages;
  final bool canSendMessages;
  final bool developerMode;
}

class MessageMediaActionScope {
  const MessageMediaActionScope({
    required this.message,
    required this.permissions,
    required this.callbacks,
    this.previewRoleGuildId,
  });

  final Message message;
  final MessageActionPermissions permissions;
  final MessageActionCallbacks callbacks;
  final String? previewRoleGuildId;
}

class ChatFullscreenVideoLaunchContext {
  const ChatFullscreenVideoLaunchContext({
    required this.source,
    this.attachment,
    this.embedIndex,
    this.actionScope,
  });

  final ChatVideoSource source;
  final Attachment? attachment;
  final int? embedIndex;
  final MessageMediaActionScope? actionScope;

  bool get hasOptionsMenu =>
      source.fallbackUrl.trim().isNotEmpty || actionScope != null;

  factory ChatFullscreenVideoLaunchContext.fromAttachment({
    required Attachment attachment,
    required FluxerMediaDimensions layoutDimensions,
    MessageMediaActionScope? actionScope,
  }) {
    return ChatFullscreenVideoLaunchContext(
      source: ChatVideoSource.fromAttachment(attachment, layoutDimensions),
      attachment: attachment,
      actionScope: actionScope,
    );
  }

  factory ChatFullscreenVideoLaunchContext.fromEmbed({
    required Embed embed,
    int? embedIndex,
    MessageMediaActionScope? actionScope,
  }) {
    return ChatFullscreenVideoLaunchContext(
      source: ChatVideoSource.fromEmbed(embed),
      embedIndex: embedIndex,
      actionScope: actionScope,
    );
  }
}
