import 'package:fluxer_markdown/src/config/fluxer_markdown_config.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_features.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:markdown/markdown.dart' as md;

const int kFluxerMarkdownMaxListNestingDepth = 9;

List<md.InlineSyntax> fluxerStandardInlineSyntaxes() {
  return <md.InlineSyntax>[
    md.EscapeSyntax(),
    md.CodeSyntax(),
    md.LinkSyntax(),
    md.EmphasisSyntax.asterisk(),
    md.EmphasisSyntax.underscore(),
    md.SoftLineBreakSyntax(),
    md.LineBreakSyntax(),
  ];
}

List<md.InlineSyntax> fluxerInlineSyntaxes({
  required FluxerMarkdownFeatures features,
  required FluxerShortcodeResolver resolveEmojiShortcode,
  RegExp? internalLinkPattern,
  bool includeJumpLinks = false,
  RegExp? unicodeEmojiPattern,
}) {
  return <md.InlineSyntax>[
    if (includeJumpLinks && internalLinkPattern != null) ...<md.InlineSyntax>[
      FluxerJumpLinkSyntax(internalLinkPattern),
      FluxerBracketedJumpLinkSyntax(internalLinkPattern),
    ],
    FluxerAppLinkSyntax(),
    FluxerBracketedAppLinkSyntax(),
    FluxerUnderlineSyntax(),
    md.StrikethroughSyntax(),
    if (features.allowUserMentions) FluxerUserMentionSyntax(),
    if (features.allowChannelMentions) FluxerChannelMentionSyntax(),
    if (features.allowRoleMentions) FluxerRoleMentionSyntax(),
    if (features.allowEveryoneMentions) FluxerEveryoneMentionSyntax(),
    if (features.allowCommandMentions) FluxerCommandMentionSyntax(),
    if (features.allowGuildNavigations) FluxerGuildNavigationSyntax(),
    FluxerTimestampSyntax(),
    if (features.allowSpoilers) FluxerSpoilerSyntax(),
    FluxerUnicodeEmojiToneSyntax(resolveEmojiShortcode),
    FluxerUnicodeEmojiSyntax(resolveEmojiShortcode),
    FluxerCustomEmojiSyntax(),
    if (unicodeEmojiPattern != null)
      FluxerRawUnicodeEmojiSyntax(unicodeEmojiPattern),
    if (features.allowAutolinks) ...<md.InlineSyntax>[
      FluxerSmsLinkSyntax(),
      FluxerPhoneLinkSyntax(),
      FluxerAngleEmailLinkSyntax(),
      FluxerAngleUrlLinkSyntax(),
      FluxerLocalhostAutolinkSyntax(),
      FluxerAutolinkExtensionSyntax(),
    ],
    ...fluxerStandardInlineSyntaxes(),
  ];
}
