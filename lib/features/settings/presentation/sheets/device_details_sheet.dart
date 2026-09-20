import 'package:fluxer_app/core/theme/fluxer_fonts.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart';

String? authSessionLocationLabel(AuthSessionLocation? loc) {
  if (loc == null) {
    return null;
  }
  final parts = <String>[
    if (loc.city != null && loc.city!.isNotEmpty) loc.city!,
    if (loc.region != null && loc.region!.isNotEmpty) loc.region!,
    if (loc.country != null && loc.country!.isNotEmpty) loc.country!,
  ];
  return parts.isEmpty ? null : parts.join(', ');
}

class DeviceDetailsSheet {
  DeviceDetailsSheet._();

  static Future<void> show(
    BuildContext context, {
    required AuthSessionResponse session,
    required bool isCurrent,
  }) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.linkedDevicesDetailsTitle,
      centered: true,
      useRootNavigator: true,
      builder: (dialogContext, _) {
        return _DeviceDetailsBody(session: session, isCurrent: isCurrent);
      },
    );
  }
}

class _DeviceDetailsBody extends StatelessWidget {
  const _DeviceDetailsBody({required this.session, required this.isCurrent});

  final AuthSessionResponse session;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final os = session.clientInfo?.os ?? l10n.linkedDevicesUnknownOs;
    final platform =
        session.clientInfo?.platform ?? l10n.linkedDevicesUnknownPlatform;
    final location = authSessionLocationLabel(session.clientInfo?.location);
    final maskedIp = session.maskedIp?.trim();
    final lastUsed = session.approxLastUsedAt;
    final lastUsedLabel = isCurrent
        ? l10n.linkedDevicesCurrentSession
        : (lastUsed == null
              ? l10n.linkedDevicesUnknown
              : relativeTime(lastUsed, l10n));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: layout.s2,
      children: [
        _DeviceDetailRow(label: l10n.linkedDevicesDetailsDevice, value: os),
        _DeviceDetailRow(
          label: l10n.linkedDevicesDetailsClient,
          value: platform,
        ),
        if (location != null)
          _DeviceDetailRow(
            label: l10n.linkedDevicesDetailsLocation,
            value: location,
          ),
        if (maskedIp != null && maskedIp.isNotEmpty)
          _DeviceDetailRow(
            label: l10n.linkedDevicesDetailsIp,
            value: maskedIp,
            mono: true,
          ),
        _DeviceDetailRow(
          label: l10n.linkedDevicesDetailsLastUsed,
          value: lastUsedLabel,
        ),
      ],
    );
  }
}

class _DeviceDetailRow extends StatelessWidget {
  const _DeviceDetailRow({
    required this.label,
    required this.value,
    this.mono = false,
  });

  final String label;
  final String value;
  final bool mono;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: textStyles.timestamp.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
        ),
        SizedBox(width: layout.s3),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimary,
              fontSize: 13,
              height: 18 / 13,
              fontFamily: mono ? FluxerFonts.mono : null,
            ),
          ),
        ),
      ],
    );
  }
}
