import 'package:fluxer_app/material_ui.dart';

const double kVoiceHudButtonSize = 44;
const double kVoiceHudButtonRadius = 16;
const double kVoiceHudButtonGap = 4;
const double kVoiceHudIconSize = 22;
const double kVoiceHudBarPadding = 6;
const double kVoiceHudBarBorderWidth = 1;
const double kVoiceHudBarRadius =
    kVoiceHudButtonRadius + kVoiceHudBarPadding + 2;
const double kVoiceHudBarHeight =
    kVoiceHudButtonSize +
    (kVoiceHudBarPadding * 2) +
    (kVoiceHudBarBorderWidth * 2);
const int kVoiceHudMaxBarButtons = 6;
const double kVoiceHudSeparatorWidth = 1;
const double kVoiceHudSeparatorHeight = 22;
const double kVoiceHudBarMaxWidth =
    (kVoiceHudMaxBarButtons * kVoiceHudButtonSize) +
    (kVoiceHudMaxBarButtons * kVoiceHudButtonGap) +
    kVoiceHudSeparatorWidth +
    (kVoiceHudBarPadding * 2) +
    (kVoiceHudBarBorderWidth * 2);

const double kVoiceHudCaretSize = 17;
const double kVoiceHudCaretRadius = 7;
const double kVoiceHudCaretIconSize = 10;
const double kVoiceHudCaretInset = -2;

const double kVoiceHudFooterTopPadding = 8;
const double kVoiceHudFooterBottomPadding = 12;
const double kVoiceHudFooterHorizontalPadding = 24;
const double kVoiceHudFooterHeight =
    kVoiceHudFooterTopPadding +
    kVoiceHudBarHeight +
    kVoiceHudFooterBottomPadding;
const double kVoiceHudEdgeGradientExtension = 40;

const double kVoiceHudCornerButtonSize = 42;
const double kVoiceHudCornerButtonRadius = 14;
const double kVoiceHudCornerIconSize = 21;
const double kVoiceHudCornerGap = 8;
const double kVoiceHudCornerMinInset = 16;
const double kVoiceHudCornerMaxInset = 32;
const double kVoiceHudCornerInsetFraction = 0.02;

const double kVoiceHudMenuWidth = 280;
const double kVoiceHudDisabledOpacity = 0.45;
const double kVoiceHudFocusBorderWidth = 2;

const Color kVoiceHudSurface = Color(0xFF000000);
const Color kVoiceHudSurfaceHover = Color(0xFF111111);
const Color kVoiceHudBarBorder = Color(0x1AFFFFFF);
const Color kVoiceHudCaretBorder = Color(0x24FFFFFF);
const Color kVoiceHudCaretIcon = Color(0xE0FFFFFF);
const Color kVoiceHudSeparator = Color(0x1FFFFFFF);
const Color kVoiceHudCornerBorder = Color(0x1FFFFFFF);
const Color kVoiceHudCornerBorderHover = Color(0x33FFFFFF);
const Color kVoiceHudFocusBorder = Color(0xFFFFFFFF);

const List<BoxShadow> kVoiceHudBarShadow = <BoxShadow>[
  BoxShadow(color: Color(0x73000000), blurRadius: 24, offset: Offset(0, 8)),
];

const List<BoxShadow> kVoiceHudCaretShadow = <BoxShadow>[
  BoxShadow(color: Color(0x80000000), blurRadius: 16, offset: Offset(0, 6)),
];

const List<BoxShadow> kVoiceHudCornerShadow = <BoxShadow>[
  BoxShadow(color: Color(0x42000000), blurRadius: 10, offset: Offset(0, 3)),
];

const LinearGradient kVoiceHudFooterGradient = LinearGradient(
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

enum VoiceHudTone { neutral, danger, success, disconnect }

class VoiceHudToneColors {
  const VoiceHudToneColors({
    required this.background,
    required this.hover,
    required this.foreground,
  });

  final Color background;
  final Color hover;
  final Color foreground;
}

const VoiceHudToneColors _kNeutralTone = VoiceHudToneColors(
  background: Color(0x0DFFFFFF),
  hover: Color(0x1FFFFFFF),
  foreground: Color(0xE6FFFFFF),
);

const VoiceHudToneColors _kDangerTone = VoiceHudToneColors(
  background: Color(0x29FF453A),
  hover: Color(0x3DFF453A),
  foreground: Color(0xFFFF453A),
);

const VoiceHudToneColors _kSuccessTone = VoiceHudToneColors(
  background: Color(0x2930D158),
  hover: Color(0x3D30D158),
  foreground: Color(0xFF30D158),
);

const VoiceHudToneColors _kDisconnectTone = VoiceHudToneColors(
  background: Color(0xFFFF3B30),
  hover: Color(0xFFFF453A),
  foreground: Color(0xFFFFFFFF),
);

VoiceHudToneColors voiceHudToneColors(VoiceHudTone tone) {
  return switch (tone) {
    VoiceHudTone.neutral => _kNeutralTone,
    VoiceHudTone.danger => _kDangerTone,
    VoiceHudTone.success => _kSuccessTone,
    VoiceHudTone.disconnect => _kDisconnectTone,
  };
}
