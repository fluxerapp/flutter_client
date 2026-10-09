import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';

sealed class IarContext {
  const IarContext();

  ReportFlowTargetType get targetType;

  String? get blockableUserId;
}

class IarMessageContext extends IarContext {
  const IarMessageContext({required this.message, required this.guildId});

  final Message message;
  final String? guildId;

  @override
  ReportFlowTargetType get targetType => ReportFlowTargetType.message;

  @override
  String? get blockableUserId =>
      message.isWebhookMessage || message.authorIsSystem
      ? null
      : message.authorId;
}

class IarUserContext extends IarContext {
  const IarUserContext({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    this.avatarColor,
    this.guildId,
  });

  final String userId;
  final String username;
  final String displayName;
  final String? avatarUrl;
  final int? avatarColor;
  final String? guildId;

  @override
  ReportFlowTargetType get targetType => ReportFlowTargetType.user;

  @override
  String? get blockableUserId => userId;
}
