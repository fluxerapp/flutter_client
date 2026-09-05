import 'package:fluxer_markdown/src/utils/visible_content.dart';

const int kFluxerMarkdownMaxMaskedLinkUrlLength = 2048;

bool hasVisibleMaskedLinkLabel(String text) => hasVisibleContent(text);

bool isEmailLikeMaskedLinkLabel(String text) {
  final int atIndex = text.indexOf('@');
  if (atIndex <= 0 || atIndex == text.length - 1) {
    return false;
  }
  if (text.contains(RegExp(r'\s'))) {
    return false;
  }
  return text.substring(atIndex + 1).contains('.');
}

bool isSlashCommandLikeMaskedLinkLabel(String text) {
  final String trimmed = text.trim();
  return trimmed.startsWith('</') &&
      trimmed.endsWith('>') &&
      trimmed.contains(':');
}

bool isValidMaskedLinkUrl(String url) {
  final String normalized = unwrapAngleMaskedLinkDestination(url);
  if (normalized.isEmpty ||
      normalized.length > kFluxerMarkdownMaxMaskedLinkUrlLength) {
    return false;
  }
  if (normalized.contains('"')) {
    return false;
  }
  final Uri? uri = Uri.tryParse(normalized);
  if (uri == null) {
    return false;
  }
  final String scheme = uri.scheme.toLowerCase();
  if (scheme == 'http' || scheme == 'https') {
    return uri.userInfo.isEmpty;
  }
  return scheme == 'mailto' ||
      scheme == 'tel' ||
      scheme == 'sms' ||
      scheme == 'fluxer';
}

String unwrapAngleMaskedLinkDestination(String url) {
  final String trimmed = url.trim();
  if (trimmed.length >= 2 && trimmed.startsWith('<') && trimmed.endsWith('>')) {
    return trimmed.substring(1, trimmed.length - 1);
  }
  return trimmed;
}

bool isMisleadingMaskedLinkLabel(String text, String url) {
  final String label = text.trim();
  final String destination = unwrapAngleMaskedLinkDestination(url);
  if (!_looksLikeComparableUrl(label)) {
    return false;
  }
  return !_maskedLinkUrlsMatch(label, destination);
}

bool _looksLikeComparableUrl(String value) {
  final String lower = value.toLowerCase();
  return lower.startsWith('https://') ||
      lower.startsWith('http://') ||
      lower.startsWith('fluxer:');
}

bool _maskedLinkUrlsMatch(String left, String right) {
  final Uri? leftUri = Uri.tryParse(left);
  final Uri? rightUri = Uri.tryParse(right);
  if (leftUri == null || rightUri == null) {
    return left == right;
  }
  return leftUri.scheme.toLowerCase() == rightUri.scheme.toLowerCase() &&
      leftUri.host.toLowerCase() == rightUri.host.toLowerCase() &&
      leftUri.port == rightUri.port &&
      leftUri.path == rightUri.path &&
      leftUri.query == rightUri.query &&
      leftUri.fragment == rightUri.fragment;
}

bool isAutolinkDisplayText(String text, String href) {
  if (text == href) {
    return true;
  }
  for (final String prefix in <String>['mailto:', 'tel:', 'sms:']) {
    if (href.startsWith(prefix) && text == href.substring(prefix.length)) {
      return true;
    }
  }
  return false;
}
