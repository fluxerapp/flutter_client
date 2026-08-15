import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

typedef BlockedGroupMessageBuilder =
    Widget Function(Message message, Message? previousMessage);

class BlockedMessageGroups extends StatelessWidget {
  const BlockedMessageGroups({
    required this.item,
    required this.isRevealed,
    required this.onToggle,
    required this.messageBuilder,
    this.leadingPreviousMessage,
    super.key,
  });

  final ChannelStreamItem item;
  final bool isRevealed;
  final VoidCallback onToggle;
  final BlockedGroupMessageBuilder messageBuilder;
  final Message? leadingPreviousMessage;

  @override
  Widget build(BuildContext context) {
    if (isRevealed) {
      final List<Widget> children = <Widget>[];
      Message? previousMessage = leadingPreviousMessage;
      for (final Message message in item.messages) {
        children.add(messageBuilder(message, previousMessage));
        previousMessage = message;
      }
      // Identity is owned by the viewport's per-tile KeyedSubtree wrapper
      // ('group-<groupKey>'); duplicating the key here would nest two nodes
      // with the same ValueKey and break by-key finders.
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int count = item.messages.length;
    final String label = item.type == ChannelStreamType.messageGroupBlocked
        ? l10n.chatBlockedMessagesCollapsed(count)
        : l10n.chatSpammerMessagesCollapsed(count);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: FluxerButton.ghost(
        onPressed: onToggle,
        child: Text(
          label,
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textPrimaryMuted,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
