import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_hdr_player_config.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

void main() {
  group('chatVideoHdrMpvProperties', () {
    test('STANDARD pins Rec.709 sRGB', () {
      final Map<String, String> properties = chatVideoHdrMpvProperties(
        HdrDisplayMode.standard,
      );
      expect(properties['hdr-compute-peak'], 'yes');
      expect(properties['tone-mapping'], 'auto');
      expect(properties['target-prim'], 'bt.709');
      expect(properties['target-trc'], 'srgb');
    });

    test('FULL does not pin sRGB', () {
      final Map<String, String> properties = chatVideoHdrMpvProperties(
        HdrDisplayMode.full,
      );
      expect(properties['hdr-compute-peak'], 'yes');
      expect(properties['tone-mapping'], 'auto');
      expect(properties['target-trc'], 'auto');
      expect(properties['target-prim'], 'auto');
    });
  });
}
