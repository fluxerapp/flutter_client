import 'package:fluxer_app/features/chat/domain/message.dart';

class SavedMessageMissingEntry {
  const SavedMessageMissingEntry({
    required this.id,
    required this.channelId,
    required this.messageId,
  });

  final String id;
  final String channelId;
  final String messageId;
}

class SavedMessagesFetchPage {
  const SavedMessagesFetchPage({
    required this.messages,
    required this.missing,
    required this.hasMore,
    this.cursor,
  });

  final List<Message> messages;
  final List<SavedMessageMissingEntry> missing;
  final bool hasMore;
  final String? cursor;
}

class SavedMessagesState {
  const SavedMessagesState({
    this.messages = const <Message>[],
    this.missing = const <SavedMessageMissingEntry>[],
    this.fetched = false,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.cursor,
    this.lastError,
  });

  final List<Message> messages;
  final List<SavedMessageMissingEntry> missing;
  final bool fetched;
  final bool hasMore;
  final bool isLoadingMore;
  final String? cursor;
  final Object? lastError;

  bool get isEmpty => messages.isEmpty && missing.isEmpty;

  SavedMessagesState copyWith({
    List<Message>? messages,
    List<SavedMessageMissingEntry>? missing,
    bool? fetched,
    bool? hasMore,
    bool? isLoadingMore,
    String? cursor,
    Object? lastError,
    bool resetError = false,
  }) {
    return SavedMessagesState(
      messages: messages ?? this.messages,
      missing: missing ?? this.missing,
      fetched: fetched ?? this.fetched,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      cursor: cursor ?? this.cursor,
      lastError: resetError ? null : (lastError ?? this.lastError),
    );
  }
}
