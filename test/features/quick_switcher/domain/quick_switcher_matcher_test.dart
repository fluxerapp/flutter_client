import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_matcher.dart';

void main() {
  group('matchQuickSwitcherCandidates', () {
    final List<QuickSwitcherUserCandidate> candidates =
        <QuickSwitcherUserCandidate>[
          const QuickSwitcherUserCandidate(
            id: '1',
            title: 'Alice',
            subtitle: 'alice',
            userId: '1',
            searchValues: <String>['Alice', 'alice'],
            sortWeight: 10,
          ),
          const QuickSwitcherUserCandidate(
            id: '2',
            title: 'Bob Builder',
            subtitle: 'bob',
            userId: '2',
            searchValues: <String>['Bob Builder', 'bob'],
            sortWeight: 5,
          ),
        ];

    test('returns all candidates sorted by weight when search is empty', () {
      final List<QuickSwitcherUserCandidate> actual =
          matchQuickSwitcherCandidates(candidates, '', 10);

      expect(actual.map((QuickSwitcherUserCandidate c) => c.id).toList(), [
        '1',
        '2',
      ]);
    });

    test('filters candidates by title and subtitle', () {
      final List<QuickSwitcherUserCandidate> actual =
          matchQuickSwitcherCandidates(candidates, 'bob', 10);

      expect(actual, hasLength(1));
      expect(actual.first.id, '2');
    });
  });
}
