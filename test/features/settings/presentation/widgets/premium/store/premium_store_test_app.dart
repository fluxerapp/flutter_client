import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_backdrop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_comparison.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_showcase.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../../helpers/test_l10n.dart';

const Key premiumStoreTestBarKey = Key('premium-store-test-bar');

Widget premiumStoreTestApp({
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
    home: ProviderScope(
      overrides: [instanceRuntimeConfigOverride()],
      child: Scaffold(
        body: PremiumStoreBackdrop(
          bar: const SizedBox(key: premiumStoreTestBarKey, height: 48),
          child: SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PremiumStoreShowcase(),
                SizedBox(height: 16),
                PremiumStoreComparison(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
