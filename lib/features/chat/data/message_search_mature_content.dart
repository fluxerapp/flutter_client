import 'package:fluxer_app/features/chat/data/message_search_repository.dart';

MessageSearchQuery applyMatureContentToSearchQuery(
  MessageSearchQuery query, {
  required bool includeNsfw,
}) {
  if (!includeNsfw || (query.parsed.includeNsfw ?? false)) {
    return query;
  }
  return query.copyWith(parsed: query.parsed.copyWith(includeNsfw: true));
}
