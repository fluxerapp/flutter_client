import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceStreamQualitySubmenu extends StatelessWidget {
  const VoiceStreamQualitySubmenu({
    required this.label,
    required this.builder,
    super.key,
  });

  final String label;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopHoverFlyout(
      width: kVoiceHudMenuWidth,
      flyoutBuilder: builder,
      child: FluxerMenuSubmenuItem(label: label, onPressed: () {}),
    );
  }
}
