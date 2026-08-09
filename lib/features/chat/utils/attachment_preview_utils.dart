import 'package:fluxer_app/features/chat/domain/message.dart';

const int kTextPreviewMaxBytes = 128 * 1024;
const int kDefaultPreviewLines = 6;
const int kMaxExpandedPreviewLines = 100;
const int kMaxCodeHighlightSourceLength = 50000;

final RegExp kTextualPreviewLineBreakPattern = RegExp(r'\r\n|\r|\n');

const List<String> kTextualMimePrefixes = <String>[
  'text/',
  'application/json',
  'application/ld+json',
  'application/xml',
  'application/javascript',
];

const Set<String> kTextualMimeExact = <String>{
  'application/x-sh',
  'application/x-shellscript',
  'application/x-bash',
  'application/sql',
  'application/x-yaml',
  'package/manifest+json',
};

const Set<String> kTextualExtensions = <String>{
  'txt',
  'md',
  'markdown',
  'log',
  'json',
  'js',
  'jsx',
  'ts',
  'tsx',
  'py',
  'java',
  'c',
  'cpp',
  'h',
  'cs',
  'css',
  'scss',
  'sass',
  'html',
  'htm',
  'xml',
  'yml',
  'yaml',
  'sh',
  'bash',
  'ps1',
  'go',
  'rb',
  'php',
  'rust',
  'dockerfile',
  'sql',
  'ini',
  'cfg',
  'conf',
  'csv',
};

const Map<String, String> kExtensionLanguageMap = <String, String>{
  'js': 'javascript',
  'jsx': 'javascript',
  'ts': 'typescript',
  'tsx': 'typescript',
  'py': 'python',
  'java': 'java',
  'c': 'c',
  'cpp': 'cpp',
  'h': 'cpp',
  'cs': 'csharp',
  'css': 'css',
  'scss': 'scss',
  'sass': 'scss',
  'html': 'xml',
  'htm': 'xml',
  'xml': 'xml',
  'json': 'json',
  'yml': 'yaml',
  'yaml': 'yaml',
  'sh': 'bash',
  'bash': 'bash',
  'ps1': 'powershell',
  'go': 'go',
  'rb': 'ruby',
  'php': 'php',
  'rust': 'rust',
  'dockerfile': 'dockerfile',
  'sql': 'sql',
  'ini': 'ini',
  'cfg': 'ini',
  'conf': 'ini',
  'csv': 'plaintext',
  'md': 'markdown',
  'markdown': 'markdown',
  'log': 'plaintext',
  'txt': 'plaintext',
};

const Map<String, String> kMimeLanguageMap = <String, String>{
  'application/json': 'json',
  'application/ld+json': 'json',
  'application/javascript': 'javascript',
  'application/x-javascript': 'javascript',
  'text/javascript': 'javascript',
  'application/typescript': 'typescript',
  'text/typescript': 'typescript',
  'text/html': 'xml',
  'application/xhtml+xml': 'xml',
  'application/xml': 'xml',
  'text/xml': 'xml',
  'text/css': 'css',
  'application/xml+rss': 'xml',
  'application/atom+xml': 'xml',
  'application/x-yaml': 'yaml',
  'text/yaml': 'yaml',
  'text/markdown': 'markdown',
  'text/x-markdown': 'markdown',
  'text/csv': 'plaintext',
  'application/csv': 'plaintext',
  'application/x-sh': 'bash',
  'application/x-shellscript': 'bash',
  'application/x-bash': 'bash',
  'application/x-php': 'php',
  'application/x-python': 'python',
  'application/x-ruby': 'ruby',
};

const List<String> kSupportedPreviewLanguages = <String>[
  'auto',
  'plaintext',
  'json',
  'javascript',
  'typescript',
  'python',
  'java',
  'c',
  'cpp',
  'csharp',
  'go',
  'ruby',
  'php',
  'rust',
  'bash',
  'powershell',
  'css',
  'scss',
  'xml',
  'yaml',
  'markdown',
  'sql',
  'ini',
  'dockerfile',
];

String attachmentPreviewFileName(Attachment attachment) {
  final String filename = attachment.filename.trim();
  if (filename.isNotEmpty) {
    return filename;
  }
  final String title = attachment.title?.trim() ?? '';
  if (title.isNotEmpty) {
    return title;
  }
  return attachment.filename;
}

