import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef FluxerScrollablePageSheetBuilder =
    Widget Function(
      BuildContext context,
      ScrollController scrollController,
      VoidCallback close,
    );

enum FluxerPageSheetPresentation { root, nested }

/// Adaptive full page settings style sheet
///
/// iOS uses a single [showCupertinoSheet] with nested [CupertinoPageRoute]
/// pushes for sections. Android uses [MaterialPageRoute] (fullscreen dialog
/// for root, standard push for nested).
class FluxerPageSheet {
  FluxerPageSheet._();

  static bool get _useCupertinoPageSheet =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  static Future<T?> _showWithOverlayTracking<T>(
    BuildContext context,
    Future<T?> Function() showSheet,
  ) {
    final ProviderContainer container = ProviderScope.containerOf(context);
    container.read(obscuringOverlayTrackerProvider.notifier).push();
    return showSheet().whenComplete(() {
      container.read(obscuringOverlayTrackerProvider.notifier).pop();
    });
  }

  static Future<T?> showScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    String? title,
    FluxerPageSheetPresentation presentation =
        FluxerPageSheetPresentation.nested,
    ValueNotifier<bool>? canDismissNotifier,
    bool useRootNavigator = true,
  }) {
    return _showWithOverlayTracking<T>(context, () {
      if (_useCupertinoPageSheet) {
        return _showCupertinoScrollable<T>(
          context,
          builder: builder,
          title: title,
          presentation: presentation,
          canDismissNotifier: canDismissNotifier,
          useRootNavigator: useRootNavigator,
        );
      }
      return _showMaterialScrollable<T>(
        context,
        builder: builder,
        title: title,
        presentation: presentation,
        canDismissNotifier: canDismissNotifier,
        useRootNavigator: useRootNavigator,
      );
    });
  }

  static Future<T?> _showCupertinoScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    required FluxerPageSheetPresentation presentation,
    required bool useRootNavigator,
    String? title,
    ValueNotifier<bool>? canDismissNotifier,
  }) {
    if (presentation == FluxerPageSheetPresentation.nested &&
        CupertinoSheetRoute.hasParentSheet(context)) {
      return _pushCupertinoNestedScrollable<T>(
        context,
        builder: builder,
        title: title,
        presentation: presentation,
        canDismissNotifier: canDismissNotifier,
      );
    }

    final bool useNestedNavigation =
        presentation == FluxerPageSheetPresentation.root;

    return showCupertinoSheet<T>(
      context: context,
      useNestedNavigation: useNestedNavigation,
      scrollableBuilder:
          (BuildContext sheetContext, ScrollController controller) {
            void close() {
              if (useNestedNavigation) {
                CupertinoSheetRoute.popSheet(sheetContext);
                return;
              }
              Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop();
            }

            return _buildPageSheetWithBackHandler(
              canDismissNotifier: canDismissNotifier,
              child: _FluxerPageSheetScaffold(
                title: title,
                presentation: presentation,
                onClose: close,
                child: builder(sheetContext, controller, close),
              ),
            );
          },
    );
  }

  static Future<T?> _pushCupertinoNestedScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    required FluxerPageSheetPresentation presentation,
    String? title,
    ValueNotifier<bool>? canDismissNotifier,
  }) {
    return Navigator.of(context).push<T>(
      CupertinoPageRoute<T>(
        builder: (BuildContext routeContext) {
          return _FluxerPageSheetScrollableHost<T>(
            builder: builder,
            title: title,
            presentation: presentation,
            canDismissNotifier: canDismissNotifier,
          );
        },
      ),
    );
  }

  static Future<T?> _showMaterialScrollable<T>(
    BuildContext context, {
    required FluxerScrollablePageSheetBuilder builder,
    required FluxerPageSheetPresentation presentation,
    required bool useRootNavigator,
    String? title,
    ValueNotifier<bool>? canDismissNotifier,
  }) {
    return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
      MaterialPageRoute<T>(
        fullscreenDialog: presentation == FluxerPageSheetPresentation.root,
        builder: (BuildContext routeContext) {
          return _FluxerPageSheetScrollableHost<T>(
            builder: builder,
            title: title,
            presentation: presentation,
            canDismissNotifier: canDismissNotifier,
          );
        },
      ),
    );
  }
}

class _FluxerPageSheetScrollableHost<T> extends StatefulWidget {
  const _FluxerPageSheetScrollableHost({
    required this.builder,
    required this.presentation,
    this.title,
    this.canDismissNotifier,
  });

  final FluxerScrollablePageSheetBuilder builder;
  final String? title;
  final FluxerPageSheetPresentation presentation;
  final ValueNotifier<bool>? canDismissNotifier;

  @override
  State<_FluxerPageSheetScrollableHost<T>> createState() =>
      _FluxerPageSheetScrollableHostState<T>();
}

class _FluxerPageSheetScrollableHostState<T>
    extends State<_FluxerPageSheetScrollableHost<T>> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void close() => Navigator.of(context).pop<T>();

    return _buildPageSheetWithBackHandler(
      canDismissNotifier: widget.canDismissNotifier,
      child: _FluxerPageSheetScaffold(
        title: widget.title,
        presentation: widget.presentation,
        onClose: close,
        child: widget.builder(context, _scrollController, close),
      ),
    );
  }
}

class _FluxerPageSheetScaffold extends StatelessWidget {
  const _FluxerPageSheetScaffold({
    required this.presentation,
    required this.onClose,
    required this.child,
    this.title,
  });

  final String? title;
  final FluxerPageSheetPresentation presentation;
  final VoidCallback onClose;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color backgroundColor = context.colors.backgroundSecondary;
    final bool isRoot = presentation == FluxerPageSheetPresentation.root;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: title == null ? null : Text(title!),
        leading: IconButton(
          icon: PhosphorIcon(
            isRoot ? PhosphorIconsBold.x : PhosphorIconsBold.arrowLeft,
          ),
          tooltip: isRoot ? l10n.uiClose : l10n.back,
          onPressed: onClose,
        ),
      ),
      body: child,
    );
  }
}

Widget _buildPageSheetWithBackHandler({
  required Widget child,
  required ValueNotifier<bool>? canDismissNotifier,
}) {
  if (canDismissNotifier == null) {
    return wrapFluxerOverlayBackHandler(
      canDismiss: true,
      onBack: null,
      onDismiss: null,
      child: child,
    );
  }

  return ValueListenableBuilder<bool>(
    valueListenable: canDismissNotifier,
    builder: (BuildContext context, bool canDismiss, Widget? sheetChild) {
      return wrapFluxerOverlayBackHandler(
        canDismiss: canDismiss,
        onBack: null,
        onDismiss: null,
        child: sheetChild!,
      );
    },
    child: child,
  );
}
