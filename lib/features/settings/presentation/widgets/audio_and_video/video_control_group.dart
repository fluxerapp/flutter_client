import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceVideoControlGroup extends StatelessWidget {
  const VoiceVideoControlGroup({required this.children, super.key});

  final List<Widget> children;

  static const double _kGap = 6;
  static const double _kBottomPadding = 12;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.backgroundModifierAccent),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: _kBottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          spacing: _kGap,
          children: children,
        ),
      ),
    );
  }
}
