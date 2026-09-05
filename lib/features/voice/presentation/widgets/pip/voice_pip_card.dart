import 'package:fluxer_app/material_ui.dart';

class VoicePipCard extends StatelessWidget {
  const VoicePipCard({required this.child, this.dragging = false, super.key});

  final Widget child;
  final bool dragging;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: dragging ? 1.04 : 1,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: dragging ? 0.45 : 0.28),
                blurRadius: dragging ? 22 : 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: child,
          ),
        ),
      ),
    );
  }
}
