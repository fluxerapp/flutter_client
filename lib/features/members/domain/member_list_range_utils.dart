import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';

const int kMemberListRangeMaxSpan = 99;
const int kMemberListRangePageSize = 100;
const int kMemberListRangeWindowOverscanPages = 1;
const int kMemberListSubscriptionBufferRows = 12;

const List<MemberListRange> kMemberListInitialSubscriptionRanges =
    <MemberListRange>[
      <int>[0, kMemberListRangeMaxSpan],
    ];

typedef MemberListRange = List<int>;

bool isValidMemberListRange(List<int>? range) {
  if (range == null || range.length != 2) {
    return false;
  }
  final int start = range[0];
  final int end = range[1];
  return start >= 0 && end >= start && end - start <= kMemberListRangeMaxSpan;
}

List<MemberListRange> normalizeMemberListRanges(List<MemberListRange> input) {
  if (input.isEmpty) {
    return <MemberListRange>[];
  }
  final List<MemberListRange> sanitized = <MemberListRange>[];
  for (final MemberListRange range in input) {
    final MemberListRange? safe = _sanitizeMemberListRange(range);
    if (safe != null) {
      sanitized.add(safe);
    }
  }
  if (sanitized.isEmpty) {
    return <MemberListRange>[];
  }
  sanitized.sort(
    (MemberListRange a, MemberListRange b) => a[0].compareTo(b[0]),
  );
  final List<MemberListRange> normalized = <MemberListRange>[];
  int currentStart = sanitized.first[0];
  int currentEnd = sanitized.first[1];
  for (int i = 1; i < sanitized.length; i++) {
    final MemberListRange range = sanitized[i];
    if (range[0] <= currentEnd + 1) {
      currentEnd = currentEnd > range[1] ? currentEnd : range[1];
      continue;
    }
    _pushRangeBySpan(normalized, currentStart, currentEnd);
    currentStart = range[0];
    currentEnd = range[1];
  }
  _pushRangeBySpan(normalized, currentStart, currentEnd);
  return normalized;
}

bool areMemberListRangesEqual(
  List<MemberListRange> left,
  List<MemberListRange> right,
) {
  final List<MemberListRange> normalizedLeft = normalizeMemberListRanges(left);
  final List<MemberListRange> normalizedRight = normalizeMemberListRanges(
    right,
  );
  if (normalizedLeft.length != normalizedRight.length) {
    return false;
  }
  for (int i = 0; i < normalizedLeft.length; i++) {
    if (normalizedLeft[i][0] != normalizedRight[i][0] ||
        normalizedLeft[i][1] != normalizedRight[i][1]) {
      return false;
    }
  }
  return true;
}

bool isIndexInMemberListRanges(int index, List<MemberListRange> ranges) {
  for (final MemberListRange range in ranges) {
    if (index >= range[0] && index <= range[1]) {
      return true;
    }
  }
  return false;
}

