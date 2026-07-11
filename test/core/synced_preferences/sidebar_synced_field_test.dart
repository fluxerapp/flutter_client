import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sidebar_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

void main() {
  group('SidebarSyncedField', () {
    test('toProtoForPush preserves optional badge fields from wire', () {
      const local = SidebarLocalState(inlineDmsCollapsed: true);
      final wireBase = pb.SidebarPreferences(
        showCollapsedUnreadDmsBadge: true,
        showIncomingFriendRequestBadge: true,
      );
      final pushed = SidebarSyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );
      expect(pushed.inlineDmsCollapsed, isTrue);
      expect(pushed.showCollapsedUnreadDmsBadge, isTrue);
      expect(pushed.showIncomingFriendRequestBadge, isTrue);
    });
  });
}
