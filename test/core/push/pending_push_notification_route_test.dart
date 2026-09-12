import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/pending_push_notification_route.dart';

void main() {
  test('currentAccountPendingNavigationPath ignores other accounts', () {
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