String? attachmentPreviewExtension(Attachment attachment) {
  final String fileName = attachmentPreviewFileName(attachment);
  final List<String> segments = fileName.split('.');
  if (segments.length < 2) {
    return null;
  }
  final String extension = segments.last.trim().toLowerCase();
  return extension.isEmpty ? null : extension;
}

String normalizeAttachmentContentType(String? contentType) {
  return (contentType ?? '').toLowerCase().split(';').first.trim();
}

bool isTextualAttachment(Attachment attachment) {
  if (attachment.url.isEmpty) {
    return false;
  }
  if (attachment.expired ?? false) {
    return false;
  }
  final String normalizedType = normalizeAttachmentContentType(
    attachment.contentType,
  );
  if (normalizedType.isNotEmpty) {
    if (kTextualMimePrefixes.any(normalizedType.startsWith)) {
      return true;
    }
    if (kTextualMimeExact.contains(normalizedType)) {
      return true;
    }
  }
  final String? extension = attachmentPreviewExtension(attachment);
  if (extension != null && kTextualExtensions.contains(extension)) {
    return true;
  }
  return false;
}

bool shouldPreviewAttachment(Attachment attachment) {
  if (!isTextualAttachment(attachment)) {
    return false;
  }
  final int? size = attachment.size;
  if (size != null && size > kTextPreviewMaxBytes) {
    return false;
  }
  return true;
}

String? getLanguageFromAttachment(Attachment attachment) {
  final String? extension = attachmentPreviewExtension(attachment);
  if (extension != null) {
    final String? fromExtension = kExtensionLanguageMap[extension];
    if (fromExtension != null) {
      return fromExtension;
    }
  }
  final String normalizedType = normalizeAttachmentContentType(
    attachment.contentType,
  );
  if (normalizedType.isNotEmpty) {
    return kMimeLanguageMap[normalizedType];
  }
  return null;
}

String inferLanguageCodeFromAttachment(Attachment attachment) {
  final String? mapped = getLanguageFromAttachment(
    attachment,
  )?.trim().toLowerCase();
  if (mapped != null && mapped.isNotEmpty) {
    return mapped;
  }
  final String? extension = attachmentPreviewExtension(attachment);
  if (extension != null) {
    return extension;
  }
  return 'plaintext';
}

bool isSupportedPreviewLanguage(String languageCode) {
  final String normalized = languageCode.trim().toLowerCase();
  if (normalized.isEmpty) {
    return false;
  }
  return kSupportedPreviewLanguages.contains(normalized);
}

String getInitialSelectedLanguage(
  Attachment attachment,
  String inferredLanguageCode,
) {
  if (isSupportedPreviewLanguage(inferredLanguageCode)) {
    return inferredLanguageCode;
  }
  final String? mapped = getLanguageFromAttachment(
    attachment,
  )?.trim().toLowerCase();
  if (mapped != null && isSupportedPreviewLanguage(mapped)) {
    return mapped;
  }
  return 'plaintext';
}

int getLineCount(String? textContent) {
  if (textContent == null || textContent.isEmpty) {
    return 0;
  }
  return splitPreviewLines(textContent).length;
}

List<String> splitPreviewLines(String textContent) {
  return textContent.split(kTextualPreviewLineBreakPattern);
}

int getVisibleLineCount(int lineCount, {required bool isExpanded}) {
  if (!isExpanded) {
    return kDefaultPreviewLines;
  }
  if (lineCount <= 0) {
    return 1;
  }
  return lineCount < kMaxExpandedPreviewLines
      ? lineCount
      : kMaxExpandedPreviewLines;
}

String joinPreviewLines(List<String> lines, {required int maxLines}) {
  if (lines.length <= maxLines) {
    return lines.join('\n');
  }
  return lines.take(maxLines).join('\n');
}

String truncatePreviewTextForInlineExpand(String textContent) {
  final List<String> lines = splitPreviewLines(textContent);
  return joinPreviewLines(lines, maxLines: kMaxExpandedPreviewLines);
}

int remainingPreviewLines(String textContent) {
  final int lineCount = getLineCount(textContent);
  if (lineCount <= kMaxExpandedPreviewLines) {
    return 0;
  }
  return lineCount - kMaxExpandedPreviewLines;
}

int remainingPreviewLinesFromCount(int lineCount) {
  if (lineCount <= kMaxExpandedPreviewLines) {
    return 0;
  }
  return lineCount - kMaxExpandedPreviewLines;
}

final Map<String, bool> previewExpansionState = <String, bool>{};
