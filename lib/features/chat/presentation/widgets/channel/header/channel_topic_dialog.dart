import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

Future<void> showChannelTopicDialog(
  BuildContext context, {
  required String channelName,
  required String topic,
  required String channelId,
}) {
  return FluxerModal.show<void>(
    context,
    title: channelName,
    centered: true,
    builder: (dialogContext, close) => Padding(
      padding: EdgeInsets.all(dialogContext.layout.s4),
      child: SelectableRegion(
        focusNode: FocusNode(),
        selectionControls: materialTextSelectionControls,
        child: MessageMarkdown(
          data: topic,
          channelId: channelId,
          markdownContext: FluxerMarkdownContext.restrictedChannelTopic,
          baseStyle: dialogContext.textStyles.bodySmall.copyWith(
            color: dialogContext.colors.textSecondary,
          ),
        ),
      ),
    ),
  );
}
