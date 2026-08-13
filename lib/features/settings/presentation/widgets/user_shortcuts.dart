import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_format.dart';
import 'package:fluxer_app/features/input/domain/keybind_section.dart';
import 'package:fluxer_app/features/input/utils/default_shortcuts_display.dart';
import 'package:fluxer_app/features/input/utils/keybind_action_labels.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/keybind_hint/fluxer_keybind_hint.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DefaultShortcutsList extends StatelessWidget {
  const DefaultShortcutsList({required this.searchQuery, super.key});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String normalized = searchQuery.trim().toLowerCase();
    final Map<KeybindSection, List<DefaultKeybind>> grouped =
        <KeybindSection, List<DefaultKeybind>>{};
    for (final DefaultKeybind entry in visibleDefaultKeybinds()) {
      final String label = keybindActionLabel(l10n, entry.action).toLowerCase();
      final List<String> chips = formatDefaultKeybindChips(
        combo: entry.combo,
        displayKind: entry.defaultsShortcutDisplayKind,
      );
      final bool matches =
          normalized.isEmpty ||
          label.contains(normalized) ||
          chips.any((String chip) => chip.toLowerCase().contains(normalized));
      if (!matches) {
        continue;
      }
      grouped.putIfAbsent(entry.section, () => <DefaultKeybind>[]).add(entry);
    }

    final List<KeybindSection> sections = grouped.keys.toList()
      ..sort(
        (KeybindSection a, KeybindSection b) =>
            a.sortOrder.compareTo(b.sortOrder),
      );

    if (sections.isEmpty) {
      return const SizedBox.shrink();
    }

    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (int i = 0; i < sections.length; i++) ...<Widget>[
          _ShortcutsSectionCard(
            title: keybindSectionLabel(l10n, sections[i]),
            rows: partitionMergedShortcutRows(
              sortDefaultKeybindsForSection(sections[i], grouped[sections[i]]!),
            ),
            l10n: l10n,
          ),
          if (i < sections.length - 1) SizedBox(height: layout.s4),
        ],
      ],
    );
  }
}

class _ShortcutsSectionCard extends StatelessWidget {
  const _ShortcutsSectionCard({
    required this.title,
    required this.rows,
    required this.l10n,
  });

  final String title;
  final List<List<DefaultKeybind>> rows;
  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textStyles.bodySmall.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: layout.s2),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundTextarea,
            border: Border.all(color: colors.backgroundModifierAccent),
            borderRadius: layout.radiusLg,
          ),
          child: ClipRRect(
            borderRadius: layout.radiusLg,
            child: Column(
              children: <Widget>[
                for (int i = 0; i < rows.length; i++)
                  _ShortcutRow(
                    entries: rows[i],
                    l10n: l10n,
                    showDivider: i < rows.length - 1,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ShortcutRow extends StatelessWidget {
  const _ShortcutRow({
    required this.entries,
    required this.l10n,
    required this.showDivider,
  });

  final List<DefaultKeybind> entries;
  final FluxerLocalizations l10n;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final DefaultKeybind primary = entries.first;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: showDivider
            ? Border(bottom: BorderSide(color: colors.backgroundModifierAccent))
            : null,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 44),
        child: Padding(
          padding: EdgeInsets.all(layout.s3),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  keybindActionLabel(l10n, primary.action),
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              SizedBox(width: layout.s3),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (int i = 0; i < entries.length; i++) ...<Widget>[
                    if (i > 0) SizedBox(width: layout.s3),
                    FluxerKeybindHint(
                      style: FluxerKeybindHintStyle.settingsList,
                      keys: formatDefaultKeybindChips(
                        combo: entries[i].combo,
                        displayKind: entries[i].defaultsShortcutDisplayKind,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserShortcuts extends StatefulWidget {
  const UserShortcuts({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  State<UserShortcuts> createState() => _UserShortcutsState();
}

class _UserShortcutsState extends State<UserShortcuts> {
  late final TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FluxerInput(
            controller: _searchController,
            hint: l10n.keybindsSearchShortcuts,
            prefixIcon: PhosphorIcon(
              PhosphorIconsBold.magnifyingGlass,
              size: 16,
              color: context.colors.textTertiary,
            ),
          ),
          SizedBox(height: layout.s4),
          DefaultShortcutsList(searchQuery: _searchQuery),
        ],
      ),
    );
  }
}
