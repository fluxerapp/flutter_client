import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_grouping_utils.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UnreadInboxCardPreview extends ConsumerWidget {
  const UnreadInboxCardPreview({
    required this.preview,
    required this.read,
    required this.showViewAllUnread,
    required this.previewRoleGuildId,
    required this.onViewAllUnread,
    super.key,
  });

  final List<Message> preview;
  final bool read;
  final bool showViewAllUnread;
  final String? previewRoleGuildId;
  final ValueChanged<Message> onViewAllUnread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Message> items = preview;
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        NotificationQuote(barGap: 0, child: _buildBody(context, ref, items)),
        if (showViewAllUnread)
          NotificationRowButton(
            label: FluxerLocalizations.of(context).notificationsViewAllUnread,
            onPressed: () => onViewAllUnread(items.first),
          ),
      ],
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
            previewTextStyle: notificationQuoteStyle(context, unread: !read),
            previewRoleGuildId: previewRoleGuildId,
          ),
      ],
    );
  }
}
