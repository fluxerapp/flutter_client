import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

void main() {
  test(
    'touchRecentInstance keeps at most five entries ordered by recency',
    () async {
      final FluxerDatabase db = openTestDatabase();
      final dao = db.recentInstancesDao;

      for (int index = 0; index < 6; index++) {
        await dao.touchRecentInstance(domain: 'instance-$index.example');
        await Future<void>.delayed(const Duration(milliseconds: 2));
      }

      final List<RecentInstance> recent = await dao.getRecentInstances();
      expect(recent, hasLength(5));
      expect(
        recent.any((RecentInstance row) => row.domain == 'instance-0.example'),
        isFalse,
      );
      expect(
        recent.any((RecentInstance row) => row.domain == 'instance-5.example'),
        isTrue,
      );
    },
  );

  test('removeRecentInstance deletes a stored domain', () async {
    final FluxerDatabase db = openTestDatabase();
    final dao = db.recentInstancesDao;

    await dao.touchRecentInstance(domain: 'chat.example.com', name: 'Chat');
    await dao.removeRecentInstance('chat.example.com');

    final List<RecentInstance> recent = await dao.getRecentInstances();
    expect(recent, isEmpty);
  });

  test(
    'touchRecentInstance updates name and lastUsed for existing domain',
    () async {
      final FluxerDatabase db = openTestDatabase();
      final dao = db.recentInstancesDao;

      await dao.touchRecentInstance(domain: 'Chat.Example.com');
      await Future<void>.delayed(const Duration(milliseconds: 2));
      await dao.touchRecentInstance(
        domain: 'chat.example.com',
        name: 'My Chat',
      );

      final List<RecentInstance> recent = await dao.getRecentInstances();
      expect(recent, hasLength(1));
      expect(recent.single.domain, 'chat.example.com');
      expect(recent.single.name, 'My Chat');
    },
  );
}
