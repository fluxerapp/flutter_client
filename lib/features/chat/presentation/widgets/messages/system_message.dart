import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Color _kGuildJoinIconColor = Color(0xFF22C55E);

/// Renders a system message as a single row with an icon,
/// bold author name, descriptive text, and timestamp.
class SystemMessage extends ConsumerWidget {
  final Message message;
  final String? guildId;

  const SystemMessage({required this.message, this.guildId, super.key});

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
    final textStyle = TextStyle(
      color: context.colors.textTertiaryMuted,
      fontSize: 14,
    );
    final usernameStyle = TextStyle(
      color: authorRoleColor ?? context.colors.textChat,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final (icon, textSpans) = _iconAndTextSpans(
      context,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Opacity(
            opacity: 0.6,
            child: PhosphorIcon(
              icon,
              size: 18,
              color: message.type == messageTypeUserJoin
                  ? _kGuildJoinIconColor
                  : context.colors.textTertiaryMuted,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text.rich(
              TextSpan(children: textSpans),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _formatTimestamp(message.timestamp),
            style: TextStyle(
              color: context.colors.textTertiaryMuted,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  (IconData, List<InlineSpan>) _iconAndTextSpans(
    BuildContext context, {
    required TextStyle textStyle,
    required TextStyle usernameStyle,
  }) {
    if (message.type == messageTypeUserJoin) {
      return (
        PhosphorIconsBold.arrowRight,
        _guildJoinTextSpans(
          FluxerLocalizations.of(context),
          textStyle: textStyle,
          usernameStyle: usernameStyle,
        ),
      );
    }

    final (icon, text) = _iconAndText();
    return (
      icon,
      <InlineSpan>[
        TextSpan(text: message.authorName, style: usernameStyle),
        TextSpan(text: ' $text', style: textStyle),
      ],
    );
  }

  List<InlineSpan> _guildJoinTextSpans(
    FluxerLocalizations l10n, {
    required TextStyle textStyle,
    required TextStyle usernameStyle,
  }) {
    final template = resolveGuildJoinMessageTemplate(
      l10n,
      messageId: message.id,
    );
    final parts = template.split(kGuildJoinMessageUsernamePlaceholder);
    if (parts.length == 1) {
      return <InlineSpan>[TextSpan(text: template, style: textStyle)];
    }
    return <InlineSpan>[
      for (var i = 0; i < parts.length; i++) ...[
        if (parts[i].isNotEmpty) TextSpan(text: parts[i], style: textStyle),
        if (i < parts.length - 1)
          TextSpan(text: message.authorName, style: usernameStyle),
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
      case messageTypeChannelPinnedMessage:
        return (PhosphorIconsFill.pushPin, 'pinned a message.');
      default:
        return (PhosphorIconsFill.info, message.content);
    }
  }

  String _formatTimestamp(DateTime dt) {
    final local = dt.toLocal();
    final now = DateTime.now();
    final isToday =
        local.year == now.year &&
        local.month == now.month &&
        local.day == now.day;
    final h = local.hour.toString().padLeft(2, '0');
    final m = local.minute.toString().padLeft(2, '0');
    if (isToday) {
      return 'Today at $h:$m';
    }
    return '${local.month}/${local.day}/${local.year} $h:$m';
  }
}
