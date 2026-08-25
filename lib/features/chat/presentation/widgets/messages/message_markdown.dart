import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/markdown_timestamp_format.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/markdown/fluxer_markdown_adapter.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class MessageMarkdown extends ConsumerWidget {
  const MessageMarkdown({
    required this.data,
    this.baseStyle,
    this.selectable = false,
    this.channelId,
    this.guildId,
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
  final String? guildId;
  final String? messageId;
  final List<MessageChannelMention> mentionChannels;
  final FluxerMarkdownContext markdownContext;
  final bool revealSpoilers;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final int? maxLines;
  final TextOverflow? overflow;
  final Widget? trailingInlineWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MessageMarkdownSettings settings =
        MessageMarkdownSettingsScope.maybeOf(context) ??
        MessageMarkdownSettings.watch(ref, context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBoundedTextClip(
      child: MessageMarkdownBinding(
        channelId: channelId,
        guildId: guildId,
        mentionChannels: mentionChannels,
        child: FluxerMarkdown(
          data: data,
          parseCacheKey: messageId,
          config: createFluxerMarkdownConfig(
            context: context,
            revealSpoilers: revealSpoilers,
            spoilerSyncController: spoilerSyncController,
            alwaysUnderlineLinks: settings.alwaysUnderlineLinks,
            dimStrikethroughText: settings.dimStrikethroughText,
            animateCustomEmoji: settings.animateCustomEmoji,
            selectionContextMenuBuilder: selectable
                ? settings.selectionContextMenuBuilder ??
                      selectionMenuBuilderFor(settings.searchEngines)
                : null,
            timestampFormatter: (DateTime localDateTime, String style) {
              return formatMarkdownTimestamp(
                localDateTime,
                style,
                l10n,
                use12Hour: settings.use12Hour,
              );
            },
          ),
          baseStyle: baseStyle ?? context.textStyles.messageText,
          selectable: selectable,
          context: markdownContext,
          maxLines: maxLines,
          overflow: overflow,
          trailingInlineWidget: trailingInlineWidget,
        ),
      ),
    );
  }
}
