import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_background_bleed.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

EdgeInsets profileHostedSideContentInsets(BuildContext context) {
  if (FluxerBottomSheet.isInSheet(context)) {
    return EdgeInsets.zero;
  }
  return hostedUiSideInsets(context);
}

bool profileHostedBannerBleedsIntoSideStrip(BuildContext context) {
  if (FluxerBottomSheet.isInSheet(context)) {
    return false;
  }
  final EdgeInsets bleed = hostedUiBackgroundBleedInsets(context);
  return bleed.left > 0 || bleed.right > 0;
}
