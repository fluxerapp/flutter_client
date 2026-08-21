import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:highlight/highlight.dart' show Mode;

class PreviewLanguageOption {
  const PreviewLanguageOption({
    required this.code,
    required this.canonicalCode,
  });

  final String code;
  final String canonicalCode;

  bool get hasSecondaryName =>
      canonicalCode.isNotEmpty && canonicalCode != code;
}

String previewLanguageCanonicalCode(String code) {
  final String normalized = code.trim().toLowerCase();
  if (normalized.isEmpty) {
    return normalized;
  }
  if (normalized == 'plaintext' ||
      normalized == 'plain' ||
      normalized == 'text') {
    return 'text';
  }
  if (normalized == 'auto') {
    return 'auto';
  }

  ensureFluxerMarkdownLanguagesRegistered();
  final Mode? mode = kFluxerMarkdownLanguages[normalized];
  if (mode == null) {
    return normalized;
  }

  final List<String> aliases = mode.aliases ?? const <String>[];
  final List<String> candidates = kFluxerMarkdownLanguages.entries
      .where((MapEntry<String, Mode> entry) => identical(entry.value, mode))
      .map((MapEntry<String, Mode> entry) => entry.key)
      .toList(growable: false);
  final List<String> primary = candidates
      .where((String key) => !aliases.contains(key))
      .toList();
  if (primary.isEmpty) {
    primary.addAll(candidates);
  }
  primary.sort((String left, String right) {
    final int lengthCompare = right.length.compareTo(left.length);
    if (lengthCompare != 0) {
      return lengthCompare;
    }
    return left.compareTo(right);
  });
  return primary.first;
}

List<PreviewLanguageOption> buildPreviewLanguageOptions({
  String inferredLanguageCode = '',
  String selectedLanguage = '',
}) {
  ensureFluxerMarkdownLanguagesRegistered();
  final String inferred = inferredLanguageCode.trim().toLowerCase();
  final String selected = selectedLanguage.trim().toLowerCase();
  final Set<String> codes = <String>{
    'plaintext',
    ...kSupportedPreviewLanguages.where((String code) => code != 'auto'),
    ...kFluxerMarkdownLanguages.keys,
  };
  final List<PreviewLanguageOption> options =
      codes
          .map(
            (String code) => PreviewLanguageOption(
              code: code,
              canonicalCode: previewLanguageCanonicalCode(code),
            ),
          )
          .toList()
        ..sort((PreviewLanguageOption left, PreviewLanguageOption right) {
          final int leftScore =
              (left.code == inferred ||
                  left.canonicalCode == inferred ||
                  left.code == selected ||
                  left.canonicalCode == selected)
              ? 1
              : 0;
          final int rightScore =
              (right.code == inferred ||
                  right.canonicalCode == inferred ||
                  right.code == selected ||
                  right.canonicalCode == selected)
              ? 1
              : 0;
          if (leftScore != rightScore) {
            return rightScore.compareTo(leftScore);
          }
          return left.code.compareTo(right.code);
        });
  return options;
}
