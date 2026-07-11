import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/add_friends_to_group_controller.dart';

void main() {
  group('AddFriendsToGroupController', () {
    late ProviderContainer container;
    late AddFriendsToGroupController controller;
    final DmConversation dm = DmConversation(
      id: 'group-1',
      type: 3,
      recipientId: 'user-1',
      recipientName: 'Alice',
      lastMessage: '',
      lastMessageTime: DateTime.utc(2026),
      recipientCount: 3,
      remoteRecipientIds: <String>['user-1', 'user-2'],
    );

    setUp(() {
      container = ProviderContainer(
        overrides: [
          instanceLimitProvider(
            LimitKeys.maxGroupDmRecipients,
          ).overrideWith((Ref ref) => 10),
        ],
      );
      controller = AddFriendsToGroupController(
        container: container,
        channelId: dm.id,
        dm: dm,
      );
    });

    tearDown(() {
      controller.dispose();
      container.dispose();
    });

    test('limits selection count to remaining slots', () {
      controller.toggleUser('friend-1');
      controller.toggleUser('friend-2');
      controller.toggleUser('friend-3');
      controller.toggleUser('friend-4');
      controller.toggleUser('friend-5');
      controller.toggleUser('friend-6');
      controller.toggleUser('friend-7');
      controller.toggleUser('friend-8');

      expect(controller.selectedUserIds.length, 7);
      expect(controller.remainingSlotsCount, 7);
    });

    test('excludes current members from selection target list', () {
      expect(controller.currentMemberIds, <String>['user-1', 'user-2']);
    });
  });
}
