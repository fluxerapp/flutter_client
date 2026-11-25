import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_downloads_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_download_row.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_pressable.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_style.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class NativeDownloadsPanel extends ConsumerWidget {
  const NativeDownloadsPanel({super.key});

  static const double _kListMaxHeight = 208;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final List<DesktopDownload> downloads = ref.watch(desktopDownloadsProvider);

    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: l10n.desktopDownloadsTitle,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: layout.s3),
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusLg,
          border: Border.all(color: colors.backgroundModifierAccent),
          boxShadow: fluxerDesktopPanelShadow(context),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: layout.s3),
              child: const _PanelHeader(),
            ),
            SizedBox(height: layout.s2),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: _kListMaxHeight),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: layout.s3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: layout.s1,
                  children: [
                    for (final DesktopDownload download in downloads)
                      NativeDownloadRow(
                        key: ValueKey<int>(download.id),
                        download: download,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PanelHeader extends ConsumerWidget {
  const _PanelHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: context.layout.s2,
      children: [
        Flexible(
          child: Text(
            l10n.desktopDownloadsTitle,
            style: nativeDownloadsTitleStyle(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        NativeDownloadsPressable(
          semanticLabel: l10n.desktopDownloadsClear,
          onPressed: ref.read(desktopDownloadsProvider.notifier).clear,
          builder: (BuildContext context, Set<WidgetState> states) =>
              AnimatedDefaultTextStyle(
                duration: context.motion.fast,
                curve: Curves.ease,
                style: nativeDownloadsMetaStyle(context).copyWith(
                  color: states.contains(WidgetState.hovered)
                      ? colors.textSecondary
                      : colors.textTertiary,
                ),
                child: Text(l10n.desktopDownloadsClear),
              ),
        ),
      ],
    );
  }
}
