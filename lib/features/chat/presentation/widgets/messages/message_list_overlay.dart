import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MessageListOverlay extends StatelessWidget {
  const MessageListOverlay({
    required this.body,
    required this.showUnreadBar,
    required this.unreadCount,
    required this.isEstimated,
    required this.unreadSince,
    required this.onJumpToUnread,
    required this.onMarkRead,
    required this.scaleRatio,
    super.key,
  });

  final Widget body;
  final bool showUnreadBar;
  final int unreadCount;
  final bool isEstimated;
  final DateTime? unreadSince;
  final VoidCallback onJumpToUnread;
  final VoidCallback onMarkRead;
  final double scaleRatio;

  @override
  Widget build(BuildContext context) {
    final Widget scaledBody = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        body,
        if (showUnreadBar)
          Positioned(
            top: 8,
            left: 12,
            right: 12,
            child: MessageListNewMessagesBar(
              count: unreadCount,
              isEstimated: isEstimated,
              since: unreadSince,
              onJumpToUnread: onJumpToUnread,
              onMarkRead: onMarkRead,
            ),
          ),
      ],
    );
    return _ChatTextScale(scaleRatio: scaleRatio, child: scaledBody);
  }
}

class MessageListNewMessagesBar extends ConsumerWidget {
  const MessageListNewMessagesBar({
    required this.count,
    required this.isEstimated,
    required this.since,
    required this.onJumpToUnread,
    required this.onMarkRead,
    super.key,
  });

  final int count;
  final bool isEstimated;
  final DateTime? since;
  final VoidCallback onJumpToUnread;
  final VoidCallback onMarkRead;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String displayCount = unreadCountLabel(
      count,
      isEstimated: isEstimated,
    );
    final String messageLabel = count == 1 && !isEstimated
        ? '1 new message'
        : '$displayCount new';
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final String locale = Localizations.localeOf(context).toString();
    final String sinceLabel = since == null
        ? ''
        : ' since ${formatUserTime(since!.toLocal(), locale, use12Hour: use12Hour)}';
    return Material(
      color: context.colors.brandPrimary,
      elevation: 3,
      shadowColor: Colors.black.withValues(alpha: 0.22),
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: onJumpToUnread,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 9, 8, 9),
                child: Row(
                  children: <Widget>[
                    PhosphorIcon(
                      PhosphorIconsBold.envelopeOpen,
                      color: context.colors.textOnBrandPrimary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '$messageLabel$sinceLabel',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.smallText.copyWith(
                          color: context.colors.textOnBrandPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onMarkRead,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 9, 12, 9),
              child: Text(
                'Mark Read',
                maxLines: 1,
                style: context.textStyles.smallText.copyWith(
                  color: context.colors.textOnBrandPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatTextScale extends StatelessWidget {
  const _ChatTextScale({required this.scaleRatio, required this.child});

  final double scaleRatio;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(
          MediaQuery.of(context).textScaler.scale(1) * scaleRatio,
        ),
      ),
      child: child,
    );
  }
}
