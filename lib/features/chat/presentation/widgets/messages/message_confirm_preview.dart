import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/material_ui.dart';

class MessageConfirmPreview extends ConsumerWidget {
  const MessageConfirmPreview({required this.message, this.guildId, super.key});

  final Message message;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final layout = context.layout;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(
          MediaQuery.textScalerOf(context).scale(1) * 0.875,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusMd,
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: ClipRRect(
          borderRadius: layout.radiusMd,
          child: IgnorePointer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: layout.s2),
              child: message.isSystemMessage
                  ? SystemMessage(message: message, guildId: guildId)
                  : MessageItem(
                      message: message,
                      inboxPreviewMode: true,
                      hideMentionHighlight: true,
                      previewRoleGuildId: guildId,
                      currentUserId: ref.watch(currentUserIdProvider),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
