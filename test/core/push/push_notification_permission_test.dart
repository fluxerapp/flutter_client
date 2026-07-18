import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  group('requiresPushNotificationSystemSettingsForStatus', () {
    test('returns false when granted', () {
      expect(
        requiresPushNotificationSystemSettingsForStatus(
          PermissionStatus.granted,
        ),
        isFalse,
      );
    });

    test('returns false when provisional', () {
      expect(
        requiresPushNotificationSystemSettingsForStatus(
          PermissionStatus.provisional,
        ),
        isFalse,
      );
    });

    test('returns true when permanently denied', () {
      expect(
        requiresPushNotificationSystemSettingsForStatus(
          PermissionStatus.permanentlyDenied,
        ),
        isTrue,
      );
    });

    test('returns true when restricted', () {
      expect(
        requiresPushNotificationSystemSettingsForStatus(
          PermissionStatus.restricted,
        ),
        isTrue,
      );
    });

    test('returns false when only denied', () {
      expect(
        requiresPushNotificationSystemSettingsForStatus(
          PermissionStatus.denied,
        ),
        isFalse,
      );
    });
  });

  group('shouldOpenPushNotificationSettingsAfterRequest', () {
    test('returns false when granted after request', () {
      expect(
        shouldOpenPushNotificationSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.granted,
          isAndroid: false,
        ),
        isFalse,
      );
    });

    test('returns true when permanently denied after request', () {
      expect(
        shouldOpenPushNotificationSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.permanentlyDenied,
          isAndroid: true,
        ),
        isTrue,
      );
    });

    test('returns true on iOS when denied before and after request', () {
      expect(
        shouldOpenPushNotificationSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.denied,
          isAndroid: false,
        ),
        isTrue,
      );
    });

    test('returns false on Android when denied before and after request', () {
      expect(
        shouldOpenPushNotificationSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.denied,
          isAndroid: true,
        ),
        isFalse,
      );
    });
  });
}
