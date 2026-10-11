import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/features/shell/presentation/gateway_reconnect_banner.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

class _RetryCountingGatewayConnection extends GatewayConnection {
  _RetryCountingGatewayConnection() : super(token: 'test', dio: Dio());

  int reconnectNowCalls = 0;
  GatewayState current = GatewayState.reconnecting;

  @override
  GatewayState get state => current;

  @override
  Future<void> reconnectNow() async {
    reconnectNowCalls++;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<ProviderContainer> pumpBanner(WidgetTester tester) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        child: const GatewayReconnectBannerOverlay(child: SizedBox.expand()),
      ),
    );
    return ProviderScope.containerOf(
      tester.element(find.byType(GatewayReconnectBannerOverlay)),
    );
  }

  testWidgets('stays on reconnecting copy until connected', (tester) async {
    final ProviderContainer container = await pumpBanner(tester);

    expect(find.text(testL10n.gatewayReconnectingToast), findsNothing);

    container.read(gatewayReconnectBannerProvider.notifier).showReconnecting();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.text(testL10n.gatewayReconnectingToast), findsOneWidget);
    expect(find.text(testL10n.gatewayConnectedToast), findsNothing);

    container.read(gatewayReconnectBannerProvider.notifier).showConnected();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 450));

    expect(find.text(testL10n.gatewayConnectedToast), findsOneWidget);
    expect(find.text(testL10n.gatewayReconnectingToast), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders reconnecting copy with reduced motion', (tester) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        child: const MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: GatewayReconnectBannerOverlay(child: SizedBox.expand()),
        ),
      ),
    );
    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(GatewayReconnectBannerOverlay)),
    );
    container.read(gatewayReconnectBannerProvider.notifier).showReconnecting();
    await tester.pump();

    expect(find.text(testL10n.gatewayReconnectingToast), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('tapping the reconnecting banner retries right away', (
    tester,
  ) async {
    final _RetryCountingGatewayConnection connection =
        _RetryCountingGatewayConnection();
    var backgroundTaps = 0;
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: <Override>[
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
        child: GatewayReconnectBannerOverlay(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => backgroundTaps++,
          ),
        ),
      ),
    );
    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(GatewayReconnectBannerOverlay)),
    );
    container.read(gatewayReconnectBannerProvider.notifier).showReconnecting();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 450));

    await tester.tap(find.text(testL10n.gatewayReconnectingToast));
    expect(connection.reconnectNowCalls, 1);
    expect(backgroundTaps, 0);

    connection.current = GatewayState.connecting;
    await tester.tap(find.text(testL10n.gatewayReconnectingToast));
    expect(connection.reconnectNowCalls, 1);
    expect(backgroundTaps, 0);

    await tester.tapAt(const Offset(5, 500));
    expect(backgroundTaps, 1);

    container.read(gatewayReconnectBannerProvider.notifier).showConnected();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 450));
    await tester.tap(
      find.text(testL10n.gatewayConnectedToast),
      warnIfMissed: false,
    );
    expect(connection.reconnectNowCalls, 1);
    expect(backgroundTaps, 2);

    await tester.pump(kReconnectBannerSuccessHold);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
