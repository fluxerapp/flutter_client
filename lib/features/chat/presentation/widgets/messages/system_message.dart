import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/utils/message_timestamp_format.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Color _kSystemMessageOnlineIconColor = Color(0xFF22C55E);
const Color _kSystemMessageRemoveIconColor = Color(0xFFEF4444);
const double _kSystemMessageIconOpacity = 0.6;
const Duration _kSystemMessageLongPressDuration = Duration(milliseconds: 500);
const double _kSystemMessageLongPressMoveTolerance = 18;

/// Renders a system message with an icon aligned to the avatar column,
/// message text, and an inline timestamp at the end of the text.
class SystemMessage extends ConsumerWidget {
  final Message message;
  final String? guildId;
  final VoidCallback? onJumpToPinnedMessage;
  final VoidCallback? onViewAllPins;
  final VoidCallback? onLongPress;
  final void Function(Offset position)? onSecondaryTapUp;
  final ReactionToggleCallback? onReaction;
  final bool canAddReactions;

  const SystemMessage({
    required this.message,
    this.guildId,
    this.onJumpToPinnedMessage,
    this.onViewAllPins,
    this.onLongPress,
    this.onSecondaryTapUp,
    this.onReaction,
    this.canAddReactions = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (message.type == messageTypeCall && message.call == null) {
      return const SizedBox.shrink();
    }
    final String? resolvedGuildId = guildId;
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final Color? authorRoleColor = resolvedGuildId == null
        ? null
        : ref.watch(
            memberRoleColorProvider((message.authorId, resolvedGuildId)),
          );
    final String authorName = watchMessageAuthorDisplay(
      ref: ref,
      message: message,
      guildId: resolvedGuildId,
      currentUserId: currentUserId,
    ).displayName;
    final String? mentionedUserName = message.mentionedUserIds.isEmpty
        ? null
        : watchMentionUserDisplayName(
            ref: ref,
            userId: message.mentionedUserIds.first,
            channelId: message.channelId,
          );
    final textStyle = TextStyle(
      color: context.colors.textTertiaryMuted,
      fontSize: kSystemMessageBodyFontSize,
    );
    final usernameStyle = TextStyle(
      color: authorRoleColor ?? context.colors.textChat,
      fontWeight: FontWeight.bold,
      fontSize: kSystemMessageBodyFontSize,
    );
    final linkStyle = TextStyle(
      color: context.colors.textPrimary,
      fontSize: kSystemMessageBodyFontSize,
      fontWeight: FontWeight.w500,
    );
    final newNameStyle = TextStyle(
      color: context.colors.textPrimary,
      fontSize: kSystemMessageBodyFontSize,
      fontWeight: FontWeight.w500,
    );
    final (IconData icon, Color iconColor, bool flipIcon) = _iconAndColor(
      message: message,
      currentUserId: currentUserId,
      mutedColor: context.colors.textTertiaryMuted,
    );
    final List<InlineSpan> textSpans = buildSystemMessageTextSpans(
      l10n: FluxerLocalizations.of(context),
      message: message,
      authorName: authorName,
      mentionedUserName: mentionedUserName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      newNameStyle: newNameStyle,
      linkStyle: linkStyle,
      onMessageLinkTap: onJumpToPinnedMessage,
      onAllPinsLinkTap: onViewAllPins,
      onJoinCallTap: _joinCallTapHandler(
        ref: ref,
        context: context,
        guildId: resolvedGuildId,
      ),
      currentUserId: currentUserId,
    );
    final String timestampText = formatMessageTimestamp(
      message.timestamp.toLocal(),
      FluxerLocalizations.of(context),
      Localizations.localeOf(context).toString(),
      use12Hour: ref.watch(use12HourTimeFormatProvider),
    );
    final TextStyle timestampStyle = TextStyle(
      color: context.colors.textTertiaryMuted,
      fontSize: kSystemMessageTimestampFontSize,
    );
    final List<InlineSpan> spansWithTimestamp = <InlineSpan>[
      ...textSpans,
      TextSpan(
        text: '$kSystemMessageTimestampLeading$timestampText',
        style: timestampStyle,
      ),
    ];
    final bool renderReactions = ref.watch(
      userSettingsViewModelProvider.select((s) => s.renderReactions),
    );
    final bool showReactions = renderReactions && message.reactions.isNotEmpty;
    Widget content = Padding(
      padding: const EdgeInsets.fromLTRB(
        kMessageRowPaddingHorizontal,
        kMessageRowPaddingVertical,
        kMessageRowPaddingHorizontal,
        kMessageRowPaddingVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: kMessageAvatarSize,
                child: Padding(
                  padding: const EdgeInsets.only(top: kMessageAvatarTopPadding),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Opacity(
                      opacity: _kSystemMessageIconOpacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: flipIcon
                            ? (Matrix4.identity()..scaleByDouble(-1, 1, 1, 1))
                            : Matrix4.identity(),
                        child: PhosphorIcon(
                          icon,
                          size: kSystemMessageIconSize,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: kMessageAvatarTextGap),
              Expanded(
                child: Text.rich(
                  TextSpan(children: spansWithTimestamp),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          if (showReactions)
            Padding(
              padding: const EdgeInsets.only(
                left: kMessageAvatarColumnWidth,
                top: 4,
              ),
              child: MessageReactionsBar(
                reactions: message.reactions,
                channelId: message.channelId,
                onReactionTap: (emoji, {emojiId, animated = false}) =>
                    onReaction?.call(
                      emoji,
                      emojiId: emojiId,
                      animated: animated,
                    ),
                showAddReaction: canAddReactions && onReaction != null,
                isMobile: isMobileLayout(context),
              ),
            ),
        ],
      ),
    );
    if (onLongPress != null) {
      content = _PointerLongPressDetector(
        onLongPress: onLongPress!,
        child: content,
      );
    }
    if (onSecondaryTapUp != null) {
      content = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onSecondaryTapUp: (details) =>
            onSecondaryTapUp!(details.globalPosition),
        child: content,
      );
    }
    return content;
  }

  VoidCallback? _joinCallTapHandler({
    required WidgetRef ref,
    required BuildContext context,
    required String? guildId,
  }) {
    final MessageCall? call = message.call;
    if (call == null || call.isEnded) {
      return null;
    }
    final voice = ref.watch(voiceSessionProvider);
    final bool isConnectedToChannel =
        voice.isInVoice && voice.channelId == message.channelId;
    if (isConnectedToChannel) {
      return null;
    }
    return () {
      unawaited(
        joinVoiceChannelWithConfirmation(
          ref: ref,
          guildId: guildId,
          channelId: message.channelId,
          context: context,
        ),
      );
    };
  }

  (IconData, Color, bool) _iconAndColor({
    required Message message,
    required String? currentUserId,
    required Color mutedColor,
  }) {
    switch (message.type) {
      case messageTypeUserJoin:
        return (
          PhosphorIconsBold.arrowRight,
          _kSystemMessageOnlineIconColor,
          false,
        );
      case messageTypeChannelPinnedMessage:
        return (PhosphorIconsFill.pushPin, mutedColor, false);
      case messageTypeRecipientAdd:
        return (
          PhosphorIconsBold.userPlus,
          _kSystemMessageOnlineIconColor,
          false,
        );
      case messageTypeRecipientRemove:
        return (
          PhosphorIconsBold.userMinus,
          _kSystemMessageRemoveIconColor,
          false,
        );
      case messageTypeCall:
        final MessageCall? call = message.call;
        if (call == null) {
          return (PhosphorIconsFill.phone, mutedColor, false);
        }
        if (!call.isEnded) {
          return (
            PhosphorIconsFill.phone,
            _kSystemMessageOnlineIconColor,
            false,
          );
        }
        final bool includesCurrentUser =
            currentUserId != null && call.participants.contains(currentUserId);
        final bool authorIsCurrentUser =
            currentUserId != null && message.authorId == currentUserId;
        final bool isMissedCall =
            call.isEnded && !includesCurrentUser && !authorIsCurrentUser;
        if (isMissedCall) {
          return (PhosphorIconsFill.phone, mutedColor, true);
        }
        return (PhosphorIconsFill.phone, _kSystemMessageOnlineIconColor, false);
      case messageTypeChannelNameChange:
        return (PhosphorIconsBold.pencilSimple, mutedColor, false);
      case messageTypeChannelIconChange:
        return (PhosphorIconsBold.imageSquare, mutedColor, false);
      default:
        return (PhosphorIconsFill.info, mutedColor, false);
    }
  }
}

class _PointerLongPressDetector extends StatefulWidget {
  const _PointerLongPressDetector({
    required this.onLongPress,
    required this.child,
  });

  final VoidCallback onLongPress;
  final Widget child;

  @override
  State<_PointerLongPressDetector> createState() =>
      _PointerLongPressDetectorState();
}

class _PointerLongPressDetectorState extends State<_PointerLongPressDetector> {
  Timer? _holdTimer;
  Offset? _pointerDownPosition;
  bool _absorbPointers = false;

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  void _cancelHold() {
    _holdTimer?.cancel();
    _holdTimer = null;
    _pointerDownPosition = null;
  }

  void _handlePointerDown(PointerDownEvent event) {
    _cancelHold();
    _pointerDownPosition = event.position;
    _holdTimer = Timer(_kSystemMessageLongPressDuration, () {
      _holdTimer = null;
      widget.onLongPress();
      setState(() => _absorbPointers = true);
      Future<void>.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() => _absorbPointers = false);
        }
      });
    });
  }

  void _handlePointerMove(PointerMoveEvent event) {
    final Offset? origin = _pointerDownPosition;
    if (origin == null) {
      return;
    }
    if ((event.position - origin).distance >
        _kSystemMessageLongPressMoveTolerance) {
      _cancelHold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _handlePointerDown,
      onPointerMove: _handlePointerMove,
      onPointerUp: (_) => _cancelHold(),
      onPointerCancel: (_) => _cancelHold(),
      child: AbsorbPointer(absorbing: _absorbPointers, child: widget.child),
    );
  }
}
