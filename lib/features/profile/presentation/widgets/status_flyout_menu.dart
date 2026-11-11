import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/domain/time_window_presets.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

const double kStatusExpiryFlyoutWidth = 220;

class StatusFlyoutMenu extends ConsumerWidget {
  const StatusFlyoutMenu({required this.onClose, super.key});

  final VoidCallback onClose;

  void _select(WidgetRef ref, PresenceStatus status, {Duration? duration}) {
    onClose();
    unawaited(
      ref
          .read(userStatusServiceProvider)
          .setPresenceStatus(status: status, duration: duration)
          .catchError((Object _) {}),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<TimeWindowPreset> expiryPresets = getTimeWindowPresets(
      includeDeveloperOptions: ref
          .watch(userSettingsViewModelProvider)
          .developerMode,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (final PresenceStatus status in kSelectablePresenceStatuses)
          _buildRow(context, ref, l10n, status, expiryPresets),
      ],
    );
  }

  Widget _buildRow(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    PresenceStatus status,
    List<TimeWindowPreset> expiryPresets,
  ) {
    final String statusValue = status.json ?? 'online';
    final bool hasExpiryOptions = status != PresenceStatus.online;
    final Widget row = FluxerDesktopMenuRow(
      label: presenceStatusLabel(statusValue, l10n),
      hint: presenceStatusDescription(statusValue, l10n),
      hintColor: context.colors.textTertiary,
      crossAxisAlignment: CrossAxisAlignment.start,
      leading: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: SizedBox.square(
          dimension: 18,
          child: Center(
            child: FluxerStatusIndicator(status: statusValue, size: 14),
          ),
        ),
      ),
      trailing: hasExpiryOptions
          ? Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SizedBox.square(
                dimension: 16,
                child: Center(
                  child: PhosphorIcon(
                    PhosphorIconsBold.caretRight,
                    size: kFluxerDesktopMenuCaretSize,
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
            )
          : null,
      onTap: () => _select(ref, status),
    );
    if (!hasExpiryOptions) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: row,
      );
    }
    return FluxerDesktopHoverFlyout(
      width: kStatusExpiryFlyoutWidth,
      flyoutBuilder: (BuildContext flyoutContext) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (final TimeWindowPreset preset in expiryPresets)
            FluxerDesktopMenuRow(
              label: statusExpiryLabel(preset.key, l10n),
              onTap: () => _select(
                ref,
                status,
                duration: minutesToDuration(preset.minutes),
              ),
            ),
        ],
      ),
      child: row,
    );
  }
}
