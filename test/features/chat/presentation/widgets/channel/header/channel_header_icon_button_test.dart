import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import '../../../../../../helpers/test_l10n.dart';

class _TouchPrimaryModality extends InputModalityNotifier {
  @override
  bool build() => true;
}

void main() {
  testWidgets('uses touch target min size when touch-primary', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          inputModalityProvider.overrideWith(_TouchPrimaryModality.new),
        ],
        child: _buildApp(
          const ChannelHeaderIconButton(
            icon: Icons.star,
            label: 'Favorite',
            onPressed: _noop,
          ),
        ),
      ),
    );
    await tester.pump();

    final SizedBox box = tester.widget<SizedBox>(
      find
          .descendant(
            of: find.byType(ChannelHeaderIconButton),
            matching: find.byType(SizedBox),
          )
          .first,
    );
    expect(box.width, 44);
    expect(box.height, 44);
  });
}

void _noop() {}

Widget _buildApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: Center(child: child)),
  );
}
