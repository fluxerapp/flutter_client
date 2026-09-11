import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/chat_wallpaper_provider.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatWallpaperSection extends ConsumerWidget {
  const ChatWallpaperSection({super.key});

  static const double _cardWidth = 90;
  static const double _cardHeight = 148;
  static const double _cardRadius = 22;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ChatWallpaperSnapshot snapshot = ref.watch(chatWallpaperProvider);
    final ChatWallpaperState selection = snapshot.selection;
    final layout = context.layout;
    final ChatWallpaper notifier = ref.read(chatWallpaperProvider.notifier);

    Future<void> select({
      required ChatWallpaperKind kind,
      String? id,
      bool clearId = false,
    }) {
      return notifier.setSelection(
        selection.copyWith(kind: kind, id: id, clearId: clearId),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: _cardHeight,
          child: ListView(
            scrollDirection: Axis.horizontal,
            primary: false,
            padding: EdgeInsets.only(right: layout.s2),
            children: <Widget>[
              _WallpaperPresetCard(
                label: l10n.lookAndFeelChatWallpaperDefaultLabel,
                selected: selection.kind == ChatWallpaperKind.defaultTheme,
                dim: selection.dim,
                applyDim: false,
                onTap: () => unawaited(
                  select(kind: ChatWallpaperKind.defaultTheme, clearId: true),
                ),
                child: const _DefaultWallpaperPreview(),
              ),
              SizedBox(width: layout.s3),
              _WallpaperPresetCard(
                label: l10n.lookAndFeelChatWallpaperCustomLabel,
                selected: selection.kind == ChatWallpaperKind.custom,
                dim: selection.dim,
                footer: _CustomWallpaperFooter(
                  hasImage: snapshot.hasCustomImage,
                  showIcon: selection.kind != ChatWallpaperKind.custom,
                ),
                onTap: () => unawaited(_onCustomTap(context, ref, snapshot)),
                child: _CustomWallpaperPreview(snapshot: snapshot),
              ),
              for (final ChatWallpaperColorPreset preset
                  in ChatWallpaperCatalog.colors) ...<Widget>[
                SizedBox(width: layout.s3),
                _WallpaperPresetCard(
                  label: l10n.lookAndFeelChatWallpaperColorLabel(preset.id),
                  selected:
                      selection.kind == ChatWallpaperKind.color &&
                      selection.id == preset.id,
                  dim: selection.dim,
                  onTap: () => unawaited(
                    select(kind: ChatWallpaperKind.color, id: preset.id),
                  ),
                  child: ColoredBox(color: preset.color),
                ),
              ],
              for (final ChatWallpaperGradientPreset preset
                  in ChatWallpaperCatalog.gradients) ...<Widget>[
                SizedBox(width: layout.s3),
                _WallpaperPresetCard(
                  label: l10n.lookAndFeelChatWallpaperGradientLabel(preset.id),
                  selected:
                      selection.kind == ChatWallpaperKind.gradient &&
                      selection.id == preset.id,
                  dim: selection.dim,
                  onTap: () => unawaited(
                    select(kind: ChatWallpaperKind.gradient, id: preset.id),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: preset.begin,
                        end: preset.end,
                        colors: preset.colors,
                      ),
                    ),
                  ),
                ),
              ],
              for (final ChatWallpaperImagePreset preset
                  in ChatWallpaperCatalog.bundledImages) ...<Widget>[
                SizedBox(width: layout.s3),
                _WallpaperPresetCard(
                  label: preset.id,
                  selected:
                      selection.kind == ChatWallpaperKind.preset &&
                      selection.id == preset.id,
                  dim: selection.dim,
                  onTap: () => unawaited(
                    select(kind: ChatWallpaperKind.preset, id: preset.id),
                  ),
                  child: Image(
                    image: AssetImage(preset.assetPath),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: layout.s5),
        Text(
          l10n.lookAndFeelChatWallpaperDimLabel,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        SizedBox(height: layout.s2),
        FluxerSlider(
          defaultValue: ChatWallpaperState.defaultDim * 100,
          value: selection.dim * 100,
          factoryDefaultValue: ChatWallpaperState.defaultDim * 100,
          step: 1,
          semanticLabel: l10n.lookAndFeelChatWallpaperDimLabel,
          onValueRender: (double value) => Text('${value.round()}%'),
          asValueChanges: (double value) {
            notifier.previewDim(value / 100);
          },
          onValueChange: (double value) =>
              unawaited(notifier.setDim(value / 100)),
        ),
      ],
    );
  }

  Future<void> _onCustomTap(
    BuildContext context,
    WidgetRef ref,
    ChatWallpaperSnapshot snapshot,
  ) async {
    if (snapshot.selection.kind != ChatWallpaperKind.custom &&
        snapshot.hasCustomImage) {
      await ref
          .read(chatWallpaperProvider.notifier)
          .setSelection(
            snapshot.selection.copyWith(
              kind: ChatWallpaperKind.custom,
              clearId: true,
            ),
          );
      return;
    }
    final ({Uint8List bytes, String name})? picked =
        await ImageUtils.pickImage();
    if (picked == null) {
      return;
    }
    final bool saved = await ref
        .read(chatWallpaperProvider.notifier)
        .setCustomImage(picked.bytes);
    if (!saved && context.mounted) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(
                context,
              ).lookAndFeelChatWallpaperPickFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }
}

class _WallpaperPresetCard extends StatelessWidget {
  const _WallpaperPresetCard({
    required this.label,
    required this.selected,
    required this.dim,
    required this.onTap,
    required this.child,
    this.footer,
    this.applyDim = true,
  });

  final String label;
  final bool selected;
  final double dim;
  final bool applyDim;
  final VoidCallback onTap;
  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const double radius = ChatWallpaperSection._cardRadius;
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      selected: selected,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> _) {
        return SizedBox(
          width: ChatWallpaperSection._cardWidth,
          height: ChatWallpaperSection._cardHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                child,
                if (applyDim) ColoredBox(color: chatWallpaperDimColor(dim)),
                const _WallpaperChatSkeleton(),
                ?footer,
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(
                        color: selected
                            ? colors.textPrimary
                            : colors.borderColor,
                        width: selected ? 3 : 1,
                      ),
                    ),
                  ),
                ),
                if (selected)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: footer != null ? 32 : 10,
                      ),
                      child: const _SelectionCheck(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DefaultWallpaperPreview extends StatelessWidget {
  const _DefaultWallpaperPreview();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: context.colors.chatBackground);
  }
}

