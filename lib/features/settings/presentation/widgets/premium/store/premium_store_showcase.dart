import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreShowcase extends ConsumerWidget {
  const PremiumStoreShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool showArt = !selfHosted;
    final List<_ShowcaseRow> rows = [
      _ShowcaseRow(
        title: l10n.storePlutoniumEmojiTitle,
        body: l10n.storePlutoniumEmojiBody,
        asset: 'assets/images/plutonium/perk-expressions.webp',
        aspectRatio: 549 / 468,
        overlays: const [
          _OverlaySpec(
            asset: 'assets/images/plutonium/perks-emoji-catvibe.webp',
            left: 0.6522,
            top: 0.11241,
            width: 0.04372,
            height: 0.05128,
          ),
          _OverlaySpec(
            asset: 'assets/images/plutonium/perks-emoji-catwave.webp',
            left: 0.14936,
            top: 0.31197,
            width: 0.08743,
            height: 0.10256,
          ),
          _OverlaySpec(
            asset: 'assets/images/plutonium/perks-sticker-feel-that.webp',
            left: 0.14936,
            top: 0.5235,
            width: 0.29144,
            height: 0.34188,
          ),
        ],
      ),
      _ShowcaseRow(
        title: l10n.storePlutoniumProfileTitle,
        body: l10n.storePlutoniumProfileBody,
        asset: 'assets/images/plutonium/perk-profile.webp',
        aspectRatio: 662 / 407,
        profileOverlay: true,
      ),
      _ShowcaseRow(
        title: l10n.storePlutoniumStreamTitle,
        body: l10n.storePlutoniumStreamBody,
        asset: 'assets/images/plutonium/perk-stream.webp',
        aspectRatio: 588 / 343,
      ),
      _ShowcaseRow(
        title: l10n.storePlutoniumFilesTitle,
        body: l10n.storePlutoniumFilesBody,
        asset: 'assets/images/plutonium/perk-upload.webp',
        aspectRatio: 549 / 362,
      ),
    ];

    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: 56),
          _ShowcasePerkRow(row: rows[i], flipped: i.isOdd, showArt: showArt),
        ],
      ],
    );
  }
}

class _ShowcaseRow {
  const _ShowcaseRow({
    required this.title,
    required this.body,
    required this.asset,
    required this.aspectRatio,
    this.overlays = const [],
    this.profileOverlay = false,
  });

  final String title;
  final String body;
  final String asset;
  final double aspectRatio;
  final List<_OverlaySpec> overlays;
  final bool profileOverlay;
}

class _OverlaySpec {
  const _OverlaySpec({
    required this.asset,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  final String asset;
  final double left;
  final double top;
  final double width;
  final double height;
}

class _ShowcasePerkRow extends StatelessWidget {
  const _ShowcasePerkRow({
    required this.row,
    required this.flipped,
    required this.showArt,
  });

  final _ShowcaseRow row;
  final bool flipped;
  final bool showArt;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final textStyles = context.textStyles;
    final Widget copy = Column(
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
    if (!showArt) {
      return copy;
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool wide = constraints.maxWidth >= 896;
        final Widget art = _TiltedArt(
          reverse: flipped,
          child: _PerkArt(
            asset: row.asset,
            aspectRatio: row.aspectRatio,
            overlays: row.overlays,
            profileOverlay: row.profileOverlay,
          ),
        );
        if (!wide) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [art, const SizedBox(height: 32), copy],
          );
        }
        final Widget leading = flipped ? copy : art;
        final Widget trailing = flipped ? art : copy;
        return Row(
          children: [
            Expanded(child: leading),
            const SizedBox(width: 40),
            Expanded(child: trailing),
          ],
        );
      },
    );
  }
}

class _TiltedArt extends StatelessWidget {
  const _TiltedArt({required this.child, required this.reverse});

  final Widget child;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final double angle = reverse ? 0.026 : -0.026;
    return Transform.rotate(angle: angle, child: child);
  }
}

class _PerkArt extends StatelessWidget {
  const _PerkArt({
    required this.asset,
    required this.aspectRatio,
    required this.overlays,
    required this.profileOverlay,
  });

  final String asset;
  final double aspectRatio;
  final List<_OverlaySpec> overlays;
  final bool profileOverlay;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 576),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double w = constraints.maxWidth;
              final double h = constraints.maxHeight;
              return Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    asset,
                    fit: BoxFit.contain,
                    excludeFromSemantics: true,
                  ),
                  for (final _OverlaySpec overlay in overlays)
                    Positioned(
                      left: overlay.left * w,
                      top: overlay.top * h,
                      width: overlay.width * w,
                      height: overlay.height * h,
                      child: Image.asset(
                        overlay.asset,
                        fit: BoxFit.contain,
                        excludeFromSemantics: true,
                      ),
                    ),
                  if (profileOverlay) _ProfileOverlay(width: w, height: h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProfileOverlay extends StatelessWidget {
  const _ProfileOverlay({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: width * 0.522,
          top: height * 0.035,
          width: width * 0.454,
          height: height * 0.225,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            child: Image.asset(
              'assets/images/plutonium/perks-banner-lsf.webp',
              fit: BoxFit.cover,
              excludeFromSemantics: true,
            ),
          ),
        ),
        Positioned(
          left: width * 0.522,
          top: height * 0.159,
          width: width * 0.145,
          height: width * 0.145,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF0C0B0E), width: 3),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/plutonium/perks-avatar-lsf.webp',
                fit: BoxFit.cover,
                excludeFromSemantics: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
