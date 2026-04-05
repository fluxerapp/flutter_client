import 'package:flutter/material.dart';
import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/parsing/markdown_preprocessor.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:fluxer_markdown/src/utils/highlight_languages.dart';
import 'package:markdown/markdown.dart' as md;

class FluxerMarkdown extends StatelessWidget {
  const FluxerMarkdown({
    required this.data,
    required this.config,
    this.baseStyle,
    this.selectable = false,
    this.context = FluxerMarkdownContext.standardWithJumbo,
    super.key,
  });

  final String data;
  final FluxerMarkdownConfig config;
  final TextStyle? baseStyle;
  final bool selectable;
  final FluxerMarkdownContext context;

  @override
  Widget build(BuildContext context) {
    ensureFluxerMarkdownLanguagesRegistered();

    final theme = Theme.of(context);
    final style = baseStyle ?? DefaultTextStyle.of(context).style;
    final isDark = theme.brightness == Brightness.dark;
    final features = FluxerMarkdownFeatures.forContext(this.context);
    final processedText = preprocessFluxerMarkdown(data, features);
    final segments = parseFluxerMarkdownSegments(processedText, features);

    if (segments.length == 1 && segments.first is FluxerTextSegment) {
      return _buildAstMarkdown(
        context: context,
        text: (segments.first as FluxerTextSegment).text,
        style: style,
        isDark: isDark,
        features: features,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: segments.map((segment) {
        return switch (segment) {
          FluxerTextSegment(:final text) => _buildAstMarkdown(
            context: context,
            text: text,
            style: style,
            isDark: isDark,
            features: features,
          ),
          FluxerSubtextSegment(:final text) => _buildAstMarkdown(
            context: context,
            text: text,
            style: style.copyWith(
              fontSize: (style.fontSize ?? 16) * 0.75,
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.35,
            ),
            isDark: isDark,
            features: features,
          ),
          FluxerAlertSegment(:final type, :final body) =>
            (config.alertBuilder ?? defaultFluxerAlertBuilder)(
              context,
              type,
              _buildAstMarkdown(
                context: context,
                text: body,
                style: style,
                isDark: isDark,
                features: features,
              ),
              style,
            ),
        };
      }).toList(),
    );
  }

  Widget _buildAstMarkdown({
    required BuildContext context,
    required String text,
    required TextStyle style,
    required bool isDark,
    required FluxerMarkdownFeatures features,
  }) {
    final document = md.Document(
      blockSyntaxes: [
        if (features.allowCodeBlocks) const md.FencedCodeBlockSyntax(),
        if (features.allowTables) const md.TableSyntax(),
      ],
      inlineSyntaxes: [
        FluxerSpacedTripleAsteriskSyntax(),
        FluxerSpacedTripleUnderscoreSyntax(),
        FluxerSpacedStrongSyntax(),
        FluxerSpacedEmphasisSyntax(),
        FluxerSpacedUnderscoreEmphasisSyntax(),
        FluxerSpacedUnderlineSyntax(),
        FluxerSpacedStrikethroughSyntax(),
        if (config.linkWidgetBuilder != null &&
            config.internalLinkPattern != null)
          FluxerJumpLinkSyntax(config.internalLinkPattern!),
        FluxerTripleAsteriskSyntax(),
        FluxerTripleUnderscoreSyntax(),
        FluxerUnderlineSyntax(),
        md.StrikethroughSyntax(),
        if (features.allowUserMentions) FluxerUserMentionSyntax(),
        if (features.allowChannelMentions) FluxerChannelMentionSyntax(),
        if (features.allowRoleMentions) FluxerRoleMentionSyntax(),
        if (features.allowEveryoneMentions) FluxerEveryoneMentionSyntax(),
        FluxerTimestampSyntax(),
        FluxerSpoilerSyntax(),
        FluxerUnicodeEmojiToneSyntax(config.resolveEmojiShortcode),
        FluxerUnicodeEmojiSyntax(config.resolveEmojiShortcode),
        FluxerCustomEmojiSyntax(),
        if (features.allowAutolinks) md.AutolinkExtensionSyntax(),
      ],
    );

    final nodes = document.parse(text);
    return buildFluxerMarkdownAst(
      context: context,
      nodes: nodes,
      baseStyle: style,
      config: config,
      features: features,
      selectable: selectable,
      isDark: isDark,
    );
  }
}
