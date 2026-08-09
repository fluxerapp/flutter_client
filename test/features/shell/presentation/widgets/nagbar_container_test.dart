import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbar_container.dart';
import 'package:fluxer_app/features/shell/providers/visible_nagbars_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod/src/framework.dart' show Override;
import '../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('NagbarContainer renders unclaimed account nagbar', (
    WidgetTester tester,
  ) async {
    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          visibleNagbarsProvider.overrideWith(
            (Ref ref) => <NagbarState>[
              const NagbarState(
                type: NagbarType.unclaimedAccount,
                priority: -4,
                visible: true,
                dismissible: false,
              ),
            ],
          ),
        ],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(body: NagbarContainer()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('claim your account'), findsOneWidget);
  });
}
