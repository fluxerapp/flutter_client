import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show NotifierProviderFamily;

class ForumHeaderSearchState {
  const ForumHeaderSearchState({this.expanded = false});

  final bool expanded;

  ForumHeaderSearchState copyWith({bool? expanded}) =>
      ForumHeaderSearchState(expanded: expanded ?? this.expanded);
}

class ForumHeaderSearchController extends Notifier<ForumHeaderSearchState> {
  ForumHeaderSearchController(this.channelId);

  final String channelId;

  @override
  ForumHeaderSearchState build() => const ForumHeaderSearchState();

  void expand() {
    if (!state.expanded) {
      state = state.copyWith(expanded: true);
    }
  }

  void collapse() {
    if (state.expanded) {
      state = state.copyWith(expanded: false);
    }
  }
}

final NotifierProviderFamily<
  ForumHeaderSearchController,
  ForumHeaderSearchState,
  String
>
forumHeaderSearchProvider =
    NotifierProvider.family<
      ForumHeaderSearchController,
      ForumHeaderSearchState,
      String
    >(ForumHeaderSearchController.new);
