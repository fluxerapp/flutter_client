import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/push/push_delivery_display.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_picker_sheet.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_fonts.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/push_delivery_details_provider.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserNotificationsPushDeliveryDetails extends ConsumerWidget {
  const UserNotificationsPushDeliveryDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileNative) {
      return const SizedBox.shrink();
    }
    final AsyncValue<PushDeliveryDetailsState> detailsAsync = ref.watch(
      pushDeliveryDetailsProvider,
    );

    return detailsAsync.when(
      data: (PushDeliveryDetailsState details) =>
          _PushDeliveryRows(details: details),
      loading: () => SizedBox(
        height: context.layout.s6,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}

class _PushDeliveryRows extends ConsumerWidget {
  const _PushDeliveryRows({required this.details});

  final PushDeliveryDetailsState details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final String providerName = pushProviderDisplayName(details.pushProvider);
    final String relayLabel = _relayStatusLabel(l10n, details.relayStatus);
    final Color relayColor = _relayStatusColor(
      context.colors,
      details.relayStatus,
    );
    final bool showRelayInfo =
        details.relayStatus != FluxerRelayDeliveryStatus.notUsed;

    final List<_PushDeliveryRowData> rowData = <_PushDeliveryRowData>[
      _PushDeliveryRowData(
        label: l10n.notificationsPushDeliveryProviderLabel,
        value: providerName,
      ),
      _PushDeliveryRowData(
        label: l10n.notificationsPushDeliveryRelayLabel,
        value: relayLabel,
        valueColor: relayColor,
        infoUrl: showRelayInfo ? kPushRelayNoticeUrl : null,
        infoSemanticLabel: showRelayInfo
            ? l10n.pushRelayConsentNoticeLink
            : null,
      ),
    ];

    if (details.showUnifiedPushDetails) {
      final String? packageId = details.selectedDistributorPackageId;
      final String distributorValue = packageId == null || packageId.isEmpty
          ? l10n.notificationsPushDeliveryDistributorNone
          : formatUnifiedPushDistributor(packageId);
      rowData.add(
        _PushDeliveryRowData(
          label: l10n.notificationsPushDeliveryDistributorLabel,
          value: distributorValue,
          valueColor: details.canPickDistributor
              ? context.colors.textLink
              : null,
          showCaret: details.canPickDistributor,
          onTap: details.canPickDistributor
              ? () => unawaited(
                  showUnifiedPushDistributorPickerSheet(
                    context,
                    ref: ref,
                    distributors: details.availableDistributors,
                    currentDistributor: packageId,
                  ),
                )
              : null,
          semanticLabel: details.canPickDistributor
              ? l10n.notificationsPushDeliveryDistributorPickAccessibility
              : null,
        ),
      );
      final String? gatewayHost = details.gatewayHost;
      if (gatewayHost != null && gatewayHost.isNotEmpty) {
        rowData.add(
          _PushDeliveryRowData(
            label: l10n.notificationsPushDeliveryGatewayLabel,
            value: gatewayHost,
            monoValue: true,
          ),
        );
      }
    }

    if (isMobileLayout(context)) {
      return FluxerMenuGroup(
        children: rowData
            .map(
              (_PushDeliveryRowData data) => _PushDeliveryMenuRow(data: data),
            )
            .toList(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rowData
          .map(
            (_PushDeliveryRowData data) => _PushDeliveryDesktopRow(data: data),
          )
          .toList(),
    );
  }

  String _relayStatusLabel(
    FluxerLocalizations l10n,
    FluxerRelayDeliveryStatus status,
  ) {
    return switch (status) {
      FluxerRelayDeliveryStatus.inUse =>
        l10n.notificationsPushDeliveryRelayInUse,
      FluxerRelayDeliveryStatus.off => l10n.notificationsPushDeliveryRelayOff,
      FluxerRelayDeliveryStatus.notUsed =>
        l10n.notificationsPushDeliveryRelayNotUsed,
    };
  }

  Color _relayStatusColor(
    FluxerColorTheme colors,
    FluxerRelayDeliveryStatus status,
  ) {
    return switch (status) {
      FluxerRelayDeliveryStatus.inUse => colors.textPositive,
      FluxerRelayDeliveryStatus.off => colors.textSecondary,
      FluxerRelayDeliveryStatus.notUsed => colors.textTertiary,
    };
  }
}

class _PushDeliveryRowData {
  const _PushDeliveryRowData({
    required this.label,
    required this.value,
    this.valueColor,
    this.monoValue = false,
    this.showCaret = false,
    this.onTap,
    this.semanticLabel,
    this.infoUrl,
    this.infoSemanticLabel,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final bool monoValue;
  final bool showCaret;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final String? infoUrl;
  final String? infoSemanticLabel;
}

class _PushDeliveryInfoButton extends StatelessWidget {
  const _PushDeliveryInfoButton({
    required this.url,
    required this.semanticLabel,
  });

  final String url;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FluxerTappable(
      onTap: () => unawaited(handleExternalLinkTap(context, url)),
      semanticLabel: semanticLabel,
      minSize: const Size(28, 28),
      builder: (context, states) {
        final bool pressed = states.contains(WidgetState.pressed);
        return PhosphorIcon(
          PhosphorIconsBold.info,
          size: 16,
          color: pressed ? colors.textSecondary : colors.textTertiary,
        );
      },
    );
  }
}

class _PushDeliveryLabelWithInfo extends StatelessWidget {
  const _PushDeliveryLabelWithInfo({
    required this.label,
    required this.labelStyle,
    this.infoUrl,
    this.infoSemanticLabel,
  });

  final String label;
  final TextStyle labelStyle;
  final String? infoUrl;
  final String? infoSemanticLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Text(label, style: labelStyle)),
        if (infoUrl != null && infoSemanticLabel != null) ...[
          const SizedBox(width: 4),
          _PushDeliveryInfoButton(
            url: infoUrl!,
            semanticLabel: infoSemanticLabel!,
          ),
        ],
      ],
    );
  }
}

