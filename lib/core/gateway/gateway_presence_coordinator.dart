import 'package:fluxer_app/core/gateway/gateway_lifecycle_presence.dart';
import 'package:fluxer_app/core/gateway/presence_update_batcher.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_presence_coordinator.g.dart';

@Riverpod(keepAlive: true)
void gatewayPresenceCoordinator(Ref ref) {
  if (!isFluxerNativeMobileOs) {
    return;
  }

  GatewayPresence? lastSent;

  void sync() {
    if (!ref.read(gatewayHasAuthTokenProvider)) {
      return;
    }
    final UserSettingsResponse? settings = ref.read(userSettingsStatusProvider);
    final GatewayPresence presence = buildGatewayLifecyclePresence(
      isForeground: ref.read(appUiForegroundProvider),
      status: settings?.status ?? 'online',
      customStatus: gatewayCustomStatusFromSettings(settings?.customStatus),
      mobile: isFluxerMobileClient,
      markAfkWhenBackgrounded: true,
    );
    final GatewayPresence? previous = lastSent;
    if (previous != null && sameGatewayPresence(previous, presence)) {
      return;
    }
    lastSent = presence;
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    connection.updatePresence(presence);
  }

  ref
    ..listen<bool>(appUiForegroundProvider, (_, _) => sync())
    ..listen<UserSettingsResponse?>(
      userSettingsStatusProvider,
      (_, _) => sync(),
    )
    ..listen<GatewayConnection>(gatewayConnectionProvider, (_, _) {
      lastSent = null;
      sync();
    });
  sync();
}
