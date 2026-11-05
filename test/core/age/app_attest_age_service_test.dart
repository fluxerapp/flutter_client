import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/app_attest_age_service.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';

void main() {
  test('client data is the exact JSON the server parses', () {
    const String challenge = 'q2F9tdQ0yvd0n0E8sX1rT5bYk3cJmA7pLw4uZgHxVfE';
    expect(
      utf8.decode(
        appAttestAgeClientData(
          challenge: challenge,
          report: DeclaredAgeReport.underMinimum,
        ),
      ),
      '{"challenge":"$challenge","age_floor":"under_minimum"}',
    );
    expect(DeclaredAgeReport.values.map(appAttestAgeFloorWireValue), <String>[
      'adult',
      'minor',
      'under_minimum',
    ]);
  });
}
