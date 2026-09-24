import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/pending_push_notification_route.dart';

void main() {
  test('currentAccountPendingNavigationPath waits for the target account', () {
    const PendingPushNotificationRoute pending = PendingPushNotificationRoute(
      path: '/channels/@me/123',
      accountUserId: 'user-a',
    );

    expect(
      currentAccountPendingNavigationPath(
        pending: pending,
        currentUserId: 'user-b',
      ),
      isNull,
    );
    expect(
      pendingPushRouteWaitsForAccount(
        accountUserId: pending.accountUserId,
        currentUserId: 'user-b',
      ),
      isTrue,
    );
    expect(pending.path, '/channels/@me/123');
  });

  test('currentAccountPendingNavigationPath returns current account path', () {
    const PendingPushNotificationRoute pending = PendingPushNotificationRoute(
      path: '/channels/@me/123',
      accountUserId: 'user-a',
    );

    expect(
      currentAccountPendingNavigationPath(
        pending: pending,
        currentUserId: 'user-a',
      ),
      '/channels/@me/123',
    );
  });
}
