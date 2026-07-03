import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';

class DmListRecipientRowData {
  const DmListRecipientRowData({required this.status, this.customStatus});

  final String status;
  final String? customStatus;
}

const String _dmListRecipientUserIdSeparator = '\x1e';

final dmListRecipientUserIdsKeyProvider = Provider<String>((Ref ref) {
  final List<DmConversation> conversations = ref.watch(
    dmViewModelProvider.select((DmViewState state) => state.conversations),
  );
  final Set<String> userIds = <String>{};
  for (final DmConversation conversation in conversations) {
    if (conversation.isGroup) {
      userIds.addAll(conversation.remoteRecipientIds);
    } else if (!conversation.isPersonalNotes) {
      userIds.add(conversation.recipientId);
    }
  }
  if (userIds.isEmpty) {
    return '';
  }
  final List<String> sorted = userIds.toList()..sort();
  return sorted.join(_dmListRecipientUserIdSeparator);
});

final dmListRecipientRowDataProvider =
    StreamProvider<Map<String, DmListRecipientRowData>>((Ref ref) {
      final String userIdsKey = ref.watch(dmListRecipientUserIdsKeyProvider);
      if (userIdsKey.isEmpty) {
        return Stream<Map<String, DmListRecipientRowData>>.value(
          const <String, DmListRecipientRowData>{},
        );
      }
      final List<String> userIds = userIdsKey.split(
        _dmListRecipientUserIdSeparator,
      );
      final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
      return database.userDao
          .watchUsersByIds(userIds)
          .map(
            (List<User> users) => <String, DmListRecipientRowData>{
              for (final User user in users)
                user.id: DmListRecipientRowData(
                  status: user.status,
                  customStatus: user.customStatus,
                ),
            },
          );
    });
