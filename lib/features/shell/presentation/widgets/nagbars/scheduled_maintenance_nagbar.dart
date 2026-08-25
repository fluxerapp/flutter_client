import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/providers/scheduled_maintenance_dismissal_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status_maintenance_provider.dart';
import 'package:fluxer_app/features/shell/utils/maintenance_nagbar_message.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class ScheduledMaintenanceNagbar extends ConsumerWidget
    implements NagbarWidget {
  const ScheduledMaintenanceNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ServiceStatusMaintenance? maintenance = ref.watch(
      serviceStatusMaintenanceReadProvider,
    );
    if (maintenance == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: maintenanceNagbarBackgroundColor(maintenance),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () {
        unawaited(
          ref
              .read(scheduledMaintenanceDismissalReadProvider.notifier)
              .dismiss(maintenance),
        );
      },
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: maintenanceNagbarMessage(
          context: context,
          maintenance: maintenance,
        ),
        onDismiss: () {
          unawaited(
            ref
                .read(scheduledMaintenanceDismissalReadProvider.notifier)
                .dismiss(maintenance),
          );
        },
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarLearnMore,
          onPressed: () => handleExternalLinkTap(context, maintenance.url),
        ),
      ),
    );
  }
}
