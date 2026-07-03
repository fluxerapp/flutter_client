import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';

void main() {
  group('dmListRecipientUserIdsKeyProvider', () {
    test(
      'ignores last-message updates when the recipient set is unchanged',
      () {
        DmViewState stateWithMessage(String message) {
          return DmViewState(
            conversations: [
              DmConversation(
                id: '100',
                type: ChannelType.dm.wireValue,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: message,
                lastMessageTime: DateTime(2026),
              ),
            ],
            friendsList: const [],
            activeTab: FriendsTab.online,
            searchQuery: '',
          );
        }

        final ProviderContainer before = ProviderContainer(
          overrides: [
            dmViewModelProvider.overrideWithValue(stateWithMessage('Hello')),
          ],
        );
        final ProviderContainer after = ProviderContainer(
          overrides: [
            dmViewModelProvider.overrideWithValue(
              stateWithMessage('Updated preview text'),
            ),
          ],
        );
        addTearDown(before.dispose);
        addTearDown(after.dispose);

        expect(
          before.read(dmListRecipientUserIdsKeyProvider),
          after.read(dmListRecipientUserIdsKeyProvider),
        );
      },
    );

    test('includes group recipients and excludes personal notes', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          dmViewModelProvider.overrideWithValue(
            DmViewState(
              conversations: [
                DmConversation(
                  id: 'group',
                  type: ChannelType.groupDm.wireValue,
                  recipientId: '200',
                  recipientName: 'Monty',
                  lastMessage: '',
                  lastMessageTime: DateTime(2026),
                  remoteRecipientIds: const ['201', '202'],
                ),
                DmConversation(
                  id: 'notes',
                  type: ChannelType.dmPersonalNotes.wireValue,
                  recipientId: '300',
                  recipientName: 'Notes',
                  lastMessage: '',
                  lastMessageTime: DateTime(2026),
                ),
                DmConversation(
                  id: 'dm',
                  type: ChannelType.dm.wireValue,
                  recipientId: '400',
                  recipientName: 'Alex',
                  lastMessage: '',
                  lastMessageTime: DateTime(2026),
                ),
              ],
              friendsList: const [],
              activeTab: FriendsTab.online,
              searchQuery: '',
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(dmListRecipientUserIdsKeyProvider),
        '201\x1e202\x1e400',
      );
    });
  });
}
