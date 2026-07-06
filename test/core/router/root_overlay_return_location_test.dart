import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/pre_reconnecting_location_provider.dart';
import 'package:fluxer_app/core/router/root_overlay_return_location_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';

void main() {
  test('remember and take restores shell location', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container
        .read(rootOverlayReturnLocationProvider.notifier)
        .remember('/channels/guild/channel');
    expect(
      container
          .read(rootOverlayReturnLocationProvider.notifier)
          .takeOrDefault(),
      '/channels/guild/channel',
    );
    expect(
      container
          .read(rootOverlayReturnLocationProvider.notifier)
          .takeOrDefault(),
      RoutePaths.me,
    );
  });

  test('does not remember discover or non-restorable locations', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container
        .read(rootOverlayReturnLocationProvider.notifier)
        .remember(RoutePaths.discover);
    container
        .read(rootOverlayReturnLocationProvider.notifier)
        .remember('/login');
    expect(container.read(rootOverlayReturnLocationProvider), isNull);
    expect(isRestorableShellReturnLocation('/channels/@me'), isTrue);
    expect(isRestorableShellReturnLocation(RoutePaths.discover), isFalse);
    expect(isRestorableAppLocation('/login'), isFalse);
  });
}
