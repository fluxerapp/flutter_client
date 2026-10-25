import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/operator_pass_utils.dart';

void main() {
  test('getOperatorPassWallNameProblem validates name', () {
    expect(
      getOperatorPassWallNameProblem('', false),
      OperatorPassWallNameProblem.required,
    );
    expect(getOperatorPassWallNameProblem('ok', false), isNull);
    expect(
      getOperatorPassWallNameProblem('x' * 33, false),
      OperatorPassWallNameProblem.tooLong,
    );
    expect(getOperatorPassWallNameProblem('', true), isNull);
  });

  test('normalizeOperatorPassWallName trims and collapses newlines', () {
    expect(
      normalizeOperatorPassWallName('  hello \n world  '),
      'hello   world',
    );
  });
}
