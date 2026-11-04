import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

const String _testAccountUserId = 'test-user-id';

void main() {
  group('readEffectiveGuildChannelPermissionBits', () {
    test('returns cached effective bits without recomputing', () async {
      const String channelId = 'channel_1';
      final int cachedBits = Permission.viewChannel.value;
      final ProviderContainer container = ProviderContainer(
        overrides: [
          currentUserIdProvider.overrideWithValue(_testAccountUserId),
          channelPermissionCacheProvider(_testAccountUserId).overrideWith(
            () => _FixedChannelPermissionCache(
              effective: <String, int>{channelId: cachedBits},
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      final int bits = await readEffectiveGuildChannelPermissionBits(
        container: container,
        channelId: channelId,
      );

      expect(bits, cachedBits);
    });
  });

  group('readLocalGuildChannelPermissionBits', () {
    test('returns cached local bits without recomputing', () async {
      const String channelId = 'channel_1';
      final int cachedBits = Permission.connect.value;
      final ProviderContainer container = ProviderContainer(
        overrides: [
          currentUserIdProvider.overrideWithValue(_testAccountUserId),
          channelPermissionCacheProvider(_testAccountUserId).overrideWith(
            () => _FixedChannelPermissionCache(
              local: <String, int>{channelId: cachedBits},
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      final int bits = await readLocalGuildChannelPermissionBits(
        container: container,
        channelId: channelId,
      );

      expect(bits, cachedBits);
    });
  });
}

class _FixedChannelPermissionCache extends ChannelPermissionCache {
  _FixedChannelPermissionCache({
    this.effective = const {},
    this.local = const {},
  });

  final Map<String, int> effective;
  final Map<String, int> local;

  @override
  ChannelPermissionCaches build(String accountUserId) =>
      ChannelPermissionCaches(effective: effective, local: local);
}
