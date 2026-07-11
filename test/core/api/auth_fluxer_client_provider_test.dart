import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';

const InstanceConfigSnapshot _originalInstance = InstanceConfigSnapshot(
  apiBaseUrl: 'https://a.example/api',
  gatewayUrl: 'wss://a.example/gateway',
  displayDomain: 'a.example',
);

const InstanceConfigSnapshot _pendingInstance = InstanceConfigSnapshot(
  apiBaseUrl: 'https://b.example/api',
  gatewayUrl: 'wss://b.example/gateway',
  displayDomain: 'b.example',
);

final InstanceConfigSnapshot _officialPendingInstance =
    InstanceConfigSnapshot.officialDefault();

class _PendingInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return const InstanceSelectorState(
      instanceUrl: 'https://b.example/api',
      status: InstanceDiscoveryStatus.success,
      recentInstances: <RecentInstance>[],
      requiresDiscovery: false,
      pendingSnapshot: _pendingInstance,
    );
  }
}

class _OfficialPendingInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return InstanceSelectorState(
      instanceUrl: 'api.fluxer.app/v1',
      status: InstanceDiscoveryStatus.success,
      recentInstances: const <RecentInstance>[],
      requiresDiscovery: false,
      pendingSnapshot: _officialPendingInstance,
    );
  }
}

void main() {
  test(
    'auth client targets pending instance while add-account guard is armed',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          instanceSelectorProvider.overrideWith(_PendingInstanceSelector.new),
        ],
      );
      addTearDown(container.dispose);
      await container.read(instanceSelectorProvider.future);
      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(_originalInstance);
      container
          .read(addAccountInstanceGuardProvider.notifier)
          .arm(_originalInstance);
      expect(
        container.read(fluxerBaseUrlProvider),
        _originalInstance.apiBaseUrl,
      );
      expect(
        container.read(authFluxerBaseUrlProvider),
        _pendingInstance.apiBaseUrl,
      );
      expect(
        container.read(authFluxerDioProvider).options.baseUrl,
        _pendingInstance.apiBaseUrl,
      );
    },
  );

  test(
    'auth client targets official pending instance while add-account guard is armed',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          instanceSelectorProvider.overrideWith(
            _OfficialPendingInstanceSelector.new,
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(instanceSelectorProvider.future);
      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(_originalInstance);
      container
          .read(addAccountInstanceGuardProvider.notifier)
          .arm(_originalInstance);
      expect(
        container.read(authFluxerBaseUrlProvider),
        _officialPendingInstance.apiBaseUrl,
      );
      expect(
        container.read(authFluxerDioProvider).options.baseUrl,
        _officialPendingInstance.apiBaseUrl,
      );
    },
  );
}
