import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerColorOverrideScope extends InheritedWidget {
  const FluxerColorOverrideScope({
    required this.colors,
    required this.textStyles,
    required super.child,
    super.key,
  });

  final FluxerColorTheme? colors;
  final FluxerTextTheme? textStyles;

  static FluxerColorOverrideScope? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FluxerColorOverrideScope>();
  }

  static bool isActiveOf(BuildContext context) {
    return maybeOf(context)?.isActive ?? false;
  }

  bool get isActive => colors != null && textStyles != null;

  @override
  bool updateShouldNotify(FluxerColorOverrideScope oldWidget) {
    return colors != oldWidget.colors || textStyles != oldWidget.textStyles;
  }
}
