import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_status.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  group('requiresSystemSettingsForStatus', () {
    test('returns false when granted', () {
      expect(
        requiresSystemSettingsForStatus(PermissionStatus.granted),
        isFalse,
      );
    });

    test('returns false when provisional', () {
      expect(
        requiresSystemSettingsForStatus(PermissionStatus.provisional),
        isFalse,
      );
    });

    test('returns true when permanently denied', () {
      expect(
        requiresSystemSettingsForStatus(PermissionStatus.permanentlyDenied),
        isTrue,
      );
    });

    test('returns true when restricted', () {
      expect(
        requiresSystemSettingsForStatus(PermissionStatus.restricted),
        isTrue,
      );
    });

    test('returns false when only denied', () {
      expect(requiresSystemSettingsForStatus(PermissionStatus.denied), isFalse);
    });
  });

  group('shouldOpenSystemSettingsAfterRequest', () {
    test('returns false when granted after request', () {
      expect(
        shouldOpenSystemSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.granted,
          isAndroid: false,
        ),
        isFalse,
      );
    });

    test('returns true when permanently denied after request', () {
      expect(
        shouldOpenSystemSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.permanentlyDenied,
          isAndroid: true,
        ),
        isTrue,
      );
    });

    test('returns true on iOS when denied before and after request', () {
      expect(
        shouldOpenSystemSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.denied,
          isAndroid: false,
        ),
        isTrue,
      );
    });

    test('returns false on Android when denied before and after request', () {
      expect(
        shouldOpenSystemSettingsAfterRequest(
          before: PermissionStatus.denied,
          after: PermissionStatus.denied,
          isAndroid: true,
        ),
        isFalse,
      );
    });
  });
}
