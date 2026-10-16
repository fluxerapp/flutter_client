import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('applies horizontal padding to both sides', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      buildTestApp(
        PickerSearchInput(
          controller: controller,
          hintText: 'Search GIFs',
          horizontalPadding: 20,
        ),
      ),
    );

    final hasSymmetricPadding = tester
        .widgetList<Padding>(find.byType(Padding))
        .any(
          (padding) =>
              padding.padding ==
              const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
        );

    expect(hasSymmetricPadding, isTrue);
  });

  testWidgets('enforces the configured max length', (tester) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      buildTestApp(
        PickerSearchInput(
          controller: controller,
          hintText: 'Search GIFs',
          maxLength: 3,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'abcdef');
    await tester.pump();

    expect(controller.text, 'abc');
  });

  testWidgets('does not autofocus inside bottom sheets', (tester) async {
    await tester.pumpWidget(
      buildTestApp(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                unawaited(
                  FluxerBottomSheet.show(
                    context,
                    builder: (context, close) {
                      return const PickerSearchInput.inline(
                        hintText: 'Search',
                        autofocus: true,
                      );
                    },
                  ),
                );
              },
              child: const Text('Open'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    final TextField field = tester.widget(find.byType(TextField));
    expect(field.autofocus, isFalse);
    expect(field.focusNode?.hasFocus, isFalse);
  });
}