class _CustomWallpaperPreview extends StatelessWidget {
  const _CustomWallpaperPreview({required this.snapshot});

  final ChatWallpaperSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final ImageProvider? image = chatWallpaperCustomImageProvider(snapshot);
    if (image == null) {
      return ColoredBox(color: context.colors.backgroundTertiary);
    }
    return Image(
      image: image,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
    );
  }
}

class _CustomWallpaperFooter extends StatelessWidget {
  const _CustomWallpaperFooter({
    required this.hasImage,
    required this.showIcon,
  });

  final bool hasImage;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (hasImage)
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0x00000000), Color(0xB3000000)],
                  stops: <double>[0.52, 1],
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (showIcon) ...<Widget>[
                    PhosphorIcon(
                      PhosphorIconsRegular.image,
                      size: 16,
                      color: colors.textPrimary,
                    ),
                    const SizedBox(height: 4),
                  ],
                  Text(
                    FluxerLocalizations.of(
                      context,
                    ).lookAndFeelChatWallpaperCustomLabel,
                    textAlign: TextAlign.center,
                    style: context.textStyles.smallText.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WallpaperChatSkeleton extends StatelessWidget {
  const _WallpaperChatSkeleton();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _WallpaperSkeletonGroup(
              usernameWidth: 28,
              lineWidths: <double>[56, 42],
            ),
            SizedBox(height: 12),
            _WallpaperSkeletonGroup(
              usernameWidth: 22,
              lineWidths: <double>[50],
            ),
          ],
        ),
      ),
    );
  }
}

class _WallpaperSkeletonGroup extends StatelessWidget {
  const _WallpaperSkeletonGroup({
    required this.usernameWidth,
    required this.lineWidths,
  });

  final double usernameWidth;
  final List<double> lineWidths;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const _WallpaperSkeletonShape(
          width: 14,
          height: 14,
          shape: BoxShape.circle,
          opacity: 0.45,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _WallpaperSkeletonShape(
                width: usernameWidth,
                height: 6,
                opacity: 0.55,
              ),
              const SizedBox(height: 5),
              for (int i = 0; i < lineWidths.length; i++) ...<Widget>[
                _WallpaperSkeletonShape(
                  width: lineWidths[i],
                  height: 6,
                  opacity: 0.4,
                ),
                if (i < lineWidths.length - 1) const SizedBox(height: 4),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _WallpaperSkeletonShape extends StatelessWidget {
  const _WallpaperSkeletonShape({
    required this.width,
    required this.height,
    required this.opacity,
    this.shape = BoxShape.rectangle,
  });

  final double width;
  final double height;
  final double opacity;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.colors.backgroundModifierAccent,
          shape: shape,
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(999),
        ),
      ),
    );
  }
}

class _SelectionCheck extends StatelessWidget {
  const _SelectionCheck();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: colors.textPrimary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsBold.check,
          size: 12,
          color: colors.backgroundPrimary,
        ),
      ),
    );
  }
}

class ChatWallpaperLocalOnlyButton extends ConsumerWidget {
  const ChatWallpaperLocalOnlyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerTappable(
      semanticLabel: l10n.lookAndFeelChatWallpaperLocalOnlyTooltip,
      onTap: () {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(message: l10n.lookAndFeelChatWallpaperLocalOnlyToast),
            );
      },
      builder: (BuildContext context, Set<WidgetState> states) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: PhosphorIcon(
            PhosphorIconsBold.cloudSlash,
            size: 18,
            color: context.colors.textSecondary,
          ),
        );
      },
    );
  }
}
