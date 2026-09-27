import 'package:flutter/foundation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

@immutable
class AppIconChoice {
  const AppIconChoice({
    required this.alternateIconName,
    required this.previewAssetPath,
    required this.label,
  });

  final String? alternateIconName;
  final String previewAssetPath;
  final String Function(FluxerLocalizations l10n) label;

  @override
  bool operator ==(Object other) {
    return other is AppIconChoice &&
        other.alternateIconName == alternateIconName;
  }

  @override
  int get hashCode => alternateIconName.hashCode;
}
