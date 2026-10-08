import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/configure_build.dart';

void main() {
  final Directory projectRoot = findProjectRoot(Directory.current);

  tearDown(() async {
    await configureProjectBuild(projectRoot, BuildProfile.iosStore);
  });

  test('configure_build oss strips store billing artifacts', () async {
    await configureProjectBuild(projectRoot, BuildProfile.oss);

    final String pubspec = File(
      '${projectRoot.path}/pubspec.yaml',
    ).readAsStringSync();
    expect(pubspec, isNot(contains('in_app_purchase:')));
    expect(pubspec, isNot(contains('in_app_purchase_android:')));

    final String client = File(
      '${projectRoot.path}/lib/features/settings/services/premium_store_purchase_client.dart',
    ).readAsStringSync();
    final String stub = File(
      '${projectRoot.path}/lib/features/settings/services/premium_store_purchase_client.stub.dart',
    ).readAsStringSync();
    expect(client, stub);
    expect(client, isNot(contains('in_app_purchase')));
  });
}
