import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';

import '../../../helpers/well_known_fixture.dart';

const InstanceConfigSnapshot _officialActive = InstanceConfigSnapshot(
  apiBaseUrl: 'https://a.example/api',
  gatewayUrl: 'wss://a.example/gateway',
  displayDomain: 'a.example',
);

InstanceConfigSnapshot _usernameSelfHostedPending() {
  return InstanceConfigSnapshot(
    apiBaseUrl: 'https://chat.example/api',
    gatewayUrl: 'wss://chat.example/gateway',
    displayDomain: 'chat.example',
    wellKnown: wellKnownFixture(
      media: 'https://chat.example/media',
      staticCdn: 'https://chat.example/static',
      accountIdentity: 'username',
    ),
  );
}

class _PendingUsernameInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return InstanceSelectorState(
      instanceUrl: 'https://chat.example/api',
      status: InstanceDiscoveryStatus.success,
      recentInstances: const <RecentInstance>[],
      requiresDiscovery: false,
      pendingSnapshot: _usernameSelfHostedPending(),
    );
  }
}

class _ResolvedInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return const InstanceSelectorState(
      instanceUrl: 'https://a.example/api',
      status: InstanceDiscoveryStatus.success,
      recentInstances: <RecentInstance>[],
      requiresDiscovery: false,
    );
  }
}

void main() {
  test(
    'reads username sign-in from the pending auth instance, not the active one',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          instanceSelectorProvider.overrideWith(
            _PendingUsernameInstanceSelector.new,
          ),
          instanceRuntimeConfigProvider.overrideWithValue(
            InstanceRuntimeConfig.fromWellKnown(
              wellKnownFixture(
                media: 'https://a.example/media',
                staticCdn: 'https://a.example/static',
                selfHosted: false,
                accountIdentity: 'email',
              ),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(instanceSelectorProvider.future);
      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(_officialActive);

      final InstanceRuntimeConfig config = container.read(
        authInstanceRuntimeConfigProvider,
      );
      expect(config.usernameSignIn, isTrue);
      expect(config.selfHosted, isTrue);
    },
  );

  test(
    'falls back to global runtime when the auth snapshot has no well-known',
    () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          instanceSelectorProvider.overrideWith(_ResolvedInstanceSelector.new),
          instanceRuntimeConfigProvider.overrideWithValue(
            InstanceRuntimeConfig.defaults,
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(authInstanceRuntimeConfigProvider).productName,
        InstanceConstants.defaultProductName,
      );
    },
  );
}
