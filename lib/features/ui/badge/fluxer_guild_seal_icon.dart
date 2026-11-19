import 'dart:ui' show ImageFilter;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/material_ui.dart';

enum FluxerGuildSealKind { verified, partnered, discoverable }

const String _sealPath =
    'M240 128C240 138.44 232.49 146.27 225.86 153.18C222.09 157.12 218.19 161.18 216.72 164.75C215.36 168.02 215.28 173.44 215.2 178.69C215.05 188.45 214.89 199.51 207.2 207.2C199.51 214.89 188.45 215.05 178.69 215.2C173.44 215.28 168.02 215.36 164.75 216.72C161.18 218.19 157.12 222.09 153.18 225.86C146.27 232.49 138.44 240 128 240C117.56 240 109.73 232.49 102.82 225.86C98.88 222.09 94.82 218.19 91.25 216.72C87.98 215.36 82.56 215.28 77.31 215.2C67.55 215.05 56.49 214.89 48.8 207.2C41.11 199.51 40.95 188.45 40.8 178.69C40.72 173.44 40.64 168.02 39.28 164.75C37.81 161.18 33.91 157.12 30.14 153.18C23.51 146.27 16 138.44 16 128C16 117.56 23.51 109.73 30.14 102.82C33.91 98.88 37.81 94.82 39.28 91.25C40.64 87.98 40.72 82.56 40.8 77.31C40.95 67.55 41.11 56.49 48.8 48.8C56.49 41.11 67.55 40.95 77.31 40.8C82.56 40.72 87.98 40.64 91.25 39.28C94.82 37.81 98.88 33.91 102.82 30.14C109.73 23.51 117.56 16 128 16C138.44 16 146.27 23.51 153.18 30.14C157.12 33.91 161.18 37.81 164.75 39.28C168.02 40.64 173.44 40.72 178.69 40.8C188.45 40.95 199.51 41.11 207.2 48.8C214.89 56.49 215.05 67.55 215.2 77.31C215.28 82.56 215.36 87.98 216.72 91.25C218.19 94.82 222.09 98.88 225.86 102.82C232.49 109.73 240 117.56 240 128Z';

const String _verifiedCheckPath =
    'M185.655 109.455L121.455 173.655C119.955 175.154 117.921 175.996 115.8 175.996C113.679 175.996 111.645 175.154 110.145 173.655L74.3349 137.655C72.8373 136.155 71.9961 134.122 71.9961 132.003C71.9961 129.883 72.8373 127.85 74.3349 126.35L84.3349 116.35C85.8342 114.857 87.864 114.019 89.9799 114.019C92.0958 114.019 94.1256 114.857 95.6249 116.35L116 136.11L164.38 88.325C165.879 86.8304 167.91 85.9912 170.027 85.9912C172.145 85.9912 174.175 86.8304 175.675 88.325L185.65 98.095C186.4 98.8384 186.996 99.7229 187.402 100.698C187.809 101.672 188.018 102.718 188.019 103.774C188.019 104.83 187.811 105.876 187.405 106.851C186.999 107.826 186.404 108.711 185.655 109.455Z';

const String _partneredLoopPath =
    'M112.732 144.785L110.823 146.945C106.987 150.791 102.1 153.41 96.7796 154.471C91.4591 155.533 85.9441 154.988 80.9322 152.907C75.9203 150.826 71.6365 147.301 68.6226 142.778C65.6087 138.256 64 132.939 64 127.5C64 122.061 65.6087 116.744 68.6226 112.222C71.6365 107.699 75.9203 104.175 80.9322 102.093C85.9441 100.012 91.4591 99.4673 96.7796 100.529C102.1 101.59 106.987 104.209 110.823 108.055L145.177 146.945C149.013 150.791 153.9 153.41 159.22 154.471C164.541 155.533 170.056 154.988 175.068 152.907C180.08 150.826 184.363 147.301 187.377 142.778C190.391 138.256 192 132.939 192 127.5C192 122.061 190.391 116.744 187.377 112.222C184.363 107.699 180.08 104.175 175.068 102.093C170.056 100.012 164.541 99.4673 159.22 100.529C153.9 101.59 149.013 104.209 145.177 108.055L143.268 110.215';

