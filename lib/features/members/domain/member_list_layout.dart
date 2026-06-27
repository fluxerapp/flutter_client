import 'package:fluxer_dart/gateway.dart';

class MemberListGroupLayout {
  const MemberListGroupLayout({
    required this.id,
    required this.count,
    required this.headerRowIndex,
    required this.memberStartIndex,
    required this.memberEndIndex,
    required this.rowEndIndex,
  });

  final String id;
  final int count;
  final int headerRowIndex;
  final int memberStartIndex;
  final int memberEndIndex;
  final int rowEndIndex;
}

List<MemberListGroupLayout> buildMemberListLayout(
  List<MemberListGroup> groups,
) {
  final List<MemberListGroupLayout> layouts = <MemberListGroupLayout>[];
  int rowIndex = 0;
  int memberIndex = 0;
  for (final MemberListGroup group in groups) {
    final int effectiveCount = group.count < 0 ? 0 : group.count;
    if (effectiveCount == 0) {
      continue;
    }
    final int headerRowIndex = rowIndex;
    final int memberStartIndex = memberIndex;
    final int memberEndIndex = memberIndex + effectiveCount - 1;
    final int rowEndIndex = headerRowIndex + effectiveCount;
    layouts.add(
      MemberListGroupLayout(
        id: group.id,
        count: effectiveCount,
        headerRowIndex: headerRowIndex,
        memberStartIndex: memberStartIndex,
        memberEndIndex: memberEndIndex,
        rowEndIndex: rowEndIndex,
      ),
    );
    rowIndex = rowEndIndex + 1;
    memberIndex = memberEndIndex + 1;
  }
  return layouts;
}

int getTotalRowsFromLayout(List<MemberListGroupLayout> layouts) {
  if (layouts.isEmpty) {
    return 0;
  }
  return layouts.last.rowEndIndex + 1;
}

int getTotalMemberCount(List<MemberListGroup> groups) {
  int total = 0;
  for (final MemberListGroup group in groups) {
    if (group.count > 0) {
      total += group.count;
    }
  }
  return total;
}

MemberListGroupLayout? getGroupLayoutForRow(
  List<MemberListGroupLayout> layouts,
  int rowIndex,
) {
  for (final MemberListGroupLayout layout in layouts) {
    if (rowIndex >= layout.headerRowIndex && rowIndex <= layout.rowEndIndex) {
      return layout;
    }
  }
  return null;
}

MemberListGroup? groupForRow(
  List<MemberListGroup> groups,
  List<MemberListGroupLayout> layouts,
  int rowIndex,
) {
  final MemberListGroupLayout? layout = getGroupLayoutForRow(layouts, rowIndex);
  if (layout == null) {
    return null;
  }
  for (final MemberListGroup group in groups) {
    if (group.id == layout.id) {
      return group;
    }
  }
  return null;
}

bool isGroupHeaderRow(List<MemberListGroupLayout> layouts, int rowIndex) {
  for (final MemberListGroupLayout layout in layouts) {
    if (layout.headerRowIndex == rowIndex) {
      return true;
    }
  }
  return false;
}

bool isFirstMemberRowInGroup(MemberListGroupLayout layout, int rowIndex) {
  return rowIndex == layout.headerRowIndex + 1;
}

bool isLastMemberRowInGroup(MemberListGroupLayout layout, int rowIndex) {
  return rowIndex == layout.rowEndIndex;
}
