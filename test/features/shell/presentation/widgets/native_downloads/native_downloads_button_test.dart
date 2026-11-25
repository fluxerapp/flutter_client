import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_downloads_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_button.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_style.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const String _kFile = '/downloads/report.pdf';

class _FakeDownloads extends DesktopDownloads {
  _FakeDownloads(this.initial);

  final List<DesktopDownload> initial;
  final List<String> calls = <String>[];

  @override
  List<DesktopDownload> build() => initial;

  @override
  void refreshFileExists() => calls.add('refresh');

  @override
  void cancel(int id) => calls.add('cancel $id');

  @override
  Future<void> open(int id) async => calls.add('open $id');

  @override
  Future<void> reveal(int id) async => calls.add('reveal $id');

  void add(DesktopDownload download) =>
      state = <DesktopDownload>[download, ...state];
}

DesktopDownload _entry(
  DesktopDownloadState state, {
  int id = 1,
  int received = 0,
  int? total,
  bool exists = false,
}) => DesktopDownload(
  id: id,
  filePath: _kFile,
  state: state,
  receivedBytes: received,
  totalBytes: total,
  fileExists: exists,
);

final FocusNode _composerFocus = FocusNode();
int _contentTaps = 0;

Future<_FakeDownloads> _pump(
  WidgetTester tester,
  List<DesktopDownload> entries, {
  Locale locale = const Locale('en'),
}) async {
  _contentTaps = 0;
  final _FakeDownloads fake = _FakeDownloads(entries);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [desktopDownloadsProvider.overrideWith(() => fake)],
      child: MaterialApp(
        locale: locale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: cachedFluxerTheme(colorTheme: buildDarkColorTheme()),
        home: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 300),
              TextField(focusNode: _composerFocus),
              TextButton(
                onPressed: () => _contentTaps++,
                child: const Text('content'),
              ),
            ],
          ),
        ),
        builder: (BuildContext context, Widget? child) => Material(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(padding: const EdgeInsets.only(top: 32), child: child),
              Overlay.wrap(
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 32,
                    child: TapRegion(
                      groupId: kNativeTitlebarTapGroup,
                      child: Row(
                        children: [
                          Text('titlebar'),
                          Spacer(),
                          NativeDownloadsButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return fake;
}

Finder get _trigger => find.bySemanticsLabel(RegExp('^View downloads'));

Future<void> _open(WidgetTester tester) async {
  await tester.tap(_trigger);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('is hidden without downloads', (WidgetTester tester) async {
    await _pump(tester, const <DesktopDownload>[]);
    expect(_trigger, findsNothing);
  });

  testWidgets('shows the number of active downloads', (
    WidgetTester tester,
  ) async {
    await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.started),
      _entry(DesktopDownloadState.progressing, id: 2),
      _entry(DesktopDownloadState.completed, id: 3),
    ]);
    expect(find.text('2'), findsOneWidget);
    expect(
      find.bySemanticsLabel('View downloads. 2 downloads in progress'),
      findsOneWidget,
    );
  });

  testWidgets('shows every status', (WidgetTester tester) async {
    final _FakeDownloads fake = await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.started),
      _entry(
        DesktopDownloadState.progressing,
        id: 2,
        received: 1024,
        total: 4096,
      ),
      _entry(DesktopDownloadState.progressing, id: 3, received: 2048),
      _entry(DesktopDownloadState.completed, id: 4, exists: true),
      _entry(DesktopDownloadState.completed, id: 5),
      _entry(DesktopDownloadState.canceled, id: 6),
      _entry(DesktopDownloadState.failed, id: 7),
    ]);
    await _open(tester);
    expect(fake.calls, <String>['refresh']);
    for (final String status in <String>[
      'Starting',
      '25% of 4.0 KB',
      '2.0 KB',
      'Completed',
      'The file was moved or deleted.',
      'Cancelled. The partial file was deleted.',
      'Failed',
    ]) {
      expect(find.text(status), findsOneWidget, reason: status);
    }
    expect(find.bySemanticsLabel('Show in folder'), findsOneWidget);
  });

  testWidgets('opens and reveals finished downloads', (
    WidgetTester tester,
  ) async {
    final _FakeDownloads fake = await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.completed, exists: true),
    ]);
    await _open(tester);
    await tester.tap(find.text('report.pdf'));
    await tester.tap(find.bySemanticsLabel('Show in folder'));
    expect(fake.calls, <String>['refresh', 'open 1', 'reveal 1']);
  });

  testWidgets('missing and running files cannot be opened', (
    WidgetTester tester,
  ) async {
    final _FakeDownloads fake = await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.completed),
      _entry(DesktopDownloadState.progressing, id: 2),
    ]);
    await _open(tester);
    await tester.tap(find.text('report.pdf').first);
    await tester.tap(find.text('report.pdf').last);
    expect(fake.calls, <String>['refresh']);
  });

  testWidgets('cancels running and removes finished downloads', (
    WidgetTester tester,
  ) async {
    final _FakeDownloads fake = await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.progressing),
      _entry(DesktopDownloadState.failed, id: 2),
    ]);
    await _open(tester);
    await tester.tap(find.bySemanticsLabel('Cancel download'));
    expect(fake.calls.last, 'cancel 1');
    await tester.tap(find.bySemanticsLabel('Remove from list'));
    await tester.pumpAndSettle();
    expect(find.text('Failed'), findsNothing);
    expect(find.text('report.pdf'), findsOneWidget);
  });

  testWidgets('clearing the last entries removes the panel and stays closed', (
    WidgetTester tester,
  ) async {
    final _FakeDownloads fake = await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.failed),
    ]);
    await _open(tester);
    await tester.tap(find.text('Clear list'));
    await tester.pumpAndSettle();
    expect(_trigger, findsNothing);
    expect(find.text('Downloads'), findsNothing);
    fake.add(_entry(DesktopDownloadState.started));
    await tester.pumpAndSettle();
    expect(_trigger, findsOneWidget);
    expect(find.text('Downloads'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a click outside closes the panel and reaches the content', (
    WidgetTester tester,
  ) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    await _open(tester);
    expect(find.text('Downloads'), findsOneWidget);
    await tester.tap(find.text('content'));
    await tester.pumpAndSettle();
    expect(find.text('Downloads'), findsNothing);
    expect(_contentTaps, 1);
  });

  testWidgets('a titlebar click keeps the panel open', (
    WidgetTester tester,
  ) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    await _open(tester);
    await tester.tap(find.text('titlebar'), warnIfMissed: false);
    await tester.pumpAndSettle();
    expect(find.text('Downloads'), findsOneWidget);
  });

  testWidgets('the closing panel ignores clicks', (WidgetTester tester) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    await _open(tester);
    await tester.tap(_trigger);
    await tester.pump();
    await tester.tap(find.text('Clear list'), warnIfMissed: false);
    await tester.pumpAndSettle();
    expect(_trigger, findsOneWidget);
    expect(find.text('Downloads'), findsNothing);
  });

  testWidgets('follows the desktop client metrics', (
    WidgetTester tester,
  ) async {
    await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.failed),
      _entry(DesktopDownloadState.canceled, id: 2),
    ]);
    expect(tester.getSize(_trigger), const Size(32, 32));
    await _open(tester);
    final Rect title = tester.getRect(find.text('Downloads'));
    final Rect clear = tester.getRect(find.text('Clear list'));
    final Rect name = tester.getRect(find.text('report.pdf').first);
    final Rect status = tester.getRect(find.text('Failed'));
    final Rect nextName = tester.getRect(find.text('report.pdf').last);
    final Rect control = tester.getRect(
      find.bySemanticsLabel('Remove from list').first,
    );
    expect(title.top, 32 + 1 + 1 + 12);
    expect(title.height, 21);
    expect(clear.height, 18);
    expect(name.left - title.left, 8);
    expect(name.top - title.bottom, 8 + 6);
    expect(name.height, 21);
    expect(status.top - name.bottom, 2);
    expect(status.height, 18);
    expect(nextName.top - name.top, 53 + 4);
    expect(control.size, const Size(24, 24));
    expect(clear.right - control.right, 4);
  });

  testWidgets('the trigger toggles the panel', (WidgetTester tester) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    await _open(tester);
    await _open(tester);
    expect(find.text('Downloads'), findsNothing);
  });

  testWidgets('escape closes the panel and restores focus', (
    WidgetTester tester,
  ) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    _composerFocus.requestFocus();
    await tester.pump();
    await _open(tester);
    expect(_composerFocus.hasFocus, isFalse);
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(find.text('Downloads'), findsNothing);
    expect(_composerFocus.hasFocus, isTrue);
  });

  testWidgets('can be used with the keyboard', (WidgetTester tester) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    await _open(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    expect(_trigger, findsNothing);
  });

  testWidgets('aligns to the end in both directions', (
    WidgetTester tester,
  ) async {
    await _pump(tester, <DesktopDownload>[_entry(DesktopDownloadState.failed)]);
    await _open(tester);
    expect(tester.getTopRight(find.text('Clear list')).dx, greaterThan(700));
    await _pump(tester, const <DesktopDownload>[]);
    await tester.pumpWidget(const SizedBox());
    await _pump(tester, <DesktopDownload>[
      _entry(DesktopDownloadState.failed),
    ], locale: const Locale('ar'));
    await tester.tap(find.byType(NativeDownloadsButton));
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(find.text('report.pdf')).dx, lessThan(400));
    expect(tester.getTopRight(find.text('report.pdf')).dx, lessThan(400));
  });
}
