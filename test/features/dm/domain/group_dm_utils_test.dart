import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';

void main() {
  group('getGroupDmRemainingSlots', () {
    test('returns remaining capacity before full', () {
      expect(
        getGroupDmRemainingSlots(memberCount: 3, maxGroupDmRecipients: 10),
        7,
      );
    });

    test('returns zero when group is full', () {
      expect(
        getGroupDmRemainingSlots(memberCount: 10, maxGroupDmRecipients: 10),
        0,
      );
    });

    test('never returns negative values', () {
      expect(
        getGroupDmRemainingSlots(memberCount: 12, maxGroupDmRecipients: 10),
        0,
      );
    });
  });

  group('isGroupDmOwner', () {
    test('returns true when current user owns the group', () {
      expect(
        isGroupDmOwner(ownerId: 'user-1', currentUserId: 'user-1'),
        isTrue,
      );
    });

    test('returns false when owner is missing or different', () {
      expect(isGroupDmOwner(ownerId: null, currentUserId: 'user-1'), isFalse);
      expect(
        isGroupDmOwner(ownerId: 'user-1', currentUserId: 'user-2'),
        isFalse,
      );
      expect(isGroupDmOwner(ownerId: 'user-1', currentUserId: null), isFalse);
    });
  });

  group('canRemoveGroupDmMember', () {
    test('lets the owner remove another member', () {
      expect(
        canRemoveGroupDmMember(
          ownerId: 'owner',
          currentUserId: 'owner',
          memberId: 'member',
        ),
        isTrue,
      );
    });

    test('hides removal from non-owners and for the owner themself', () {
      expect(
        canRemoveGroupDmMember(
          ownerId: 'owner',
          currentUserId: 'member',
          memberId: 'other',
        ),
        isFalse,
      );
      expect(
        canRemoveGroupDmMember(
          ownerId: 'owner',
          currentUserId: 'owner',
          memberId: 'owner',
        ),
        isFalse,
      );
    });
  });
}
