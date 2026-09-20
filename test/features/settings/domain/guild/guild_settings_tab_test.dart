import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';

void main() {
  const Guild guild = Guild(
    id: 'guild-1',
    name: 'Test Community',
    ownerId: 'owner-1',
  );

  group('canDeleteCommunity', () {
    test('allows the owner of a regular community', () {
      expect(
        canDeleteCommunity(
          guild: guild,
          currentUserId: 'owner-1',
          isStockCommunity: false,
        ),
        isTrue,
      );
    });

    test('hides delete for members who are not the owner', () {
      expect(
        canDeleteCommunity(
          guild: guild,
          currentUserId: 'member-1',
          isStockCommunity: false,
        ),
        isFalse,
      );
    });

    test('hides delete for the instance community', () {
      expect(
        canDeleteCommunity(
          guild: guild,
          currentUserId: 'owner-1',
          isStockCommunity: true,
        ),
        isFalse,
      );
    });

    test('hides delete when the current user is unknown', () {
      expect(
        canDeleteCommunity(
          guild: guild,
          currentUserId: null,
          isStockCommunity: false,
        ),
        isFalse,
      );
    });

    test('hides delete when the guild is missing', () {
      expect(
        canDeleteCommunity(
          guild: null,
          currentUserId: 'owner-1',
          isStockCommunity: false,
        ),
        isFalse,
      );
    });

    test('hides delete when the guild has no owner', () {
      expect(
        canDeleteCommunity(
          guild: const Guild(id: 'guild-1', name: 'Test Community'),
          currentUserId: 'owner-1',
          isStockCommunity: false,
        ),
        isFalse,
      );
    });
  });
}
