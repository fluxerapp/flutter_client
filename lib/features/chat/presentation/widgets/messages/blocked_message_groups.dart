import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

typedef BlockedGroupMessageBuilder =
    Widget Function(Message message, Message? previousMessage);

class BlockedMessageGroups extends StatelessWidget {
  const BlockedMessageGroups({
    required this.item,
    required this.isRevealed,
    required this.onToggle,
    required this.messageBuilder,
    this.leadingPreviousMessage,
    this.leadingGroupSpacing = 0,
    super.key,
  });

  final ChannelStreamItem item;
  final bool isRevealed;
  final VoidCallback onToggle;
  final BlockedGroupMessageBuilder messageBuilder;
  final Message? leadingPreviousMessage;
  final double leadingGroupSpacing;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int count = item.messages.length;
    final String label = item.type == ChannelStreamType.messageGroupBlocked
        ? l10n.chatBlockedMessagesCollapsed(count)
        : l10n.chatSpammerMessagesCollapsed(count);

    final List<Widget> revealedMessages = <Widget>[];
    if (isRevealed) {
      Message? previousMessage = leadingPreviousMessage;
      for (final Message message in item.messages) {
        revealedMessages.add(messageBuilder(message, previousMessage));
        previousMessage = message;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (leadingGroupSpacing > 0) SizedBox(height: leadingGroupSpacing),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMessageRowPaddingHorizontal,
                  vertical: 4,
                ),
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
              ),
              if (revealedMessages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: revealedMessages,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
