import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

bool resolveShellPopupUseRootNavigator(BuildContext context) {
  return !isMobileLayout(context) ||
      isPinnedSidebarLayout(context) ||
      isPinnedSidebarSplitAtHinge(context);
}
