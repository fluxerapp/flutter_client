import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/configure_build.dart';

const List<String> _profileFiles = <String>[
  'pubspec.yaml',
  'pubspec.firebase.deps.yaml',
  'pubspec.store_billing.deps.yaml',
  'lib/core/push/services/firebase_messaging_push_service.dart',
  'lib/core/push/services/firebase_messaging_push_service.stub.dart',
  'lib/core/push/services/firebase_messaging_push_service.fcm.dart',
  'lib/core/push/fcm/fcm_entrypoint.dart',
  'lib/core/push/fcm/fcm_entrypoint_stub.dart',
  'lib/core/push/fcm/fcm_entrypoint.fcm.dart',
  'lib/features/settings/services/premium_store_purchase_client.dart',
  'lib/features/settings/services/premium_store_purchase_client.stub.dart',
  'lib/features/settings/services/premium_store_purchase_client.billing.dart',
  'android/app/src/main/AndroidManifest.xml',
  'android/app/src/fcm/AndroidManifest.xml',
];

Map<String, String> _snapshot(Directory root) => <String, String>{
  for (final String path in _profileFiles)
    path: File('${root.path}/$path').readAsStringSync(),
};

Directory _copyProfileFiles(Directory projectRoot) {
  final Directory copy = Directory.systemTemp.createTempSync(
    'oss_configure_build_test',
  );
  for (final String path in _profileFiles) {
    File('${copy.path}/$path')
      ..createSync(recursive: true)
      ..writeAsStringSync(File('${projectRoot.path}/$path').readAsStringSync());
  }
  return copy;
}

void main() {
  final Directory projectRoot = findProjectRoot(Directory.current);

  test('configure_build oss strips store billing artifacts', () async {
    final Map<String, String> before = _snapshot(projectRoot);
    final Directory copy = _copyProfileFiles(projectRoot);
    addTearDown(() => copy.deleteSync(recursive: true));

    await configureProjectBuild(copy, BuildProfile.oss);

    final String pubspec = File('${copy.path}/pubspec.yaml').readAsStringSync();
    expect(pubspec, isNot(contains('in_app_purchase:')));
    expect(pubspec, isNot(contains('in_app_purchase_android:')));

    final String client = File(
      '${copy.path}/lib/features/settings/services/premium_store_purchase_client.dart',
    ).readAsStringSync();
    final String stub = File(
      '${copy.path}/lib/features/settings/services/premium_store_purchase_client.stub.dart',
    ).readAsStringSync();
    expect(client, stub);
    expect(client, isNot(contains('in_app_purchase')));

    expect(_snapshot(projectRoot), before);
  });
}
