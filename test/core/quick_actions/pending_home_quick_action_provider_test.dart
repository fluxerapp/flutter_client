import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action.dart';
import 'package:fluxer_app/core/quick_actions/pending_home_quick_action_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

InstanceRuntimeConfig _config({required bool directMessagesDisabled}) {
  const InstanceRuntimeConfig defaults = InstanceRuntimeConfig.defaults;
  return InstanceRuntimeConfig(
    productName: defaults.productName,
    selfHosted: defaults.selfHosted,
    stripeEnabled: defaults.stripeEnabled,
    emailsEnabled: defaults.emailsEnabled,
    voiceEnabled: defaults.voiceEnabled,
    presignedAttachmentUploads: defaults.presignedAttachmentUploads,
    gifEnabled: defaults.gifEnabled,
    blueskyEnabled: defaults.blueskyEnabled,
    gifAttributionRequired: defaults.gifAttributionRequired,
    singleCommunity: defaults.singleCommunity,
    directMessagesDisabled: directMessagesDisabled,
    registrationClosed: defaults.registrationClosed,
    adminRegistrationUrlsEnabled: defaults.adminRegistrationUrlsEnabled,
    collectDateOfBirth: defaults.collectDateOfBirth,
    iconUrl: defaults.iconUrl,
    symbolUrl: defaults.symbolUrl,
    logoUrl: defaults.logoUrl,
    wordmarkUrl: defaults.wordmarkUrl,
    themeColorHex: defaults.themeColorHex,
    gifDisplayName: defaults.gifDisplayName,
    singleCommunityGuildId: defaults.singleCommunityGuildId,
  );
}

ProviderContainer _container({bool directMessagesDisabled = false}) {
  return ProviderContainer(
    overrides: [
      instanceRuntimeConfigProvider.overrideWithValue(
        _config(directMessagesDisabled: directMessagesDisabled),
      ),
    ],
  );
}

void main() {
  test('keeps the action queued until navigation is ready', () {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).reset();

    container
        .read(pendingHomeQuickActionProvider.notifier)
        .store(HomeQuickAction.search);

    expect(container.read(pendingHomeQuickActionProvider), isNull);

    container.read(gatewayReadyProvider.notifier).setReady();

    expect(
      container.read(pendingHomeQuickActionProvider),
      HomeQuickAction.search,
    );
  });

  test('does not flush while connection failed', () {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).setReady();
    container
        .read(gatewayConnectionFailedProvider.notifier)
        .setFailed(value: true);
    container
        .read(pendingHomeQuickActionProvider.notifier)
        .store(HomeQuickAction.notifications);

    container.read(pendingHomeQuickActionProvider.notifier).flushIfReady();

    expect(container.read(pendingHomeQuickActionProvider), isNull);
  });

  test('ignores DMs when direct messages are disabled', () {
    final ProviderContainer container = _container(
      directMessagesDisabled: true,
    );
    addTearDown(container.dispose);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).setReady();
    container
        .read(pendingHomeQuickActionProvider.notifier)
        .store(HomeQuickAction.dms);

    expect(container.read(pendingHomeQuickActionProvider), isNull);
  });

  test('presents after auth and gateway become ready', () {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);

    container
        .read(pendingHomeQuickActionProvider.notifier)
        .store(HomeQuickAction.notifications);

    expect(container.read(pendingHomeQuickActionProvider), isNull);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).setReady();

    expect(
      container.read(pendingHomeQuickActionProvider),
      HomeQuickAction.notifications,
    );
  });

  test('clear drops a queued action', () {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);

    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    container.read(gatewayReadyProvider.notifier).setReady();
    container
        .read(pendingHomeQuickActionProvider.notifier)
        .store(HomeQuickAction.search);
    container.read(pendingHomeQuickActionProvider.notifier).clear();

    expect(container.read(pendingHomeQuickActionProvider), isNull);
  });
}
