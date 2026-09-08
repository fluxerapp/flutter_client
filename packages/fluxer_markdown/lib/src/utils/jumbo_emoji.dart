const kFluxerMarkdownJumboMaxCount = 30;
const kFluxerMarkdownEmojiSizeMultiplier = 1.5;
const kFluxerMarkdownEmojiSizeNormal = 24.0;
const kFluxerMarkdownEmojiSizeJumbo = 48.0;
const kFluxerMarkdownRestrictedInlineEmojiEm = 1.25;

double fluxerMarkdownEmojiSize({
  required double? fontSize,
  required double? height,
  required bool jumbo,
  bool fitToLineHeight = false,
}) {
  if (jumbo) {
    return kFluxerMarkdownEmojiSizeJumbo;
  }
  final double resolvedFontSize = fontSize ?? 16;
  if (fitToLineHeight) {
    return resolvedFontSize *
        (height ?? kFluxerMarkdownRestrictedInlineEmojiEm);
  }
  return resolvedFontSize * kFluxerMarkdownEmojiSizeMultiplier;
}
