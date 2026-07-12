import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/shell/providers/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PushNotificationNagbar extends ConsumerWidget implements NagbarWidget {
  const PushNotificationNagbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final bool requiresSystemSettings = ref
        .watch(pushNotificationRequiresSystemSettingsProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFF2563EB),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () =>
          ref.read(nagbarDismissalsProvider.notifier).dismissPushNotification(),
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarPushNotification,
        onDismiss: () => ref
            .read(nagbarDismissalsProvider.notifier)
            .dismissPushNotification(),
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: requiresSystemSettings
              ? l10n.nagbarOpenSettings
              : l10n.nagbarEnableNotifications,
          onPressed: () async {
            await requestPushNotificationPermission(
              openSystemSettingsIfBlocked: true,
            );
            ref
              ..invalidate(pushNotificationPermissionGrantedProvider)
              ..invalidate(pushNotificationRequiresSystemSettingsProvider);
          },
        ),
      ),
    );
  }
}
