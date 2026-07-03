import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/fcm/fcm_pending_notification_tap.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final class _FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  _FakePathProviderPlatform(this.root);

  final Directory root;

  @override
  Future<String?> getApplicationSupportPath() async => root.path;
}

void main() {
  late Directory tempDir;
  late Directory previousRoot;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('fcm_pending_tap_test');
    previousRoot = Directory('${tempDir.path}/previous_should_not_exist');
    PathProviderPlatform.instance = _FakePathProviderPlatform(tempDir);
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
    PathProviderPlatform.instance = _FakePathProviderPlatform(previousRoot);
  });

  test('save and readAndClear round-trip payload', () async {
    const String payloadJson =
        '{"url":"/channels/@me/dm-1/msg-9","channel_id":"dm-1"}';
    await FcmPendingNotificationTap.save(payloadJson);
    final String? actual = await FcmPendingNotificationTap.readAndClear();
    expect(actual, payloadJson);
    final String? afterClear = await FcmPendingNotificationTap.readAndClear();
    expect(afterClear, isNull);
  });

  test('flushToHandler dispatches stored payload once', () async {
    const String payloadJson = '{"url":"/channels/@me/dm-1/msg-9"}';
    await FcmPendingNotificationTap.save(payloadJson);
    final List<String?> handledPayloads = <String?>[];
    await FcmPendingNotificationTap.flushToHandler((String? payload) {
      handledPayloads.add(payload);
    });
    expect(handledPayloads, <String?>[payloadJson]);
    final List<String?> secondFlush = <String?>[];
    await FcmPendingNotificationTap.flushToHandler((String? payload) {
      secondFlush.add(payload);
    });
    expect(secondFlush, isEmpty);
  });

  test('save ignores null and empty payload', () async {
    await FcmPendingNotificationTap.save(null);
    await FcmPendingNotificationTap.save('');
    final String? actual = await FcmPendingNotificationTap.readAndClear();
    expect(actual, isNull);
  });
}
