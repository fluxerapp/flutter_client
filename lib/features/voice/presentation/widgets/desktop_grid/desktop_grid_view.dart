import 'package:fluxer_app/features/voice/utils/grid_layout/grid_desktop_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopGridView extends StatelessWidget {
  const VoiceDesktopGridView({
    required this.layout,
    required this.top,
    required this.tileIds,
    required this.moveDuration,
    required this.moveCurve,
    required this.tileBuilder,
    super.key,
  });

  final VoiceGridDesktopLayout layout;
  final double top;
  final List<String> tileIds;
  final Duration moveDuration;
  final Curve moveCurve;
  final IndexedWidgetBuilder tileBuilder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        for (int i = 0; i < layout.rects.length; i++)
          AnimatedPositioned.fromRect(
            key: ValueKey<String>(tileIds[i]),
            rect: layout.rects[i].shift(Offset(0, top)),
            duration: moveDuration,
            curve: moveCurve,
            child: tileBuilder(context, i),
          ),
      ],
    );
  }
}
