import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';

class ChannelHeaderSearchState {
  const ChannelHeaderSearchState({
    this.isActive = false,
    this.displayText = '',
    this.segments = const <ChannelSearchSegment>[],
    this.scope = MessageSearchScopeFilter.current,
    this.sort = MessageSearchSortFilter.newest,
    this.contentTypes = const <MessageSearchContentFilter>{},
    this.authorId = '',
    this.channelId = '',
    this.guildId,
  });

  final bool isActive;
  final String displayText;
  final List<ChannelSearchSegment> segments;
  final MessageSearchScopeFilter scope;
  final MessageSearchSortFilter sort;
  final Set<MessageSearchContentFilter> contentTypes;
  final String authorId;
  final String channelId;
  final String? guildId;

  ChannelHeaderSearchState copyWith({
    bool? isActive,
    String? displayText,
    List<ChannelSearchSegment>? segments,
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
    String? authorId,
    String? channelId,
    Object? guildId = _unset,
  }) {
    return ChannelHeaderSearchState(
      isActive: isActive ?? this.isActive,
      displayText: displayText ?? this.displayText,
      segments: segments ?? this.segments,
      scope: scope ?? this.scope,
      sort: sort ?? this.sort,
      contentTypes: contentTypes ?? this.contentTypes,
      authorId: authorId ?? this.authorId,
      channelId: channelId ?? this.channelId,
      guildId: guildId == _unset ? this.guildId : guildId as String?,
    );
  }
}

const Object _unset = Object();

class ChannelHeaderSearchNotifier extends Notifier<ChannelHeaderSearchState> {
  @override
  ChannelHeaderSearchState build() => const ChannelHeaderSearchState();

  void bindChannel({required String channelId, String? guildId}) {
    if (state.channelId == channelId && state.guildId == guildId) {
      return;
    }
    state = ChannelHeaderSearchState(channelId: channelId, guildId: guildId);
  }

  void updateDisplayText(String text) {
    state = state.copyWith(
      displayText: text,
      segments: parseChannelSearchDisplayText(text),
    );
  }

  void setScope(MessageSearchScopeFilter scope) {
    state = state.copyWith(scope: scope);
  }

  void setSort(MessageSearchSortFilter sort) {
    state = state.copyWith(sort: sort);
  }

  void activateSearch({required String channelId, String? guildId}) {
    state = state.copyWith(
      isActive: true,
      channelId: channelId,
      guildId: guildId,
    );
  }

  void deactivateSearch() {
    state = const ChannelHeaderSearchState();
  }

  void closeSearch() {
    state = ChannelHeaderSearchState(
      channelId: state.channelId,
      guildId: state.guildId,
    );
  }
}

final channelHeaderSearchProvider =
    NotifierProvider<ChannelHeaderSearchNotifier, ChannelHeaderSearchState>(
      ChannelHeaderSearchNotifier.new,
    );
