import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_search_field.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_supported_languages.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_language_select.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/export.dart';

class DiscoveryNavbar extends ConsumerWidget {
  const DiscoveryNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final layout = context.layout;
    final String query = ref.watch(
      discoveryControllerProvider.select((DiscoveryState s) => s.query),
    );
    final bool searchActive = query.isNotEmpty;
    return FluxerConstrainedUiTextScale(
      child: Container(
        height: layout.headerHeight,
        decoration: BoxDecoration(
          color: colors.backgroundSecondaryLighter,
          border: Border(
            bottom: BorderSide(color: colors.userAreaDividerColor),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
        child: Row(
          children: <Widget>[
            Expanded(
              child: AnimatedSwitcher(
                duration: context.motion.fast,
                layoutBuilder: (Widget? current, List<Widget> previous) {
                  return Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[...previous, ?current],
                  );
                },
                child: searchActive
                    ? _DiscoverySearchTitle(
                        key: const ValueKey<String>('search'),
                        query: query,
                      )
                    : const _DiscoveryNavbarCategoryTabs(
                        key: ValueKey<String>('browse'),
                      ),
              ),
            ),
            SizedBox(width: layout.s4),
            const _DiscoveryNavbarSearchField(),
            SizedBox(width: layout.s2),
            const _DiscoveryNavbarLanguageButton(),
          ],
        ),
      ),
    );
  }
}

class _DiscoverySearchTitle extends ConsumerWidget {
  const _DiscoverySearchTitle({required this.query, super.key});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Row(
      children: <Widget>[
        ChannelHeaderIconButton(
          icon: PhosphorIconsBold.arrowLeft,
          label: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () =>
              ref.read(discoveryControllerProvider.notifier).submitQuery(''),
        ),
        SizedBox(width: context.layout.s2),
        Flexible(
          child: Semantics(
            header: true,
            child: Text(
              l10n.discoverySearchResultsFor(query),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 20 / 16,
                color: colors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DiscoveryNavbarCategoryTabs extends ConsumerWidget {
  const _DiscoveryNavbarCategoryTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int? categoryId = ref.watch(
      discoveryControllerProvider.select((DiscoveryState s) => s.categoryId),
    );
    final List<DiscoveryCategoryResponse> categories = ref.watch(
      discoveryControllerProvider.select((DiscoveryState s) => s.categories),
    );
    final DiscoveryController controller = ref.read(
      discoveryControllerProvider.notifier,
    );
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _DiscoveryNavbarCategoryTab(
              label: l10n.discoveryAllCategories,
              isActive: categoryId == null,
              onTap: () => controller.setCategory(null),
            ),
            for (final DiscoveryCategoryResponse category
                in categories) ...<Widget>[
              SizedBox(width: context.layout.s1),
              _DiscoveryNavbarCategoryTab(
                label: category.name,
                isActive: categoryId == category.id.toInt(),
                onTap: () => controller.setCategory(category.id.toInt()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DiscoveryNavbarCategoryTab extends StatelessWidget {
  const _DiscoveryNavbarCategoryTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return FluxerTappable(
      onTap: onTap,
      selected: isActive,
      semanticLabel: label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        final Color background = isActive
            ? colors.backgroundModifierSelected
            : hovered
            ? colors.backgroundModifierHover
            : Colors.transparent;
        return AnimatedContainer(
          duration: context.motion.fast,
          height: 32,
          constraints: const BoxConstraints(maxWidth: 192),
          padding: EdgeInsets.symmetric(horizontal: layout.s3),
          decoration: BoxDecoration(
            color: background,
            borderRadius: layout.radiusMd,
          ),
          child: Center(
            widthFactor: 1,
            child: Text(
              label,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.25,
                leadingDistribution: TextLeadingDistribution.even,
                color: isActive || hovered
                    ? colors.textPrimary
                    : colors.textTertiary,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DiscoveryNavbarSearchField extends ConsumerStatefulWidget {
  const _DiscoveryNavbarSearchField();

  @override
  ConsumerState<_DiscoveryNavbarSearchField> createState() =>
      _DiscoveryNavbarSearchFieldState();
}

class _DiscoveryNavbarSearchFieldState
    extends ConsumerState<_DiscoveryNavbarSearchField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(discoveryControllerProvider).query,
    )..addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  void _onFocusChanged() => setState(() {});

  void _submit(String value) {
    final String trimmed = value.trim();
    if (trimmed != value) {
      _controller.text = trimmed;
    }
    ref.read(discoveryControllerProvider.notifier).submitQuery(trimmed);
  }

  void _clear() {
    _controller.clear();
    ref.read(discoveryControllerProvider.notifier).submitQuery('');
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref.listen<String>(
      discoveryControllerProvider.select((DiscoveryState s) => s.query),
      (String? previous, String next) {
        if (_controller.text != next) {
          _controller.text = next;
        }
      },
    );
    final TextStyle inputStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 1.25,
      leadingDistribution: TextLeadingDistribution.even,
      color: colors.textPrimary,
    );
    return TapRegion(
      onTapOutside: (_) => _focusNode.unfocus(),
      child: AnimatedContainer(
        duration: context.motion.fast,
        width: kChannelHeaderSearchFieldWidth,
        constraints: const BoxConstraints(minHeight: 36),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: colors.backgroundTextarea,
          borderRadius: layout.radiusXl,
          border: Border.all(
            color: _focusNode.hasFocus && !isFluxerMobileOs
                ? colors.backgroundModifierAccentFocus
                : colors.backgroundModifierAccent,
          ),
        ),
        child: Row(
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsBold.magnifyingGlass,
              size: 16,
              color: colors.textTertiary,
            ),
            SizedBox(width: layout.s2),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.search,
                style: inputStyle,
                decoration: InputDecoration(
                  isDense: true,
                  visualDensity: VisualDensity.standard,
                  filled: false,
                  hintText: l10n.discoverySearchCommunities,
                  hintStyle: inputStyle.copyWith(color: colors.textTertiary),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                onSubmitted: _submit,
              ),
            ),
            if (_controller.text.isNotEmpty)
              _DiscoverySearchClearButton(onPressed: _clear),
          ],
        ),
      ),
    );
  }
}

class _DiscoverySearchClearButton extends StatelessWidget {
  const _DiscoverySearchClearButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onPressed,
      semanticLabel: FluxerLocalizations.of(context).userSettingsSearchClear,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        return Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hovered
                ? colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: context.layout.radiusMd,
          ),
          child: PhosphorIcon(
            PhosphorIconsBold.x,
            size: 14,
            color: hovered ? colors.textPrimary : colors.textTertiary,
          ),
        );
      },
    );
  }
}

class _DiscoveryNavbarLanguageButton extends ConsumerWidget {
  const _DiscoveryNavbarLanguageButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? language = ref.watch(
      discoveryControllerProvider.select((DiscoveryState s) => s.language),
    );
    final String label;
    if (language == null) {
      label = l10n.discoveryFilterByLanguage;
    } else {
      final DiscoveryLanguage? match = discoveryLanguageForCode(language);
      label = l10n.discoveryFilteringByLanguage(
        match?.displayLabel ?? language,
      );
    }
    return ChannelHeaderIconButton(
      icon: PhosphorIconsBold.translate,
      label: label,
      isActive: language != null,
      onPressed: () => unawaited(
        showDiscoveryLanguagePicker(
          context: context,
          value: language,
          onChanged: ref.read(discoveryControllerProvider.notifier).setLanguage,
        ),
      ),
    );
  }
}
