import 'package:fluxer_app/features/ui/alt_text_tooltip/fluxer_alt_text_tooltip.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

class AltTextBadge extends StatelessWidget {
  const AltTextBadge({required this.altText, super.key});

  final String altText;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: FluxerAltTextTooltip(
        altText: altText,
        child: FluxerGestureDetector(
          onTap: () {},
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xF2000000),
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              child: Text(
                'ALT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
