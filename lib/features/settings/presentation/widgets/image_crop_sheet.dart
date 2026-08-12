import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_layout.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_painters.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum CropMaskShape { circle, rectangle }

Future<Uint8List?> showImageCropSheet(
  BuildContext context, {
  required Uint8List imageBytes,
  required double aspectRatio,
  required String title,
  CropMaskShape maskShape = CropMaskShape.rectangle,
}) {
  return FluxerBottomSheet.show<Uint8List?>(
    context,
    title: title,
    enableDrag: false,
    builder: (sheetContext, _) => _ImageCropContent(
      imageBytes: imageBytes,
      aspectRatio: aspectRatio,
      maskShape: maskShape,
    ),
  );
}

class _ImageCropContent extends ConsumerStatefulWidget {
  const _ImageCropContent({
    required this.imageBytes,
    required this.aspectRatio,
    required this.maskShape,
  });

  final Uint8List imageBytes;
  final double aspectRatio;
  final CropMaskShape maskShape;

  @override
  ConsumerState<_ImageCropContent> createState() => _ImageCropContentState();
}

class _ImageCropContentState extends ConsumerState<_ImageCropContent> {
  final _cropController = CropController();
  var _isCropping = false;
  late final bool _isTouchMode;
  double? _coverZoomScale;

  @override
  void initState() {
    super.initState();
    _isTouchMode = ref.read(inputModalityProvider);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final isCircle = widget.maskShape == CropMaskShape.circle;
    final frameBorderColor = colors.textPrimary.withValues(alpha: 0.9);
    final frameGuideColor = colors.textPrimary.withValues(alpha: 0.18);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Crop(
            controller: _cropController,
            image: widget.imageBytes,
            aspectRatio: widget.aspectRatio,
            withCircleUi: isCircle,
            interactive: _isTouchMode,
            fixCropRect: _isTouchMode,
            baseColor: colors.backgroundPrimary,
            maskColor: colors.backgroundPrimary.withValues(alpha: 0.7),
            clipBehavior: Clip.none,
            initialRectBuilder: InitialRectBuilder.withBuilder(
              (viewportRect, _) =>
                  computeInitialCropRect(viewportRect, widget.aspectRatio),
            ),
            overlayBuilder: (_, _) => CustomPaint(
              painter: ImageCropFramePainter(
                isCircle: isCircle,
                borderColor: frameBorderColor,
                guideColor: frameGuideColor,
              ),
            ),
            cornerDotBuilder: _isTouchMode
                ? (_, _) => const SizedBox.shrink()
                : (size, alignment) => ImageCropCornerHandle(
                    packageDotSize: size,
                    alignment: alignment,
                    color: colors.textPrimary,
                  ),
            willUpdateScale: _isTouchMode ? _willUpdateScale : null,
            progressIndicator: Center(
              child: CircularProgressIndicator(color: colors.brandPrimary),
            ),
            onCropped: _handleCropped,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(layout.s4, layout.s3, layout.s4, 0),
          child: Text(
            _isTouchMode ? l10n.cropTouchHint : l10n.cropMouseHint,
            textAlign: TextAlign.center,
            style: context.textStyles.smallText.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            layout.s4,
            layout.s4,
            layout.s4,
            layout.s2,
          ),
          child: Row(
            children: [
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: _isCropping ? null : _skip,
                  label: l10n.skip,
                ),
              ),
              SizedBox(width: layout.s3),
              Expanded(
                child: FluxerButton.primary(
                  onPressed: _isCropping ? null : _confirmCrop,
                  label: l10n.crop,
                  isLoading: _isCropping,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleCropped(CropResult result) {
    if (result case CropSuccess(:final croppedImage)) {
      Navigator.of(context).pop(croppedImage);
      return;
    }
    setState(() => _isCropping = false);
  }

  void _skip() => Navigator.of(context).pop(widget.imageBytes);

  void _confirmCrop() {
    setState(() => _isCropping = true);
    _cropController.crop();
  }

  bool _willUpdateScale(double nextScale) {
    _coverZoomScale ??= nextScale;
    return nextScale >= _coverZoomScale! && nextScale <= imageCropMaxZoomScale;
  }
}
