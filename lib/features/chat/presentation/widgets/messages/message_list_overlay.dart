import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/chat/data/chat_unread_summary.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
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
    required this.showLoadErrorBar,
    required this.loadErrorRetryInFlight,
    required this.onRetryLoadMessages,
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
  final bool showLoadErrorBar;
  final bool loadErrorRetryInFlight;
  final VoidCallback onRetryLoadMessages;
  final double scaleRatio;

  @override
  Widget build(BuildContext context) {
    final Widget scaledBody = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        body,
        Positioned(
          top: 8,
          left: 12,
          right: 12,
          child: AnimatedSwitcher(
            duration: context.motion.normal,
            switchInCurve: context.motion.curve,
            switchOutCurve: context.motion.curve,
            transitionBuilder: _unreadBarTransition,
            layoutBuilder: _unreadBarLayout,
            child: showUnreadBar
                ? MessageListNewMessagesBar(
                    key: const ValueKey<String>('message-list-unread-bar'),
                    count: unreadCount,
                    isEstimated: isEstimated,
                    since: unreadSince,
                    onJumpToUnread: onJumpToUnread,
                    onMarkRead: onMarkRead,
                  )
                : const SizedBox.shrink(),
          ),
        ),
        if (showLoadErrorBar)
          Positioned(
            left: 12,
            right: 12,
            bottom: 8,
            child: MessageListLoadErrorBar(
              retryInFlight: loadErrorRetryInFlight,
              onRetry: onRetryLoadMessages,
            ),
          ),
      ],
    );
    return _ChatTextScale(scaleRatio: scaleRatio, child: scaledBody);
  }

  static Widget _unreadBarTransition(
    Widget child,
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -kUnreadBarHiddenOffset),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  static Widget _unreadBarLayout(
    Widget? currentChild,
    List<Widget> previousChildren,
  ) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[...previousChildren, ?currentChild],
    );
  }
}

class MessageListLoadErrorBar extends StatelessWidget {
  const MessageListLoadErrorBar({
    required this.retryInFlight,
    required this.onRetry,
    super.key,
  });

  final bool retryInFlight;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color danger = context.colors.statusDanger;
    return Semantics(
      label: l10n.chatMessagesFailedToLoad,
      container: true,
      child: Material(
        color: Color.alphaBlend(
          danger.withValues(alpha: 0.12),
          context.colors.backgroundTextarea,
        ),
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 0.18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
          side: BorderSide(
            color: Color.alphaBlend(
              danger.withValues(alpha: 0.48),
              context.colors.backgroundModifierAccent,
            ),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  l10n.chatMessagesFailedToLoad,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.smallText.copyWith(
                    color: danger,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              FluxerButton.primary(
                label: l10n.retry,
                size: FluxerButtonSize.small,
                fitContent: true,
                isLoading: retryInFlight,
                onPressed: retryInFlight ? null : onRetry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const double kUnreadBarHiddenOffset = 0.5;

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
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: onJumpToUnread,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 9, 8, 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PhosphorIcon(
                    PhosphorIconsBold.envelopeOpen,
                    color: context.colors.textOnBrandPrimary,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '$messageLabel$sinceLabel',
                      maxLines: 2,
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
          InkWell(
            onTap: onMarkRead,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 9, 12, 9),
              child: Text(
                'Mark Read',
                maxLines: 2,
                textAlign: TextAlign.end,
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
        textScaler: chatMessageTextScaler(
          MediaQuery.textScalerOf(context),
          scaleRatio,
        ),
      ),
      child: child,
    );
  }
}
