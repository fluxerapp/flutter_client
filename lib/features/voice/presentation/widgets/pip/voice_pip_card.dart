import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/material_ui.dart';

class VoicePipCard extends StatelessWidget {
  const VoicePipCard({
    required this.child,
    required this.speaking,
    required this.isScreenShare,
    this.dragging = false,
    super.key,
  });

  final Widget child;
  final bool speaking;
  final bool isScreenShare;
  final bool dragging;

  @override
  Widget build(BuildContext context) {
    final Color ring = context.colors.statusOnline;
    return AnimatedScale(
      scale: dragging ? 1.04 : 1,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: speaking ? ring : Colors.transparent,
            width: speaking ? 2.5 : 0,
          ),
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
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              child,
              if (isScreenShare)
                const Positioned(left: 8, bottom: 8, child: FluxerLiveBadge()),
            ],
          ),
        ),
      ),
    );
  }
}
