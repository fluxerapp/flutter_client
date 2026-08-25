import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

/// Faithful preview of the reported message (reuses [MessageItem] in preview
/// mode), matching web `IARModalPreview.tsx`.
class IarPreview extends StatelessWidget {
  const IarPreview({required this.context, super.key});

  final IarContext context;

  @override
  Widget build(BuildContext ctx) {
    return switch (context) {
      IarMessageContext(:final message, :final guildId) => _MessagePreviewCard(
        message: message,
        guildId: guildId,
      ),
      IarUserContext(
        :final userId,
        :final username,
        :final displayName,
        :final avatarUrl,
        :final avatarColor,
      ) =>
        _UserPreviewCard(
          userId: userId,
          username: username,
          displayName: displayName,
          avatarUrl: avatarUrl,
          avatarColor: avatarColor,
        ),
      IarGuildContext(:final guildName) => _GuildPreviewCard(
        guildName: guildName,
      ),
    };
  }
}

class _MessagePreviewCard extends StatelessWidget {
  const _MessagePreviewCard({required this.message, this.guildId});

  final Message message;
  final String? guildId;

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
          child: IgnorePointer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: MessageItem(
                message: message,
                inboxPreviewMode: true,
                hideMentionHighlight: true,
                previewRoleGuildId: guildId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserPreviewCard extends StatelessWidget {
  const _UserPreviewCard({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.avatarColor,
  });

  final String userId;
  final String username;
  final String displayName;
  final String? avatarUrl;
  final int? avatarColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusMd,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          children: [
            FluxerAvatar.user(
              fallbackText: displayName,
              userId: userId,
              imageUrl: avatarUrl,
              avatarColor: avatarColor,
            ),
            SizedBox(width: layout.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayName,
                    style: textStyles.bodyMedium.copyWith(
                      color: colors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '@$username',
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

class _GuildPreviewCard extends StatelessWidget {
  const _GuildPreviewCard({required this.guildName});

  final String guildName;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusMd,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              guildName,
              style: textStyles.bodyMedium.copyWith(color: colors.textPrimary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              l10n.iarPreviewCommunitySubtitle,
              style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
