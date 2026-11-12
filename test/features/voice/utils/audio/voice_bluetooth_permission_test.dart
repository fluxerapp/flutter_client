import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/audio/voice_join_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  setUp(resetVoiceBluetoothPermissionRequestForTest);

  test('requests bluetooth connect once when it is not yet granted', () async {
    int requests = 0;
    Future<PermissionStatus> request() async {
      requests++;
      return PermissionStatus.granted;
    }

    await requestVoiceBluetoothPermissionOnce(
      isAndroid: true,
      readStatus: () async => PermissionStatus.denied,
      request: request,
    );
    await requestVoiceBluetoothPermissionOnce(
      isAndroid: true,
      readStatus: () async => PermissionStatus.denied,
      request: request,
    );

    expect(requests, 1);
  });

  test('does not prompt when already granted or permanently denied', () async {
    int requests = 0;
    Future<PermissionStatus> request() async {
      requests++;
      return PermissionStatus.granted;
    }

    await requestVoiceBluetoothPermissionOnce(
      isAndroid: true,
      readStatus: () async => PermissionStatus.granted,
      request: request,
    );
    resetVoiceBluetoothPermissionRequestForTest();
    await requestVoiceBluetoothPermissionOnce(
      isAndroid: true,
      readStatus: () async => PermissionStatus.permanentlyDenied,
      request: request,
    );

    expect(requests, 0);
  });
}
