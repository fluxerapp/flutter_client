import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';

void main() {
  // A runtime `colorFilter` makes vector_graphics call saveLayer on every icon
  // paint (RenderPictureVectorGraphic.paint), which dominated raster time while
  // scrolling the channel list. Because every channel SVG fills with
  // `currentColor`, we tint through SvgTheme so the color is baked into the
  // decoded picture and no offscreen layer is needed. These tests lock in that
  // contract: the SvgPicture must carry the tint via the loader theme, never via
  // a colorFilter.
  group('ChannelIcon tinting', () {
    const Color tint = Color(0xFF123456);

    Future<SvgPicture> pumpIcon(WidgetTester tester, ChannelType type) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChannelIcon(type: type, color: tint),
        ),
      );
      return tester.widget<SvgPicture>(find.byType(SvgPicture));
    }

    for (final type in const <ChannelType>[
      ChannelType.text,
      ChannelType.voice,
      ChannelType.link,
    ]) {
      testWidgets('$type icon tints via SvgTheme.currentColor', (tester) async {
        final SvgPicture svg = await pumpIcon(tester, type);

        expect(
          svg.colorFilter,
          isNull,
          reason: 'a colorFilter forces a saveLayer on every icon paint',
        );
        final loader = svg.bytesLoader as SvgAssetLoader;
        expect(loader.theme?.currentColor, tint);
      });
    }
  });
}
