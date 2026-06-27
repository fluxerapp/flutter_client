import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';

final dmListPresenceMapProvider = StreamProvider<Map<String, String>>((
  Ref ref,
) {
  final List<DmConversation> conversations = ref.watch(
    dmViewModelProvider.select((DmViewState state) => state.conversations),
  );
  final Set<String> userIds = <String>{};
  for (final DmConversation conversation in conversations) {
    if (conversation.isGroup) {
      userIds.addAll(conversation.remoteRecipientIds);
    } else if (shouldShowDmRecipientPresence(conversation)) {
      userIds.add(conversation.recipientId);
    }
  }
  if (userIds.isEmpty) {
    return Stream<Map<String, String>>.value(const <String, String>{});
  }
  final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
  return database.userDao
      .watchUsersByIds(userIds.toList())
      .map(
        (List<User> users) => <String, String>{
          for (final User user in users) user.id: user.status,
        },
      );
});
