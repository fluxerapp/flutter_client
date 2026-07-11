import 'package:fluxer_app/features/auth/utils/phone_verification_errors.dart';
import 'package:fluxer_dart/export.dart';

class PhoneVerificationRepository {
  const PhoneVerificationRepository(this._client);

  final FluxerClient _client;

  Future<PhoneSendVerificationResponse> sendVerification({
    required String phone,
    PhoneSendVerificationRequestChannelChannel? channel,
  }) {
    return _client.users.sendPhoneVerificationCode(
      body: PhoneSendVerificationRequest(phone: phone, channel: channel),
    );
  }

  Future<void> verifyCode({required String phone, required String code}) {
    return _client.users.verifyPhoneCode(
      body: PhoneVerifyRequest(
        phone: phone,
        code: normalizeVerificationCode(code),
      ),
    );
  }

  Future<InboundSmsChallengeStartResponse> startInboundChallenge() {
    return _client.users.startInboundPhoneChallenge();
  }
}
