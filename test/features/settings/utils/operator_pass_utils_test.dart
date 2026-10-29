import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/commerce/operator_pass_utils.dart';

void main() {
  test('getOperatorPassWallNameProblem validates name', () {
    expect(
      getOperatorPassWallNameProblem('', optOut: false),
      OperatorPassWallNameProblem.required,
    );
    expect(getOperatorPassWallNameProblem('ok', optOut: false), isNull);
    expect(
      getOperatorPassWallNameProblem('x' * 33, optOut: false),
      OperatorPassWallNameProblem.tooLong,
    );
    expect(getOperatorPassWallNameProblem('', optOut: true), isNull);
  });

  test('normalizeOperatorPassWallName trims and collapses newlines', () {
    expect(
      normalizeOperatorPassWallName('  hello \n world  '),
      'hello   world',
    );
  });
}
