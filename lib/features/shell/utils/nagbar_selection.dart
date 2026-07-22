import 'package:fluxer_app/features/shell/domain/nagbar_state.dart';

List<NagbarState> selectVisibleNagbars(List<NagbarState> nagbars) {
  final List<NagbarState> visibleNagbars =
      nagbars.where((NagbarState nagbar) => nagbar.visible).toList()..sort(
        (NagbarState a, NagbarState b) => a.priority.compareTo(b.priority),
      );
  final List<NagbarState> nonDismissible = visibleNagbars
      .where((NagbarState nagbar) => !nagbar.dismissible)
      .toList();
  final List<NagbarState> dismissible = visibleNagbars
      .where((NagbarState nagbar) => nagbar.dismissible)
      .toList();
  final List<NagbarState> selected = <NagbarState>[
    if (nonDismissible.isNotEmpty) nonDismissible.first,
    if (dismissible.isNotEmpty) dismissible.first,
  ];
  return selected
    ..sort((NagbarState a, NagbarState b) => a.priority.compareTo(b.priority));
}
