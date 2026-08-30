import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:fluxer_markdown_native/fluxer_markdown_native.dart' as native;
import 'package:markdown/markdown.dart' as md;

int fluxerParserFlagsForFeatures(FluxerMarkdownFeatures features) {
  var flags = 0;
  if (features.allowSpoilers) {
    flags |= native.FluxerParserFlags.spoilers;
  }
  if (features.allowHeadings) {
    flags |= native.FluxerParserFlags.headings;
  }
  if (features.allowLists) {
    flags |= native.FluxerParserFlags.lists;
  }
  if (features.allowCodeBlocks) {
    flags |= native.FluxerParserFlags.codeBlocks;
  }
  if (features.allowMaskedLinks) {
    flags |= native.FluxerParserFlags.maskedLinks;
  }
  if (features.allowCommandMentions) {
    flags |= native.FluxerParserFlags.commandMentions;
  }
  if (features.allowGuildNavigations) {
    flags |= native.FluxerParserFlags.guildNavigations;
  }
  if (features.allowUserMentions) {
    flags |= native.FluxerParserFlags.userMentions;
  }
  if (features.allowRoleMentions) {
    flags |= native.FluxerParserFlags.roleMentions;
  }
  if (features.allowChannelMentions) {
    flags |= native.FluxerParserFlags.channelMentions;
  }
  if (features.allowEveryoneMentions) {
    flags |= native.FluxerParserFlags.everyoneMentions;
  }
  if (features.allowBlockquotes) {
    flags |= native.FluxerParserFlags.blockquotes;
  }
  if (features.allowMultilineBlockquotes) {
    flags |= native.FluxerParserFlags.multilineBlockquotes;
  }
  if (features.allowSubtext) {
    flags |= native.FluxerParserFlags.subtext;
  }
  if (features.allowTables) {
    flags |= native.FluxerParserFlags.tables;
  }
  if (features.allowAlerts) {
    flags |= native.FluxerParserFlags.alerts;
  }
  if (features.allowAutolinks) {
    flags |= native.FluxerParserFlags.autolinks;
  }
  return flags;
}

/// Top-level on purpose: [FluxerMarkdown.astParser] participates in the
/// widget's layout cache key. `null` on native failure falls back to the
/// classic pipeline.
List<md.Node>? parseNativeFluxerMarkdownAst(
  String data,
  FluxerMarkdownFeatures features,
) {
  try {
    final nodes = native.parseFluxerMarkdownBinary(
      data,
      flags: fluxerParserFlagsForFeatures(features),
    );
    return native.fluxerNativeAstToMarkdown(nodes);
  } on Object catch (error, stackTrace) {
    FluxerObservability.instance.recordError(
      error,
      source: 'native_markdown_parser',
      stackTrace: stackTrace,
      context: 'length=${data.length}',
    );
    return null;
  }
}
