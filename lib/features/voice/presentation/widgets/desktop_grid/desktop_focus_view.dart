import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_members_divider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_members_row.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_members_toggle.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_visibility.dart';
import 'package:fluxer_app/features/voice/providers/focus_members_row_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/focus_desktop_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopFocusView extends ConsumerWidget {
  const VoiceDesktopFocusView({
    required this.size,
    required this.headerHeight,
    required this.footerHeight,
    required this.compact,
    required this.main,
    required this.memberCount,
    required this.memberBuilder,
    super.key,
  });

  final Size size;
  final double headerHeight;
  final double footerHeight;
  final bool compact;
  final Widget main;
  final int memberCount;
  final IndexedWidgetBuilder memberBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FocusMembersRowState row = ref.watch(focusMembersRowProvider);
    final bool hasMembers = !compact && memberCount > 0;
    final VoiceFocusDesktopLayout layout = resolveVoiceFocusDesktopLayout(
      container: size,
      headerHeight: headerHeight,
      controlClearance: footerHeight > 0 ? voiceFocusControlClearancePx : 0,
      showMembersRow: hasMembers && row.visible,
      preferredMembersRowHeight: row.height,
    );
    final Rect? rowRect = layout.membersRowRect;
    return Stack(
      children: <Widget>[
        Positioned.fromRect(rect: layout.mainRect, child: main),
        if (rowRect != null) ...<Widget>[
          Positioned.fromRect(
            rect: rowRect,
            child: VoiceDesktopMembersRow(
              itemCount: memberCount,
              itemBuilder: memberBuilder,
              size: rowRect.size,
              horizontalPadding: layout.membersRowPadding,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top:
                rowRect.top -
                voiceFocusMembersDividerHeightPx +
                voiceFocusMembersDividerOverlapPx,
            height: voiceFocusMembersDividerHeightPx,
            child: VoiceDesktopMembersDivider(
              rowHeight: rowRect.height,
              maxRowHeight: layout.maxMembersRowHeight,
              horizontalPadding: layout.membersRowPadding,
            ),
          ),
        ],
        if (hasMembers)
          Positioned(
            left: 0,
            right: 0,
            bottom: layout.membersToggleBottom,
            child: Center(
              child: VoiceHudVisibility(
                child: VoiceDesktopMembersToggle(
                  expanded: row.visible,
                  onPressed: () => ref
                      .read(focusMembersRowProvider.notifier)
                      .toggleVisible(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
