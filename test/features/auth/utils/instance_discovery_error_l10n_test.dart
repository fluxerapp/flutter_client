import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/auth/utils/instance_discovery_error_l10n.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:test/test.dart';

void main() {
  group('instanceDiscoveryErrorText', () {
    late FluxerLocalizations l10n;

    setUp(() async {
      l10n = await FluxerLocalizations.delegate.load(const Locale('en'));
    });

    test('maps instance outdated reason', () {
      const InstanceSelectorState state = InstanceSelectorState(
        instanceUrl: 'chat.example.com',
        status: InstanceDiscoveryStatus.error,
        recentInstances: [],
        requiresDiscovery: true,
        discoveryFailureReason: InstanceDiscoveryFailureReason.instanceOutdated,
      );

      final String message = instanceDiscoveryErrorText(state, l10n);
      expect(message, contains('chat.example.com'));
      expect(message, contains('out of date'));
    });

    test('maps requires newer client reason', () {
      const InstanceSelectorState state = InstanceSelectorState(
        instanceUrl: 'chat.example.com',
        status: InstanceDiscoveryStatus.error,
        recentInstances: [],
        requiresDiscovery: true,
        discoveryFailureReason:
            InstanceDiscoveryFailureReason.requiresNewerClient,
      );

      final String message = instanceDiscoveryErrorText(state, l10n);
      expect(message, contains('chat.example.com'));
      expect(message, contains('Update the app'));
    });
  });
}
