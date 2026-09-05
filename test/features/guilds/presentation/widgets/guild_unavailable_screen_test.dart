import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_unavailable_screen.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  testWidgets('guild not found uses an outline icon and a single title', (
    tester,
  ) async {
    await tester.pumpWidget(_buildApp(const GuildNotFoundScreen()));

    expect(
      find.text("This is not the community you're looking for."),
      findsOneWidget,
    );
    expect(
      find.text(
        "The community you're looking for may have been deleted or you may not have access to it.",
      ),
      findsOneWidget,
    );
    expect(find.text('Go to home'), findsOneWidget);
    expect(find.byType(FluxerButton), findsOneWidget);

    final PhosphorIcon icon = tester.widget<PhosphorIcon>(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is PhosphorIcon &&
            widget.icon == PhosphorIconsRegular.question,
      ),
    );
    expect(icon.icon, PhosphorIconsRegular.question);
    expect(find.byIcon(PhosphorIconsFill.question), findsNothing);
  });
}

Widget _buildApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: child,
    ),
  );
}
