import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopStageInsets extends InheritedWidget {
  const VoiceDesktopStageInsets({
    required this.header,
    required this.footer,
    required super.child,
    super.key,
  });

  final double header;
  final double footer;

  static ({double header, double footer}) of(BuildContext context) {
    final VoiceDesktopStageInsets? insets = context
        .dependOnInheritedWidgetOfExactType<VoiceDesktopStageInsets>();
    return (header: insets?.header ?? 0, footer: insets?.footer ?? 0);
  }

  @override
  bool updateShouldNotify(VoiceDesktopStageInsets oldWidget) =>
      header != oldWidget.header || footer != oldWidget.footer;
}
