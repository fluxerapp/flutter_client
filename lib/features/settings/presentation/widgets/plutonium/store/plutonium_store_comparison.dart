import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PlutoniumStoreComparison extends StatelessWidget {
  const PlutoniumStoreComparison({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<_Row> rows = [
      _Row(
        icon: PhosphorIconsRegular.hash,
        label: l10n.storePlutoniumCompareTag,
        free: const _Mark(on: false),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.userCircle,
        label: l10n.storePlutoniumCompareProfile,
        free: const _Mark(on: false),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.medal,
        label: l10n.storePlutoniumCompareBadge,
        free: const _Mark(on: false),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.image,
        label: l10n.storePlutoniumCompareBackgrounds,
        free: const _Text('1'),
        plutonium: const _Text('15'),
      ),
      _Row(
        icon: PhosphorIconsRegular.usersThree,
        label: l10n.storePlutoniumCompareCommunities,
        free: const _Text('100'),
        plutonium: const _Text('200'),
      ),
      _Row(
        icon: PhosphorIconsRegular.textAa,
        label: l10n.storePlutoniumCompareCharacters,
        free: const _Text('2,000'),
        plutonium: const _Text('4,000'),
      ),
      _Row(
        icon: PhosphorIconsRegular.bookmarkSimple,
        label: l10n.storePlutoniumCompareBookmarks,
        free: const _Text('50'),
        plutonium: const _Text('300'),
      ),
      _Row(
        icon: PhosphorIconsRegular.uploadSimple,
        label: l10n.storePlutoniumCompareUpload,
        free: const _Text('25 MB'),
        plutonium: const _Text('500 MB'),
      ),
      _Row(
        icon: PhosphorIconsRegular.images,
        label: l10n.storePlutoniumCompareSavedMedia,
        free: const _Text('50'),
        plutonium: const _Text('500'),
      ),
      _Row(
        icon: PhosphorIconsRegular.smiley,
        label: l10n.storePlutoniumCompareAnimatedEmoji,
        free: const _Mark(on: true),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.sticker,
        label: l10n.storePlutoniumCompareCustomEmoji,
        free: const _Mark(on: false),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.videoCamera,
        label: l10n.storePlutoniumCompareVideo,
        free: _Text(l10n.storePlutoniumVideoFree),
        plutonium: _Text(l10n.storePlutoniumVideoPlutonium),
      ),
      _Row(
        icon: PhosphorIconsRegular.identificationBadge,
        label: l10n.storePlutoniumCompareAvatar,
        free: const _Mark(on: false),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.sparkle,
        label: l10n.storePlutoniumCompareEarlyAccess,
        free: const _Mark(on: false),
        plutonium: const _Mark(on: true),
      ),
      _Row(
        icon: PhosphorIconsRegular.palette,
        label: l10n.storePlutoniumCompareThemes,
        free: const _Mark(on: true),
        plutonium: const _Mark(on: true),
      ),
    ];

    return DecoratedBox(
      decoration: PlutoniumStoreStyle.panel,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 20),
        child: Column(
          children: [
            Text(
              l10n.storePlutoniumCompareTitle,
              textAlign: TextAlign.center,
              style: context.textStyles.heading.copyWith(
                color: PlutoniumStoreStyle.ink,
              ),
            ),
            const SizedBox(height: 8),
            _CompareTable(rows: rows),
            const SizedBox(height: 16),
            Text(
              l10n.storePlutoniumCompareMobileNote,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: PlutoniumStoreStyle.inkMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row {
  const _Row({
    required this.icon,
    required this.label,
    required this.free,
    required this.plutonium,
  });

  final IconData icon;
  final String label;
  final _Value free;
  final _Value plutonium;
}

sealed class _Value {
  const _Value();
}

class _Mark extends _Value {
  const _Mark({required this.on});

  final bool on;
}

class _Text extends _Value {
  const _Text(this.text);

  final String text;
}

class _CompareTable extends StatelessWidget {
  const _CompareTable({required this.rows});

  final List<_Row> rows;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Column(
      children: [
        _TableLine(
          label: l10n.premiumComparisonFeatureColumn,
          free: Text(
            l10n.premiumFreeColumn,
            textAlign: TextAlign.center,
            style: context.textStyles.label.copyWith(
              color: PlutoniumStoreStyle.inkMuted,
            ),
          ),
          plutonium: Text(
            kPremiumProductName,
            textAlign: TextAlign.center,
            style: context.textStyles.label.copyWith(
              color: PlutoniumStoreStyle.accent,
            ),
          ),
          header: true,
        ),
        for (var i = 0; i < rows.length; i++)
          _TableLine(
            icon: rows[i].icon,
            label: rows[i].label,
            free: _ValueView(value: rows[i].free, plutonium: false),
            plutonium: _ValueView(value: rows[i].plutonium, plutonium: true),
            last: i == rows.length - 1,
          ),
      ],
    );
  }
}

class _TableLine extends StatelessWidget {
  const _TableLine({
    required this.label,
    required this.free,
    required this.plutonium,
    this.icon,
    this.header = false,
    this.last = false,
  });

  final String label;
  final Widget free;
  final Widget plutonium;
  final IconData? icon;
  final bool header;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: last
            ? null
            : const Border(bottom: BorderSide(color: PlutoniumStoreStyle.line)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: header
                ? Text(
                    label,
                    style: context.textStyles.label.copyWith(
                      color: PlutoniumStoreStyle.inkMuted,
                    ),
                  )
                : Row(
                    children: [
                      if (icon != null) ...[
                        PhosphorIcon(
                          icon!,
                          size: 22,
                          color: PlutoniumStoreStyle.accent,
                        ),
                        const SizedBox(width: 14),
                      ],
                      Expanded(
                        child: Text(
                          label,
                          style: context.textStyles.label.copyWith(
                            color: PlutoniumStoreStyle.ink,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(flex: 3, child: Center(child: free)),
          Expanded(flex: 3, child: Center(child: plutonium)),
        ],
      ),
    );
  }
}

class _ValueView extends StatelessWidget {
  const _ValueView({required this.value, required this.plutonium});

  final _Value value;
  final bool plutonium;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return switch (value) {
      _Text(:final String text) => Text(
        text,
        textAlign: TextAlign.center,
        style: context.textStyles.bodySmall.copyWith(
          color: plutonium
              ? PlutoniumStoreStyle.ink
              : PlutoniumStoreStyle.inkMuted,
        ),
      ),
      _Mark(:final bool on) => Semantics(
        label: on
            ? l10n.storePlutoniumAvailable
            : l10n.storePlutoniumNotAvailable,
        child: PhosphorIcon(
          on ? PhosphorIconsBold.check : PhosphorIconsBold.x,
          size: 18,
          color: on && plutonium
              ? PlutoniumStoreStyle.accent
              : on
              ? PlutoniumStoreStyle.inkMuted
              : PlutoniumStoreStyle.inkFaint,
        ),
      ),
    };
  }
}
