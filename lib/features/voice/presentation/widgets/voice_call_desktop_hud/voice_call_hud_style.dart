import 'package:fluxer_app/material_ui.dart';

const double kVoiceCallHudButtonSize = 44;
const double kVoiceCallHudButtonRadius = 16;
const double kVoiceCallHudButtonGap = 4;
const double kVoiceCallHudIconSize = 22;
const double kVoiceCallHudBarPadding = 6;
const double kVoiceCallHudBarBorderWidth = 1;
const double kVoiceCallHudBarRadius =
    kVoiceCallHudButtonRadius + kVoiceCallHudBarPadding + 2;
const double kVoiceCallHudBarHeight =
    kVoiceCallHudButtonSize +
    (kVoiceCallHudBarPadding * 2) +
    (kVoiceCallHudBarBorderWidth * 2);
const int kVoiceCallHudMaxBarButtons = 6;
const double kVoiceCallHudSeparatorWidth = 1;
const double kVoiceCallHudSeparatorHeight = 22;
const double kVoiceCallHudBarMaxWidth =
    (kVoiceCallHudMaxBarButtons * kVoiceCallHudButtonSize) +
    (kVoiceCallHudMaxBarButtons * kVoiceCallHudButtonGap) +
    kVoiceCallHudSeparatorWidth +
    (kVoiceCallHudBarPadding * 2) +
    (kVoiceCallHudBarBorderWidth * 2);

const double kVoiceCallHudCaretSize = 17;
const double kVoiceCallHudCaretRadius = 7;
const double kVoiceCallHudCaretIconSize = 10;
const double kVoiceCallHudCaretInset = -2;

const double kVoiceCallHudFooterTopPadding = 8;
const double kVoiceCallHudFooterBottomPadding = 12;
const double kVoiceCallHudFooterHorizontalPadding = 24;
const double kVoiceCallHudFooterHeight =
    kVoiceCallHudFooterTopPadding +
    kVoiceCallHudBarHeight +
    kVoiceCallHudFooterBottomPadding;
const double kVoiceCallHudEdgeGradientExtension = 40;

const double kVoiceCallHudCornerButtonSize = 42;
const double kVoiceCallHudCornerButtonRadius = 14;
const double kVoiceCallHudCornerIconSize = 21;
const double kVoiceCallHudCornerGap = 8;
const double kVoiceCallHudCornerMinInset = 16;
const double kVoiceCallHudCornerMaxInset = 32;
const double kVoiceCallHudCornerInsetFraction = 0.02;

const double kVoiceCallHudMenuWidth = 280;
const double kVoiceCallHudDisabledOpacity = 0.45;
const double kVoiceCallHudFocusBorderWidth = 2;

const Color kVoiceCallHudSurface = Color(0xFF000000);
const Color kVoiceCallHudSurfaceHover = Color(0xFF111111);
const Color kVoiceCallHudBarBorder = Color(0x1AFFFFFF);
const Color kVoiceCallHudCaretBorder = Color(0x24FFFFFF);
const Color kVoiceCallHudCaretIcon = Color(0xE0FFFFFF);
const Color kVoiceCallHudSeparator = Color(0x1FFFFFFF);
const Color kVoiceCallHudCornerBorder = Color(0x1FFFFFFF);
const Color kVoiceCallHudCornerBorderHover = Color(0x33FFFFFF);
const Color kVoiceCallHudFocusBorder = Color(0xFFFFFFFF);

const List<BoxShadow> kVoiceCallHudBarShadow = <BoxShadow>[
  BoxShadow(color: Color(0x73000000), blurRadius: 24, offset: Offset(0, 8)),
];

const List<BoxShadow> kVoiceCallHudCaretShadow = <BoxShadow>[
  BoxShadow(color: Color(0x80000000), blurRadius: 16, offset: Offset(0, 6)),
];

const List<BoxShadow> kVoiceCallHudCornerShadow = <BoxShadow>[
  BoxShadow(color: Color(0x42000000), blurRadius: 10, offset: Offset(0, 3)),
];

const LinearGradient kVoiceCallHudFooterGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: <Color>[
    Color(0xD6000000),
    Color(0x94000000),
    Color(0x3D000000),
    Color(0x00000000),
  ],
  stops: <double>[0, 0.38, 0.7, 1],
);

enum VoiceCallHudTone { neutral, danger, success, disconnect }

class VoiceCallHudToneColors {
  const VoiceCallHudToneColors({
    required this.background,
    required this.hover,
    required this.foreground,
  });

  final Color background;
  final Color hover;
  final Color foreground;
}

const VoiceCallHudToneColors _kNeutralTone = VoiceCallHudToneColors(
  background: Color(0x0DFFFFFF),
  hover: Color(0x1FFFFFFF),
  foreground: Color(0xE6FFFFFF),
);

const VoiceCallHudToneColors _kDangerTone = VoiceCallHudToneColors(
  background: Color(0x29FF453A),
  hover: Color(0x3DFF453A),
  foreground: Color(0xFFFF453A),
);

const VoiceCallHudToneColors _kSuccessTone = VoiceCallHudToneColors(
  background: Color(0x2930D158),
  hover: Color(0x3D30D158),
  foreground: Color(0xFF30D158),
);

const VoiceCallHudToneColors _kDisconnectTone = VoiceCallHudToneColors(
  background: Color(0xFFFF3B30),
  hover: Color(0xFFFF453A),
  foreground: Color(0xFFFFFFFF),
);

VoiceCallHudToneColors voiceCallHudToneColors(VoiceCallHudTone tone) {
  return switch (tone) {
    VoiceCallHudTone.neutral => _kNeutralTone,
    VoiceCallHudTone.danger => _kDangerTone,
    VoiceCallHudTone.success => _kSuccessTone,
    VoiceCallHudTone.disconnect => _kDisconnectTone,
  };
}
