import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';

MatureAccess _access({
  bool serverAllowsMature = true,
  bool deviceDeclaredMinor = false,
  MatureGeoStatus geo = MatureGeoStatus.none,
  bool matureContentUnlocked = false,
  bool appStorePolicy = false,
  bool iosOptIn = false,
}) {
  return resolveMatureAccess(
    serverAllowsMature: serverAllowsMature,
    deviceDeclaredMinor: deviceDeclaredMinor,
    geo: geo,
    matureContentUnlocked: matureContentUnlocked,
    appStorePolicy: appStorePolicy,
    iosOptIn: iosOptIn,
  );
}

void main() {
  test('minor beats region and region beats the app lock', () {
    expect(
      _access(
        serverAllowsMature: false,
        geo: MatureGeoStatus.blocked,
        appStorePolicy: true,
      ),
      MatureAccess.minor,
    );
    expect(
      _access(deviceDeclaredMinor: true, appStorePolicy: true, iosOptIn: true),
      MatureAccess.minor,
    );
    expect(
      _access(geo: MatureGeoStatus.restricted, appStorePolicy: true),
      MatureAccess.regionLocked,
    );
    expect(_access(appStorePolicy: true), MatureAccess.appLocked);
    expect(_access(appStorePolicy: true, iosOptIn: true), MatureAccess.allowed);
  });

  test(
    'an account with mature content unlocked passes restricted regions but not blocked ones',
    () {
      expect(
        _access(geo: MatureGeoStatus.restricted, matureContentUnlocked: true),
        MatureAccess.allowed,
      );
      expect(
        _access(geo: MatureGeoStatus.blocked, matureContentUnlocked: true),
        MatureAccess.regionLocked,
      );
    },
  );

  test('other platforms ignore the iOS opt-in', () {
    expect(_access(), MatureAccess.allowed);
    expect(_access(iosOptIn: true), MatureAccess.allowed);
  });

  test('show stays locked on iOS until an adult opts in', () {
    bool locked({
      required bool appStorePolicy,
      bool serverAllowsMature = true,
      bool deviceDeclaredMinor = false,
      bool iosOptIn = false,
    }) => resolveInAppShowLocked(
      appStorePolicy: appStorePolicy,
      serverAllowsMature: serverAllowsMature,
      deviceDeclaredMinor: deviceDeclaredMinor,
      iosOptIn: iosOptIn,
    );
    expect(
      locked(appStorePolicy: true, serverAllowsMature: false, iosOptIn: true),
      isTrue,
    );
    expect(
      locked(appStorePolicy: true, deviceDeclaredMinor: true, iosOptIn: true),
      isTrue,
    );
    expect(locked(appStorePolicy: true), isTrue);
    expect(locked(appStorePolicy: true, iosOptIn: true), isFalse);
    expect(locked(appStorePolicy: false), isFalse);
    expect(locked(appStorePolicy: false, serverAllowsMature: false), isFalse);
    expect(locked(appStorePolicy: false, deviceDeclaredMinor: true), isFalse);
  });
}
