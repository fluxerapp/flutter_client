import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/services/upload_keep_alive.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('fluxer_app/upload_keep_alive'),
          null,
        );
    UploadKeepAlive.resetForTest();
  });

  test('releaseNativeIfIdle stops only when no upload is active', () async {
    final List<String> calls = <String>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('fluxer_app/upload_keep_alive'),
          (MethodCall call) async {
            calls.add(call.method);
            return null;
          },
        );

    UploadKeepAlive.releaseNativeIfIdle();
    await pumpEventQueue();
    expect(calls, <String>['stop']);

    calls.clear();
    final UploadKeepAlive keepAlive = UploadKeepAlive();
    keepAlive.begin(notificationTitle: 'uploading');
    await pumpEventQueue();
    expect(calls, <String>['start']);

    calls.clear();
    UploadKeepAlive.releaseNativeIfIdle();
    await pumpEventQueue();
    expect(calls, isEmpty);

    keepAlive.end();
    await pumpEventQueue();
    expect(calls, <String>['stop']);
  });
}
