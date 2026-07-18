import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:fluxer_app/features/shell/providers/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class UserNotificationsPermissionBanner extends ConsumerWidget {
  const UserNotificationsPermissionBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileNative) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final AsyncValue<bool> permissionGrantedAsync = ref.watch(
      pushNotificationPermissionGrantedProvider,
    );
    final bool requiresSystemSettings = ref
        .watch(pushNotificationRequiresSystemSettingsProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    return permissionGrantedAsync.when(
      data: (bool granted) {
        if (granted) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerWarningAlert(
              title: l10n.notificationsPermissionDeniedTitle,
              message: l10n.systemPermissionNotificationsMessage,
            ),
            SizedBox(height: layout.s2),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: FluxerButton.secondary(
                size: FluxerButtonSize.small,
                label: requiresSystemSettings
                    ? l10n.nagbarOpenSettings
                    : l10n.nagbarEnableNotifications,
                onPressedAsync: () async {
                  await ensureSystemPermission(
                    context,
                    SystemPermissionKind.notifications,
                  );
                  ref
                    ..invalidate(pushNotificationPermissionGrantedProvider)
                    ..invalidate(
                      pushNotificationRequiresSystemSettingsProvider,
                    );
                },
              ),
            ),
            SizedBox(height: layout.s3),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
