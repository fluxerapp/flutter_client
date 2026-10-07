import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';

final RegExp _spoilerRegex = RegExp(r'\|\|([\s\S]*?)\|\|');
final RegExp _urlRegex = RegExp(
  r'''https?:\/\/[^\s<>"']+''',
  caseSensitive: false,
);

Set<String> extractSpoileredUrls(String content) {
  final urls = <String>{};
  for (final spoiler in _spoilerRegex.allMatches(content)) {
    final body = spoiler.group(1);
    if (body == null || body.isEmpty) {
      continue;
    }
    for (final url in _urlRegex.allMatches(body)) {
      final normalized = normalizeSpoilerUrl(url.group(0) ?? '');
      if (normalized != null) {
        urls.add(normalized);
      }
    }
  }
  return urls;
}

String? normalizeSpoilerUrl(String url) {
  final uri = Uri.tryParse(url.trim());
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
    return null;
  }

  final Uri cleaned = uri.replace(
    scheme: uri.scheme.toLowerCase(),
    host: uri.host.toLowerCase(),
    port: _isDefaultPort(uri) ? null : uri.port,
  );
  var normalized = cleaned.toString();
  if (normalized.endsWith('/')) {
    normalized = normalized.substring(0, normalized.length - 1);
  }
  return normalized;
}

bool _isDefaultPort(Uri uri) {
  return (uri.scheme == 'http' && uri.port == 80) ||
      (uri.scheme == 'https' && uri.port == 443);
}

String _canonicalHost(Uri uri) {
  final host = uri.host.toLowerCase();
  if (host.startsWith('www.')) {
    return host.substring(4);
  }
  return host;
}

String? _youtubeVideoId(Uri uri) {
  final host = _canonicalHost(uri);
  if (host == 'youtu.be') {
    if (uri.pathSegments.isEmpty) {
      return null;
    }
    final id = uri.pathSegments.first;
    return id.isEmpty ? null : id;
  }
  if (host == 'youtube.com' ||
      host == 'm.youtube.com' ||
      host == 'music.youtube.com') {
    if (uri.pathSegments.isEmpty) {
      return uri.queryParameters['v'];
    }
    final String first = uri.pathSegments.first;
    if (first == 'watch') {
      return uri.queryParameters['v'];
    }
    if (first == 'embed' || first == 'shorts' || first == 'v') {
      return uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
    }
  }
  return null;
}

bool _pathsAndQueryMatch(Uri a, Uri b) {
  return a.path == b.path && a.query == b.query;
}

bool _spoilerUrlMatchesCandidate(
  String spoilerNormalized,
  String candidateRaw,
) {
  final String? candidateNormalized = normalizeSpoilerUrl(candidateRaw);
  if (candidateNormalized == null) {
    return false;
  }
  if (spoilerNormalized == candidateNormalized) {
    return true;
  }

  final Uri spoilerUri = Uri.parse(spoilerNormalized);
  final Uri candidateUri = Uri.parse(candidateNormalized);

  if (_canonicalHost(spoilerUri) == _canonicalHost(candidateUri) &&
      _pathsAndQueryMatch(spoilerUri, candidateUri)) {
    return true;
  }

  final String? spoilerVideoId = _youtubeVideoId(spoilerUri);
  final String? candidateVideoId = _youtubeVideoId(candidateUri);
  if (spoilerVideoId != null &&
      candidateVideoId != null &&
      spoilerVideoId == candidateVideoId) {
    return true;
  }

  return false;
}

List<String?> _embedUrlCandidates(Embed embed) {
  return <String?>[
    embed.url,
    embed.providerUrl,
    embed.author?.url,
    embed.image?.url,
    embed.image?.proxyUrl,
    embed.thumbnail?.url,
    embed.thumbnail?.proxyUrl,
    embed.video?.url,
    embed.video?.proxyUrl,
  ];
}

List<String> spoilerSyncKeysForEmbed(Embed embed, Set<String> spoileredUrls) {
  if (spoileredUrls.isEmpty) {
    return const [];
  }

  final keys = <String>{};

  for (final spoilerUrl in spoileredUrls) {
    for (final candidate in _embedUrlCandidates(embed)) {
      if (candidate == null || candidate.isEmpty) {
        continue;
      }
      if (_spoilerUrlMatchesCandidate(spoilerUrl, candidate)) {
        keys.add(spoilerUrl);
      }
    }
  }

  return List<String>.unmodifiable(keys);
}

bool _messageContentIsOnlySpoilers(String content) {
  var rest = content;
  for (final RegExpMatch match in _spoilerRegex.allMatches(content)) {
    rest = rest.replaceRange(match.start, match.end, '');
  }
  return rest.trim().isEmpty;
}

List<String> spoilerSyncKeysForMessageEmbed({
  required String messageContent,
  required Embed embed,
  required List<Embed> messageEmbeds,
}) {
  final Set<String> spoileredUrls = extractSpoileredUrls(messageContent);
  final List<String> keys = spoilerSyncKeysForEmbed(embed, spoileredUrls);
  if (keys.isNotEmpty ||
      spoileredUrls.isEmpty ||
      messageEmbeds.length != 1 ||
      messageEmbeds.first != embed ||
      !_messageContentIsOnlySpoilers(messageContent)) {
    return keys;
  }
  return List<String>.unmodifiable(spoileredUrls);
}

String forwardedSnapshotScope(String messageId) => '$messageId-forward';

List<String> spoilerSyncKeysForAttachment({
  required String scope,
  required Attachment attachment,
}) {
  if (!attachment.isSpoiler || scope.isEmpty) {
    return const [];
  }

  final String effectiveUrl = attachmentEffectiveUrl(attachment);
  final String attachmentKey = attachment.id.isNotEmpty
      ? attachment.id
      : effectiveUrl.isNotEmpty
      ? effectiveUrl
      : attachment.filename;
  if (attachmentKey.isEmpty) {
    return const [];
  }

  return List<String>.unmodifiable(<String>[
    'attachment:$scope:$attachmentKey',
  ]);
}
