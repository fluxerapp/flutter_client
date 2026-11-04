import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreShowcase extends StatelessWidget {
  const PremiumStoreShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool ios = defaultTargetPlatform == TargetPlatform.iOS;
    final List<_ShowcaseRow> rows = [
      _ShowcaseRow(
        title: l10n.storePlutoniumEmojiTitle,
        body: l10n.storePlutoniumEmojiBody,
      ),
      _ShowcaseRow(
        title: l10n.storePlutoniumProfileTitle,
        body: l10n.storePlutoniumProfileBody,
      ),
      _ShowcaseRow(
        title: ios
            ? l10n.storePlutoniumStreamTitleIos
            : l10n.storePlutoniumStreamTitle,
        body: ios
            ? l10n.storePlutoniumStreamBodyIos
            : l10n.storePlutoniumStreamBody,
      ),
      _ShowcaseRow(
        title: l10n.storePlutoniumFilesTitle,
        body: l10n.storePlutoniumFilesBody,
      ),
    ];

    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: 56),
          _ShowcasePerkRow(row: rows[i]),
        ],
      ],
    );
  }
}

class _ShowcaseRow {
  const _ShowcaseRow({required this.title, required this.body});

  final String title;
  final String body;
}

class _ShowcasePerkRow extends StatelessWidget {
  const _ShowcasePerkRow({required this.row});

  final _ShowcaseRow row;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final textStyles = context.textStyles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          row.title,
          style: textStyles.heading.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            height: 1.14,
            letterSpacing: -0.2,
            color: style.ink,
            shadows: [
              Shadow(color: style.textLedge, offset: const Offset(0, 4)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          row.body,
          style: textStyles.bodyMedium.copyWith(
            fontSize: 17,
            height: 1.55,
            color: style.inkSoft,
          ),
        ),
      ],
    );
  }
}
