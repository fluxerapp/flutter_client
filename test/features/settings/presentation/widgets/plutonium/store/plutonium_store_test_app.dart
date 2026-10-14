import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_backdrop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_comparison.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_highlights.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../../helpers/test_l10n.dart';

const Key plutoniumStoreTestBarKey = Key('plutonium-store-test-bar');

Widget plutoniumStoreTestApp({
  required Brightness brightness,
  required ScrollController controller,
}) {
  final colorTheme = brightness == Brightness.light
      ? buildLightColorTheme()
      : buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
      brightness: brightness,
    ),
    home: Scaffold(
      body: PremiumStoreBackdrop(
        controller: controller,
        bar: const SizedBox(key: plutoniumStoreTestBarKey, height: 48),
        child: SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.all(16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PremiumStoreHighlights(),
              SizedBox(height: 16),
              PremiumStoreComparison(),
            ],
          ),
        ),
      ),
    ),
  );
}
