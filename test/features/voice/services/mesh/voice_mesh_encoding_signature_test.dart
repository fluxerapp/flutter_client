import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_peer.dart';

void main() {
  test('equal encodings share a signature', () {
    expect(
      voiceMeshEncodingSignature(
        RTCRtpEncoding(maxBitrate: 1000, maxFramerate: 30),
      ),
      voiceMeshEncodingSignature(
        RTCRtpEncoding(maxBitrate: 1000, maxFramerate: 30),
      ),
    );
  });

  test('changed encodings get a new signature', () {
    final String base = voiceMeshEncodingSignature(
      RTCRtpEncoding(maxBitrate: 1000, maxFramerate: 30),
    );
    expect(
      voiceMeshEncodingSignature(
        RTCRtpEncoding(maxBitrate: 2000, maxFramerate: 30),
      ),
      isNot(base),
    );
    expect(
      voiceMeshEncodingSignature(
        RTCRtpEncoding(maxBitrate: 1000, maxFramerate: 15),
      ),
      isNot(base),
    );
    expect(
      voiceMeshEncodingSignature(
        RTCRtpEncoding(
          maxBitrate: 1000,
          maxFramerate: 30,
          scaleResolutionDownBy: 2,
        ),
      ),
      isNot(base),
    );
  });
}
