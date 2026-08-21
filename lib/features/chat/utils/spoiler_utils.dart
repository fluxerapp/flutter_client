import 'package:fluxer_app/features/chat/domain/message.dart';

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
  final uri = Uri.tryParse(url);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
    return null;
  }
  final normalized = uri.toString();
  return normalized.endsWith('/')
      ? normalized.substring(0, normalized.length - 1)
      : normalized;
}

List<String> spoilerSyncKeysForEmbed(Embed embed, Set<String> spoileredUrls) {
  if (spoileredUrls.isEmpty) {
    return const [];
  }

  final candidates = <String?>[
    embed.url,
    embed.image?.url,
    embed.image?.proxyUrl,
    embed.thumbnail?.url,
    embed.thumbnail?.proxyUrl,
    embed.video?.url,
    embed.video?.proxyUrl,
  ];
  final keys = <String>{};

  for (final candidate in candidates) {
    if (candidate == null) {
      continue;
    }
    final normalized = normalizeSpoilerUrl(candidate);
    if (normalized != null && spoileredUrls.contains(normalized)) {
      keys.add(normalized);
    }
  }

  return List<String>.unmodifiable(keys);
}

bool isEmbedSpoilered(Embed embed, Set<String> spoileredUrls) {
  return spoilerSyncKeysForEmbed(embed, spoileredUrls).isNotEmpty;
}

String forwardedSnapshotScope(String messageId) => '$messageId-forward';

List<String> spoilerSyncKeysForAttachment({
  required String scope,
  required Attachment attachment,
}) {
  if (!attachment.isSpoiler || scope.isEmpty) {
    return const [];
  }

  final String attachmentKey = attachment.id.isNotEmpty
      ? attachment.id
      : attachment.url.isNotEmpty
      ? attachment.url
      : attachment.filename;
  if (attachmentKey.isEmpty) {
    return const [];
  }

  return List<String>.unmodifiable(<String>[
    'attachment:$scope:$attachmentKey',
  ]);
}
