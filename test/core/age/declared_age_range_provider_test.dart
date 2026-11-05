import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';

void main() {
  test('maps the shared age range to a floor', () {
    expect(declaredAgeFloorFromPayload(null), DeclaredAgeFloor.none);
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{'status': 'declined'}),
      DeclaredAgeFloor.none,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 18,
      }),
      DeclaredAgeFloor.none,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 16,
        'upperBound': 17,
      }),
      DeclaredAgeFloor.minor,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 13,
        'upperBound': 15,
      }),
      DeclaredAgeFloor.minor,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'upperBound': 12,
      }),
      DeclaredAgeFloor.underMinimum,
    );
  });
}
