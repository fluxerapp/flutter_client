import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_selector.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';
import '../../../../helpers/test_l10n.dart';

class _FixedInstanceSelector extends InstanceSelector {
  _FixedInstanceSelector(this._state);

  final InstanceSelectorState _state;

  @override
  Future<InstanceSelectorState> build() async => _state;
}

InstanceSelectorState _officialState({
  List<RecentInstance> recentInstances = const <RecentInstance>[],
  InstanceDiscoveryStatus status = InstanceDiscoveryStatus.success,
  bool requiresDiscovery = false,
  String? errorMessage,
}) {
  return InstanceSelectorState(
    instanceUrl: InstanceConstants.defaultInstanceInputUrl,
    status: status,
    recentInstances: recentInstances,
    requiresDiscovery: requiresDiscovery,
    errorMessage: errorMessage,
  );
}

void main() {
  testWidgets('login entry shows official domain and Change', (tester) async {
    var opened = false;
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [
          instanceSelectorProvider.overrideWith(
            () => _FixedInstanceSelector(_officialState()),
          ),
          activeInstanceProvider.overrideWithValue(
            InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: Scaffold(
          body: InstanceSelectorLoginEntry(
            enabled: true,
            onOpenSheet: () => opened = true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text(InstanceConstants.defaultInstanceInputUrl),
      findsOneWidget,
    );
    expect(find.text(testL10n.changeInstance), findsOneWidget);

    await tester.tap(find.text(testL10n.changeInstance));
    await tester.pump();
    expect(opened, isTrue);
  });

  testWidgets('login entry shows custom domain and Change', (tester) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [
          instanceSelectorProvider.overrideWith(
            () => _FixedInstanceSelector(
              const InstanceSelectorState(
                instanceUrl: 'chat.example.com',
                status: InstanceDiscoveryStatus.success,
                recentInstances: <RecentInstance>[],
                requiresDiscovery: false,
              ),
            ),
          ),
          activeInstanceProvider.overrideWithValue(
            const InstanceConfigSnapshot(
              apiBaseUrl: 'https://chat.example.com/api',
              gatewayUrl: '',
              displayDomain: 'chat.example.com',
            ),
          ),
        ],
        child: const Scaffold(
          body: InstanceSelectorLoginEntry(enabled: true, onOpenSheet: _noop),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('chat.example.com'), findsOneWidget);
    expect(find.text(testL10n.changeInstance), findsOneWidget);
  });

  testWidgets('login entry shows pending instance while active stays put', (
    tester,
  ) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [
          instanceSelectorProvider.overrideWith(
            () => _FixedInstanceSelector(
              const InstanceSelectorState(
                instanceUrl: 'chat.example.com',
                status: InstanceDiscoveryStatus.success,
                recentInstances: <RecentInstance>[],
                requiresDiscovery: false,
                pendingSnapshot: InstanceConfigSnapshot(
                  apiBaseUrl: 'https://chat.example.com/api',
                  gatewayUrl: '',
                  displayDomain: 'chat.example.com',
                ),
              ),
            ),
          ),
          activeInstanceProvider.overrideWithValue(
            InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: const Scaffold(
          body: InstanceSelectorLoginEntry(enabled: true, onOpenSheet: _noop),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('chat.example.com'), findsOneWidget);
    expect(find.text(InstanceConstants.defaultInstanceInputUrl), findsNothing);
    expect(find.text(testL10n.changeInstance), findsOneWidget);
  });

  testWidgets('login entry keeps the error hint and Change', (tester) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [
          instanceSelectorProvider.overrideWith(
            () => _FixedInstanceSelector(
              _officialState(
                status: InstanceDiscoveryStatus.error,
                requiresDiscovery: true,
                errorMessage: 'unreachable',
              ),
            ),
          ),
          activeInstanceProvider.overrideWithValue(
            InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: const Scaffold(
          body: InstanceSelectorLoginEntry(enabled: true, onOpenSheet: _noop),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('unreachable'), findsOneWidget);
    expect(find.text(testL10n.changeInstance), findsOneWidget);
  });

  testWidgets('control shows helper copy, official domain, and recents', (
    tester,
  ) async {
    final DateTime used = DateTime.utc(2026, 1, 2);
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [
          instanceSelectorProvider.overrideWith(
            () => _FixedInstanceSelector(
              _officialState(
                recentInstances: <RecentInstance>[
                  RecentInstance(
                    domain: 'chat.example.com',
                    name: 'Chat',
                    lastUsed: used,
                  ),
                ],
              ),
            ),
          ),
          activeInstanceProvider.overrideWithValue(
            InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: const Scaffold(
          body: SingleChildScrollView(
            child: InstanceSelectorControl(enabled: true),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(testL10n.instanceUrlHelper), findsOneWidget);
    expect(find.text(testL10n.instanceUrlPlaceholder), findsWidgets);
    expect(find.text(testL10n.instanceConnect), findsOneWidget);
    expect(find.text(testL10n.recentInstances), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.text('chat.example.com'), findsOneWidget);

    final TextFormField field = tester.widget(find.byType(TextFormField));
    expect(field.controller?.text, InstanceConstants.defaultInstanceInputUrl);
    expect(field.controller?.text.contains('api.fluxer.app'), isFalse);
  });
}

void _noop() {}
