import 'package:flutter/widgets.dart' show IconData;
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

String macPermissionName(FluxerLocalizations l10n, MacPermissionKind kind) =>
    switch (kind) {
      MacPermissionKind.microphone => l10n.macPermissionMicrophone,
      MacPermissionKind.camera => l10n.macPermissionCamera,
      MacPermissionKind.screen => l10n.macPermissionScreenRecording,
      MacPermissionKind.inputMonitoring => l10n.macPermissionInputMonitoring,
    };

String macPermissionPurpose(FluxerLocalizations l10n, MacPermissionKind kind) =>
    switch (kind) {
      MacPermissionKind.microphone => l10n.macPermissionMicrophonePurpose,
      MacPermissionKind.camera => l10n.macPermissionCameraPurpose,
      MacPermissionKind.screen => l10n.macPermissionScreenRecordingPurpose,
      MacPermissionKind.inputMonitoring =>
        l10n.macPermissionInputMonitoringPurpose,
    };

IconData macPermissionIcon(MacPermissionKind kind) => switch (kind) {
  MacPermissionKind.microphone => PhosphorIconsFill.microphone,
  MacPermissionKind.camera => PhosphorIconsFill.videoCamera,
  MacPermissionKind.screen => PhosphorIconsFill.monitor,
  MacPermissionKind.inputMonitoring => PhosphorIconsFill.keyboard,
};

String? macPermissionActionLabel(
  FluxerLocalizations l10n,
  MacPermissionStatus status,
) => switch (status) {
  MacPermissionStatus.notDetermined => l10n.macPermissionAllow,
  MacPermissionStatus.denied => l10n.macPermissionOpenSystemSettings,
  MacPermissionStatus.granted || MacPermissionStatus.unsupported => null,
};
