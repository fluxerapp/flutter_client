import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
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
    home: Scaffold(body: child),
  );
}

void useMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

void main() {
  group('FluxerModal', () {
    testWidgets('shows title and body content', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerModal.show(
                      context,
                      title: 'Modal Title',
                      builder: (context, close) {
                        return const Text('Modal Body');
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

      expect(find.text('Modal Title'), findsOneWidget);
      expect(find.text('Modal Body'), findsOneWidget);
    });

    testWidgets('builder receives working close callback', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerModal.show(
                      context,
                      title: 'Closeable',
                      builder: (context, close) {
                        return ElevatedButton(
                          onPressed: close,
                          child: const Text('Close Me'),
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

      expect(find.text('Closeable'), findsOneWidget);

      await tester.tap(find.text('Close Me'));
      await tester.pumpAndSettle();

      expect(find.text('Closeable'), findsNothing);
    });

    testWidgets(
      'uses mobile fullscreen treatment by default on narrow screens',
      (tester) async {
        useMobileSurface(tester);

        await tester.pumpWidget(
          buildTestApp(
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    unawaited(
                      FluxerModal.show(
                        context,
                        title: 'Mobile Modal',
                        builder: (context, close) {
                          return const Text('Body');
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

        expect(find.byType(Dialog), findsNothing);
        expect(find.text('Mobile Modal'), findsOneWidget);
      },
    );

    testWidgets('supports centered mobile dialogs with description and back', (
      tester,
    ) async {
      useMobileSurface(tester);
      var backPressed = false;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerModal.show(
                      context,
                      title: 'Centered Modal',
                      description: 'Helpful details',
                      centered: true,
                      onBack: () => backPressed = true,
                      builder: (context, close) {
                        return const Text('Body');
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

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.text('Helpful details'), findsOneWidget);

      await tester.tap(find.byIcon(PhosphorIconsBold.caretLeft));
      await tester.pump();

      expect(backPressed, isTrue);
    });

    testWidgets('android back dismisses the modal', (tester) async {
      useMobileSurface(tester);

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerModal.show(
                      context,
                      title: 'Dismissible Modal',
                      builder: (context, close) {
                        return const Text('Body');
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

      expect(find.text('Dismissible Modal'), findsOneWidget);

      final bool handled = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(handled, isTrue);
      expect(find.text('Dismissible Modal'), findsNothing);
    });

    testWidgets('moves centered dialog above keyboard when visible', (
      tester,
    ) async {
      useMobileSurface(tester);

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerModal.show(
                      context,
                      title: 'Keyboard Modal',
                      centered: true,
                      builder: (context, close) {
                        return const TextField(
                          autofocus: true,
                          decoration: InputDecoration(labelText: 'Name'),
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

      tester.view.viewInsets = const FakeViewPadding(bottom: 300);
      addTearDown(tester.view.resetViewInsets);
      await tester.pumpAndSettle();

      final Finder alignFinder = find.byWidgetPredicate(
        (Widget widget) =>
            widget is Align && widget.alignment == Alignment.bottomCenter,
      );
      expect(alignFinder, findsOneWidget);

      final Rect dialogRect = tester.getRect(find.byType(Dialog));
      expect(
        dialogRect.bottom,
        lessThanOrEqualTo(tester.view.physicalSize.height - 300),
      );
    });

    testWidgets('android back invokes onBack instead of dismissing', (
      tester,
    ) async {
      useMobileSurface(tester);
      var backPressed = false;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerModal.show(
                      context,
                      title: 'Back Modal',
                      onBack: () => backPressed = true,
                      builder: (context, close) {
                        return const Text('Body');
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

      final bool handled = await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(handled, isTrue);
      expect(backPressed, isTrue);
      expect(find.text('Back Modal'), findsOneWidget);
    });
  });

  group('FluxerConfirmModal', () {
    testWidgets('shows description and both buttons', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerConfirmModal.show(
                      context,
                      title: 'Delete Item?',
                      description: 'This action cannot be undone.',
                      confirmLabel: 'Delete',
                      isDanger: true,
                      onConfirm: () {},
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

      expect(find.text('Delete Item?'), findsOneWidget);
      expect(find.text('This action cannot be undone.'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('calls onConfirm when confirm button is tapped', (
      tester,
    ) async {
      var confirmed = false;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    FluxerConfirmModal.show(
                      context,
                      title: 'Confirm Action',
                      description: 'Are you sure?',
                      onConfirm: () => confirmed = true,
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

      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(confirmed, isTrue);
    });
  });
}
