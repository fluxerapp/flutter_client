import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator_selection.dart';

GuildScrollIndicatorTarget _target({
  required String id,
  required double top,
  required double bottom,
  GuildScrollIndicatorSeverity severity = GuildScrollIndicatorSeverity.unread,
  int order = 0,
}) {
  return (id: id, severity: severity, top: top, bottom: bottom, order: order);
}

GuildScrollIndicatorLayout _layout(
  List<GuildScrollIndicatorTarget> targets, {
  double scrollTop = 100,
  double viewportHeight = 200,
  GuildScrollIndicatorEdge? preferredEdge,
}) {
  return (
    scrollTop: scrollTop,
    viewportHeight: viewportHeight,
    targets: targets,
    preferredEdge: preferredEdge,
  );
}

void main() {
  group('GuildScrollIndicatorSelection', () {
    test('hides when there are no offscreen unread targets', () {
      final GuildScrollIndicatorSelection? selection =
          resolveGuildScrollIndicator(
            layout: _layout([_target(id: 'visible', top: 120, bottom: 160)]),
          );
      expect(selection, isNull);
    });

    test(
      'treats partially visible targets as visible, not floating-pill targets',
      () {
        final ({
          GuildScrollIndicatorCandidate? topCandidate,
          GuildScrollIndicatorCandidate? bottomCandidate,
        })
        candidates = collectGuildScrollIndicatorCandidates(
          _layout([
            _target(id: 'partly-above', top: 90, bottom: 120),
            _target(id: 'partly-below', top: 290, bottom: 320),
          ]),
        );
        expect(candidates.topCandidate, isNull);
        expect(candidates.bottomCandidate, isNull);
      },
    );

    test('selects the nearest offscreen target at the same severity', () {
      final GuildScrollIndicatorSelection? selection =
          resolveGuildScrollIndicator(
            layout: _layout([
              _target(id: 'far-above', top: 0, bottom: 40),
              _target(id: 'near-above', top: 80, bottom: 90, order: 1),
              _target(id: 'far-below', top: 500, bottom: 540, order: 2),
            ]),
          );
      expect(selection?.edge, GuildScrollIndicatorEdge.top);
      expect(selection?.candidate.id, 'near-above');
      expect(selection?.candidate.distance, 10);
    });

    test(
      'prioritizes mentions over plain unread targets regardless of distance',
      () {
        final GuildScrollIndicatorSelection? selection =
            resolveGuildScrollIndicator(
              layout: _layout([
                _target(id: 'near-unread', top: 80, bottom: 90),
                _target(
                  id: 'far-mention',
                  top: 600,
                  bottom: 640,
                  severity: GuildScrollIndicatorSeverity.mention,
                  order: 1,
                ),
              ]),
            );
        expect(selection?.edge, GuildScrollIndicatorEdge.bottom);
        expect(selection?.candidate.id, 'far-mention');
      },
    );

    test('uses the latest scroll direction to break exact ties', () {
      final GuildScrollIndicatorSelection? selection =
          resolveGuildScrollIndicator(
            layout: _layout([
              _target(id: 'above', top: 80, bottom: 90),
              _target(id: 'below', top: 310, bottom: 320, order: 1),
            ], preferredEdge: GuildScrollIndicatorEdge.bottom),
          );
      expect(selection?.edge, GuildScrollIndicatorEdge.bottom);
      expect(selection?.candidate.id, 'below');
    });

    test(
      'hides immediately when the previously offscreen target moves into the viewport',
      () {
        final GuildScrollIndicatorSelection? selection =
            resolveGuildScrollIndicator(
              layout: _layout([
                _target(id: 'unread-above', top: 120, bottom: 160),
              ]),
            );
        expect(selection, isNull);
      },
    );

    test(
      'selectGuildScrollIndicator returns only one edge when both exist',
      () {
        const GuildScrollIndicatorCandidate top = (
          id: 'above',
          severity: GuildScrollIndicatorSeverity.unread,
          distance: 10,
          order: 0,
        );
        const GuildScrollIndicatorCandidate bottom = (
          id: 'below',
          severity: GuildScrollIndicatorSeverity.unread,
          distance: 10,
          order: 1,
        );
        final GuildScrollIndicatorSelection? selection =
            selectGuildScrollIndicator(
              topCandidate: top,
              bottomCandidate: bottom,
            );
        expect(selection?.edge, GuildScrollIndicatorEdge.top);
        expect(selection?.candidate.id, 'above');
      },
    );
  });
}