class _PushDeliveryMenuRow extends StatelessWidget {
  const _PushDeliveryMenuRow({required this.data});

  final _PushDeliveryRowData data;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return _PushDeliveryRowShell(
      data: data,
      padding: EdgeInsets.fromLTRB(
        layout.groupRowInset,
        12,
        layout.groupRowInset,
        12,
      ),
      lineHeight: 1.35,
      valueGap: layout.s2,
      useAnimatedPress: false,
    );
  }
}

class _PushDeliveryDesktopRow extends StatelessWidget {
  const _PushDeliveryDesktopRow({required this.data});

  final _PushDeliveryRowData data;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return _PushDeliveryRowShell(
      data: data,
      padding: EdgeInsets.symmetric(vertical: layout.s1),
      lineHeight: 1.4,
      valueGap: layout.s4,
      useAnimatedPress: true,
    );
  }
}

class _PushDeliveryRowShell extends StatelessWidget {
  const _PushDeliveryRowShell({
    required this.data,
    required this.padding,
    required this.lineHeight,
    required this.valueGap,
    required this.useAnimatedPress,
  });

  final _PushDeliveryRowData data;
  final EdgeInsetsGeometry padding;
  final double lineHeight;
  final double valueGap;
  final bool useAnimatedPress;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final TextStyle labelStyle = textStyles.bodySmall.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w500,
      height: lineHeight,
    );
    final TextStyle valueStyle = textStyles.bodySmall.copyWith(
      color: data.valueColor ?? colors.textPrimaryMuted,
      fontFamily: data.monoValue ? FluxerFonts.mono : null,
      height: lineHeight,
    );

    final Widget row = Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: _PushDeliveryLabelWithInfo(
                label: data.label,
                labelStyle: labelStyle,
                infoUrl: data.infoUrl,
                infoSemanticLabel: data.infoSemanticLabel,
              ),
            ),
          ),
          SizedBox(width: valueGap),
          Text(data.value, style: valueStyle),
          if (data.showCaret) ...[
            SizedBox(width: layout.s1),
            PhosphorIcon(
              PhosphorIconsBold.caretRight,
              size: 16,
              color: colors.textTertiary,
            ),
          ],
        ],
      ),
    );

    if (data.onTap == null) {
      return row;
    }

    final double minHeight = layout.settingsSwitchRowMinHeight;
    return FluxerTappable(
      onTap: data.onTap,
      minSize: Size(layout.touchTargetMin, minHeight),
      semanticLabel: data.semanticLabel ?? '${data.label}. ${data.value}',
      builder: (context, states) {
        final bool pressed = states.contains(WidgetState.pressed);
        final Color? pressColor = pressed
            ? colors.backgroundModifierHover.withValues(alpha: 0.45)
            : null;
        if (!useAnimatedPress) {
          return ColoredBox(
            color: pressColor ?? Colors.transparent,
            child: row,
          );
        }
        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: pressColor ?? Colors.transparent,
          constraints: BoxConstraints(minHeight: minHeight),
          child: row,
        );
      },
    );
  }
}
