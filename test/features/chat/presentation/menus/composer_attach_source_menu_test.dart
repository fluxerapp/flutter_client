import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/menus/composer_attach_source_menu.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';
import '../../../../helpers/test_l10n.dart';
import '../../../../helpers/wide_layout_test_sizes.dart';

void _useWideSurface(WidgetTester tester) {
  tester.view.physicalSize = kWideTestViewportSize;
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

Future<Completer<ComposerAttachSource?>> _openMenu(WidgetTester tester) async {
  _useWideSurface(tester);
  final Completer<ComposerAttachSource?> selected =
      Completer<ComposerAttachSource?>();
  await tester.pumpWidget(
    pumpFluxerApp(
      child: Builder(
        builder: (BuildContext context) {
          return TextButton(
            onPressed: () {
              unawaited(
                showComposerAttachSourceMenu(context).then(selected.complete),
              );
            },
            child: const Text('attach'),
          );
        },
      ),
    ),
  );
  await tester.tap(find.text('attach'));
  await tester.pumpAndSettle();
  return selected;
}

void main() {
  testWidgets('shows gallery and file picker actions', (tester) async {
    await _openMenu(tester);

    expect(find.text(testL10n.chatAttachmentSourceGallery), findsOneWidget);
    expect(find.text(testL10n.chatAttachmentSourceBrowse), findsOneWidget);
  });

  testWidgets('returns gallery when that action is chosen', (tester) async {
    final Completer<ComposerAttachSource?> selected = await _openMenu(tester);

    await tester.tap(find.text(testL10n.chatAttachmentSourceGallery));
    await tester.pumpAndSettle();

    expect(await selected.future, ComposerAttachSource.gallery);
  });

  testWidgets('returns files when that action is chosen', (tester) async {
    final Completer<ComposerAttachSource?> selected = await _openMenu(tester);

    await tester.tap(find.text(testL10n.chatAttachmentSourceBrowse));
    await tester.pumpAndSettle();

    expect(await selected.future, ComposerAttachSource.files);
  });

  testWidgets('returns null when the menu is dismissed', (tester) async {
    final Completer<ComposerAttachSource?> selected = await _openMenu(tester);

    await tester.tapAt(const Offset(500, 500));
    await tester.pumpAndSettle();

    expect(await selected.future, isNull);
  });
}
