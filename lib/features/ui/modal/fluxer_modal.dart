import 'dart:ui';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/foldable/crease_overlay_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_presentation.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal_size.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_autofocus.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

typedef FluxerModalBuilder =
    Widget Function(BuildContext context, VoidCallback close);

typedef FluxerModalActionsBuilder<T> =
    List<Widget> Function(void Function([T? result]) pop);

class FluxerModal {
  FluxerModal._();

  static bool _isActionSpacer(Widget action) =>
      action is SizedBox && action.child == null;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required FluxerModalBuilder builder,
    List<Widget>? actions,
    FluxerModalActionsBuilder<T>? actionsBuilder,
    String? description,
    Widget? trailing,
    VoidCallback? onBack,
    bool centered = false,
    FluxerModalSize size = FluxerModalSize.small,
    bool? useRootNavigator,
  }) {
    final bool desktopRoute =
        usesDesktopPointerUi(context) && (centered || !isMobileLayout(context));
    return _presentFluxerModal<T>(
      context,
      desktopRoute: desktopRoute,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext dialogContext) {
        void close() => Navigator.of(dialogContext).pop();
        void pop([T? result]) => Navigator.of(dialogContext).pop(result);
        final List<Widget> footerActions =
            actions ?? actionsBuilder?.call(pop) ?? const <Widget>[];

        final colors = dialogContext.colors;
        final textStyles = dialogContext.textStyles;
        final layout = dialogContext.layout;
        final dialogTheme = DialogTheme.of(dialogContext);
        final mediaQuery = MediaQuery.of(dialogContext);
        final double keyboardInset = mediaQuery.viewInsets.bottom;
        final isMobile = isMobileLayout(dialogContext);
        final useMobileFullscreen = isMobile && !centered;
        final bool desktop =
            !useMobileFullscreen && usesDesktopPointerUi(dialogContext);

        final themeShape = dialogTheme.shape as RoundedRectangleBorder?;
        final headerSubtitle = description == null
            ? null
            : Text(
                description,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                  height: 1.4,
                ),
              );
        final FluxerLocalizations l10n = FluxerLocalizations.of(dialogContext);
        final Widget closeButton = desktop
            ? FluxerDesktopModalCloseButton(onTap: close)
            : Opacity(
                opacity: 0.7,
                child: FluxerButton.ghost(
                  onPressed: close,
                  icon: PhosphorIconsBold.x,
                  isSquare: true,
                  semanticLabel: l10n.uiClose,
                ),
              );

        final Widget header = FluxerBottomSheetHeader(
          title: title,
          subtitle: headerSubtitle,
          onBack: onBack,
          trailing: trailing ?? closeButton,
        );

        Widget buildModalContent({required bool mobileFullscreen}) {
          final double dialogMaxHeight =
              mediaQuery.size.height -
              mediaQuery.viewPadding.top -
              layout.s2 -
              keyboardInset;
          final body = Padding(
            padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
            child: SingleChildScrollView(child: builder(dialogContext, close)),
          );

          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: desktop
                  ? size.desktopWidth(mediaQuery.size.width)
                  : 400,
              maxHeight: dialogMaxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: layout.s4, bottom: layout.s4),
                  child: desktop
                      ? FluxerDesktopSurfaceScope(
                          surface: FluxerDesktopSurface.modal,
                          child: header,
                        )
                      : header,
                ),
                if (mobileFullscreen)
                  Flexible(child: body)
                else
                  LimitedBox(
                    maxHeight:
                        (dialogMaxHeight - layout.headerHeight - layout.s16)
                            .clamp(0.0, dialogMaxHeight),
                    child: body,
                  ),
                if (footerActions.isNotEmpty && desktop)
                  FluxerBottomSheetFooter(
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final Widget action in footerActions.reversed)
                          if (!_isActionSpacer(action)) action,
                      ],
                    ),
                  )
                else if (footerActions.isNotEmpty)
                  FluxerBottomSheetFooter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: footerActions,
                    ),
                  ),
              ],
            ),
          );
        }

        final Widget centeredDialog = Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: desktop ? layout.radiusLg : layout.radiusXxl,
            side: themeShape?.side ?? BorderSide.none,
          ),
          child: buildModalContent(mobileFullscreen: false),
        );

        return _buildFluxerModalOverlay(
          dialogContext,
          close: close,
          onBack: onBack,
          routeBackdrop: desktopRoute,
          child: useMobileFullscreen
              ? SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: layout.s2),
                      child: Material(
                        color: dialogTheme.backgroundColor,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: layout.radiusXxl.topLeft,
                          ),
                          side: themeShape?.side ?? BorderSide.none,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: buildModalContent(mobileFullscreen: true),
                      ),
                    ),
                  ),
                )
              : keyboardInset > 0
              ? Align(alignment: Alignment.bottomCenter, child: centeredDialog)
              : CreaseAwareAlign(child: centeredDialog),
        );
      },
    );
  }

  static Future<T?> showBare<T>(
    BuildContext context, {
    required String semanticLabel,
    required FluxerModalBuilder builder,
    FluxerModalSize size = FluxerModalSize.small,
    bool? useRootNavigator,
  }) {
    final bool desktopRoute = usesDesktopPointerUi(context);
    return _presentFluxerModal<T>(
      context,
      desktopRoute: desktopRoute,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext dialogContext) {
        void close() => Navigator.of(dialogContext).pop();
        final layout = dialogContext.layout;
        final RoundedRectangleBorder? themeShape =
            DialogTheme.of(dialogContext).shape as RoundedRectangleBorder?;
        return _buildFluxerModalOverlay(
          dialogContext,
          close: close,
          routeBackdrop: desktopRoute,
          child: CreaseAwareAlign(
            child: Dialog(
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: layout.radiusLg,
                side: themeShape?.side ?? BorderSide.none,
              ),
              child: Semantics(
                scopesRoute: true,
                namesRoute: true,
                explicitChildNodes: true,
                label: semanticLabel,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: desktopRoute
                        ? size.desktopWidth(
                            MediaQuery.sizeOf(dialogContext).width,
                          )
                        : 440,
                  ),
                  child: SingleChildScrollView(
                    child: builder(dialogContext, close),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<T?> _presentFluxerModal<T>(
  BuildContext context, {
  required bool desktopRoute,
  required bool? useRootNavigator,
  required WidgetBuilder builder,
}) {
  final bool useRoot =
      useRootNavigator ?? resolveShellPopupUseRootNavigator(context);
  if (desktopRoute) {
    return pushFluxerDesktopRoute<T>(
      context,
      navigator: Navigator.of(context, rootNavigator: useRoot),
      surface: FluxerDesktopSurface.modal,
      builder: builder,
    );
  }
  return showDialog<T>(
    context: context,
    useRootNavigator: useRoot,
    barrierColor: Colors.transparent,
    builder: builder,
  );
}

Widget _buildFluxerModalOverlay(
  BuildContext context, {
  required VoidCallback close,
  required Widget child,
  required bool routeBackdrop,
  VoidCallback? onBack,
}) {
  return wrapFluxerOverlayBackHandler(
    canDismiss: true,
    onBack: onBack,
    onDismiss: close,
    child: Stack(
      children: [
        Positioned.fill(
          child: FluxerGestureDetector(
            onTap: close,
            behavior: HitTestBehavior.opaque,
            child: routeBackdrop
                ? const SizedBox.expand()
                : ColoredBox(
                    color: Colors.black.withValues(alpha: 0.35),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: const SizedBox.expand(),
                    ),
                  ),
          ),
        ),
        AnimatedPadding(
          duration: context.motion.normal,
          curve: context.motion.curve,
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: MediaQuery.removeViewInsets(
            context: context,
            removeBottom: true,
            child: child,
          ),
        ),
      ],
    ),
  );
}

class FluxerConfirmModal {
  FluxerConfirmModal._();

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onConfirm,
    String? confirmLabel,
    Widget? body,
    bool isDanger = false,
    bool? useRootNavigator,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String resolvedConfirmLabel = confirmLabel ?? l10n.uiConfirm;
    return FluxerModal.show<bool>(
      context,
      useRootNavigator: useRootNavigator,
      title: title,
      centered: true,
      builder: (dialogContext, close) {
        final textStyles = dialogContext.textStyles;
        final layout = dialogContext.layout;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              style: textStyles.bodySmall.copyWith(height: 1.4),
            ),
            if (body != null) ...[SizedBox(height: layout.s4), body],
          ],
        );
      },
      actionsBuilder: (pop) => [
        FluxerAutofocus(
          child: isDanger
              ? FluxerButton.dangerPrimary(
                  onPressed: () {
                    onConfirm();
                    pop(true);
                  },
                  label: resolvedConfirmLabel,
                )
              : FluxerButton.primary(
                  onPressed: () {
                    onConfirm();
                    pop(true);
                  },
                  label: resolvedConfirmLabel,
                ),
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(onPressed: () => pop(false), label: l10n.cancel),
      ],
    );
  }
}
