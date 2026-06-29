import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/utils/message_timestamp_format.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Color _kGuildJoinIconColor = Color(0xFF22C55E);
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

  const SystemMessage({
    required this.message,
    this.guildId,
    this.onJumpToPinnedMessage,
    this.onViewAllPins,
    this.onLongPress,
    this.onSecondaryTapUp,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? resolvedGuildId = guildId;
    final Color? authorRoleColor = resolvedGuildId == null
        ? null
        : ref
              .watch(
                memberRoleColorProvider((message.authorId, resolvedGuildId)),
              )
              .value;
    final String authorName = watchMessageAuthorDisplay(
      ref: ref,
      message: message,
      guildId: resolvedGuildId,
      currentUserId: ref.watch(currentUserIdProvider),
    ).displayName;
    final textStyle = TextStyle(
      color: context.colors.textTertiaryMuted,
      fontSize: kSystemMessageBodyFontSize,
    );
    final usernameStyle = TextStyle(
      color: authorRoleColor ?? context.colors.textChat,
      fontWeight: FontWeight.bold,
      fontSize: kSystemMessageBodyFontSize,
    );
    final (icon, textSpans) = _iconAndTextSpans(
      context,
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
    );
    final String timestampText = formatMessageTimestamp(
      message.timestamp.toLocal(),
      FluxerLocalizations.of(context),
      Localizations.localeOf(context).toString(),
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
    Widget content = Padding(
      padding: const EdgeInsets.fromLTRB(
        kMessageRowPaddingHorizontal,
        kMessageRowPaddingVertical,
        kMessageRowPaddingHorizontal,
        kMessageRowPaddingVertical,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: kMessageAvatarSize,
            child: Padding(
              padding: const EdgeInsets.only(top: kMessageAvatarTopPadding),
              child: Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: 0.6,
                  child: PhosphorIcon(
                    icon,
                    size: kSystemMessageIconSize,
                    color: message.type == messageTypeUserJoin
                        ? _kGuildJoinIconColor
                        : context.colors.textTertiaryMuted,
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

  (IconData, List<InlineSpan>) _iconAndTextSpans(
    BuildContext context, {
    required String authorName,
    required TextStyle textStyle,
    required TextStyle usernameStyle,
  }) {
    if (message.type == messageTypeUserJoin) {
      return (
        PhosphorIconsBold.arrowRight,
        _guildJoinTextSpans(
          FluxerLocalizations.of(context),
          authorName: authorName,
          textStyle: textStyle,
          usernameStyle: usernameStyle,
        ),
      );
    }
    if (message.type == messageTypeChannelPinnedMessage) {
      return (
        PhosphorIconsFill.pushPin,
        _pinMessageTextSpans(
          context,
          authorName: authorName,
          textStyle: textStyle,
          usernameStyle: usernameStyle,
        ),
      );
    }
    final (icon, text) = _iconAndText();
    return (
      icon,
      <InlineSpan>[
        TextSpan(text: authorName, style: usernameStyle),
        TextSpan(text: ' $text', style: textStyle),
      ],
    );
  }

  List<InlineSpan> _pinMessageTextSpans(
    BuildContext context, {
    required String authorName,
    required TextStyle textStyle,
    required TextStyle usernameStyle,
  }) {
    final l10n = FluxerLocalizations.of(context);
    final linkStyle = TextStyle(
      color: context.colors.textPrimary,
      fontSize: kSystemMessageBodyFontSize,
      fontWeight: FontWeight.w500,
    );
    return buildPinMessageTextSpans(
      l10n: l10n,
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      linkStyle: linkStyle,
      onMessageLinkTap: onJumpToPinnedMessage,
      onAllPinsLinkTap: onViewAllPins,
    );
  }

  List<InlineSpan> _guildJoinTextSpans(
    FluxerLocalizations l10n, {
    required String authorName,
    required TextStyle textStyle,
    required TextStyle usernameStyle,
  }) {
    final template = resolveGuildJoinMessageTemplate(
      l10n,
      messageId: message.id,
    );
    final parts = template.split(kSystemMessageUsernamePlaceholder);
    if (parts.length == 1) {
      return <InlineSpan>[TextSpan(text: template, style: textStyle)];
    }
    return <InlineSpan>[
      for (var i = 0; i < parts.length; i++) ...[
        if (parts[i].isNotEmpty) TextSpan(text: parts[i], style: textStyle),
        if (i < parts.length - 1)
          TextSpan(text: authorName, style: usernameStyle),
      ],
    ];
  }

  (IconData, String) _iconAndText() {
    switch (message.type) {
      case messageTypeRecipientRemove:
        return (PhosphorIconsFill.info, message.content);
      case messageTypeCall:
        return (PhosphorIconsFill.phone, 'started a call.');
      case messageTypeChannelNameChange:
        return (PhosphorIconsFill.textAa, 'changed the channel name.');
      case messageTypeChannelIconChange:
        return (PhosphorIconsFill.image, 'changed the channel icon.');
      default:
        return (PhosphorIconsFill.info, message.content);
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
