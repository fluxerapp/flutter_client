import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  group('isValidMemberListRange', () {
    test('accepts large end indices', () {
      expect(isValidMemberListRange(<int>[500000, 500099]), isTrue);
    });

    test('rejects spans over max', () {
      expect(isValidMemberListRange(<int>[0, 100]), isFalse);
    });
  });

  group('normalizeMemberListRanges', () {
    test('preserves ranges beyond former 100k cap', () {
      final List<MemberListRange> ranges = normalizeMemberListRanges(
        <MemberListRange>[
          <int>[250000, 250050],
        ],
      );
      expect(ranges, <MemberListRange>[
        <int>[250000, 250050],
      ]);
    });
  });

  group('buildMemberListRangeWindow', () {
    test('uses layout-aware row mapping for group headers', () {
      final List<MemberListGroupLayout> layouts =
          buildMemberListLayout(<MemberListGroup>[
            const MemberListGroup(id: 'online', count: 50),
            const MemberListGroup(id: 'offline', count: 50),
          ]);
      final List<MemberListRange> ranges = buildMemberListRangeWindow(
        scrollTop: 0,
        clientHeight: 200,
        rowHeight: kMemberListRowHeight,
        totalRows: getTotalRowsFromLayout(layouts),
        layouts: layouts,
      );
      expect(ranges, isNotEmpty);
      expect(ranges.first[0], 0);
    });
  });
}