List<MemberListRange> buildMemberListRangeWindow({
  required double scrollTop,
  required double clientHeight,
  required double rowHeight,
  int bufferRows = kMemberListSubscriptionBufferRows,
  int? totalRows,
  int overscanPages = kMemberListRangeWindowOverscanPages,
  List<MemberListGroupLayout>? layouts,
  double groupHeaderHeight = kMemberListGroupHeaderHeight,
}) {
  if (rowHeight <= 0) {
    return normalizeMemberListRanges(<MemberListRange>[
      <int>[0, kMemberListRangeMaxSpan],
    ]);
  }
  final int startIndex;
  final int endIndex;
  if (layouts != null && layouts.isNotEmpty) {
    startIndex =
        _memberListRowIndexAtScrollOffset(
          scrollOffset: scrollTop,
          layouts: layouts,
          memberRowHeight: rowHeight,
          groupHeaderHeight: groupHeaderHeight,
        ) -
        bufferRows;
    endIndex =
        _memberListRowIndexAtScrollOffset(
          scrollOffset: scrollTop + clientHeight,
          layouts: layouts,
          memberRowHeight: rowHeight,
          groupHeaderHeight: groupHeaderHeight,
        ) +
        bufferRows;
  } else {
    startIndex = (scrollTop / rowHeight).floor() - bufferRows;
    endIndex = ((scrollTop + clientHeight) / rowHeight).ceil() + bufferRows;
  }
  final int safeStart = startIndex < 0 ? 0 : startIndex;
  final int? safeTotalRows = totalRows != null && totalRows >= 0
      ? totalRows
      : null;
  if (safeTotalRows == 0) {
    return <MemberListRange>[];
  }
  final int safeEnd = safeTotalRows != null
      ? (endIndex < safeTotalRows - 1 ? endIndex : safeTotalRows - 1)
      : endIndex;
  final int firstVisiblePage = safeStart ~/ kMemberListRangePageSize;
  final int lastVisiblePage = safeEnd ~/ kMemberListRangePageSize;
  int firstPage = firstVisiblePage - overscanPages;
  if (firstPage < 0) {
    firstPage = 0;
  }
  int lastPage = lastVisiblePage + overscanPages;
  if (lastPage < firstPage) {
    lastPage = firstPage;
  }
  if (safeTotalRows != null) {
    final int maxPage = (safeTotalRows - 1) ~/ kMemberListRangePageSize;
    if (firstPage > maxPage) {
      firstPage = maxPage;
    }
    if (lastPage > maxPage) {
      lastPage = maxPage;
    }
  }
  final List<MemberListRange> ranges = <MemberListRange>[];
  for (int page = firstPage; page <= lastPage; page++) {
    final int pageStart = page * kMemberListRangePageSize;
    final int maxPageEnd = pageStart + kMemberListRangeMaxSpan;
    final int pageEnd = safeTotalRows != null
        ? (maxPageEnd < safeTotalRows - 1 ? maxPageEnd : safeTotalRows - 1)
        : maxPageEnd;
    ranges.add(<int>[pageStart, pageEnd]);
  }
  return normalizeMemberListRanges(ranges);
}

int _memberListRowIndexAtScrollOffset({
  required double scrollOffset,
  required List<MemberListGroupLayout> layouts,
  required double memberRowHeight,
  required double groupHeaderHeight,
}) {
  if (scrollOffset <= 0) {
    return 0;
  }
  double accumulated = 0;
  for (final MemberListGroupLayout layout in layouts) {
    final double groupHeight =
        groupHeaderHeight + layout.count * memberRowHeight;
    if (scrollOffset < accumulated + groupHeight) {
      final double withinGroup = scrollOffset - accumulated;
      if (withinGroup < groupHeaderHeight) {
        return layout.headerRowIndex;
      }
      final int memberOffset =
          ((withinGroup - groupHeaderHeight) / memberRowHeight).floor();
      final int rowIndex = layout.headerRowIndex + 1 + memberOffset;
      return rowIndex > layout.rowEndIndex ? layout.rowEndIndex : rowIndex;
    }
    accumulated += groupHeight;
  }
  return layouts.last.rowEndIndex;
}

MemberListRange? _sanitizeMemberListRange(MemberListRange range) {
  if (range.length != 2) {
    return null;
  }
  final int start = range[0];
  final int end = range[1];
  if (start < 0 || end < start) {
    return null;
  }
  if (end - start > kMemberListRangeMaxSpan) {
    return <int>[start, start + kMemberListRangeMaxSpan];
  }
  return <int>[start, end];
}

void _pushRangeBySpan(List<MemberListRange> ranges, int start, int end) {
  int chunkStart = start;
  while (chunkStart <= end) {
    final int chunkEnd = chunkStart + kMemberListRangeMaxSpan;
    ranges.add(<int>[chunkStart, if (chunkEnd < end) chunkEnd else end]);
    chunkStart = chunkEnd + 1;
  }
}