const String _discoverableHousePath =
    'M184 168H176V132L177.17 133.17C177.922 133.921 178.941 134.342 180.004 134.341C181.066 134.34 182.084 133.917 182.835 133.165C183.586 132.413 184.007 131.394 184.006 130.332C184.005 129.269 183.582 128.251 182.83 127.5L133.655 78.3401C132.155 76.8409 130.121 75.9988 128 75.9988C125.879 75.9988 123.845 76.8409 122.345 78.3401L73.17 127.5C72.4201 128.251 71.9991 129.268 71.9995 130.329C72 131.39 72.4219 132.408 73.1725 133.158C73.9231 133.907 74.9408 134.328 76.0018 134.328C77.0628 134.328 78.0801 133.906 78.83 133.155L80 132V168H72C70.9391 168 69.9217 168.421 69.1716 169.172C68.4214 169.922 68 170.939 68 172C68 173.061 68.4214 174.078 69.1716 174.828C69.9217 175.579 70.9391 176 72 176H184C185.061 176 186.078 175.579 186.828 174.828C187.579 174.078 188 173.061 188 172C188 170.939 187.579 169.922 186.828 169.172C186.078 168.421 185.061 168 184 168ZM140 168H116V144C116 143.47 116.211 142.961 116.586 142.586C116.961 142.211 117.47 142 118 142H138C138.53 142 139.039 142.211 139.414 142.586C139.789 142.961 140 143.47 140 144V168Z';

class FluxerGuildSealIcon extends StatelessWidget {
  const FluxerGuildSealIcon({
    required this.kind,
    required this.sealColor,
    required this.iconColor,
    this.size = 20,
    this.shadows,
    super.key,
  });

  final FluxerGuildSealKind kind;
  final Color sealColor;
  final Color iconColor;
  final double size;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final Widget icon = _svg(sealColor, iconColor);
    final List<Shadow> current = shadows ?? const <Shadow>[];
    if (current.isEmpty) {
      return icon;
    }
    return SizedBox.square(
      dimension: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          for (final Shadow shadow in current)
            Positioned.fill(
              child: Transform.translate(
                offset: shadow.offset,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: shadow.blurSigma,
                    sigmaY: shadow.blurSigma,
                  ),
                  child: _svg(shadow.color, shadow.color),
                ),
              ),
            ),
          Positioned.fill(child: icon),
        ],
      ),
    );
  }

  Widget _svg(Color seal, Color glyph) =>
      SvgPicture.string(_buildSvg(seal, glyph), width: size, height: size);

  String _buildSvg(Color seal, Color glyph) {
    final String glyphElement = switch (kind) {
      FluxerGuildSealKind.verified =>
        '<path d="$_verifiedCheckPath" ${_fill(glyph)}/>',
      FluxerGuildSealKind.partnered =>
        '<path d="$_partneredLoopPath" fill="none" ${_stroke(glyph)} '
            'stroke-width="16" stroke-linecap="round" '
            'stroke-linejoin="round"/>',
      FluxerGuildSealKind.discoverable =>
        '<path d="$_discoverableHousePath" ${_fill(glyph)}/>',
    };
    return '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" '
        'fill="none"><path d="$_sealPath" ${_fill(seal)}/>$glyphElement</svg>';
  }

  static String _fill(Color color) =>
      'fill="${_hex(color)}" fill-opacity="${_opacity(color)}"';

  static String _stroke(Color color) =>
      'stroke="${_hex(color)}" stroke-opacity="${_opacity(color)}"';

  static String _hex(Color color) {
    final int rgb = color.toARGB32() & 0xFFFFFF;
    return '#${rgb.toRadixString(16).padLeft(6, '0')}';
  }

  static String _opacity(Color color) => color.a.toStringAsFixed(3);
}
