import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/presentation/thread_menu_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/navigation_item_semantics.dart';

const double _kThreadSpineInset = 22;
const double _kThreadSpineWidth = 11;
const double _kThreadSpineStroke = 2;
const double _kThreadSpineRadius = 5;
const double _kThreadSpineGap = 3;

class ThreadSidebarTile extends ConsumerWidget {
  const ThreadSidebarTile({
    required this.thread,
    required this.guildId,
    required this.isLast,
    this.tileKey,
    super.key,
  });

  final Channel thread;
  final String guildId;
  final bool isLast;
  final GlobalKey? tileKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSelected = ref.watch(
      activeChannelIdProvider.select((String? id) => id == thread.id),
    );
    final UnreadState? unread = ref
        .watch(channelUnreadProvider(thread.id))
        .value;
    final ThreadMembership? member = ref
        .watch(threadMembershipProvider(thread.id))
        .value;
    final String? parentId = thread.parentId;
    final bool parentMuted = ref.watch(
      mutedChannelIdsProvider(guildId).select(
        (AsyncValue<Set<String>> muted) =>
            parentId != null &&
            (muted.value ?? const <String>{}).contains(parentId),
      ),
    );
    final bool muted = (member?.muted ?? false) || parentMuted;
    final bool showFadedUnread = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showFadedUnreadOnMutedChannels,
      ),
    );
    final int mentionCount = unread?.mentionCount ?? 0;
    final ChannelUnreadState state = getChannelUnreadState(
      unreadCount: (unread?.hasUnreadMessages ?? false) ? 1 : 0,
      mentionCount: mentionCount,
      isMuted: muted,
      showFadedUnreadOnMutedChannels: showFadedUnread,
      unreadBadgesLevel: unread?.unreadBadgesLevel,
    );
    final bool showUnreadOnSelected = isMobileLayout(context);
    final bool showUnreadIndicator =
        state.shouldShowUnreadIndicator &&
        (showUnreadOnSelected || !isSelected);
    final bool showMentionBadge =
        mentionCount > 0 &&
        state.hasMentions &&
        (showUnreadOnSelected || !isSelected);
    final Color baseColor = isSelected
        ? context.colors.textPrimary
        : state.isHighlight
        ? context.colors.textSecondary
        : context.colors.textTertiaryMuted;
    final Color textColor = muted && !isSelected
        ? baseColor.withValues(alpha: baseColor.a * 0.5)
        : baseColor;
    return Stack(
      key: tileKey,
      clipBehavior: Clip.none,
      children: <Widget>[
        if (showUnreadIndicator)
          ChannelUnreadIndicator.positioned(
            faded: state.isUnreadIndicatorMuted,
          ),
        Positioned(
          left: _kThreadSpineInset,
          top: 0,
          bottom: 0,
          width: _kThreadSpineWidth,
          child: CustomPaint(
            painter: _ThreadSpinePainter(
              color: context.colors.interactiveMuted,
              isLast: isLast,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            const SizedBox(width: _kThreadSpineInset + _kThreadSpineWidth),
            Expanded(
              child: FluxerSelectableRow(
                isSelected: isSelected,
                selectedColor: context.colors.backgroundModifierSelected,
                borderRadius: BorderRadius.circular(4),
                margin: const EdgeInsets.only(right: 5, top: 1, bottom: 1),
                padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
                semanticLabel: navigationItemSemanticLabel(
                  l10n: FluxerLocalizations.of(context),
                  name: thread.name,
                  isSelected: isSelected,
                  hasUnread: showUnreadIndicator,
                  mentionCount: showMentionBadge ? mentionCount : 0,
                  isMuted: muted,
                ),
                onTap: () => unawaited(openThread(context, ref, thread)),
                onLongPress: () =>
                    unawaited(showThreadMenuSheet(context, ref, thread)),
                onSecondaryTapUp: (_) =>
                    unawaited(showThreadMenuSheet(context, ref, thread)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        thread.name,
                        style: context.textStyles.channelName.copyWith(
                          color: textColor,
                          fontSize: 14,
                          height: 20 / 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (showMentionBadge) ...<Widget>[
                      const SizedBox(width: 4),
                      FluxerBadge.count(count: mentionCount),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ThreadSpinePainter extends CustomPainter {
  const _ThreadSpinePainter({required this.color, required this.isLast});

  final Color color;
  final bool isLast;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = _kThreadSpineStroke
      ..style = PaintingStyle.stroke;
    const double x = _kThreadSpineStroke / 2;
    final double midY = size.height / 2;
    final double endX = size.width - _kThreadSpineGap;
    final Path path = Path()
      ..moveTo(x, 0)
      ..lineTo(x, midY - _kThreadSpineRadius)
      ..arcToPoint(
        Offset(x + _kThreadSpineRadius, midY),
        radius: const Radius.circular(_kThreadSpineRadius),
        clockwise: false,
      )
      ..lineTo(endX, midY);
    canvas.drawPath(path, paint);
    if (!isLast) {
      canvas.drawLine(
        Offset(x, midY - _kThreadSpineRadius),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ThreadSpinePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.isLast != isLast;
}
