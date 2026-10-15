import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  late FluxerLocalizations l10n;

  setUp(() {
    l10n = lookupFluxerLocalizations(const Locale('en'));
  });

  group('resolveVoiceSessionErrorMessage', () {
    test('maps mic permission code', () {
      expect(
        resolveVoiceSessionErrorMessage(kVoiceSessionErrorMicPermission, l10n),
        l10n.voiceMessageMicPermissionDenied,
      );
    });

    test('maps transport failure code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorTransportFailed,
          l10n,
        ),
        l10n.voiceJoinCallFailed,
      );
    });

    test('maps connect permission code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorNoConnectPermission,
          l10n,
        ),
        l10n.voiceChannelNoConnectPermission,
      );
    });

    test('maps mic publish failure code', () {
      expect(
        resolveVoiceSessionErrorMessage(kVoiceSessionErrorMicPublish, l10n),
        l10n.voiceMicPublishFailedStayConnected,
      );
    });

    test('maps e2ee required code', () {
      expect(
        resolveVoiceSessionErrorMessage(kVoiceSessionErrorE2eeRequired, l10n),
        l10n.voiceE2eeUpdateRequired,
      );
    });

    test('maps camera permission code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorCameraPermission,
          l10n,
        ),
        l10n.voiceCameraPermissionRequired,
      );
    });

    test('maps screen share toggle code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorScreenShareToggle,
          l10n,
        ),
        l10n.voiceErrorScreenShareToggle,
      );
    });

    test('maps screen share permission code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorScreenSharePermissionDenied,
          l10n,
        ),
        l10n.voiceErrorScreenSharePermissionDenied,
      );
    });

    test('maps screen share unsupported code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorScreenShareUnsupported,
          l10n,
        ),
        l10n.voiceErrorScreenShareUnsupported,
      );
    });

    test('maps multi-device disconnect failure code', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceSessionErrorMultiDeviceDisconnectFailed,
          l10n,
        ),
        l10n.voiceMultiDeviceDisconnectFailed,
      );
    });

    test('returns unknown messages unchanged', () {
      const String raw = 'Voice server did not return connection details.';
      expect(resolveVoiceSessionErrorMessage(raw, l10n), raw);
    });

    test('maps gateway join refusals to specific copy', () {
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceGatewayJoinErrors['VOICE_MEMBER_TIMED_OUT']!,
          l10n,
        ),
        "You can't join while you're timed out.",
      );
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceGatewayJoinErrors['VOICE_CONNECTION_LIMIT_REACHED']!,
          l10n,
        ),
        "You've reached this voice channel's connection limit.",
      );
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceGatewayJoinErrors['VOICE_UNCLAIMED_ACCOUNT']!,
          l10n,
        ),
        'Claim your account to join this voice channel.',
      );
      expect(
        resolveVoiceSessionErrorMessage(
          kVoiceGatewayJoinErrors['VOICE_CHANNEL_NOT_FOUND']!,
          l10n,
        ),
        'This voice channel is no longer available.',
      );
      expect(
        resolveVoiceSessionErrorMessage(kVoiceSessionErrorUserLimit, l10n),
        'This voice channel has reached its user limit. Try again later or join a different channel.',
      );
    });
  });
}
