import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

class ReportFlowTargetPreview extends StatelessWidget {
  const ReportFlowTargetPreview({required this.target, super.key});

  final IarContext target;

  @override
  Widget build(BuildContext context) {
    return switch (target) {
      IarMessageContext(:final message, :final guildId) =>
        _ReportFlowMessagePreview(message: message, guildId: guildId),
      final IarUserContext user => ReportFlowUserCard(user: user),
    };
  }
}

class _ReportFlowMessagePreview extends StatefulWidget {
  const _ReportFlowMessagePreview({
    required this.message,
    required this.guildId,
  });

  final Message message;
  final String? guildId;

  @override
  State<_ReportFlowMessagePreview> createState() =>
      _ReportFlowMessagePreviewState();
}

class _ReportFlowMessagePreviewState extends State<_ReportFlowMessagePreview> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: math.min(220, MediaQuery.sizeOf(context).height * 0.4),
            ),
            child: Scrollbar(
              controller: _controller,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _controller,
                primary: false,
                padding: EdgeInsets.symmetric(vertical: layout.s2),
                child: IgnorePointer(
                  child: MessageItem(
                    message: widget.message,
                    inboxPreviewMode: true,
                    hideMentionHighlight: true,
                    previewRoleGuildId: widget.guildId,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReportFlowUserCard extends StatelessWidget {
  const ReportFlowUserCard({required this.user, super.key});

  final IarUserContext user;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          children: [
            FluxerAvatar.user(
              fallbackText: user.displayName,
              userId: user.userId,
              imageUrl: user.avatarUrl,
              avatarColor: user.avatarColor,
            ),
            SizedBox(width: layout.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user.displayName,
                    style: textStyles.bodyMedium.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user.username,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textTertiary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
