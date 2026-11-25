import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_downloads_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_icon.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_pressable.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_style.dart';
import 'package:fluxer_app/features/shell/utils/desktop_download_status_label.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class NativeDownloadRow extends ConsumerStatefulWidget {
  const NativeDownloadRow({required this.download, super.key});

  final DesktopDownload download;

  @override
  ConsumerState<NativeDownloadRow> createState() => _NativeDownloadRowState();
}

class _NativeDownloadRowState extends ConsumerState<NativeDownloadRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final DesktopDownload download = widget.download;
    final DesktopDownloads downloads = ref.read(
      desktopDownloadsProvider.notifier,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: kNativeDownloadsHoverDuration,
        curve: Curves.ease,
        padding: EdgeInsetsDirectional.only(end: layout.s1),
        decoration: BoxDecoration(
          color: _hovered ? colors.backgroundModifierHover : Colors.transparent,
          borderRadius: layout.radiusMd,
        ),
        child: Row(
          children: [
            Expanded(child: _DownloadBody(download: download)),
            SizedBox(width: layout.s1),
            if (download.canOpen) ...[
              _DownloadControl(
                icon: PhosphorIconsBold.folderOpen,
                label: l10n.desktopDownloadsShowInFolder,
                onPressed: () => unawaited(downloads.reveal(download.id)),
              ),
              const SizedBox(width: 2),
            ],
            if (download.isInProgress)
              _DownloadControl(
                icon: PhosphorIconsBold.x,
                label: l10n.desktopDownloadsCancel,
                isDanger: true,
                onPressed: () => downloads.cancel(download.id),
              )
            else
              _DownloadControl(
                icon: PhosphorIconsBold.x,
                label: l10n.desktopDownloadsRemove,
                onPressed: () => downloads.dismiss(download.id),
              ),
          ],
        ),
      ),
    );
  }
}

class _DownloadBody extends ConsumerWidget {
  const _DownloadBody({required this.download});

  final DesktopDownload download;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final String status = desktopDownloadStatusLabel(
      FluxerLocalizations.of(context),
      download,
    );
    return NativeDownloadsPressable(
      semanticLabel: '${download.fileName}, $status',
      borderRadius: layout.radiusMd,
      onPressed: download.canOpen
          ? () => unawaited(
              ref.read(desktopDownloadsProvider.notifier).open(download.id),
            )
          : null,
      builder: (BuildContext context, Set<WidgetState> states) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.s2,
          vertical: layout.s1_5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(download.fileName, style: nativeDownloadsTitleStyle(context)),
            const SizedBox(height: 2),
            Text(status, style: nativeDownloadsMetaStyle(context)),
          ],
        ),
      ),
    );
  }
}

class _DownloadControl extends StatelessWidget {
  const _DownloadControl({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isDanger = false,
  });

  static const double _kSize = 24;
  static const double _kIconSize = 20;

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius borderRadius = context.layout.radiusFull;
    return NativeDownloadsPressable(
      semanticLabel: label,
      borderRadius: borderRadius,
      onPressed: onPressed,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        return AnimatedContainer(
          duration: context.motion.fast,
          curve: Curves.ease,
          width: _kSize,
          height: _kSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hovered
                ? colors.backgroundModifierAccent
                : Colors.transparent,
            borderRadius: borderRadius,
          ),
          child: NativeDownloadsIcon(
            icon: icon,
            size: _kIconSize,
            color: !hovered
                ? colors.textTertiary
                : isDanger
                ? colors.statusDanger
                : colors.textPrimary,
            duration: context.motion.fast,
          ),
        );
      },
    );
  }
}
