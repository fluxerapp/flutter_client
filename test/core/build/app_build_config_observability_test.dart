import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';

void main() {
  group('parseObservabilityReportingEnabled', () {
    test('defaults to enabled for empty and true values', () {
      expect(AppBuildConfig.parseObservabilityReportingEnabled(''), isTrue);
      expect(AppBuildConfig.parseObservabilityReportingEnabled('true'), isTrue);
      expect(AppBuildConfig.parseObservabilityReportingEnabled('TRUE'), isTrue);
    });

    test('disables for false and zero', () {
      expect(
        AppBuildConfig.parseObservabilityReportingEnabled('false'),
        isFalse,
      );
      expect(
        AppBuildConfig.parseObservabilityReportingEnabled('FALSE'),
        isFalse,
      );
      expect(AppBuildConfig.parseObservabilityReportingEnabled('0'), isFalse);
    });
  });
}
