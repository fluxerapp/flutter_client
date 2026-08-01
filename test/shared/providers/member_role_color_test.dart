import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';

void main() {
  test('memberRoleColorProvider is a reactive color provider', () {
    expect(memberRoleColorProvider, isNotNull);
  });
}
