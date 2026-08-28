import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  tearDown(takeVoicePipSkipPhoneEnter);

  group('voice pip skip phone enter', () {
    test('arm then take', () {
      expect(peekVoicePipSkipPhoneEnter(), isFalse);
      armVoicePipSkipPhoneEnter();
      expect(peekVoicePipSkipPhoneEnter(), isTrue);
      expect(takeVoicePipSkipPhoneEnter(), isTrue);
      expect(peekVoicePipSkipPhoneEnter(), isFalse);
    });
  });

  group('voicePipMorphRadius', () {
    test('lerps from pip radius to tile', () {
      expect(voicePipMorphRadius(0), 16);
      expect(voicePipMorphRadius(1), 12);
    });
  });

  group('voicePipFallbackExpandRect', () {
    test('insets from padding when no pip size', () {
      final Rect rect = voicePipFallbackExpandRect(
        viewport: const Size(400, 800),
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
      );
      expect(rect.top, 48);
      expect(rect.left, 12);
      expect(rect.right, 388);
    });

    test('keeps pip aspect and centers in the content bounds', () {
      final Rect rect = voicePipFallbackExpandRect(
        viewport: const Size(400, 800),
        padding: EdgeInsets.zero,
        pipSize: const Size(100, 100),
      );
      expect(rect.width, closeTo(rect.height, 0.5));
      expect(rect.center.dx, closeTo(200, 1));
    });
  });

  group('voicePipHeroRectAt', () {
    const Rect pip = Rect.fromLTWH(280, 680, 100, 100);
    const Rect card = Rect.fromLTWH(24, 80, 350, 480);

    test('t=0 is the pip and t=1 is the card', () {
      expect(voicePipHeroRectAt(begin: pip, end: card, t: 0), pip);
      expect(voicePipHeroRectAt(begin: pip, end: card, t: 1), card);
    });

    test('center travels continuously toward the card', () {
      final Offset c0 = voicePipHeroRectAt(begin: pip, end: card, t: 0).center;
      final Offset cMid = voicePipHeroRectAt(
        begin: pip,
        end: card,
        t: 0.5,
      ).center;
      final Offset c1 = voicePipHeroRectAt(begin: pip, end: card, t: 1).center;
      expect((cMid - c0).distance, greaterThan(40));
      expect((c1 - cMid).distance, greaterThan(40));
      expect((cMid - c0).distance + (c1 - cMid).distance, greaterThan(120));
    });

    test('grows from pip size toward card size', () {
      final Rect mid = voicePipHeroRectAt(begin: pip, end: card, t: 0.5);
      expect(mid.width, greaterThan(pip.width + 20));
      expect(mid.width, lessThan(card.width - 20));
      expect(mid.height, greaterThan(pip.height + 20));
      expect(mid.height, lessThan(card.height - 20));
    });

    test('shrinks back to the pip when t goes from 1 to 0', () {
      final Rect start = voicePipHeroRectAt(begin: pip, end: card, t: 1);
      final Rect mid = voicePipHeroRectAt(begin: pip, end: card, t: 0.5);
      final Rect end = voicePipHeroRectAt(begin: pip, end: card, t: 0);
      expect(start, card);
      expect(end, pip);
      expect(mid.width, lessThan(start.width - 20));
      expect(mid.width, greaterThan(end.width + 20));
      expect(
        (mid.center - pip.center).distance,
        lessThan((start.center - pip.center).distance),
      );
    });

    test('moves the center on an arc instead of a linear Rect.lerp', () {
      final Rect linear = Rect.lerp(pip, card, 0.5)!;
      final Rect hero = voicePipHeroRectAt(begin: pip, end: card, t: 0.5);
      expect((hero.center - linear.center).distance, greaterThan(1));
    });
  });

  group('voicePipHostsFeatured', () {
    test('hosts during pip and both flight phases', () {
      expect(voicePipHostsFeatured(VoicePipOverlayPhase.hidden), isFalse);
      expect(voicePipHostsFeatured(VoicePipOverlayPhase.pip), isTrue);
      expect(voicePipHostsFeatured(VoicePipOverlayPhase.expanding), isTrue);
      expect(voicePipHostsFeatured(VoicePipOverlayPhase.collapsing), isTrue);
      expect(voicePipHostsFeatured(VoicePipOverlayPhase.settling), isFalse);
    });
  });

  group('voicePipHidesFeaturedTile', () {
    test('hides the destination tile only while the overlay is flying', () {
      expect(voicePipHidesFeaturedTile(VoicePipOverlayPhase.expanding), isTrue);
      expect(
        voicePipHidesFeaturedTile(VoicePipOverlayPhase.collapsing),
        isTrue,
      );
      expect(voicePipHidesFeaturedTile(VoicePipOverlayPhase.settling), isFalse);
      expect(voicePipHidesFeaturedTile(VoicePipOverlayPhase.hidden), isFalse);
    });
  });

  group('voicePipIsInFlight', () {
    test('is true while expanding, collapsing, or settling', () {
      expect(voicePipIsInFlight(VoicePipOverlayPhase.hidden), isFalse);
      expect(voicePipIsInFlight(VoicePipOverlayPhase.pip), isFalse);
      expect(voicePipIsInFlight(VoicePipOverlayPhase.expanding), isTrue);
      expect(voicePipIsInFlight(VoicePipOverlayPhase.collapsing), isTrue);
      expect(voicePipIsInFlight(VoicePipOverlayPhase.settling), isTrue);
    });
  });

  group('voicePipDecorationOpacity', () {
    test('keeps pip decoration at the start and drops it before landing', () {
      expect(voicePipDecorationOpacity(0), 1);
      expect(voicePipDecorationOpacity(0.4), 1);
      expect(voicePipDecorationOpacity(1), 0);
      expect(
        voicePipDecorationOpacity(0.8),
        lessThan(voicePipDecorationOpacity(0.6)),
      );
    });
  });

  group('voicePipFlightRect', () {
    test('snaps to the slot near the end of the flight', () {
      const Rect pip = Rect.fromLTWH(280, 680, 100, 100);
      const Rect card = Rect.fromLTWH(24, 80, 350, 480);
      const Rect slot = Rect.fromLTWH(20, 76, 360, 500);
      final VoicePipHeroFlight flight = VoicePipHeroFlight(
        begin: pip,
        end: card,
      );
      expect(voicePipFlightRect(flight: flight, t: 0, slot: slot), pip);
      expect(voicePipFlightRect(flight: flight, t: 1, slot: slot), slot);
      final Rect late = voicePipFlightRect(flight: flight, t: 0.9, slot: slot);
      expect(late, slot);
    });

    test('collapse does not snap to a live slot that changed aspect', () {
      const Rect pip = Rect.fromLTWH(280, 680, 100, 100);
      const Rect wide = Rect.fromLTWH(20, 80, 360, 202.5);
      const Rect packed = Rect.fromLTWH(40, 120, 160, 160);
      final VoicePipHeroFlight flight = VoicePipHeroFlight(
        begin: pip,
        end: wide,
      );
      final Rect start = voicePipFlightRect(
        flight: flight,
        t: 0.95,
        slot: packed,
        snapToSlot: false,
      );
      expect(start.width / start.height, closeTo(16 / 9, 0.08));
      expect(start.width, isNot(closeTo(packed.width, 8)));
    });

    test('collapse aspect moves toward the pip without bouncing back', () {
      const Rect pip = Rect.fromLTWH(280, 680, 100, 100);
      const Rect wide = Rect.fromLTWH(20, 80, 360, 202.5);
      final VoicePipHeroFlight flight = VoicePipHeroFlight(
        begin: pip,
        end: wide,
      );
      const double pipAspect = 1;
      double previous = (wide.width / wide.height - pipAspect).abs();
      for (int i = 9; i >= 0; i--) {
        final Rect rect = voicePipFlightRect(
          flight: flight,
          t: i / 10,
          snapToSlot: false,
        );
        final double dist = (rect.width / rect.height - pipAspect).abs();
        expect(dist, lessThanOrEqualTo(previous + 0.02));
        previous = dist;
      }
    });
  });

  group('VoicePipHeroFlight.retarget', () {
    test('does not restart when the end rect is unchanged', () {
      const Rect pip = Rect.fromLTWH(0, 0, 100, 100);
      const Rect card = Rect.fromLTWH(10, 10, 200, 300);
      final VoicePipHeroFlight flight = VoicePipHeroFlight(
        begin: pip,
        end: card,
      );
      expect(flight.retarget(newEnd: card, t: 0.4), isFalse);
      expect(flight.begin, pip);
    });

    test('freezes the in-flight rect as the new begin', () {
      const Rect pip = Rect.fromLTWH(280, 680, 100, 100);
      const Rect fallback = Rect.fromLTWH(12, 8, 376, 696);
      const Rect slot = Rect.fromLTWH(40, 120, 320, 420);
      final VoicePipHeroFlight flight = VoicePipHeroFlight(
        begin: pip,
        end: fallback,
      );
      final Rect inFlight = flight.rectAt(0.4);
      expect(flight.retarget(newEnd: slot, t: 0.4), isTrue);
      expect(voicePipRectsClose(flight.begin, inFlight), isTrue);
      expect(flight.end, slot);
      expect(flight.rectAt(0), inFlight);
      expect(flight.rectAt(1), slot);
    });
  });
}
