import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_grouping_utils.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UnreadInboxCardPreview extends ConsumerWidget {
  const UnreadInboxCardPreview({
    required this.preview,
    required this.isLoading,
    required this.showViewAllUnread,
    required this.previewRoleGuildId,
    required this.onViewAllUnread,
    super.key,
  });

  final List<Message>? preview;
  final bool isLoading;
  final bool showViewAllUnread;
  final String? previewRoleGuildId;
  final ValueChanged<Message> onViewAllUnread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerColorTheme colors = context.colors;
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 8),
        child: NotificationsSkeletonBlock(),
      );
    }
    final List<Message>? items = preview;
    if (items == null || items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondaryAlt,
          borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kNotificationPreviewRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildBody(context, ref, items),
              if (showViewAllUnread)
                _buildViewAllButton(context, colors, items.first),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, List<Message> items) {
    final String? currentUserId = ref.watch(currentUserIdProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (int i = 0; i < items.length; i++)
          MessageItem(
            message: items[i],
            isGrouped: shouldGroupMessages(
              items[i],
              i > 0 ? items[i - 1] : null,
            ),
            currentUserId: currentUserId,
            inboxPreviewMode: true,
            previewRoleGuildId: previewRoleGuildId,
          ),
      ],
    );
  }

  Widget _buildViewAllButton(
    BuildContext context,
    FluxerColorTheme colors,
    Message first,
  ) {
    final FluxerTextTheme textStyles = context.textStyles;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: OutlinedButton(
          onPressed: () => onViewAllUnread(first),
          style: OutlinedButton.styleFrom(
            foregroundColor: colors.textPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            side: BorderSide(color: colors.backgroundHeaderSecondary),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            l10n.notificationsViewAllUnread,
            style: textStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
