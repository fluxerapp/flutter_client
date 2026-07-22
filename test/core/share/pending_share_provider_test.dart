import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/share/pending_share_provider.dart';
import 'package:fluxer_app/core/share/shared_media_payload.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() {
  group('isPendingShareReady', () {
    test('returns true when authenticated, gateway ready, and not failed', () {
      expect(
        isPendingShareReady(
          isAuthenticated: true,
          isGatewayReady: true,
          isConnectionFailed: false,
        ),
        isTrue,
      );
    });

    test('returns false when not authenticated', () {
      expect(
        isPendingShareReady(
          isAuthenticated: false,
          isGatewayReady: true,
          isConnectionFailed: false,
        ),
        isFalse,
      );
    });

    test('returns false when gateway is not ready', () {
      expect(
        isPendingShareReady(
          isAuthenticated: true,
          isGatewayReady: false,
          isConnectionFailed: false,
        ),
        isFalse,
      );
    });

    test('returns false when connection failed', () {
      expect(
        isPendingShareReady(
          isAuthenticated: true,
          isGatewayReady: true,
          isConnectionFailed: true,
        ),
        isFalse,
      );
    });
  });

  group('PendingShare', () {
    test('build returns null on non-mobile platforms', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(authStateProvider.notifier).setAuthenticated(value: true);
      container.read(gatewayReadyProvider.notifier).setReady();

      expect(container.read(pendingShareProvider), isNull);
    });

    test('store ignores payloads with no content', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(authStateProvider.notifier).setAuthenticated(value: true);
      container.read(gatewayReadyProvider.notifier).reset();

      container
          .read(pendingShareProvider.notifier)
          .store(const SharedMediaPayload(files: <SharedMediaFile>[]));

      expect(container.read(pendingShareProvider), isNull);
    });

    test('store accepts text-only payloads', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(pendingShareProvider.notifier)
          .store(
            SharedMediaPayload(
              files: <SharedMediaFile>[
                SharedMediaFile(path: 'Hello', type: SharedMediaType.text),
              ],
            ),
          );

      expect(container.read(pendingShareProvider)?.initialMessage, 'Hello');
    });
  });
}
