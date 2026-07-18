import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  test('gateway identify properties serialises mobile', () {
    const properties = GatewayIdentifyProperties(
      os: 'ios',
      browser: 'fluxer_app',
      device: 'ios',
      mobile: true,
    );

    expect(properties.toJson(), containsPair('mobile', true));
  });
}
