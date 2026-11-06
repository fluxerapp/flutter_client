import 'package:material_ui/material_ui.dart' as material;
import 'package:phosphor_flutter/phosphor_flutter.dart' as phosphor;

const Set<int> _kDirectionalPhosphorCodePoints = <int>{
  0xe014,
  0xe016,
  0xe018,
  0xe01a,
  0xe01c,
  0xe01e,
  0xe020,
  0xe022,
  0xe024,
  0xe026,
  0xe02a,
  0xe02c,
  0xe02e,
  0xe032,
  0xe034,
  0xe03a,
  0xe03c,
  0xe040,
  0xe042,
  0xe044,
  0xe046,
  0xe048,
  0xe04a,
  0xe04c,
  0xe04e,
  0xe050,
  0xe052,
  0xe054,
  0xe056,
  0xe058,
  0xe05a,
  0xe05e,
  0xe060,
  0xe062,
  0xe064,
  0xe068,
  0xe06a,
  0xe06c,
  0xe070,
  0xe072,
  0xe074,
  0xe076,
  0xe07a,
  0xe07c,
  0xe07e,
  0xe080,
  0xe082,
  0xe084,
  0xe086,
  0xe088,
  0xe08a,
  0xe08c,
  0xe090,
  0xe092,
  0xe0ae,
  0xe118,
  0xe11a,
  0xe120,
  0xe122,
  0xe128,
  0xe12a,
  0xe130,
  0xe132,
  0xe138,
  0xe13a,
  0xe2f2,
  0xe2f4,
  0xe2f6,
  0xe396,
  0xe398,
  0xe406,
  0xe428,
  0xe42a,
  0xe51a,
  0xe51e,
  0xe520,
  0xe526,
  0xe528,
  0xe52c,
  0xe5dc,
  0xe5de,
  0xea1c,
  0xea1e,
  0xeab6,
  0xeadc,
  0xec24,
  0xec92,
  0xec94,
  0xed52,
};

const Set<int> _kDirectionalPhosphorDuotoneCodePoints = <int>{
  0xe015,
  0xe017,
  0xe019,
  0xe01b,
  0xe01d,
  0xe01f,
  0xe021,
  0xe023,
  0xe025,
  0xe027,
  0xe02b,
  0xe02d,
  0xe02f,
  0xe033,
  0xe035,
  0xe03b,
  0xe03d,
  0xe041,
  0xe043,
  0xe045,
  0xe047,
  0xe049,
  0xe04b,
  0xe04d,
  0xe04f,
  0xe051,
  0xe053,
  0xe055,
  0xe057,
  0xe059,
  0xe05b,
  0xe05f,
  0xe061,
  0xe063,
  0xe065,
  0xe069,
  0xe06b,
  0xe06d,
  0xe071,
  0xe073,
  0xe075,
  0xe077,
  0xe07b,
  0xe07d,
  0xe07f,
  0xe081,
  0xe083,
  0xe085,
  0xe087,
  0xe089,
  0xe08b,
  0xe08d,
  0xe091,
  0xe093,
  0xe0af,
  0xe119,
  0xe11b,
  0xe121,
  0xe123,
  0xe129,
  0xe12b,
  0xe131,
  0xe133,
  0xe139,
  0xe13b,
  0xe2f3,
  0xe2f5,
  0xe2f7,
  0xe397,
  0xe399,
  0xe409,
  0xe429,
  0xe42b,
  0xe51b,
  0xe51f,
  0xe521,
  0xe527,
  0xe529,
  0xe52d,
  0xe5dd,
  0xe5df,
  0xea1d,
  0xea1f,
  0xeab7,
  0xeadd,
  0xec25,
  0xec93,
  0xec95,
  0xed57,
};

bool phosphorIconMirrorsInRtl(material.IconData icon) {
  return switch (icon.fontFamily) {
    'PhosphorDuotone' => _kDirectionalPhosphorDuotoneCodePoints.contains(
      icon.codePoint,
    ),
    _ => _kDirectionalPhosphorCodePoints.contains(icon.codePoint),
  };
}

bool _isPhosphorIcon(material.IconData icon) =>
    icon.fontFamily?.startsWith('Phosphor') ?? false;

material.Widget _buildWithMirrorPolicy(
  material.BuildContext context,
  material.Icon widget,
  material.WidgetBuilder build,
) {
  final material.IconData? icon = widget.icon;
  if (icon == null ||
      widget.textDirection != null ||
      !_isPhosphorIcon(icon) ||
      phosphorIconMirrorsInRtl(icon) ||
      material.Directionality.maybeOf(context) != material.TextDirection.rtl) {
    return build(context);
  }
  return material.Directionality(
    textDirection: material.TextDirection.ltr,
    child: material.Builder(builder: build),
  );
}

class Icon extends material.Icon {
  const Icon(
    super.icon, {
    super.key,
    super.size,
    super.fill,
    super.weight,
    super.grade,
    super.opticalSize,
    super.color,
    super.shadows,
    super.semanticLabel,
    super.textDirection,
    super.applyTextScaling,
    super.blendMode,
    super.fontWeight,
  });

  @override
  material.Widget build(material.BuildContext context) {
    return _buildWithMirrorPolicy(context, this, super.build);
  }
}

class PhosphorIcon extends phosphor.PhosphorIcon {
  const PhosphorIcon(
    super.icon, {
    super.key,
    super.size,
    super.fill,
    super.weight,
    super.grade,
    super.opticalSize,
    super.color,
    super.shadows,
    super.semanticLabel,
    super.textDirection,
    super.duotoneSecondaryOpacity,
    super.duotoneSecondaryColor,
  });

  @override
  material.Widget build(material.BuildContext context) {
    return _buildWithMirrorPolicy(context, this, super.build);
  }
}
