import 'dart:typed_data';

import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_waveform.dart';
import 'package:test/test.dart';

void main() {
  test('computeLiveRmsAmplitudeFromPcmWindow increases with signal', () {
    final Uint8List quiet = Uint8List(64);
    final Uint8List loud = Uint8List(64);
    final ByteData loudView = ByteData.sublistView(loud);
    for (int i = 0; i < 32; i++) {
      loudView.setInt16(i * 2, 20000, Endian.little);
    }
    expect(
      computeLiveRmsAmplitudeFromPcmWindow(loud),
      greaterThan(computeLiveRmsAmplitudeFromPcmWindow(quiet)),
    );
  });
}
