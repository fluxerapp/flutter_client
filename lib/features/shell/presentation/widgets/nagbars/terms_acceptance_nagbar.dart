import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class TermsAcceptanceNagbar extends ConsumerWidget implements NagbarWidget {
  const TermsAcceptanceNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFDC2626),
      textColor: Colors.white,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarTermsAcceptance,
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarReviewTerms,
          onPressed: () {},
        ),
      ),
    );
  }
}
