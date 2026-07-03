import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/markdown/fluxer_markdown_adapter.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class MessageMarkdown extends StatelessWidget {
  const MessageMarkdown({
    required this.data,
    this.baseStyle,
    this.selectable = false,
    this.channelId,
    this.messageId,
    this.mentionChannels = const [],
    this.markdownContext = FluxerMarkdownContext.standardWithJumbo,
    this.revealSpoilers = false,
    this.spoilerSyncController,
    this.maxLines,
    this.overflow,
    this.trailingInlineWidget,
    super.key,
  });

  final String data;
  final TextStyle? baseStyle;
  final bool selectable;
  final String? channelId;
  final String? messageId;
  final List<MessageChannelMention> mentionChannels;
  final FluxerMarkdownContext markdownContext;
  final bool revealSpoilers;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final int? maxLines;
  final TextOverflow? overflow;
  final Widget? trailingInlineWidget;

  @override
  Widget build(BuildContext context) {
    return FluxerMarkdown(
      data: data,
      parseCacheKey: messageId == null ? null : '$messageId:${data.hashCode}',
      config: createFluxerMarkdownConfig(
        context: context,
        channelId: channelId,
        mentionChannels: mentionChannels,
        revealSpoilers: revealSpoilers,
        spoilerSyncController: spoilerSyncController,
      ),
      baseStyle: baseStyle ?? context.textStyles.messageText,
      selectable: selectable,
      context: markdownContext,
      maxLines: maxLines,
      overflow: overflow,
      trailingInlineWidget: trailingInlineWidget,
    );
  }
}
