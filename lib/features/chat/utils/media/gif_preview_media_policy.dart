final RegExp _animatedImageFileExtensionRegex = RegExp(
  r'\.(?:webp|gif)(?:$|[?#])',
  caseSensitive: false,
);

bool isAnimatedImagePreviewUrl(String value) {
  if (value.isEmpty) {
    return false;
  }

  final parsed = Uri.tryParse(value);
  final target = parsed?.path ?? value;
  if (_animatedImageFileExtensionRegex.hasMatch(target)) {
    return true;
  }
  return _animatedImageFileExtensionRegex.hasMatch(value);
}

bool gifPreviewShouldLoadImage({
  required String previewUrl,
  required String sourceUrl,
  required bool isAnimatedImagePlaybackAllowed,
}) {
  final isAnimatedImagePreview =
      isAnimatedImagePreviewUrl(previewUrl) ||
      isAnimatedImagePreviewUrl(sourceUrl);
  return !isAnimatedImagePreview || isAnimatedImagePlaybackAllowed;
}
