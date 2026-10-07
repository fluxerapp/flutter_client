import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:fluxer_app/features/shell/presentation/reconnecting_screen.dart';
import 'package:fluxer_app/features/shell/providers/service_status_incident_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';
import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

class _SignedIn extends AuthState {
  @override
  bool build() => true;
}

class _NoopIncidentRead extends ServiceStatusIncidentRead {
  @override
  ServiceStatusIncident? build() => null;

  @override
  Future<void> refresh() async {}
}

class _NoAccounts extends AccountManager {
  @override
  AccountManagerState build() => const AccountManagerState(
    accounts: <StoredAccount>[],
    isSwitching: false,
  );

  @override
  Future<void> loadAccounts() async {}
}

late FluxerDatabase _database;

void main() {
  setUp(() {
    _database = openTestDatabase();
  });

  testWidgets('signed in without a token never builds the gateway', (
    tester,
  ) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(_database),
          authStateProvider.overrideWith(_SignedIn.new),
          serviceStatusIncidentReadProvider.overrideWith(_NoopIncidentRead.new),
          accountManagerProvider.overrideWith(_NoAccounts.new),
        ],
        child: const ReconnectingScreen(),
      ),
    );
    await tester.pump();
    await tester.pump();

    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(ReconnectingScreen)),
    );
    expect(container.read(fluxerAuthTokenProvider), isNull);
    expect(container.exists(gatewayConnectionProvider), isFalse);
    expect(find.text(testL10n.reconnectingTitle), findsOneWidget);

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await tester.pump();
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    await tester.pump();
    await tester.pump(kReconnectingScreenRetryInterval);

    expect(container.exists(gatewayConnectionProvider), isFalse);
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
