import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerFullscreenFlow {
  FluxerFullscreenFlow._();

  static Future<T?> show<T>(
    BuildContext context, {
    required WidgetBuilder builder,
  }) => _push<T>(context, builder: builder, fullscreenDialog: true);

  static Future<T?> push<T>(
    BuildContext context, {
    required WidgetBuilder builder,
  }) => _push<T>(context, builder: builder, fullscreenDialog: false);

  static Future<T?> _push<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    required bool fullscreenDialog,
  }) {
    final ProviderContainer container = ProviderScope.containerOf(context);
    container.read(obscuringOverlayTrackerProvider.notifier).push();
    final Route<T> route = MaterialPageRoute<T>(
      fullscreenDialog: fullscreenDialog,
      builder: builder,
    );
    return Navigator.of(context, rootNavigator: true)
        .push<T>(route)
        .whenComplete(
          () => container.read(obscuringOverlayTrackerProvider.notifier).pop(),
        );
  }
}

Page<void> fluxerFlowPage({required LocalKey key, required Widget child}) =>
    MaterialPage<void>(key: key, child: child);

class FluxerFlowNavigator extends StatefulWidget {
  const FluxerFlowNavigator({
    required this.pages,
    required this.onDidRemovePage,
    super.key,
  });

  final List<Page<void>> pages;
  final DidRemovePageCallback onDidRemovePage;

  @override
  State<FluxerFlowNavigator> createState() => _FluxerFlowNavigatorState();
}

class _FluxerFlowNavigatorState extends State<FluxerFlowNavigator> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPopWithResult: (Object? result) {
        _navigatorKey.currentState?.maybePop();
      },
      child: Navigator(
        key: _navigatorKey,
        pages: widget.pages,
        onDidRemovePage: widget.onDidRemovePage,
      ),
    );
  }
}

class FluxerFlowStep extends StatelessWidget {
  const FluxerFlowStep({
    required this.title,
    required this.isFirst,
    required this.onLeading,
    required this.child,
    this.description,
    this.action,
    super.key,
  });

  final String title;
  final String? description;
  final bool isFirst;
  final VoidCallback onLeading;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Scaffold(
      backgroundColor: colors.backgroundSecondary,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 4),
                  child: IconButton(
                    onPressed: onLeading,
                    tooltip: isFirst ? l10n.uiClose : l10n.back,
                    icon: PhosphorIcon(
                      isFirst
                          ? PhosphorIconsBold.x
                          : PhosphorIconsBold.arrowLeft,
                      size: 24,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  16 + MediaQuery.paddingOf(context).bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textStyles.heading.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                        color: colors.textPrimary,
                      ),
                    ),
                    if (description != null) ...<Widget>[
                      const SizedBox(height: 8),
                      Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: textStyles.bodyMedium.copyWith(
                          fontSize: 15,
                          height: 1.35,
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    child,
                    if (action != null) ...<Widget>[
                      const SizedBox(height: 24),
                      action!,
                    ],
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

class FluxerPushPage extends StatelessWidget {
  const FluxerPushPage({
    required this.title,
    required this.body,
    this.closes = false,
    this.onLeading,
    this.trailing,
    super.key,
  });

  final String title;
  final Widget body;
  final bool closes;
  final VoidCallback? onLeading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.backgroundSecondary,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 88),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: context.textStyles.heading.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: 4,
                    child: IconButton(
                      onPressed:
                          onLeading ?? () => Navigator.of(context).maybePop(),
                      tooltip: closes ? l10n.uiClose : l10n.back,
                      icon: PhosphorIcon(
                        closes
                            ? PhosphorIconsBold.x
                            : PhosphorIconsBold.arrowLeft,
                        size: 24,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                  if (trailing != null)
                    PositionedDirectional(end: 4, child: trailing!),
                ],
              ),
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}

class FluxerPushPageAction extends StatelessWidget {
  const FluxerPushPageAction({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colors.brandPrimaryLight,
        disabledForegroundColor: colors.brandPrimaryLight.withValues(
          alpha: 0.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minimumSize: const Size(44, 44),
        splashFactory: NoSplash.splashFactory,
        textStyle: context.textStyles.bodyMedium.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text(label),
    );
  }
}
