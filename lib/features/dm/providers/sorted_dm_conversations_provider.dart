import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sorted_dm_conversations_provider.g.dart';

@riverpod
List<DmConversation> sortedDmConversations(Ref ref) {
  final List<DmConversation> convos = ref.watch(
    dmViewModelProvider.select((DmViewState state) => state.conversations),
  );
  final Set<String> pinnedIds =
      ref.watch(pinnedDmChannelIdsProvider).value ?? <String>{};
  final List<String> pinnedOrder =
      ref.watch(pinnedDmChannelOrderProvider).value ?? <String>[];
  return sortDmConversations(convos, pinnedIds, pinnedOrder);
}

List<DmConversation> sortDmConversations(
  List<DmConversation> convos,
  Set<String> pinnedIds,
  List<String> pinnedOrder,
) {
  final pinIndex = {
    for (var i = 0; i < pinnedOrder.length; i++) pinnedOrder[i]: i,
  };
  return [...convos]..sort((a, b) {
    final aPin = pinIndex[a.id];
    final bPin = pinIndex[b.id];
    final aIsPinned = aPin != null;
    final bIsPinned = bPin != null;

    if (aIsPinned && bIsPinned) {
      return aPin.compareTo(bPin);
    }
    if (aIsPinned != bIsPinned) {
      return aIsPinned ? -1 : 1;
    }
    return b.lastMessageTime.compareTo(a.lastMessageTime);
  });
}
