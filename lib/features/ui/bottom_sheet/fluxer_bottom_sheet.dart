import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// ---------------------------------------------------------------------------
// FluxerBottomSheet
// ---------------------------------------------------------------------------

/// Builder that receives the sheet's [BuildContext] and a [close] callback.
typedef FluxerBottomSheetBuilder =
    Widget Function(BuildContext context, VoidCallback close);

/// Builder for scrollable sheets — also receives a [ScrollController] that
/// must be attached to the inner scrollable to coordinate scroll-vs-dismiss.
typedef FluxerScrollableBottomSheetBuilder =
    Widget Function(
      BuildContext context,
      ScrollController scrollController,
      VoidCallback close,
    );

enum FluxerBottomSheetVariant { content, menu }

/// Shows a styled modal bottom sheet with the app's standard appearance.
///
/// The sheet builder receives a `close` callback so children can dismiss the
/// sheet without needing their own `Navigator.pop` call.
class FluxerBottomSheet {
  FluxerBottomSheet._();

  static Future<T?> show<T>(
    BuildContext context, {
    required FluxerBottomSheetBuilder builder,
    String? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onBack,
    bool showDragHandle = true,
    bool useRootNavigator = false,
    FluxerBottomSheetVariant variant = FluxerBottomSheetVariant.content,
    ValueNotifier<bool>? canDismissNotifier,
    bool enableDrag = true,
    double? maxHeight,
    bool isDismissible = true,
    bool reserveBottomInset = true,
  }) {
    final layout = context.layout;

    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      isScrollControlled: true,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      elevation: 0,
      builder: (sheetContext) {
        void close() =>
            Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop();

        final mediaQuery = MediaQuery.of(sheetContext);
        final bottomPadding = mediaQuery.viewPadding.bottom;
        final topPadding = mediaQuery.viewPadding.top;
        final bottomInset = mediaQuery.viewInsets.bottom;
        final hasHeader =
            title != null ||
            subtitle != null ||
            leading != null ||
            trailing != null ||
            onBack != null;

        final content = AnimatedPadding(
          duration: sheetContext.motion.normal,
          curve: sheetContext.motion.curve,
          padding: EdgeInsets.only(bottom: bottomInset),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight != null
                  ? (mediaQuery.size.height - topPadding - layout.s4) *
                        maxHeight
                  : mediaQuery.size.height - topPadding - layout.s4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: layout.s2),
                if (showDragHandle) ...[
                  const FluxerBottomSheetDragHandle(),
                  SizedBox(height: layout.s2),
                ],
                if (hasHeader) ...[
                  FluxerBottomSheetHeader(
                    title: title ?? '',
                    subtitle: subtitle,
                    leading: leading,
                    trailing: trailing,
                    onBack: onBack,
                  ),
                  SizedBox(
                    height: variant == FluxerBottomSheetVariant.menu
                        ? layout.s3
                        : layout.s2,
                  ),
                ],
                Flexible(child: builder(sheetContext, close)),
                if (reserveBottomInset)
                  SizedBox(
                    height: bottomPadding > 0 ? bottomPadding : layout.s4,
                  ),
              ],
            ),
          ),
        );

        if (canDismissNotifier == null) {
          return content;
        }

        return ValueListenableBuilder<bool>(
          valueListenable: canDismissNotifier,
          builder: (context, canDismiss, child) =>
              PopScope(canPop: canDismiss, child: child!),
          child: content,
        );
      },
    );
  }

  /// Shows a bottom sheet whose content is scrollable with coordinated
  /// drag-to-dismiss (only dismisses when the scrollable is at the top).
  ///
  /// The [builder] receives a [ScrollController] that **must** be attached to
  /// the inner scrollable widget for the coordination to work.
  static Future<T?> showScrollable<T>(
    BuildContext context, {
    required FluxerScrollableBottomSheetBuilder builder,
    String? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onBack,
    bool showDragHandle = true,
    bool useRootNavigator = false,
    double initialChildSize = 0.9,
    double minChildSize = 0.4,
    double maxChildSize = 0.95,
    ValueNotifier<bool>? canDismissNotifier,
    double? maxHeight,
    bool disableTopPadding = false,
    bool isDismissible = true,
  }) {
    final layout = context.layout;

    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: isDismissible,
      elevation: 0,
      builder: (sheetContext) {
        void close() =>
            Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop();

        final mediaQuery = MediaQuery.of(sheetContext);
        final bottomPadding = mediaQuery.viewPadding.bottom;
        final bottomInset = mediaQuery.viewInsets.bottom;
        final hasHeader =
            title != null ||
            subtitle != null ||
            leading != null ||
            trailing != null ||
            onBack != null;

        Widget buildContent(ScrollController scrollController) {
          return AnimatedPadding(
            duration: sheetContext.motion.normal,
            curve: sheetContext.motion.curve,
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Column(
              children: [
                if (!disableTopPadding) SizedBox(height: layout.s2),
                if (showDragHandle) ...[
                  const FluxerBottomSheetDragHandle(),
                  SizedBox(height: layout.s2),
                ],
                if (hasHeader) ...[
                  FluxerBottomSheetHeader(
                    title: title ?? '',
                    subtitle: subtitle,
                    leading: leading,
                    trailing: trailing,
                    onBack: onBack,
                  ),
                  SizedBox(height: layout.s2),
                ],
                Expanded(child: builder(sheetContext, scrollController, close)),
                SizedBox(height: bottomPadding > 0 ? bottomPadding : layout.s4),
              ],
            ),
          );
        }

        final sheet = ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight != null
                ? (mediaQuery.size.height -
                          mediaQuery.viewPadding.top -
                          layout.s4) *
                      maxHeight
                : mediaQuery.size.height -
                      mediaQuery.viewPadding.top -
                      layout.s4,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: initialChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            builder: (_, scrollController) => buildContent(scrollController),
          ),
        );

        if (canDismissNotifier == null) {
          return sheet;
        }

        return ValueListenableBuilder<bool>(
          valueListenable: canDismissNotifier,
          builder: (context, canDismiss, child) =>
              PopScope(canPop: canDismiss, child: child!),
          child: sheet,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Structural widgets
// ---------------------------------------------------------------------------

class FluxerBottomSheetDragHandle extends StatelessWidget {
  const FluxerBottomSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 4,
        decoration: BoxDecoration(
          color: context.colors.backgroundModifierAccent,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class FluxerBottomSheetHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onBack;
  final Widget? after;

  const FluxerBottomSheetHeader({
    required this.title,
    super.key,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onBack,
    this.after,
  });

  bool _leadingOccupiesSpace(Widget? widget) {
    if (widget == null) {
      return false;
    }
    if (widget is SizedBox) {
      final double? width = widget.width;
      final double? height = widget.height;
      if (widget.child == null &&
          (width == null || width == 0) &&
          (height == null || height == 0)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget? effectiveLeading = onBack != null
        ? IconButton(
            onPressed: onBack,
            tooltip: l10n.back,
            icon: PhosphorIcon(
              PhosphorIconsBold.caretLeft,
              size: 20,
              color: colors.textPrimary,
            ),
          )
        : _leadingOccupiesSpace(leading)
        ? leading
        : null;

    final bool alignStart = effectiveLeading != null || trailing != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (effectiveLeading != null) ...[
                effectiveLeading,
                SizedBox(width: layout.s3),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: alignStart
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.channelName.copyWith(
                        color: colors.textPrimary,
                      ),
                      textAlign: alignStart
                          ? TextAlign.start
                          : TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      DefaultTextStyle.merge(
                        textAlign: alignStart
                            ? TextAlign.start
                            : TextAlign.center,
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[SizedBox(width: layout.s3), trailing!],
            ],
          ),
          if (after != null) ...[SizedBox(height: layout.s3), after!],
        ],
      ),
    );
  }
}

class FluxerBottomSheetSubmenuHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const FluxerBottomSheetSubmenuHeader({
    required this.title,
    required this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetHeader(title: title, onBack: onBack);
  }
}

class FluxerBottomSheetContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;

  const FluxerBottomSheetContent({
    required this.child,
    super.key,
    this.padding,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final content = Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
      child: child,
    );

    if (!scrollable) {
      return SafeArea(child: content);
    }

    return SafeArea(child: SingleChildScrollView(child: content));
  }
}

