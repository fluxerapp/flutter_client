import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_banner.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_entry.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_scope.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class DesktopSettingsModalHeader extends StatelessWidget {
  const DesktopSettingsModalHeader({
    required this.title,
    required this.onClose,
    this.titleTrailing,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final String title;
  final VoidCallback onClose;
  final Widget? titleTrailing;
  final Color? backgroundColor;
  final Color? foregroundColor;

  static const Duration _kContentFadeDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerUnsavedChangesScope? scope = FluxerUnsavedChangesScope.maybeOf(
      context,
    );
    final FluxerUnsavedChangesEntry? entry =
        scope != null && scope.showsHeaderBanner
        ? scope.controller.dirtyEntry
        : null;
    final bool flashing = entry != null && scope!.controller.flashing;
    final Color? resolvedBackground = entry == null
        ? backgroundColor
        : flashing
        ? colors.statusDanger
        : colors.backgroundPrimary;
    final Widget content = entry == null
        ? _DesktopSettingsModalHeaderTitle(
            key: const ValueKey<String>('title'),
            title: title,
            titleTrailing: titleTrailing,
            foregroundColor: foregroundColor,
            onClose: onClose,
          )
        : FluxerUnsavedChangesBanner(
            key: const ValueKey<String>('banner'),
            entry: entry,
            flashing: flashing,
          );
    return AnimatedContainer(
      duration: context.motion.panel,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: resolvedBackground,
        border: Border(
          bottom: BorderSide(color: colors.backgroundModifierAccent),
        ),
      ),
      child: AnimatedSwitcher(
        duration: MediaQuery.disableAnimationsOf(context)
            ? Duration.zero
            : _kContentFadeDuration,
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeOut,
        layoutBuilder: (Widget? current, List<Widget> previous) => Stack(
          alignment: Alignment.center,
          children: <Widget>[...previous, ?current],
        ),
        child: content,
      ),
    );
  }
}

class _DesktopSettingsModalHeaderTitle extends StatelessWidget {
  const _DesktopSettingsModalHeaderTitle({
    required this.title,
    required this.onClose,
    this.titleTrailing,
    this.foregroundColor,
    super.key,
  });

  final String title;
  final VoidCallback onClose;
  final Widget? titleTrailing;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.heading.copyWith(
                      fontSize: 18,
                      height: 24 / 18,
                      fontWeight: FontWeight.w600,
                      color: foregroundColor ?? colors.textPrimary,
                    ),
                  ),
                ),
                if (titleTrailing != null) ...<Widget>[
                  const SizedBox(width: 8),
                  titleTrailing!,
                ],
              ],
            ),
          ),
        ),
        FluxerButton.desktop(
          icon: PhosphorIconsBold.x,
          semanticLabel: FluxerLocalizations.of(context).uiClose,
          onPressed: onClose,
          extent: 34,
          borderRadius: 8,
          color: foregroundColor ?? colors.textTertiary,
          hoverColor: foregroundColor ?? colors.textPrimary,
          hoverBackground: colors.surfaceInteractiveHoverBg,
          duration: const Duration(milliseconds: 120),
        ),
      ],
    );
  }
}
