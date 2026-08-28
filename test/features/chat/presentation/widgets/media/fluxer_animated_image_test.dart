import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('FluxerAnimatedImage', () {
    testWidgets('skips decode cache while playing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp',
                staticUrl: 'https://x/a.png',
                playing: true,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );

      final CachedNetworkImage image = tester.widget(
        find.byType(CachedNetworkImage),
      );
      expect(image.imageUrl, 'https://x/a.webp');
      expect(image.memCacheWidth, isNull);
      expect(image.memCacheHeight, isNull);
      expect(image.maxWidthDiskCache, isNull);
      expect(image.maxHeightDiskCache, isNull);
    });

    testWidgets('caps decode cache for the static frame', (tester) async {
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 160,
              height: 160,
              child: FluxerAnimatedImage(
                animatedUrl: 'https://x/a.webp',
                staticUrl: 'https://x/a.png',
                playing: false,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );

      final CachedNetworkImage image = tester.widget(
        find.byType(CachedNetworkImage),
      );
      expect(image.imageUrl, 'https://x/a.png');
      expect(image.memCacheWidth ?? image.memCacheHeight, 320);
    });
  });
}
