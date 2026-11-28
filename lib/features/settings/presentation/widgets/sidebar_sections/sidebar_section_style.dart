import 'package:fluxer_app/material_ui.dart';

const double kSettingsSidebarSectionItemHeight = 30;
const double kSettingsSidebarSectionItemGap = 2;
const double kSettingsSidebarSectionItemRadius = 6;
const EdgeInsets kSettingsSidebarSectionItemPadding = EdgeInsets.symmetric(
  horizontal: 11,
  vertical: 5,
);

const double kSettingsSidebarSectionTreeLineX = 21;
const double kSettingsSidebarSectionTreeLineWidth = 1;
const double kSettingsSidebarSectionTreeContentGap = 7;
const EdgeInsets kSettingsSidebarSectionTreeMargin = EdgeInsets.only(
  top: 3,
  bottom: 4,
);

const double kSettingsSidebarExpandChevronSize = 16;

const Duration kSettingsSidebarSectionTreeDuration = Duration(
  milliseconds: 250,
);
const Curve kSettingsSidebarSectionCurve = Cubic(0.4, 0, 0.2, 1);

double settingsSidebarSectionItemTop(int index) =>
    index *
    (kSettingsSidebarSectionItemHeight + kSettingsSidebarSectionItemGap);

Duration settingsSidebarSectionTreeDuration(BuildContext context) =>
    MediaQuery.disableAnimationsOf(context)
    ? Duration.zero
    : kSettingsSidebarSectionTreeDuration;
