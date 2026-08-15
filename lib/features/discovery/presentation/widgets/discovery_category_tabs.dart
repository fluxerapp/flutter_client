import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

const double _categoryTabRowHeight = 36;

double discoveryCategoryTabsExtent(FluxerLayoutTheme layout) {
  return layout.s3 + layout.s2 + _categoryTabRowHeight;
}

SliverPersistentHeader buildDiscoveryCategoryTabsSliver(BuildContext context) {
  final FluxerLayoutTheme layout = context.layout;
  return SliverPersistentHeader(
    pinned: true,
    delegate: _DiscoveryCategoryTabsHeaderDelegate(
      extent: discoveryCategoryTabsExtent(layout),
    ),
  );
}

class _DiscoveryCategoryTabsHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const _DiscoveryCategoryTabsHeaderDelegate({required this.extent});

  final double extent;

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: context.colors.backgroundPrimary,
      child: const DiscoveryCategoryTabs(),
    );
  }

  @override
  bool shouldRebuild(
    covariant _DiscoveryCategoryTabsHeaderDelegate oldDelegate,
  ) {
    return extent != oldDelegate.extent;
  }
}

class DiscoveryCategoryTabs extends ConsumerWidget {
  const DiscoveryCategoryTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final DiscoveryState state = ref.watch(discoveryControllerProvider);
    final List<DiscoveryCategoryResponse> categories = state.categories;
    return Container(
      color: colors.backgroundPrimary,
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s3, layout.s4, layout.s2),
      height: discoveryCategoryTabsExtent(layout),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              _DiscoveryCategoryTab(
                label: l10n.discoveryAllCategories,
                isSelected: state.categoryId == null,
                onTap: () => ref
                    .read(discoveryControllerProvider.notifier)
                    .setCategory(null),
                colors: colors,
                textStyles: textStyles,
              ),
              for (final DiscoveryCategoryResponse category
                  in categories) ...<Widget>[
                const SizedBox(width: 8),
                _DiscoveryCategoryTab(
                  label: category.name,
                  isSelected: state.categoryId == category.id.toInt(),
                  onTap: () => ref
                      .read(discoveryControllerProvider.notifier)
                      .setCategory(category.id.toInt()),
                  colors: colors,
                  textStyles: textStyles,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscoveryCategoryTab extends StatelessWidget {
  const _DiscoveryCategoryTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.colors,
    required this.textStyles,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final FluxerColorTheme colors;
  final FluxerTextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: Material(
        color: isSelected
            ? colors.backgroundModifierSelected
            : colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          child: ExcludeSemantics(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Text(
                label,
                style: textStyles.bodySmall.copyWith(
                  color: isSelected ? colors.textPrimary : colors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
