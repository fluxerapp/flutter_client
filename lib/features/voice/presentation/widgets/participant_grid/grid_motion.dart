import 'package:fluxer_app/material_ui.dart';

const Duration kVoiceGridMoveDuration = Duration(milliseconds: 260);
const Curve kVoiceGridMoveCurve = Curves.easeOutCubic;

Duration voiceGridMoveDuration(BuildContext context) =>
    MediaQuery.disableAnimationsOf(context)
    ? Duration.zero
    : kVoiceGridMoveDuration;
