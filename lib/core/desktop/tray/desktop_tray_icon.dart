import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/desktop/windows/windows_registry.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const double _kGlyphCutoutStart = 0.1;
const double _kGlyphCutoutEnd = 0.5;
const int _kMinGlyphContrast = 32;
const List<int> _kWindowsIconSizes = <int>[16, 20, 24, 32, 40, 48, 64];

String _trayChannel() =>
    AppBuildConfig.environment == AppBuildEnvironment.canary
    ? 'canary'
    : 'stable';

String _trayAssetDirectory() => 'assets/images/tray/${_trayChannel()}';

String desktopTrayIconAsset() {
  final String directory = _trayAssetDirectory();
  if (Platform.isMacOS) {
    return '$directory/FluxerTrayTemplate.png';
  }
  if (Platform.isWindows) {
    return '$directory/icon.ico';
  }
  return '$directory/256x256.png';
}

enum _TrayGlyphTone { white, black }

_TrayGlyphTone _autoTone() {
  if (!Platform.isWindows) {
    return _TrayGlyphTone.white;
  }
  final int? lightTaskbar = readCurrentUserRegistryDword(
    r'Software\Microsoft\Windows\CurrentVersion\Themes\Personalize',
    'SystemUsesLightTheme',
  );
  return lightTaskbar == 1 ? _TrayGlyphTone.black : _TrayGlyphTone.white;
}

Future<String> resolveDesktopTrayIcon(
  DesktopBehaviorPreferencesState preferences,
) async {
  if (Platform.isMacOS || preferences.coloredTrayIcon) {
    return desktopTrayIconAsset();
  }
  final _TrayGlyphTone tone = switch (preferences.monochromeTrayIconTone) {
    MonochromeTrayIconTone.white => _TrayGlyphTone.white,
    MonochromeTrayIconTone.black => _TrayGlyphTone.black,
    MonochromeTrayIconTone.auto => _autoTone(),
  };
  try {
    return await _renderMonochromeIcon(tone);
  } on Object {
    return desktopTrayIconAsset();
  }
}

Future<String> _renderMonochromeIcon(_TrayGlyphTone tone) async {
  final Directory support = await getApplicationSupportDirectory();
  final String extension = Platform.isWindows ? 'ico' : 'png';
  final File target = File(
    p.join(
      support.path,
      'tray',
      'tray-${_trayChannel()}-${tone.name}.$extension',
    ),
  );
  final ByteData data = await rootBundle.load(
    '${_trayAssetDirectory()}/256x256.png',
  );
  final img.Image? source = img.decodePng(data.buffer.asUint8List());
  if (source == null) {
    return desktopTrayIconAsset();
  }
  final img.Image glyph = _paintMonochromeGlyph(
    source.convert(numChannels: 4),
    tone,
  );
  final Uint8List bytes = Platform.isWindows
      ? _encodeWindowsIcon(glyph)
      : img.encodePng(glyph);
  await target.parent.create(recursive: true);
  await target.writeAsBytes(bytes, flush: true);
  return target.path;
}

Uint8List _encodeWindowsIcon(img.Image glyph) {
  final List<img.Image> frames = <img.Image>[
    for (final int size in _kWindowsIconSizes)
      img.copyResize(
        glyph,
        width: size,
        height: size,
        interpolation: img.Interpolation.average,
      ),
  ];
  final img.Image icon = frames.first;
  for (final img.Image frame in frames.skip(1)) {
    icon.addFrame(frame);
  }
  return img.encodeIco(icon);
}

double _luminance(img.Pixel pixel) =>
    0.0722 * pixel.b + 0.7152 * pixel.g + 0.2126 * pixel.r;

img.Image _paintMonochromeGlyph(img.Image image, _TrayGlyphTone tone) {
  final List<int> histogram = List<int>.filled(256, 0);
  int opaque = 0;
  double highlight = 0;
  for (final img.Pixel pixel in image) {
    final double luminance = _luminance(pixel);
    if (pixel.a >= 128 && luminance > highlight) {
      highlight = luminance;
    }
    if (pixel.a == 255) {
      histogram[luminance.round().clamp(0, 255)]++;
      opaque++;
    }
  }
  int? body;
  int seen = 0;
  for (int level = 0; level < 256 && opaque > 0; level++) {
    seen += histogram[level];
    if (seen * 2 >= opaque) {
      body = level;
      break;
    }
  }
  final double contrast = body == null ? 0 : highlight - body;
  final int glyph = tone == _TrayGlyphTone.white ? 0xff : 0x1c;
  for (final img.Pixel pixel in image) {
    double alpha = pixel.a.toDouble();
    if (body != null && contrast >= _kMinGlyphContrast) {
      final double position = (_luminance(pixel) - body) / contrast;
      final double cutout =
          ((position - _kGlyphCutoutStart) /
                  (_kGlyphCutoutEnd - _kGlyphCutoutStart))
              .clamp(0.0, 1.0);
      alpha = alpha * (1 - cutout);
    }
    pixel
      ..r = glyph
      ..g = glyph
      ..b = glyph
      ..a = alpha.round();
  }
  return image;
}
