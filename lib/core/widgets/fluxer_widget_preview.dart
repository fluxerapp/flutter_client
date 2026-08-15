import 'package:flutter/widget_previews.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

final class FluxerWidgetPreview extends Preview {
  const FluxerWidgetPreview({
    super.name,
    super.group,
    super.size,
    super.textScaleFactor,
    super.brightness,
    super.localizations,
    super.wrapper = _defaultWrapper,
  });

  static Widget _defaultWrapper(Widget child) {
    return _PreviewAppWrapper(child: child);
  }
}

class _PreviewAppWrapper extends StatelessWidget {
  const _PreviewAppWrapper({required this.child});

  final Widget child;

  static final FluxerLayoutTheme _layoutTheme = FluxerLayoutTheme.scaled();
  static final FluxerColorTheme _colorTheme = buildDarkColorTheme();
  static final FluxerTextTheme _textTheme = FluxerTextTheme.fromColors(
    _colorTheme,
  );
  static final ThemeData _theme = buildFluxerTheme(
    colorTheme: _colorTheme,
    textTheme: _textTheme,
    layoutTheme: _layoutTheme,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluxer',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: _theme,
      home: Scaffold(body: Center(child: child)),
    );
  }
}
