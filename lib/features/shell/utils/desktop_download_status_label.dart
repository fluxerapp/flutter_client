import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart' show NumberFormat;

String desktopDownloadStatusLabel(
  FluxerLocalizations l10n,
  DesktopDownload download,
) {
  return switch (download.state) {
    DesktopDownloadState.started => l10n.desktopDownloadsStarting,
    DesktopDownloadState.progressing => _progressLabel(l10n, download),
    DesktopDownloadState.completed =>
      download.fileExists
          ? l10n.desktopDownloadsCompleted
          : l10n.desktopDownloadsFileMissing,
    DesktopDownloadState.canceled => l10n.desktopDownloadsCancelled,
    DesktopDownloadState.failed => l10n.desktopDownloadsFailed,
  };
}

String _progressLabel(FluxerLocalizations l10n, DesktopDownload download) {
  final int? total = download.totalBytes;
  final String? totalLabel = formatAttachmentByteSize(total);
  if (total == null || totalLabel == null) {
    return formatAttachmentByteSize(download.receivedBytes) ?? '0 B';
  }
  final double progress = (download.receivedBytes / total).clamp(0, 1);
  return l10n.desktopDownloadsProgress(
    NumberFormat.percentPattern(l10n.localeName).format(progress),
    totalLabel,
  );
}