class FluxerBottomSheetSection extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const FluxerBottomSheetSection({
    required this.child,
    super.key,
    this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Padding(
              padding: EdgeInsets.only(bottom: layout.s2),
              child: Text(
                title!,
                style: context.textStyles.label.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
          ],
          child,
        ],
      ),
    );
  }
}

class FluxerBottomSheetFooter extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showTopBorder;

  const FluxerBottomSheetFooter({
    required this.child,
    super.key,
    this.padding,
    this.showTopBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: showTopBorder
            ? Border(
                top: BorderSide(
                  color: colors.backgroundModifierAccent.withValues(alpha: 0.5),
                ),
              )
            : null,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(layout.s4),
        child: child,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Menu group
// ---------------------------------------------------------------------------

class FluxerMenuGroup extends StatelessWidget {
  final List<Widget> children;

  const FluxerMenuGroup({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = context.colors;
    final layout = context.layout;

    return Material(
      color: colors.backgroundSecondaryAlt,
      surfaceTintColor: Colors.transparent,
      borderRadius: layout.radiusXl,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _intersperseDividers(children, colors),
      ),
    );
  }
}

List<Widget> _intersperseDividers(List<Widget> items, FluxerColorTheme colors) {
  final result = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    result.add(items[i]);
    if (i < items.length - 1) {
      result.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 1,
            thickness: 1,
            color: colors.backgroundHeaderSecondary.withValues(alpha: 0.3),
          ),
        ),
      );
    }
  }
  return result;
}

