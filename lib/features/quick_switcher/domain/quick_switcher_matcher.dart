import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';

List<T> matchQuickSwitcherCandidates<T extends QuickSwitcherCandidate>(
  List<T> candidates,
  String search,
  int limit,
) {
  if (candidates.isEmpty) {
    return <T>[];
  }
  if (search.isEmpty) {
    return _sortCandidatesByWeight(candidates).take(limit).toList();
  }
  final String query = search.toLowerCase();
  final List<T> matches = candidates
      .where((QuickSwitcherCandidate candidate) => _matchesCandidate(candidate, query))
      .toList()
    ..sort((T a, T b) {
      final int weightCompare = b.sortWeight.compareTo(a.sortWeight);
      if (weightCompare != 0) {
        return weightCompare;
      }
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
  return matches.take(limit).toList();
}

List<T> _sortCandidatesByWeight<T extends QuickSwitcherCandidate>(
  List<T> candidates,
) {
  final List<T> sorted = List<T>.from(candidates);
  sorted.sort((T a, T b) {
    final int weightCompare = b.sortWeight.compareTo(a.sortWeight);
    if (weightCompare != 0) {
      return weightCompare;
    }
    return a.title.toLowerCase().compareTo(b.title.toLowerCase());
  });
  return sorted;
}

bool _matchesCandidate(QuickSwitcherCandidate candidate, String query) {
  if (candidate.title.toLowerCase().contains(query)) {
    return true;
  }
  final String? subtitle = candidate.subtitle;
  if (subtitle != null && subtitle.toLowerCase().contains(query)) {
    return true;
  }
  for (final String value in candidate.searchValues) {
    if (value.toLowerCase().contains(query)) {
      return true;
    }
  }
  return false;
}
