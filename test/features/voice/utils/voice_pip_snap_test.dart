import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_snap.dart';

void main() {
  const Size viewport = Size(400, 800);
  const Size card = Size(120, 160);
  final Rect safe = voicePipSafeRect(
    viewport: viewport,
    insets: const EdgeInsets.fromLTRB(0, 40, 0, 80),
  );

  group('voicePipSnap', () {
    test('places each corner inside the safe rect', () {
      for (final VoicePipCorner corner in VoicePipCorner.values) {
        final Offset origin = voicePipOriginForCorner(
          corner: corner,
          safeRect: safe,
          cardSize: card,
        );
        expect(origin.dx, greaterThanOrEqualTo(safe.left));
        expect(origin.dy, greaterThanOrEqualTo(safe.top));
        expect(origin.dx + card.width, lessThanOrEqualTo(safe.right + 0.01));
        expect(origin.dy + card.height, lessThanOrEqualTo(safe.bottom + 0.01));
      }
    });

    test('release snaps to the nearer left or right edge', () {
      const Offset dropped = Offset(90, 220);
      final Offset origin = voicePipOriginAfterRelease(
        origin: dropped,
        cardSize: card,
        safeRect: safe,
      );
      expect(origin.dx, safe.left);
      expect(origin.dy, dropped.dy);
    });

    test('release snaps to the top when that edge is nearest', () {
      final double centerX = (safe.left + safe.right - card.width) / 2;
      final Offset origin = voicePipSnapToNearestEdge(
        origin: Offset(centerX, safe.top + 24),
        cardSize: card,
        safeRect: safe,
      );
      expect(origin.dx, closeTo(centerX, 0.01));
      expect(origin.dy, safe.top);
    });

    test('fling coasts then snaps to an edge', () {
      final Offset origin = voicePipDefaultOrigin(
        safeRect: safe,
        cardSize: card,
      );
      final Offset released = voicePipOriginAfterRelease(
        origin: origin,
        cardSize: card,
        safeRect: safe,
        velocity: const Offset(-2400, -2400),
      );
      expect(released.dx, greaterThanOrEqualTo(safe.left));
      expect(released.dy, greaterThanOrEqualTo(safe.top));
      expect(
        released.dx == safe.left ||
            released.dx == safe.right - card.width ||
            released.dy == safe.top ||
            released.dy == safe.bottom - card.height,
        isTrue,
      );
    });

    test('clamp keeps the card in the safe rect', () {
      final Offset clamped = voicePipClampOrigin(
        origin: const Offset(-40, 900),
        cardSize: card,
        safeRect: safe,
      );
      expect(clamped.dx, safe.left);
      expect(clamped.dy, safe.bottom - card.height);
    });

    test('move haptic fires on the first non-zero delta only', () {
      expect(
        voicePipShouldPlayMoveHaptic(alreadyPlayed: false, delta: Offset.zero),
        isFalse,
      );
      expect(
        voicePipShouldPlayMoveHaptic(
          alreadyPlayed: false,
          delta: const Offset(1, 0),
        ),
        isTrue,
      );
      expect(
        voicePipShouldPlayMoveHaptic(
          alreadyPlayed: true,
          delta: const Offset(4, 2),
        ),
        isFalse,
      );
    });

    test('screen-share cards use a wide aspect', () {
      final Size size = voicePipCardSize(
        viewport: viewport,
        isScreenShare: true,
        hasVideo: true,
      );
      expect(size.width / size.height, closeTo(16 / 9, 0.02));
    });

    test('voice-only cards are a 100 square', () {
      expect(
        voicePipCardSize(
          viewport: viewport,
          isScreenShare: false,
          hasVideo: false,
        ),
        kVoicePipCompactSize,
      );
    });

    test('tile avatars scale with the card up to 192', () {
      expect(voiceTileAvatarSize(100), closeTo(50, 0.01));
      expect(voiceTileAvatarSize(220), closeTo(110, 0.01));
      expect(voiceTileAvatarSize(40), 32);
      expect(voiceTileAvatarSize(800), kVoiceTileAvatarMaxSize);
    });
  });
}