// ---------------------------------------------------------------------------
// Menu items
// ---------------------------------------------------------------------------

class FluxerBottomSheetMenuItem extends StatelessWidget {
  final String label;
  final String? hint;
  final VoidCallback onTap;
  final Widget? leading;
  final IconData? icon;
  final bool isDanger;
  final bool isSelected;
  final bool enabled;
  final Widget? trailing;

  const FluxerBottomSheetMenuItem({
    required this.label,
    required this.onTap,
    super.key,
    this.hint,
    this.leading,
    this.icon,
    this.isDanger = false,
    this.isSelected = false,
    this.enabled = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final baseColor = isDanger
        ? colors.menuDangerText
        : isSelected
        ? colors.brandPrimary
        : colors.textPrimary;

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      selected: isSelected,
      semanticLabel: hint != null ? '$label. $hint' : label,
      excludeChildSemantics: true,
      builder: (context, states) {
        final isPressed = states.contains(WidgetState.pressed);

        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isSelected
              ? colors.brandPrimary.withValues(alpha: 0.12)
              : isPressed
              ? colors.backgroundModifierHover.withValues(alpha: 0.6)
              : Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  if (leading case final leading?) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: leading),
                    ),
                    const SizedBox(width: 12),
                  ] else if (icon != null) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(
                        child: PhosphorIcon(icon!, color: baseColor, size: 20),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          label,
                          style: context.textStyles.username.copyWith(
                            color: enabled ? baseColor : colors.textTertiary,
                          ),
                        ),
                        if (hint != null)
                          Text(
                            hint!,
                            style: context.textStyles.timestamp.copyWith(
                              color: colors.textTertiary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: 12),
                    trailing!,
                  ] else if (isSelected) ...[
                    const SizedBox(width: 12),
                    PhosphorIcon(
                      PhosphorIconsBold.check,
                      size: 18,
                      color: colors.brandPrimary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FluxerBottomSheetSubmenuItem extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final VoidCallback onTap;

  const FluxerBottomSheetSubmenuItem({
    required this.label,
    required this.onTap,
    this.hint,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetMenuItem(
      label: label,
      hint: hint,
      icon: icon,
      onTap: onTap,
      trailing: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: 20,
        color: context.colors.textPrimaryMuted,
      ),
    );
  }
}

class FluxerBottomSheetGroupColumn extends StatelessWidget {
  final List<Widget> children;

  const FluxerBottomSheetGroupColumn({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class FluxerBottomSheetCheckboxItem extends StatelessWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const FluxerBottomSheetCheckboxItem({
    required this.label,
    required this.isChecked,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      checked: isChecked,
      excludeChildSemantics: true,
      builder: (context, states) {
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: context.textStyles.username.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isChecked
                          ? colors.brandPrimary
                          : colors.backgroundHeaderSecondary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(3),
                    color: isChecked ? colors.brandPrimary : Colors.transparent,
                  ),
                  child: isChecked
                      ? Center(
                          child: PhosphorIcon(
                            PhosphorIconsBold.check,
                            size: 12,
                            color: colors.textOnBrandPrimary,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Drag handle', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetDragHandlePreview() {
  return const FluxerBottomSheetDragHandle();
}

@FluxerWidgetPreview(name: 'Header', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetHeaderPreview() {
  return const FluxerBottomSheetHeader(
    title: 'Invite friends',
    subtitle: Text('Share this server with people you trust.'),
  );
}

@FluxerWidgetPreview(name: 'Submenu header', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSubmenuHeaderPreview() {
  return FluxerBottomSheetSubmenuHeader(
    title: 'Notification settings',
    onBack: () {},
  );
}

@FluxerWidgetPreview(name: 'Content', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetContentPreview() {
  return const FluxerBottomSheetContent(
    scrollable: false,
    child: Text('Sheet body content goes here.'),
  );
}

@FluxerWidgetPreview(name: 'Section', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSectionPreview() {
  return const FluxerBottomSheetSection(
    title: 'Privacy',
    child: Text('Section children'),
  );
}

@FluxerWidgetPreview(name: 'Footer', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetFooterPreview() {
  return FluxerBottomSheetFooter(
    showTopBorder: true,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: const Text('Cancel')),
        const SizedBox(width: 8),
        FilledButton(onPressed: () {}, child: const Text('Save')),
      ],
    ),
  );
}

@FluxerWidgetPreview(name: 'Menu group', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetMenuGroupPreview() {
  return FluxerMenuGroup(
    children: [
      FluxerBottomSheetMenuItem(
        label: 'Edit channel',
        icon: PhosphorIconsBold.pencilSimple,
        onTap: () {},
      ),
      FluxerBottomSheetMenuItem(
        label: 'Delete channel',
        hint: 'Cannot be undone',
        icon: PhosphorIconsBold.trash,
        isDanger: true,
        onTap: () {},
      ),
    ],
  );
}

@FluxerWidgetPreview(name: 'Menu item selected', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetMenuItemSelectedPreview() {
  return FluxerBottomSheetMenuItem(
    label: 'Dark',
    isSelected: true,
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Submenu item', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSubmenuItemPreview() {
  return FluxerBottomSheetSubmenuItem(
    label: 'Change nickname',
    onTap: () {},
    icon: PhosphorIconsBold.user,
  );
}

@FluxerWidgetPreview(name: 'Checkbox item', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetCheckboxItemPreview() {
  return FluxerBottomSheetCheckboxItem(
    label: 'Mute @mentions',
    isChecked: true,
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Group column', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetGroupColumnPreview() {
  return FluxerBottomSheetGroupColumn(
    children: [
      FluxerBottomSheetMenuItem(label: 'First', onTap: () {}),
      FluxerBottomSheetMenuItem(label: 'Second', onTap: () {}),
    ],
  );
}
