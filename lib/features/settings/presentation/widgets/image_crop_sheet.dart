import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_layout.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_painters.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:material_ui/material_ui.dart';

enum CropMaskShape { circle, rectangle }

const _landscapeControlsWidth = 280.0;

Future<Uint8List?> showImageCropSheet(
  BuildContext context, {
  required Uint8List imageBytes,
  required double aspectRatio,
  required String title,
  CropMaskShape maskShape = CropMaskShape.rectangle,
}) async {
  final imageSize = await imageCropDecodeImageSize(imageBytes);
  if (!context.mounted) {
    return null;
  }
  return Navigator.of(context, rootNavigator: true).push<Uint8List?>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => _ImageCropDialog(
        imageBytes: imageBytes,
        imageSize: imageSize,
        aspectRatio: aspectRatio,
        maskShape: maskShape,
        title: title,
      ),
    ),
  );
}

class _ImageCropDialog extends StatelessWidget {
  const _ImageCropDialog({
    required this.imageBytes,
    required this.imageSize,
    required this.aspectRatio,
    required this.maskShape,
    required this.title,
  });

  final Uint8List imageBytes;
  final Size? imageSize;
  final double aspectRatio;
  final CropMaskShape maskShape;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: colors.backgroundPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: const CloseButton(),
        title: Text(title),
      ),
      body: _ImageCropContent(
        imageBytes: imageBytes,
        imageSize: imageSize,
        aspectRatio: aspectRatio,
        maskShape: maskShape,
      ),
    );
  }
}

class _ImageCropContent extends ConsumerStatefulWidget {
  const _ImageCropContent({
    required this.imageBytes,
    required this.imageSize,
    required this.aspectRatio,
    required this.maskShape,
  });

  final Uint8List imageBytes;
  final Size? imageSize;
  final double aspectRatio;
  final CropMaskShape maskShape;

  @override
  ConsumerState<_ImageCropContent> createState() => _ImageCropContentState();
}

class _ImageCropContentState extends ConsumerState<_ImageCropContent> {
  final _cropController = CropController();
  var _isCropping = false;
  late final bool _isTouchMode;
  Size? _viewportSize;

  @override
  void initState() {
    super.initState();
    _isTouchMode = ref.read(inputModalityProvider);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final isCircle = widget.maskShape == CropMaskShape.circle;
    final frameBorderColor = colors.textPrimary.withValues(alpha: 0.9);
    final frameGuideColor = colors.textPrimary.withValues(alpha: 0.18);

    return LayoutBuilder(
      builder: (context, constraints) {
        final useSideControls = constraints.maxWidth > constraints.maxHeight;
        final controls = _buildControls(
          context,
          l10n,
          useSideControls: useSideControls,
        );
        final cropArea = _buildCropArea(
          isCircle: isCircle,
          frameBorderColor: frameBorderColor,
          frameGuideColor: frameGuideColor,
          backgroundColor: colors.backgroundPrimary,
          brandPrimary: colors.brandPrimary,
          textPrimary: colors.textPrimary,
        );

        if (useSideControls) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: cropArea),
              SizedBox(width: _landscapeControlsWidth, child: controls),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: cropArea),
            controls,
          ],
        );
      },
    );
  }

  Widget _buildCropArea({
    required bool isCircle,
    required Color frameBorderColor,
    required Color frameGuideColor,
    required Color backgroundColor,
    required Color brandPrimary,
    required Color textPrimary,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewportSize = constraints.biggest;
        return SizedBox.expand(
          child: Crop(
            key: ValueKey(
              '${constraints.maxWidth.round()}x${constraints.maxHeight.round()}',
            ),
            controller: _cropController,
            image: widget.imageBytes,
            aspectRatio: widget.aspectRatio,
            withCircleUi: isCircle,
            interactive: _isTouchMode,
            fixCropRect: _isTouchMode,
            baseColor: backgroundColor,
            maskColor: backgroundColor.withValues(alpha: 0.7),
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
                    color: textPrimary,
                  ),
            willUpdateScale: _isTouchMode ? _willUpdateScale : null,
            progressIndicator: Center(
              child: CircularProgressIndicator(color: brandPrimary),
            ),
            onCropped: _handleCropped,
          ),
        );
      },
    );
  }

  Widget _buildControls(
    BuildContext context,
    FluxerLocalizations l10n, {
    required bool useSideControls,
  }) {
    final layout = context.layout;
    final colors = context.colors;
    final bottomInset = FluxerBottomSheet.systemBottomInsetOf(context);
    final endInset = useSideControls
        ? FluxerBottomSheet.systemEndInsetOf(context)
        : 0.0;

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: layout.s4,
        top: layout.s3,
        end: layout.s4 + endInset,
        bottom: layout.s2 + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _isTouchMode ? l10n.cropTouchHint : l10n.cropMouseHint,
            textAlign: TextAlign.center,
            style: context.textStyles.smallText.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          Row(
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
        ],
      ),
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
    if (widget.imageSize == null || _viewportSize == null) {
      return true;
    }
    final maxScale = imageCropMaxScaleFor(widget.imageSize!, _viewportSize!);
    return imageCropScaleAllowed(nextScale, maxScale);
  }
}
