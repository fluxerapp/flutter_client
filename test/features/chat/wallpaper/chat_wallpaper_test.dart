import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';

void main() {
  group('chatWallpaperFromJson', () {
    test('empty and invalid payloads use default', () {
      expect(chatWallpaperFromJson(null), const ChatWallpaperState());
      expect(chatWallpaperFromJson(''), const ChatWallpaperState());
      expect(chatWallpaperFromJson('{'), const ChatWallpaperState());
      expect(chatWallpaperFromJson('{"kind":1,"dim":0.4}').dim, 0.4);
      expect(
        chatWallpaperFromJson('{"kind":"unknown","dim":0.2}').kind,
        ChatWallpaperKind.defaultTheme,
      );
    });

    test('clamps dim between 0 and 1', () {
      expect(chatWallpaperFromJson('{"kind":"default","dim":2}').dim, 1);
      expect(chatWallpaperFromJson('{"kind":"default","dim":-1}').dim, 0);
    });

    test('defaults dim to 20 percent when omitted', () {
      expect(const ChatWallpaperState().dim, 0.2);
      expect(chatWallpaperFromJson('{"kind":"color","id":"slate"}').dim, 0.2);
    });

    test('composer fade uses dimmed wallpaper color', () {
      const ChatWallpaperState selection = ChatWallpaperState(
        kind: ChatWallpaperKind.color,
        id: 'navy',
      );
      final ChatWallpaperPaint paint = resolveChatWallpaperPaint(
        snapshot: const ChatWallpaperSnapshot(selection: selection),
        themeBackground: const Color(0xFF111111),
      );
      expect(
        chatWallpaperComposerFadeColor(
          paint: paint,
          resolved: selection,
          themeBackground: const Color(0xFF111111),
        ),
        Color.lerp(const Color(0xFF1B2A4A), const Color(0xFF000000), 0.2),
      );
    });

    test('round-trips color, gradient, custom, and preset', () {
      const ChatWallpaperState color = ChatWallpaperState(
        kind: ChatWallpaperKind.color,
        id: 'slate',
        dim: 0.25,
      );
      const ChatWallpaperState gradient = ChatWallpaperState(
        kind: ChatWallpaperKind.gradient,
        id: 'dusk',
        dim: 0.4,
      );
      const ChatWallpaperState custom = ChatWallpaperState(
        kind: ChatWallpaperKind.custom,
        dim: 0.6,
      );
      const ChatWallpaperState preset = ChatWallpaperState(
        kind: ChatWallpaperKind.preset,
        id: 'aurora',
        dim: 0.3,
      );

      expect(chatWallpaperFromJson(chatWallpaperToJson(color)), color);
      expect(chatWallpaperFromJson(chatWallpaperToJson(gradient)), gradient);
      expect(chatWallpaperFromJson(chatWallpaperToJson(custom)), custom);
      expect(chatWallpaperFromJson(chatWallpaperToJson(preset)), preset);
      const ChatWallpaperState starfield = ChatWallpaperState(
        kind: ChatWallpaperKind.starfield,
        dim: 0.15,
      );
      expect(chatWallpaperFromJson(chatWallpaperToJson(starfield)), starfield);
    });
  });

  group('ChatWallpaperSnapshot.resolved', () {
    test('unknown color and gradient ids fall back to default', () {
      expect(
        const ChatWallpaperSnapshot(
          selection: ChatWallpaperState(
            kind: ChatWallpaperKind.color,
            id: 'missing',
          ),
        ).resolved,
        const ChatWallpaperState(),
      );
      expect(
        const ChatWallpaperSnapshot(
          selection: ChatWallpaperState(
            kind: ChatWallpaperKind.gradient,
            id: 'missing',
          ),
        ).resolved.isThemeBackground,
        isTrue,
      );
    });

    test('preset kind is kept in JSON even with an empty image catalog', () {
      const ChatWallpaperState preset = ChatWallpaperState(
        kind: ChatWallpaperKind.preset,
        id: 'aurora',
        dim: 0.7,
      );
      final ChatWallpaperState parsed = chatWallpaperFromJson(
        chatWallpaperToJson(preset),
      );
      expect(parsed, preset);
      expect(ChatWallpaperCatalog.bundledImages, isEmpty);
      expect(
        const ChatWallpaperSnapshot(selection: preset).resolved.kind,
        ChatWallpaperKind.defaultTheme,
      );
    });

    test('custom bytes resolve to a memory image', () {
      final ChatWallpaperSnapshot snapshot = ChatWallpaperSnapshot(
        selection: const ChatWallpaperState(kind: ChatWallpaperKind.custom),
        customImageBytes: Uint8List.fromList(<int>[1, 2, 3]),
      );
      expect(snapshot.hasCustomImage, isTrue);
      expect(snapshot.resolved.kind, ChatWallpaperKind.custom);
      expect(chatWallpaperCustomImageProvider(snapshot), isA<MemoryImage>());
    });

    test('replacing custom bytes updates equality', () {
      final ChatWallpaperSnapshot first = ChatWallpaperSnapshot(
        selection: const ChatWallpaperState(kind: ChatWallpaperKind.custom),
        customImagePath: '/tmp/wallpaper.jpg',
        customImageBytes: Uint8List.fromList(<int>[1, 2, 3]),
      );
      final ChatWallpaperSnapshot second = first.copyWith(
        customImageBytes: Uint8List.fromList(<int>[4, 5, 6]),
      );
      expect(first == second, isFalse);
      expect(chatWallpaperCustomImageProvider(second), isA<MemoryImage>());
    });

    test('custom without a file falls back to default', () {
      expect(
        const ChatWallpaperSnapshot(
          selection: ChatWallpaperState(kind: ChatWallpaperKind.custom),
        ).hasCustomImage,
        isFalse,
      );
      expect(
        const ChatWallpaperSnapshot(
          selection: ChatWallpaperState(kind: ChatWallpaperKind.custom),
        ).resolved.isThemeBackground,
        isTrue,
      );
    });
  });

  group('chat wallpaper tone', () {
    test('default wallpaper has no tone and does not overlay', () {
      const ChatWallpaperState def = ChatWallpaperState();
      expect(resolveChatWallpaperTone(def), isNull);
      expect(
        shouldOverlayChatWallpaperText(
          resolved: def,
          themeBrightness: Brightness.light,
        ),
        isFalse,
      );
      expect(
        shouldOverlayChatWallpaperText(
          resolved: def,
          themeBrightness: Brightness.dark,
        ),
        isFalse,
      );
    });

    test('every current color, gradient, and starfield is dark', () {
      for (final ChatWallpaperColorPreset preset
          in ChatWallpaperCatalog.colors) {
        expect(
          resolveChatWallpaperTone(
            ChatWallpaperState(kind: ChatWallpaperKind.color, id: preset.id),
          ),
          Brightness.dark,
        );
      }
      for (final ChatWallpaperGradientPreset preset
          in ChatWallpaperCatalog.gradients) {
        expect(
          resolveChatWallpaperTone(
            ChatWallpaperState(kind: ChatWallpaperKind.gradient, id: preset.id),
          ),
          Brightness.dark,
        );
      }
      expect(
        resolveChatWallpaperTone(
          const ChatWallpaperState(kind: ChatWallpaperKind.starfield),
        ),
        Brightness.dark,
      );
    });

    test('dark wallpaper overlays in light theme and not in dark theme', () {
      const ChatWallpaperState starfield = ChatWallpaperState(
        kind: ChatWallpaperKind.starfield,
      );
      expect(
        shouldOverlayChatWallpaperText(
          resolved: starfield,
          themeBrightness: Brightness.light,
        ),
        isTrue,
      );
      expect(
        shouldOverlayChatWallpaperText(
          resolved: starfield,
          themeBrightness: Brightness.dark,
        ),
        isFalse,
      );
    });

    test('dimmed custom luminance crosses the cutoff', () {
      expect(chatWallpaperEffectiveLuminance(1, 0.2), closeTo(0.8, 0.0001));
      expect(chatWallpaperToneFromLuminance(0.8), Brightness.light);
      expect(
        chatWallpaperToneFromLuminance(kChatWallpaperLuminanceCutoff - 0.001),
        Brightness.dark,
      );
      expect(
        resolveChatWallpaperTone(
          const ChatWallpaperState(
            kind: ChatWallpaperKind.custom,
            dim: 0.9,
            luminance: 0.5,
          ),
        ),
        Brightness.dark,
      );
      expect(
        resolveChatWallpaperTone(
          const ChatWallpaperState(
            kind: ChatWallpaperKind.custom,
            dim: 0,
            luminance: 0.9,
          ),
        ),
        Brightness.light,
      );
    });

    test('round-trips custom luminance', () {
      const ChatWallpaperState custom = ChatWallpaperState(
        kind: ChatWallpaperKind.custom,
        dim: 0.35,
        luminance: 0.42,
      );
      expect(chatWallpaperFromJson(chatWallpaperToJson(custom)), custom);
    });
  });
}
