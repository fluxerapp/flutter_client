import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/observability/measure_http_policy.dart';

void main() {
  const MeasureHttpPolicy policy = kMeasureHttpPolicy;

  final InstanceConfigSnapshot official =
      InstanceConfigSnapshot.officialDefault();
  const InstanceConfigSnapshot selfHosted = InstanceConfigSnapshot(
    apiBaseUrl: 'https://chat.example.org/api/v1',
    gatewayUrl: 'wss://gateway.chat.example.org',
    displayDomain: 'chat.example.org',
  );

  test('tracks only official instance API hosts', () {
    expect(
      policy.shouldTrackHttpRequest(
        instance: official,
        requestUri: Uri.parse('https://fluxer.com/api/v1/users/@me'),
      ),
      isTrue,
    );
    expect(
      policy.shouldTrackHttpRequest(
        instance: selfHosted,
        requestUri: Uri.parse('https://chat.example.org/api/v1/users/@me'),
      ),
      isFalse,
    );
  });

  test('isOfficialFluxerInstance includes canary defaults', () {
    const InstanceConfigSnapshot canary = InstanceConfigSnapshot(
      apiBaseUrl: 'https://canary.fluxer.com/api/v1',
      gatewayUrl: 'wss://gateway.canary.fluxer.com',
      displayDomain: 'canary.fluxer.com',
    );
    expect(policy.isOfficialFluxerInstance(canary), isTrue);
    expect(
      policy.shouldTrackHttpRequest(
        instance: canary,
        requestUri: Uri.parse('https://canary.fluxer.com/api/v1/guilds'),
      ),
      isTrue,
    );
  });
}
