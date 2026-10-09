import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/apns/apns_mobile_device_registration.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_prompt_provider.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

const MethodChannel _permissionChannel = MethodChannel(
  'flutter.baseflow.com/permissions/methods',
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_permissionChannel, (
          MethodCall methodCall,
        ) async {
          switch (methodCall.method) {
            case 'checkPermissionStatus':
              return 1;
            case 'requestPermissions':
              return <int, int>{17: 1};
            default:
              return null;
          }
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_permissionChannel, null);
  });

  testWidgets(
    'a self-hosted device without relay consent drops its relay registration',
    (WidgetTester tester) async {
      final _RecordingUsersApi users = _RecordingUsersApi();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerClientProvider.overrideWithValue(_FakeClient(users)),
          pushServiceProvider.overrideWithValue(_FakePushService()),
          isActiveInstanceOfficialProvider.overrideWithValue(false),
        ],
      );
      addTearDown(container.dispose);
      container.read(fluxerAuthTokenProvider.notifier).setToken('token');
      container.read(authStateProvider.notifier).setAuthenticated(value: true);
      container.read(currentUserIdProvider.notifier).set('user-1');

      final ApnsMobileDeviceRegistration registration = container.read(
        apnsMobileDeviceRegistrationProvider.notifier,
      );
      await registration.sync();
      await registration.sync();

      expect(users.registeredTokens, isEmpty);
      expect(users.unregisteredTokens, <String>[
        apnsRelayUrl(
          appId: AppBuildConfig.mobilePushAppId,
          environment: 'development',
          deviceTokenHex: 'ab',
        ),
      ]);
      expect(container.read(pushRelayConsentPromptProvider), isTrue);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );
}

class _FakePushService implements PushService {
  @override
  Future<void> initialize() async {}

  @override
  Future<String?> getToken() async => 'ab';

  @override
  Stream<PushMessage> watchMessages() => const Stream<PushMessage>.empty();
}

class _RecordingUsersApi implements UsersApi {
  final List<String> registeredTokens = <String>[];
  final List<String> unregisteredTokens = <String>[];

  @override
  Future<RegisterMobileDeviceResponse> registerMobilePushDevice({
    required RegisterMobileDeviceRequest body,
  }) {
    registeredTokens.add(body.token);
    throw UnimplementedError();
  }

  @override
  Future<SuccessResponse> unregisterMobilePushDevice({
    required UnregisterMobileDeviceRequest body,
  }) async {
    unregisteredTokens.add(body.token);
    return const SuccessResponse(success: true);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._usersApi) : super(Dio());

  final UsersApi _usersApi;

  @override
  UsersApi get users => _usersApi;
}
