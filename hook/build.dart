import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) {
      return;
    }
    await CBuilder.library(
      name: 'fluxer_altcha',
      assetName: 'core/api/altcha_native_solver.dart',
      sources: const <String>['native/altcha_pbkdf2/altcha_pbkdf2.c'],
    ).run(input: input, output: output);
  });
}
