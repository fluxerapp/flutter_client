import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/desktop/windows/windows_app_identity.dart';

void main() {
  test('each channel has its own notification activator guid', () {
    final Set<String> guids = AppBuildEnvironment.values
        .map(windowsNotificationActivatorGuidFor)
        .toSet();
    expect(guids, hasLength(AppBuildEnvironment.values.length));
    for (final String guid in guids) {
      expect(
        guid,
        matches(
          RegExp(
            r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
          ),
        ),
      );
    }
  });

  test('each channel has its own display name', () {
    final Set<String> names = AppBuildEnvironment.values
        .map(windowsAppDisplayNameFor)
        .toSet();
    expect(names, hasLength(AppBuildEnvironment.values.length));
  });
}
