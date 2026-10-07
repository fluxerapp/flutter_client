import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator_selection.dart';

void main() {
  group('selectGuildScrollIndicator', () {
    test('hides when there are no offscreen candidates', () {
      expect(
        selectGuildScrollIndicator(topCandidate: null, bottomCandidate: null),
        isNull,
      );
    });

    test(
      'prioritizes mentions over plain unread targets regardless of distance',
      () {
        const GuildScrollIndicatorCandidate nearUnread = (
          id: 'near-unread',
          severity: GuildScrollIndicatorSeverity.unread,
          distance: 10,
          order: 0,
        );
        const GuildScrollIndicatorCandidate farMention = (
          id: 'far-mention',
          severity: GuildScrollIndicatorSeverity.mention,
          distance: 280,
          order: 1,
        );
        final GuildScrollIndicatorSelection? selection =
            selectGuildScrollIndicator(
              topCandidate: nearUnread,
              bottomCandidate: farMention,
            );
        expect(selection?.edge, GuildScrollIndicatorEdge.bottom);
        expect(selection?.candidate.id, 'far-mention');
      },
    );

    test('uses the preferred scroll direction to break exact ties', () {
      const GuildScrollIndicatorCandidate above = (
        id: 'above',
        severity: GuildScrollIndicatorSeverity.unread,
        distance: 10,
        order: 0,
      );
      const GuildScrollIndicatorCandidate below = (
        id: 'below',
        severity: GuildScrollIndicatorSeverity.unread,
        distance: 10,
        order: 1,
      );
      final GuildScrollIndicatorSelection? selection =
          selectGuildScrollIndicator(
            topCandidate: above,
            bottomCandidate: below,
            preferredEdge: GuildScrollIndicatorEdge.bottom,
          );
      expect(selection?.edge, GuildScrollIndicatorEdge.bottom);
      expect(selection?.candidate.id, 'below');
    });

    test('returns only one edge when both exist', () {
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
    });
  });
}
