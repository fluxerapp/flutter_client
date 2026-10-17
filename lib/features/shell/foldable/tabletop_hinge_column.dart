import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/features/shell/foldable/retargeting_scalar.dart';
import 'package:fluxer_app/material_ui.dart';

class TabletopHingeColumn extends StatelessWidget {
  const TabletopHingeColumn({
    required this.upper,
    required this.lower,
    super.key,
  });

  final Widget upper;
  final Widget lower;

  @override
  Widget build(BuildContext context) {
    final DeviceFoldPosture posture = deviceFoldPostureOf(context);
    final Rect? hinge = posture.hingeBounds;
    if (!posture.isTabletop || hinge == null || hinge.isEmpty) {
      return Column(
        children: <Widget>[
          Expanded(child: upper),
          lower,
        ],
      );
    }
    final double upperHeight = hinge.top.clamp(0, double.infinity);
    return RetargetingScalar(
      target: upperHeight,
      builder: (BuildContext context, double height) {
        return Column(
          children: <Widget>[
            SizedBox(height: height, child: upper),
            Expanded(child: lower),
          ],
        );
      },
    );
  }
}
