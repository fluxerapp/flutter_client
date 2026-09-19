import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/chat_wallpaper_file_store.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:image/image.dart' as img;

Uint8List _solidPng({required int r, required int g, required int b}) {
  final img.Image image = img.Image(width: 8, height: 8);
  img.fill(image, color: img.ColorRgb8(r, g, b));
  return Uint8List.fromList(img.encodePng(image));
}

void main() {
  group('sampleChatWallpaperLuminance', () {
    test('near-black images resolve to a dark tone', () {
      final double? luminance = sampleChatWallpaperLuminance(
        _solidPng(r: 8, g: 8, b: 16),
      );
      expect(luminance, isNotNull);
      expect(luminance, lessThan(kChatWallpaperLuminanceCutoff));
      expect(chatWallpaperToneFromLuminance(luminance!), Brightness.dark);
    });

    test('near-white images resolve to a light tone', () {
      final double? luminance = sampleChatWallpaperLuminance(
        _solidPng(r: 250, g: 250, b: 250),
      );
      expect(luminance, isNotNull);
      expect(luminance, greaterThan(kChatWallpaperLuminanceCutoff));
      expect(chatWallpaperToneFromLuminance(luminance!), Brightness.light);
    });
  });
}
