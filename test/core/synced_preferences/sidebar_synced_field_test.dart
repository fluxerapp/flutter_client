import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sidebar_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

SidebarSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(Provider<SidebarSyncedField>(SidebarSyncedField.new));
}

void main() {
  group('SidebarSyncedField', () {
    test('toProtoMessageForPush preserves optional badge fields from wire', () {
      const local = SidebarLocalState(inlineDmsCollapsed: true);
      final wireBase = pb.SidebarPreferences(
        showCollapsedUnreadDmsBadge: true,
        showIncomingFriendRequestBadge: true,
      );
      final pushed =
          _field().toProtoMessageForPush(local, wireSubMessage: wireBase)
              as pb.SidebarPreferences;
      expect(pushed.inlineDmsCollapsed, isTrue);
      expect(pushed.showCollapsedUnreadDmsBadge, isTrue);
      expect(pushed.showIncomingFriendRequestBadge, isTrue);
    });
  });
}
