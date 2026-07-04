import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

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

    test('returns unknown messages unchanged', () {
      const String raw = 'Voice server did not return connection details.';
      expect(resolveVoiceSessionErrorMessage(raw, l10n), raw);
    });
  });
}
