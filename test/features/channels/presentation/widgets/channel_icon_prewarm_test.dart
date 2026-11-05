import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('loads channel icons only after the splash reveal finishes', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(splashRevealCompleteProvider.notifier).reset();

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: cachedFluxerTheme(
            colorTheme: ThemePreferenceState().darkColorTheme,
          ),
          home: const ChannelIconPrewarm(),
        ),
      ),
    );

    expect(find.byType(SvgPicture, skipOffstage: false), findsNothing);

    container.read(splashRevealCompleteProvider.notifier).complete();
    await tester.pump();

    expect(find.byType(SvgPicture, skipOffstage: false), findsWidgets);
  });
}
